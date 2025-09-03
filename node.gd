extends Node
#Yes, this lookuptable is shredding through the collums, No, i don't care.
#region 15th circle of hell
var octave_range_lookup_table:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8]
#endregion 15th circle of hell
var key:Array = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
var key_pressed:String
var key_octpressed:String


#var defaultmidC = 60

signal KeyPressedSignal(tone:String,octave:int ,velocity:int,pitch:int)

func pitch_to_tone(pitch:int):
	var tone:int
	tone = pitch % 12
	return key[tone]



func pitch_to_octave(pitch:int):
	var oct:int
	var range:int = 12
	return octave_range_lookup_table[pitch]

func _ready():
	OS.open_midi_inputs()
	print("Detected device: ",OS.get_connected_midi_inputs())
	

func _input(input_event):

	if input_event is InputEventMIDI && input_event.pitch > 0:
		emit_signal("KeyPressedSignal",pitch_to_tone(input_event.pitch),pitch_to_octave(input_event.pitch),input_event.velocity,input_event.pitch)
		#print(pitch_to_tone(input_event.pitch))

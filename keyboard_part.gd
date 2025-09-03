extends Node2D
var childkey
var myindex:int
var key:Array = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
var whiteKey:Rect2 = Rect2(0,0,200,700)
var blackKey:Rect2 = Rect2(200,0,200,700)
var pressedKey:Rect2 = Rect2(200,700,200,700)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	createkeyboard()



func createkeyboard():
	var BaseC = get_node("C")
	var newKey
	var pivotx = BaseC.position.x
	for i in range(0,9):
		for j in range(0,12):
			newKey = BaseC.duplicate()
			newKey.position.x = pivotx + (100 * j)
			newKey.name = key[j] + str(i)
			newKey.set_meta("octave",j)
			newKey.set_region_rect(whiteKey)
			self.add_child(newKey)
			#moves black keys upward
			if (j == 1 || j == 3 || j == 6 || j == 8 || j == 10 ):
				newKey.position.y = newKey.position.y - 22
				newKey.set_region_rect(blackKey) 
				newKey.scale.y = 0.8
		pivotx = 1300 * i
		if (i == 8):
			$C.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	myindex = self.get_meta("keyboardindex")



func _on_midiinput_key_pressed_signal(tone: String, octave: int, velocity: int, pitch:int) -> void:
	
	var key = pitch % 15

	
	if (velocity > 0 ):
		childkey = get_node(tone + str(octave))
		print(childkey.name)
		#childkey.visible = false
		childkey.set_region_rect(pressedKey)
	else:
		childkey = get_node(tone + str(octave))
		#childkey.visible = true
		if (tone == "C#" || tone == "D#" || tone == "F#" || tone == "G#" || tone == "A#"):
			childkey.set_region_rect(blackKey)
		else:
			childkey.set_region_rect(whiteKey)

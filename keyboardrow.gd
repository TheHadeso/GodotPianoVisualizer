extends Node2D

var Key:Dictionary

func CreateKeyboard():

	for i in range(108):
		Key[i] =  false
		#print(Key)
	
	
func _on_midiinput_key_pressed(pitch: int, velocity: int) -> void:
	if (velocity > 0):
		print(pitch, "foi apertado")
		


func _draw() -> void:
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CreateKeyboard()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

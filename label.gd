extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var key

func _on_midiinput_send_key_signal(keypressed) -> void:
	self.text = keypressed
	

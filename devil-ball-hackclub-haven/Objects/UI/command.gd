extends CanvasLayer

var Delay = 0.0

func _ready() -> void:
	Global.AddCommand("See how high you can throw the ball!")
	Global.AddCommand("Just make sure not to throw it next door...")
	Global.AddCommand("He doesn't like when you disturb him...")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Delay -= delta
	
	if Delay < 0 and !Global.CommandQueue.is_empty():
		$Command/Label.text = Global.CommandQueue[0]
		Global.CommandQueue.remove_at(0)
		$AnimationPlayer.play("Show")
		Delay = 3.0

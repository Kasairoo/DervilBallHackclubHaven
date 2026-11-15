extends CanvasLayer

var Delay = 0.0

var FlashTime = 0.0

func _ready() -> void:
	Global.Command = self
	Global.AddCommand("See how high you can throw the ball!")
	Global.AddCommand("Just make sure not to throw it next door...")
	Global.AddCommand("He doesn't like when you disturb him...")
	$Command/Flash.texture.setup(512, 512, DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, Color.TRANSPARENT)
	$Command/Black.texture.setup(512, 512, DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, Color.TRANSPARENT)
	$Command/Flash/MenuButton.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.EventCurrent
	Delay -= delta
	
	if Delay < 0 and !Global.CommandQueue.is_empty():
		$Command/Label.text = Global.CommandQueue[0]
		Global.CommandQueue.remove_at(0)
		$AnimationPlayer.play("RESET")
		$AnimationPlayer.play("Show")
		Delay = 3.0
	
	if FlashTime > 0:
		$Command/Flash.texture.setup(512, 512, DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, Color(1.0, 1.0, 1.0, FlashTime / 2))
		FlashTime -= delta

func flash():
	$Command/Flash.texture.setup(512, 512, DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, Color.WHITE)
	$Command/Black.texture.setup(512, 512, DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, Color.BLACK)
	$Command/Flash/MenuButton.visible = true
	FlashTime = 2.0
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	Global.InUI = true

func _on_menu_button_pressed() -> void:
	Global.SceneManager.ChangeScene("res://Scenes/map.tscn")
	Global.InUI = false
	print("test")

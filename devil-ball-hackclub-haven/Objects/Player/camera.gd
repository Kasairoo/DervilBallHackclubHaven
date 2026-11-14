extends Camera3D

@export var sens_horizontal = 0.3
@export var sens_vertical = 0.3

@export var RotationMax = 90.0

var XRotation = 0.0
var YRotation = 0.0

@export var XPivot : Node3D
@export var YPivot : Node3D


func _ready():
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _process(delta: float) -> void:
	
	XPivot.rotation_degrees.y = XRotation
	YPivot.rotation_degrees.x = YRotation
	
	if Input.is_action_just_pressed("MouseCapture"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if Input.is_action_just_pressed("MouseUnlock"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event):
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			
			XRotation += -event.relative.x * sens_horizontal
			
			YRotation -= event.relative.y * sens_vertical
			YRotation = clamp(YRotation, -RotationMax, RotationMax)

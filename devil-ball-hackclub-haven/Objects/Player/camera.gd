extends Camera3D

@export var sens_horizontal = 0.3
@export var sens_vertical = 0.3

@export var RotationMax = 90.0

var XRotation = 0.0
var YRotation = 0.0

func _ready():
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			
			XRotation += deg_to_rad(-event.relative.x * sens_horizontal) 
			
			YRotation -= event.relative.y * sens_vertical
			YRotation = clamp(YRotation, -RotationMax, RotationMax)
			YRotation = YRotation

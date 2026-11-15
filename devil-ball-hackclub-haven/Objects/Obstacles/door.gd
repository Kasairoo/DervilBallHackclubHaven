extends Node3D

@export var OpenItem : String

var Open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$RigidBody3D/MeshInstance3D2.visible = !Open
	$RigidBody3D/CollisionShape3D.set_deferred("disabled", Open)
	$RigidBody3D/CollisionShape3D2.set_deferred("disabled", !Open)
	if !Open:
		$RigidBody3D.freeze = true
		$RigidBody3D.position = Vector3(0,0,0)
		$RigidBody3D.rotation = Vector3(0,0,0)
	else:
		$RigidBody3D.freeze = false

func CheckOpen(Name):
	if Name == OpenItem:
		print("YEA!")
		Open = true

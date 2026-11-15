extends RigidBody3D

@export var PlayerIdentifier : ShapeCast3D

var DropDelay = 0.0

func _physics_process(delta: float) -> void:
	DropDelay -= delta
	if PlayerIdentifier.is_colliding() and DropDelay < 0.0:
		for i in range(PlayerIdentifier.get_collision_count()):
			var Target = PlayerIdentifier.get_collider(i)
			if Target.get_parent().has_method("CheckOpen"):
				Target.get_parent().CheckOpen(name)
			if Target == Global.Player:
				reparent(Global.Player.RightHand)
				position = Vector3(0,0,-0.3)
				rotation = Vector3(0,0,0)
	if get_parent() == Global.Player.RightHand:
		freeze = true
		set_collision_layer_value(1, false)
		if Input.is_action_just_pressed("PlayerDrop"):
			DropDelay = 0.4
			reparent(get_tree().current_scene)
	else:
		freeze = false
		set_collision_layer_value(1, true)

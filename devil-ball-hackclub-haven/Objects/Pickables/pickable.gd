extends Node3D

@export var PlayerIdentifier : ShapeCast3D

func _physics_process(delta: float) -> void:
	if PlayerIdentifier.is_colliding():
		for i in range(PlayerIdentifier.get_collision_count()):
			var Target = PlayerIdentifier.get_collider(i)
			if Target.get_parent().has_method("CheckOpen"):
				print("YIP YIP")
				Target.get_parent().CheckOpen(name)
			if Target == Global.Player:
				reparent(Global.Player.RightHand)
				position = Vector3(0,0,-0.3)
				rotation = Vector3(0,0,0)

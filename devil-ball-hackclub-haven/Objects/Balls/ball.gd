extends RigidBody3D

@export var fence: MeshInstance3D

@export var fence_particle: PackedScene

var count = 0

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Middle Fence Body":
		count += 1
		
		if count == 4:
			fence.queue_free()
			Global.EventCurrent = "GateDown"
			
			var fx = fence_particle.instantiate()
			fx.global_position = global_position
			get_tree().current_scene.add_child(fx)
			fx.restart()
			fx.finished.connect(fx.queue_free)

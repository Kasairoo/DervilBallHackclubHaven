extends RigidBody3D

@export var PlayerIdentifier : ShapeCast3D
@export var particle : CPUParticles3D
@export var EnemyDetector : Area3D
var DropDelay = 0.0

var Enemy: CharacterBody3D  = null

var WithinRadius = false

func _physics_process(delta: float) -> void:
	DropDelay -= delta
	
	if global_position.distance_squared_to(Global.Player.global_position) < 2 ** 2 and !WithinRadius:
		Global.AddCommand("Woah is that a shotgun?")
		WithinRadius = true
	
	if PlayerIdentifier.is_colliding() and DropDelay < 0.0:
		for i in range(PlayerIdentifier.get_collision_count()):
			var Target = PlayerIdentifier.get_collider(i)
			if Target.get_parent().has_method("CheckOpen"):
				Target.get_parent().CheckOpen(name)
			if Target == Global.Player:
				reparent(Global.Player.RightHand)
				position = Vector3(0,0,-0.3)
				rotation = Vector3(180,0,0)
	if get_parent() == Global.Player.RightHand:
		freeze = true
		set_collision_layer_value(1, false)
		if Input.is_action_just_pressed("PlayerDrop"):
			DropDelay = 0.4
			reparent(get_tree().current_scene)
		if Input.is_action_just_pressed("PlayerClick"):
			particle.restart()
			if Enemy != null:
				Enemy.kill()
	else:
		freeze = false
		set_collision_layer_value(1, true)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Neighbor:
		Enemy = body

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Neighbor:
		Enemy = null

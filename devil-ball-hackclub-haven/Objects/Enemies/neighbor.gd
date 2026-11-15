extends CharacterBody3D


const SPEED = 2.0
const JUMP_VELOCITY = 4.5

@export var LookCast : ShapeCast3D

func _physics_process(delta: float) -> void:
	
	look_at(Global.Player.global_position)
	global_rotation_degrees.x = 0.0
	
	
	if not is_on_floor():
		if velocity.y > 0.0:
			velocity.y -= 14.0 * delta
		else:
			velocity.y -= 19.0 * delta
	
	var LookDirectionOffset = -global_basis.z
	
	if Global.Player.global_position.distance_squared_to(global_position) < 3 ** 2:
		
		Global.AddCommand("TURN BACK!!")
	

	if LookCast.is_colliding():
		for i in range(LookCast.get_collision_count()):
			LookDirectionOffset += LookCast.get_collision_normal(i)
	
	LookDirectionOffset.y = 0
	
	LookDirectionOffset = LookDirectionOffset.normalized() * SPEED
	
	velocity.x = LookDirectionOffset.x
	velocity.z = LookDirectionOffset.z
	
	global_rotation_degrees.y += 180.0
	
	move_and_slide()

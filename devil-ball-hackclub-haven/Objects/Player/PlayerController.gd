extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var Pusher : GamePusher

var CoyoteTime = 0.0
var JumpBuffer = 0.0
var PushDelay = 0.0

func _physics_process(delta: float) -> void: 
	
	PushDelay -= delta
	
	if Input.is_action_just_pressed("PlayerClick") and PushDelay < 0.05:
		PushDelay = 0.5
		Pusher.Trigger()
	
	CoyoteTime -= delta
	JumpBuffer -= delta
	
	if not is_on_floor():
		if velocity.y > 0.0:
			velocity.y -= 10.0 * delta
		else:
			velocity.y -= 15.0 * delta
	
	if is_on_floor():
		CoyoteTime = 0.2
	
	if Input.is_action_just_pressed("ui_accept"):
		JumpBuffer = 0.2
	
	if CoyoteTime > 0.0 and JumpBuffer > 0.0:
		velocity.y = JUMP_VELOCITY
	
	var input_dir := Input.get_vector("PlayerLeft", "PlayerRight", "PlayerForward", "PlayerBackward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

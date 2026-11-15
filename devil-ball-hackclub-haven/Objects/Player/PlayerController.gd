extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var Pusher : GamePusher

@export var CameraHolder : Node3D

@export var Camera : Camera3D

var RightHand : Node3D

var CoyoteTime = 0.0
var JumpBuffer = 0.0
var PushDelay = 0.0
var WalkTimer = 0.0
var FovBoost = 0.0

func _ready() -> void:
	Global.Player = self
	RightHand = Pusher.get_node("Right Arm")

func _process(delta: float) -> void:
	CameraHolder.position.y = sin(WalkTimer * 10) * 0.05
	Camera.rotation_degrees.z = lerp(Camera.rotation_degrees.z, ( sin(WalkTimer * 5) * 1 ) + ( Input.get_axis("PlayerRight", "PlayerLeft") * 3 ), delta * 10 )
	
	
	
	FovBoost *= 0.96
	Camera.fov = lerp(Camera.fov, 90 + FovBoost + (velocity.length() * 0.5), delta * 15)

func _physics_process(delta: float) -> void: 
	
	PushDelay -= delta
	
	if Input.is_action_just_pressed("PlayerClick") and PushDelay < 0.05:
		PushDelay = 0.5
		Pusher.Trigger()
		FovBoost = -10
	
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
		WalkTimer += delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		WalkTimer = 0.0

	move_and_slide()

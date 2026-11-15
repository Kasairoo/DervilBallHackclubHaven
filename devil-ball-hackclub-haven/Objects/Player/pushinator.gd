extends Node3D

class_name GamePusher

@export var CollisionBox : ShapeCast3D

var PushBuffer = 0.0
var PushedList : Array

func _process(delta: float) -> void:
	PushBuffer -= delta
	if PushBuffer > 0.0:
		if CollisionBox.is_colliding():
			for i in range(CollisionBox.get_collision_count()):
				var Target = CollisionBox.get_collider(i)
				#print(Target)
				if Target is RigidBody3D and !PushedList.has(Target):
					PushedList.append(Target)
					Target.linear_velocity = global_basis.z * -12
					Target.angular_velocity = global_basis.x * -2
					Target.linear_velocity.y += 5

func Trigger():
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.play("Push")
	
	PushedList.clear()
	PushBuffer = 0.15

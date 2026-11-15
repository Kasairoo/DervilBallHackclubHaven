extends Node3D

class_name GameScenemanager

func _ready() -> void:
	Global.SceneManager = self
	ChangeScene("res://Scenes/map.tscn")

func ChangeScene(SceneTo):
	for i in get_children():
		if i != $Safe:
			i.queue_free()
	
	var NewScene = load(SceneTo)
	var NewSceneInstance = NewScene.instantiate()
	
	await get_tree().physics_frame
	
	add_child(NewSceneInstance)
	
	print(get_children())

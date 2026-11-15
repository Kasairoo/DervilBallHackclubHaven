extends Node3D

class_name GameScenemanager

func _ready() -> void:
	Global.SceneManager = self
	ChangeScene("res://Scenes/House/interior_1.tscn")

func ChangeScene(SceneTo):
	for i in get_children():
		if i != $Safe:
			queue_free()
	
	var NewScene = load(SceneTo)
	var NewSceneInstance = NewScene.instantiate()
	
	add_child(NewSceneInstance)

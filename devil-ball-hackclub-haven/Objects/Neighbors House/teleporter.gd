extends Area3D

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "PlayerBody":
		Global.SceneManager.ChangeScene("res://Scenes/House/interior_1.tscn")

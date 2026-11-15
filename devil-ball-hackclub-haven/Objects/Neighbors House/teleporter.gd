extends Area3D

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body == Global.Player:
		Global.SceneManager.ChangeScene("res://Scenes/House/interior_1.tscn")

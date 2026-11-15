extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_1_body_entered(body: Node3D) -> void:
	if Global.EventCurrent == "GateDown":
		Global.EventCurrent = "NeighborAnger"
		#Say the turn back line
		#Blah blah
		LoadNeighbor()

const NEIGHBOR = preload("uid://db0rylcaqiw07")

func LoadNeighbor():
	print("APPEAR")
	var NEIGHBOR_Instance = NEIGHBOR.instantiate()
	
	NEIGHBOR_Instance.position = Vector3(0,0,-57)
	
	add_child(NEIGHBOR_Instance)

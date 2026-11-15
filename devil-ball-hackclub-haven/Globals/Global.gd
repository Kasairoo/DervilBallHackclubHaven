extends Node

var Player : CharacterBody3D

var Command : CanvasLayer
var CommandQueue : Array
var EventCurrent : String
var SceneManager : GameScenemanager
var ScreenShake = 0.0
var InUI: bool = false

func _ready() -> void:
	Global.EventCurrent = "GameBegin"

func _process(delta: float) -> void:
	ScreenShake *= 0.9

func AddCommand(Text):
	CommandQueue.append(Text)
	
	#if Global.Player.global_position.distance_squared_to(global_position) < 3 ** 2:
	#		

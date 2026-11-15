extends Node

var Player : CharacterBody3D

var CommandQueue : Array
var SceneManager : GameScenemanager

func AddCommand(Text):
	CommandQueue.append(Text)
	
	#if Global.Player.global_position.distance_squared_to(global_position) < 3 ** 2:
	#		

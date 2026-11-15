extends Node

var Player : CharacterBody3D

var CommandQueue : Array

func AddCommand(Text):
	CommandQueue.append(Text)

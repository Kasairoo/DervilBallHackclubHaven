extends Node3D

var DesiredTrack = "Safe"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	DesiredTrack = "Safe"
	if Global.EventCurrent != "GameBegin":
		DesiredTrack = "Eerie"
	
	FadeTrack("Safe", $Safe)
	FadeTrack("Eerie", $Evil)

func FadeTrack(Track, TargetNode):
	if !TargetNode.playing:
		TargetNode.playing = true
	if DesiredTrack == Track:
		TargetNode.volume_db = lerp(TargetNode.volume_db, 0.0, 0.8)
	else:
		TargetNode.volume_db = lerp(TargetNode.volume_db, -30.0, 0.8)

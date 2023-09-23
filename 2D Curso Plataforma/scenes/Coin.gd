extends Node2D

func _ready():
	$Area2D.connect("area_entered", self, "on_area_entered")
	
func on_area_entered(area2d):
	#queue_free()
	$AnimationPlayer.play("pickup")
	call_deferred("disable_pickup")
	
	
	var baseLevel = get_tree().get_nodes_in_group("base_level")[0]
	baseLevel.coin_collected()
	$RandomAudioStreamPlayer/AudioStreamPlayer.play()
	$RandomAudioStreamPlayer2/AudioStreamPlayer.play()
func disable_pickup():
	$Area2D/CollisionShape2D.disabled = true

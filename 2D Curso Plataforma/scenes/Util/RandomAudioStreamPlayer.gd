extends Node

export(int) var numberToPlay = 2
export(bool) var enablePitchRandomization = true
export(float) var minPitchScale = .9
export(float) var maxPitchScale = 1.1 

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func Play():
	var validNodes = []
	for streamPlayer in get_children():
		if (!streamPlayer.playing):
			validNodes.append(streamPlayer)


	for i in numberToPlay:
		if (validNodes.size() == 0):
			break
	var idx = rng.randi_range(0, validNodes.size() -1)
	
	if (enablePitchRandomization):
		validNodes[idx].pitch_scale = rng.randf_range(minPitchScale, maxPitchScale)
	
	validNodes[idx].play()
	validNodes.remove(idx)

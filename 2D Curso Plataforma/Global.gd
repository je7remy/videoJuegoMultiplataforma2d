extends Node

var current_level: int = 1 setget current_level_changed

var data_game = {
	'current_level': current_level
}

func _ready():
	load_game()

func current_level_changed(level):
	current_level = level
	data_game['current_level'] = current_level
	save_game()

func save_game():
	var file = File.new()
	file.open("user://logs/Data.txt", File.WRITE)
	
	file.store_line(to_json(data_game))
	file.close()
	
func load_game():
	var file = File.new()
	
	if file.file_exists("user://logs/Data.txt"):
		file.open("user://logs/Data.txt", File.READ)
	else:
		return

	while file.get_position() < file.get_len():
		var dataJson = parse_json(file.get_line())
		current_level = dataJson['current_level']
	file.close()

extends CanvasLayer

export var level_int: int = 1

onready var playButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var OptionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
onready var QuitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton
onready var Levels_Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/LevelsButton

func _ready():
	playButton.connect("pressed", self, "on_play_pressed")
	OptionsButton.connect("pressed", self, "on_options_pressed")
	QuitButton.connect("pressed", self, "on_quit_pressed")
	Levels_Button.connect("pressed", self, "on_levels_pressed")
	Levels_Button.connect("pressed", self, "on_disabled")
	
	if level_int < Global.current_level:
		on_disabled()

	
func on_levels_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/Selector de niveles.tscn")

func on_play_pressed():
	$"/root/LevelManager".change_level(0)
	
func on_quit_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/Exit.tscn")
	
func on_options_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/OptionsMenuStandalone.tscn")

func on_disabled():
	Levels_Button.disabled = false

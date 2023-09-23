extends CanvasLayer

onready var siButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/SiButton
onready var noButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/HBoxContainer2/NoButton


func _ready():
	siButton.connect("pressed", self, "on_si_pressed")
	noButton.connect("pressed", self, "on_no_pressed")

func on_si_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene(get_tree().quit())
	#get_tree().quit()
	
	
func on_no_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/MainMenu.tscn")
	


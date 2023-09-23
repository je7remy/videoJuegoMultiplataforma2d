extends CanvasLayer

onready var continueButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ContinueButton
onready var creditsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/CreditsButton


func _ready():
	continueButton.connect("pressed", self, "on_continue_pressed")
	creditsButton.connect("pressed", self, "on_credits_pressed")

func on_continue_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/MainMenu.tscn")
	
func on_credits_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/Credits.tscn")

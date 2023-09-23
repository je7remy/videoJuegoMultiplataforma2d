extends CanvasLayer


onready var continueButton2 = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ContinueButton2

func _ready():
	continueButton2.connect("pressed", self, "on_continue2_pressed")
	
func on_continue2_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/GameComplete.tscn")

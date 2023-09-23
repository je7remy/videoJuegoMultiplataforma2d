extends Control

onready var Atras = $Atras
onready var Reiniciar = $Reiniciar_Juego

func _ready():
	Atras.connect("pressed", self, "on_atras_pressed")
	Reiniciar.connect("pressed", self, "on_reiniciar_pressed")


func on_atras_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/UI/MainMenu.tscn")

func on_reiniciar_pressed():
	var Directory1 = Directory.new()
	Directory1.remove("user://logs/Data.txt")
	$"/root/ScreenTransitionManager".transition_to_scene(get_tree().quit())

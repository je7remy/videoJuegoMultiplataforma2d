extends CanvasLayer

signal back_pressed

onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var windowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowModeButton
onready var VolumeMusicControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/VolumeMusicContainer/VolumenControl
onready var SFXVolumeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/SFXVolumeContainer/VolumenControl

var fullscreen = false

func _ready():
	backButton.connect("pressed", self, "on_back_pressed")
	windowModeButton.connect("pressed", self, "on_window_Mode_pressed")
	VolumeMusicControl.connect("percentage_changed", self, "on_music_volume_changed")
	SFXVolumeControl.connect("percentage_changed", self, "on_sfx_volume_changed") 
	update_display()
	update_initial_volume_settings()
		
func update_display():
	windowModeButton.text = "MINIMIZADA" if !fullscreen else "COMPLETA"
	
func update_bus_volume(busName, volumePercent):
	var BusIdx = AudioServer.get_bus_index(busName)
	var volumeDb = linear2db(volumePercent)
	AudioServer.set_bus_volume_db(BusIdx, volumeDb)
	
	
func get_bus_volume_percent(busName):
	var busIdx = AudioServer.get_bus_index(busName)
	var volumePercent = db2linear(AudioServer.get_bus_volume_db(busIdx))
	return volumePercent
	
	
func update_initial_volume_settings():
	var musicPercent = get_bus_volume_percent("Music")
	VolumeMusicControl.set_current_percentage(musicPercent)
	
	var sfxPercent = get_bus_volume_percent("SFX")
	SFXVolumeControl.set_current_percentage(sfxPercent)
	
func on_window_Mode_pressed():
	fullscreen = !fullscreen
	OS.window_fullscreen = fullscreen
	update_display()
	

	
func on_back_pressed():
	emit_signal("back_pressed")

func on_music_volume_changed(percent):
	update_bus_volume("Music", percent)
	
func on_sfx_volume_changed(percent):
	update_bus_volume("SFX", percent)

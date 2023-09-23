extends Node

signal coin_total_changed

export(PackedScene) var levelCompleteScene
export var level_int = 1

var playerScene = preload("res://scenes/Player.tscn")
var PauseScene = preload("res://scenes/UI/PauseMenu.tscn")
var spawnPosition = Vector2.ZERO
var currentplayerNode = null
var totalCoins = 0
var collectedCoins = 0

func _ready():
	spawnPosition = $PlayerRoot/Player.global_position
	register_player($PlayerRoot/Player)
	coin_total_changed(get_tree().get_nodes_in_group("coin").size())
	
	$Flag.connect("player_won", self, "on_player_won")
	if level_int >= Global.current_level:
		Global.current_level += 1

func _unhandled_input(event):
	if (event.is_action_pressed("pause")):
		var pauseInstance = PauseScene.instance()
		add_child(pauseInstance)


func coin_collected():
	collectedCoins += 1
	#print(totalCoins, " - ", collectedCoins)
	emit_signal("coin_total_changed", totalCoins, collectedCoins)

func coin_total_changed(newTotal):
	totalCoins = newTotal
	emit_signal("coin_total_changed", totalCoins, collectedCoins)
	

func register_player(player):
	currentplayerNode = player
	currentplayerNode.connect("die",self, "on_player_died",[], CONNECT_DEFERRED)
	
	
func create_player():
	var playerInstance = playerScene.instance()
	$PlayerRoot.add_child(playerInstance)
	#add_child_below_node(currentplayerNode, playerInstance)
	playerInstance.global_position = spawnPosition
	register_player(playerInstance)
	
func on_player_died():
	currentplayerNode.queue_free()
	
	var timer = get_tree().create_timer(1.8)
	yield (timer, "timeout")
	
	create_player()
#Jeremy en la mezcla COÑASO

func on_player_won():
	currentplayerNode.disable_player_input()
	
	#currentplayerNode.queue_free()
	var levelComplete = levelCompleteScene.instance()
	add_child(levelComplete)
	#$"/root/LevelManager".increment_level()

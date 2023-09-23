extends Position2D

enum Direction {RIGHT, LEFT}

export (PackedScene) var enemyScene
export(Direction) var startDirection

var currentEnemyNode = null
var spawnonNextTick = false

func _ready():
	$SpawnTimer.connect("timeout", self, "on_spawn_timer_timeout")
	call_deferred("spawn_enemy") #esto reestablece enemigos, lo utilizare mas tarde
	
func spawn_enemy():
	currentEnemyNode = enemyScene.instance()
	currentEnemyNode.StarDirection = Vector2.RIGHT if startDirection == Direction.RIGHT else Vector2.LEFT
	get_parent().add_child(currentEnemyNode)
	currentEnemyNode.global_position = global_position 

func check_enemy_spawn():
	if (!is_instance_valid(currentEnemyNode)):
		if (spawnonNextTick):
			spawn_enemy()
			spawnonNextTick = false
		else:
			 spawnonNextTick = true

func on_spawn_timer_timeout():
	check_enemy_spawn()

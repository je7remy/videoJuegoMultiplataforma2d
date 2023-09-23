extends KinematicBody2D

#enum Direction {RIGHT, LEFT}
#export(Direction) var startDirection

var enemyDeathScene = preload("res://scenes/EnemyDeath.tscn")

export var isSpawning =  true
var maxSpeed = 25
var velocity = Vector2.ZERO
#var direction = Vector2.RIGHT if starDirection == Direction.RIGHT else Vector2.LEFT
var direction = Vector2.ZERO
var gravity = 500
var StarDirection = Vector2.RIGHT



func _ready():
	direction = StarDirection
	#direction = Vector2.RIGHT if startDirection == Direction.RIGHT else Vector2.LEFT
	$GoalDectector.connect("area_entered", self, "on_goal_entered")
	$HitboxArea.connect("area_entered",self, "on_hitbox_entered")

func _process(delta):
	if (isSpawning):
		return

	velocity.x = (direction * maxSpeed).x
	#if (!is_on_floor()):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	$Visuals/AnimatedSprite.flip_h = true if direction.x > 0 else false

func kill():
	var deathInstance = enemyDeathScene.instance()
	get_parent().add_child(deathInstance)
	deathInstance.global_position = global_position
	if (velocity.x > 0 ):
		deathInstance.scale = Vector2(-1, 1)
		
	
	queue_free()

func on_goal_entered(_area2d):
	direction *= -1;

func on_hitbox_entered(_area2d):
	$"/root/Helpers".apply_camera_shake(1)
	call_deferred("kill")
		

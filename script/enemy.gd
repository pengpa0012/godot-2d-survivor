extends CharacterBody2D

@onready var player = get_node("/root/world/player")
@onready var HEALTH_BAR = $HealthBar
var SPEED = 50
var HEALTH = 1.0
var INIT_HEALTH = 1.0

func _physics_process(delta):
	if is_instance_valid(player):
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()

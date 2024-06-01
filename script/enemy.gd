extends CharacterBody2D

@onready var player = get_node("/root/world/player")
var SPEED = 50
func _physics_process(delta):
	if is_instance_valid(player):
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()

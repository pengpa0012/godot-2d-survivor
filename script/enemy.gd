extends CharacterBody2D

@onready var player = get_node("/root/world/player")
@onready var HEALTH_BAR = $HealthBar
@onready var colShape = get_node("CollisionShape2D")
@onready var colAreaShape = get_node("enemy/CollisionShape2D")
var SPEED = 50
var HEALTH = 1.0
var INIT_HEALTH = 1.0
var IS_DEAD = false
var soundPlayed = false

func _physics_process(delta):
	if IS_DEAD && !soundPlayed:
		$death.play()
		$Icon.visible = false
		$HealthBar.visible = false
		colShape.disabled = true
		colAreaShape.disabled = true
		soundPlayed = true
		
	if is_instance_valid(player):
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()
	

func _on_death_finished():
	queue_free()

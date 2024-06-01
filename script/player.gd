extends CharacterBody2D
const SPEED = 150.0

@export var bullet_scene: PackedScene = preload("res://scene/projectile.tscn")
@onready var aim = get_node("aim")

func _physics_process(delta):
	
	# PLAYER MOVEMENT
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	
	if Input.is_action_just_pressed("ui_accept") && is_instance_valid(self):
		shoot(delta)

	move_and_slide()
	
	
func shoot(delta):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = self.position
	bullet.transform = aim.transform
	add_child(bullet)

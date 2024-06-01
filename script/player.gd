extends CharacterBody2D
const SPEED = 150.0

@export var bullet_scene: PackedScene = preload("res://scene/projectile.tscn")

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
		shoot()

	move_and_slide()
	
	
func shoot():
	var bullet = bullet_scene.instantiate() as CharacterBody2D
	get_parent().add_child(bullet)
	bullet.position.x = self.global_position.x + 30
	bullet.position.y = self.global_position.y + 30
	bullet.rotation = self.rotation
	bullet.velocity.x *= 100

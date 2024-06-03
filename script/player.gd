extends CharacterBody2D
const SPEED = 150.0

@export var bullet_scene: PackedScene = preload("res://scene/projectile.tscn")
@onready var aim = get_node("aim")
@onready var healthUI = get_node("/root/world/player/Camera2D/health")
@onready var fireTimer = $fire

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
		
	move_and_slide()
	
	
func shoot():
	$shoot.play()
	var rotate = 0
	for n in Global.PROJECTILE_COUNT:
		var bullet = bullet_scene.instantiate() as Area2D
		bullet.position = self.position
		bullet.transform = aim.transform
		bullet.rotate(rotate)
		rotate += (0.1 + n) * 0.1 if n % 2 == 0 else (0.1 + n) * -0.1
		add_child(bullet)

func _on_hitbox_area_entered(area):
	if area.name == "enemy":
		Global.HEALTH -= 1
		$hurt.play()
	healthUI.text = "Health: " + str(Global.HEALTH)
	if Global.HEALTH <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://scene/end_menu.tscn")


func _on_fire_timeout():
	if is_instance_valid(self):
		shoot()
		fireTimer.start()

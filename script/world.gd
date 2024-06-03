extends Node2D

@onready var enemies = get_node("enemies")
@onready var camera = get_node("player/Camera2D")
@onready var player = get_node("player")
@export var enemy_scene: PackedScene = preload("res://scene/enemy.tscn")

var MIN_ENEMY = 100


func _on_timer_timeout():
	if enemies.get_child_count() <= MIN_ENEMY && is_instance_valid(player):
		var enemy = enemy_scene.instantiate() as CharacterBody2D
		enemy.position.x = player.position.x + randi_range(-1000, 1000)
		enemy.position.y = player.position.y + randi_range(-1000, 1000)
		# Adjust health depends on score
		enemy.HEALTH = floor(Global.SCORE / 500.0) + 1
		enemy.SPEED = floor(Global.SCORE / 100.0) + 50
		enemy.INIT_HEALTH = enemy.HEALTH
		MIN_ENEMY = floor(Global.SCORE / 100) + 100
		enemies.add_child(enemy)
		$Timer.start()


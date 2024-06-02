extends Node2D

@onready var enemies = get_node("enemies")
@onready var camera = get_node("player/Camera2D")
@onready var player = get_node("player")
@export var enemy_scene: PackedScene = preload("res://scene/enemy.tscn")

var MIN_ENEMY = 30


func _on_timer_timeout():
	if enemies.get_child_count() <= MIN_ENEMY && is_instance_valid(player):
		var enemy = enemy_scene.instantiate() as CharacterBody2D
		enemy.position.x = player.position.x + randi_range(-1000, 1000)
		enemy.position.y = player.position.y + randi_range(-1000, 1000)
		# Adjust health depends on score
		enemies.add_child(enemy)
		$Timer.start()


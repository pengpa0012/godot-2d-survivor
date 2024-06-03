extends Node2D


func _ready():
	$score.text = "Your Score: " + str(Global.SCORE)


func _on_button_pressed():
	Global.HEALTH = 5
	Global.SCORE = 0
	Global.UPGRADE_SCORE = 0.000
	Global.UPGRADE_SCORE_TARGET = 500
	Global.FIRERATE = 1
	Global.PROJECTILE_COUNT = 1
	get_tree().change_scene_to_file("res://scene/world.tscn")

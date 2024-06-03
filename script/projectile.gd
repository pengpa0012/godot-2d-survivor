extends Area2D

@onready var scoreUI = get_node("/root/world/player/Camera2D/score")
@onready var upgradeScoreUI = get_node("/root/world/player/Camera2D/upgrade_score")
@onready var upgradeListUI = get_node("/root/world/player/Camera2D/upgrade_list")
@onready var player = get_node("/root/world/player")

var SPEED = 750

func _process(delta):
	position += transform.x * SPEED * delta


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name != "player":
		Global.SCORE += 10 + randi_range(1, 5)
		Global.UPGRADE_SCORE += 20 + randf_range(1, 5)
		upgradeScoreUI.value = Global.UPGRADE_SCORE / Global.UPGRADE_SCORE_TARGET * 100
		if Global.UPGRADE_SCORE >= Global.UPGRADE_SCORE_TARGET && player.fireTimer.wait_time && Global.PROJECTILE_COUNT < 100:
			upgradeListUI.visible = true
			get_tree().paused = true
			# Popup upgrade UI here
			Global.UPGRADE_SCORE_TARGET = Global.UPGRADE_SCORE + 500
			upgradeScoreUI.value = 0
			Global.UPGRADE_SCORE = 0
			
		scoreUI.text = "Score: " + str(Global.SCORE)
		body.HEALTH_BAR.value = floor(((body.HEALTH - 1) / body.INIT_HEALTH) * 100)
		body.HEALTH -= 1
		if body.HEALTH <= 0:
			body.queue_free()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

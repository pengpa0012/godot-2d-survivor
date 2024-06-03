extends PanelContainer

@onready var upgradeList = get_node("/root/world/player/Camera2D/upgrade_list")
@onready var player = get_node("/root/world/player")

func _on_button_pressed():
	# increase firerate
	if player.fireTimer.wait_time > 0.1:
		player.fireTimer.wait_time -= 0.1
	upgradeList.visible = false
	get_tree().paused = false


func _on_button_2_pressed():
	# add another projectile
	if Global.PROJECTILE_COUNT < 100:
		Global.PROJECTILE_COUNT += 1
	upgradeList.visible = false
	get_tree().paused = false

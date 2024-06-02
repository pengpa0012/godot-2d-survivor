extends Area2D

var speed = 750
@onready var scoreUI = get_node("/root/world/player/Camera2D/score")

func _process(delta):
	position += transform.x * speed * delta


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name != "player":
		Global.SCORE += 10 + randi_range(1, 5)
		scoreUI.text = "Score: " + str(Global.SCORE)
		body.queue_free()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

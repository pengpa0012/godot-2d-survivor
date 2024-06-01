extends Area2D

var speed = 750

func _process(delta):
	position += transform.x * speed * delta


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name != "player":
		body.queue_free()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

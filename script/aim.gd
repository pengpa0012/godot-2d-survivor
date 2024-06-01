extends Marker2D

@onready var colShape = get_node("../CollisionShape2D")

func _process(delta):
	#look_at(get_global_mouse_position())
	rotate(get_angle_to(get_global_mouse_position()))
	colShape.rotation = self.rotation
	

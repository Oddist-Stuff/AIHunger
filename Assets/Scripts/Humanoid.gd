extends KinematicBody2D
var count = 0
func _ready():
	while true:
		if get_parent().get_node("UI/Hunger").value<70:
			while not (get_node("Touch").is_colliding() and get_node("Touch").get_collider().get_parent().name=="Food"):
					while not (get_node("View").is_colliding() and get_node("View").get_collider().get_parent().name=="Food"):
						self.rotation_degrees+=4
						yield(get_tree(),"idle_frame")
					self.move_local_y(4)
					yield(get_tree(),"idle_frame")
					if get_node("Touch").is_colliding() and get_node("Touch").get_collider().get_parent().name=="Food":
						get_node("View").get_collider().queue_free()
						get_node("Sprite").scale+=Vector2(0.125,0.125)
						count+=1
						get_parent().get_node("UI/Hunger").value+=10
						get_parent().get_node("UI/Apples").text=var2str(count)+" APPLES"
						yield(get_tree(),"idle_frame")
						for i in range(0,50):
							self.move_local_y(1)
							yield(get_tree(),"idle_frame")
		yield(get_tree(),"idle_frame")
	pass

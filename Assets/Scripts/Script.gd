extends Node2D
var rng = RandomNumberGenerator.new()
var count = 0
func _ready():
	rng.randomize()
	for i in range(0,16):
		var apple = preload("res://Assets/Objects/Apple.tscn").instance()
		apple.position = Vector2(rng.randf_range(-640,1280),rng.randf_range(-480,960))
		get_node("Food").add_child(apple,true)
	while true:
		count +=1
		get_node("UI/Hunger").value-=0.05
		print(count)
		if Input.is_action_just_pressed("fullscreen"):
			OS.window_fullscreen=!OS.window_fullscreen
		if count % 1000 == 0:
			for i in range(0,get_node("Food").get_child_count()):
				var apple = preload("res://Assets/Objects/Apple.tscn").instance()
				apple.position = Vector2(rng.randf_range(0,640),rng.randf_range(0,480))
				get_node("Food").add_child(apple,true)
		if get_node("Food").get_child_count()==0:
			for i in range(0,16):
				var apple = preload("res://Assets/Objects/Apple.tscn").instance()
				apple.position = Vector2(rng.randf_range(-640,1280),rng.randf_range(-480,960))
				get_node("Food").add_child(apple,true)
		yield(get_tree(),"idle_frame")
	pass

extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var house_types = 3
var window_types = 10
var fence_types = 3

export (int) var width

func _ready():
	pass

func _enter_tree():
	var f = rand_range(0, 10)
	if f > 5:
		var fence = randi() % fence_types + 1
		$Fence.texture = load('res://art/houses/fence %s.png' % fence)
		$Fence.show()
	else:
		$Fence.hide()
	
	var window = randi() % window_types + 1 
	$Window.texture = load('res://art/houses/Window %s.png' % window)

	var house = randi() % house_types + 1
	$House.texture = load('res://art/houses/house %s.png' % house)
	#print("f%sh%sw%s" % [fence, house, window])

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Visibility_screen_exited():
	pass
#	queue_free()
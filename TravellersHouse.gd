extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var WithEyes = preload("res://art/traveler's house/traveler's house with eyes.png") 
var WithoutEyes = preload("res://art/traveler's house/traveler's house.png")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func enable_eyes():
	$Sprite.texture = WithEyes
#	pass # replace with function body


func disable_eyes():
	$Sprite.texture = WithoutEyes
	#pass # replace with function body

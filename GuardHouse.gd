extends RigidBody2D

var whois = "guard"

var WithEyes = preload("res://art/house guard/house guard with eyes.png")
var WithoutEyes = preload("res://art/house guard/house guard without eyes.png")

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func enable_eyes():
	$Sprite.texture = WithEyes

func disable_eyes():
	$Sprite.texture = WithoutEyes

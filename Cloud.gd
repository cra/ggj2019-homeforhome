extends Node

var cloud_types = 5

func _ready():
	pass
	
func _enter_tree():
	var i = randi() % cloud_types + 1
	if randf() > 0.5:
		$Sprite.texture = load('res://art/sky/clouds/cloud %s.png' % i)
	else:
		$Sprite.texture = load('res://art/sky/clouds/clouds %s.png' % i)
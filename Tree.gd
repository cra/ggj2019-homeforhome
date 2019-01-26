extends RigidBody2D

var tree_types = 25

func _enter_tree():
	var tree = randi() % tree_types + 1 
	$Sprite.texture = load('res://art/trees/tree %s.png' % tree)

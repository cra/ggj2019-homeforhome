extends RigidBody2D

var tree_types = 25

export (int) var width

func _enter_tree():
	var tree = randi() % tree_types + 1 
	$Sprite.texture = load('res://art/trees/tree %s.png' % tree)
#	$Sprite.Transform2D.scale = Vector2(1.0, randf() * 2.0 + 1)

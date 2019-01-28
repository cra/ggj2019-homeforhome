extends Node

var distance = 20
var eye_position

func _ready():
	pass

func _process(delta):
	pass
#	for eye in [$Pupils/left, $Pupils/right]:
#		var direction = (get_viewport().get_mouse_position() - eye.position).normalized()
#		eye.translate(direction * distance)

func _on_TextureButton_button_up():
	get_tree().change_scene("res://Intro.tscn")

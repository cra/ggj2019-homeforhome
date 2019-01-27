# Intro.gd
extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal scene1_move_end
signal scene1_zoom_end

var InitialScene1Scale = Vector2(1.0, 1.0)
var Scene1MoveStep = 5
var Scene1Width
var Scene1MovedLeftCount = 0

func _ready():
	$Scene2.hide()
	InitialScene1Scale = $Scene1.get_scale()
	Scene1Width = $Scene1.texture.get_width() * InitialScene1Scale.x
	Scene1Width -= 600	
	
func _on_Timer_timeout():
	var pos = $Scene1/Camera.get_camera_position()
#	print($Camera2D.get_viewport_rect().x)
	if pos.x < Scene1Width:
		$Scene1/Camera.translate(Vector2(Scene1MoveStep, 0))
	else:
		$Scene1/Timer.stop()
		emit_signal("scene1_move_end")

func _on_Intro_scene1_move_end():
	$Scene1/ZoomTimer.start()

func _on_ZoomTimer_timeout():
	var zoom = $Scene1/Camera.get_zoom()
	if zoom.length_squared() > 0.05:
#		$Scene1.texture.set_scale(1.0, 1.0)
		$Scene1/Camera.set_zoom(Vector2(zoom.x * 0.95, zoom.y * 0.95))
	
	if Scene1MovedLeftCount < 15:
		$Scene1/Camera.translate(Vector2(-30, 20))
		Scene1MovedLeftCount += 1
	else:
		$Scene1/ZoomTimer.stop()
		emit_signal("scene1_zoom_end")


func _on_Intro_scene1_zoom_end():
	$Scene1.hide()
	$Scene1/Camera.clear_current()
	$Scene1.queue_free()
	
	$Scene2/Camera.make_current()
	$Scene2.show()
	$Scene2/ZoomTimer.start()

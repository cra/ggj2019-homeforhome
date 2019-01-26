extends Control
#class_name DialogueBox

signal dialogue_ended()

onready var dialogue_player = get_node("DialoguePlayer")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _start(dialogue):
	$Panel/ButtonFinished.hide()
	$Panel/ButtonNext.show()
	$Panel/ButtonNext.grab_focus()
	dialogue_player.start(dialogue)
	update_content()
	show()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_ButtonNext_pressed():
	dialogue_player.next()
	update_content()

func _on_ButtonFinished_pressed():
	emit_signal("dialogue_ended")
	hide()
	$Panel/ButtonNext.hide()
	$Panel/ButtonFinished.grab_focus()
	$Panel/ButtonFinished.show()

func update_content():
	var dialogue_player_name = $DialoguePlayer.title
	$Panel/Name.text = dialogue_player_name
	$Panel/Text.text = dialogue_player.text
	
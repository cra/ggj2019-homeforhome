extends RichTextLabel

var dialog = []
var page = 0

func set_dialog(l):
	dialog = l

func _ready():
	pass
	
func start():
	page = 0
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func stop():
	set_process_input(false)

func _input(event):
	if Input.is_action_pressed("ui_interact"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				get_parent().hide()
		else:
			set_visible_characters(get_total_character_count())


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
extends Node

signal finished

var title = ""
var text = ""
var expression = ""

var _conversation = []
var _index_current = 0

func start(dialogue_dict):
	_conversation = dialogue_dict.values()
	_index_current = 0
	_update()
	
func _update():
	text = _conversation[_index_current].text
	name = _conversation[_index_current].name
	expression = _conversation[_index_current].expression
	if _index_current == _conversation.size() - 1:
		emit_signal("finished")

func next():
	_index_current += 1
	assert _index_current <= _conversation.size()
	_update()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

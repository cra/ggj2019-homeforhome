extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (PackedScene) var NPCHouse
export (PackedScene) var TalkBox
export (PackedScene) var bgTree

func _ready():
	randomize()
	
	for i in range(10):
		var npc = NPCHouse.instance()
		var shift = randi() % 25 - 50
		npc.position = Vector2(300 + 400*i, 300 + shift)
		add_child(npc)

	for i in range(200):
		var tree = bgTree.instance()
		var x = rand_range(200*i, 200 + 10*i)
		var y = rand_range(400, 450)
		tree.position = Vector2(x, y)
		$Background/SkyRoadBG.add_child(tree)
#		add_child(tree)
	
	new_game()

func new_game():
	$Player.start($StartPosition.position)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Player_touch():
	print("Fuck meee")
#	var tb = TalkBox.instance()
#	add_child(tb)
	#print($Player.get_collider())
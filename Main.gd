extends Node

export (int) var InitialX

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const TREE_PROB_THRESHOLD = 0.2

export (PackedScene) var NPCHouse
export (PackedScene) var TalkBox
export (PackedScene) var bgTree

func give_build_shift(is_tree):
	if is_tree:
		return randi() % 20 - 50


func _ready():
	randomize()
	var x = InitialX
	for i in range(200):
		var shall_build_tree = randf() > TREE_PROB_THRESHOLD
		var c = bgTree if shall_build_tree else NPCHouse
		var obj = c.instance()
		x += obj.width
		obj.set_z_index(0)
		obj.position = Vector2(x, 300)
		add_child(obj)

#	for i in range(10):
#		var tree = bgTree.instance()
#		var x = rand_range(200*i, 200 + 10*i)
#		var y = rand_range(350, 400)
#		tree.position = Vector2(x, y)
#		#$Background/SkyRoadBG.add_child(tree)
#		$ParallaxBackground/ParallaxLayer.add_child(tree)
##		
#		add_child(tree)
	
	new_game()

func new_game():
	$Player.start($StartPosition.position)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Player_touch():
	pass
#	print("Fuck meee")
#	var tb = TalkBox.instance()
#	add_child(tb)
	#print($Player.get_collider())
extends Node

export (int) var InitialX
export (int) var InitialY

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
	$TravellersHouse.position = Vector2(1000, InitialY)
	$GuardHouse.position = Vector2(1500, InitialY)

	$HUD/TalkBox/Text.set_dialog([
		"[House]: Uff! Better find a way out of here before it's too late!",
	])
	
	randomize()
	var x = InitialX
	for i in range(200):
		var shall_build_tree = randf() > TREE_PROB_THRESHOLD
		var c = bgTree if shall_build_tree else NPCHouse
		var obj = c.instance()
		x += obj.width
		if !shall_build_tree:
			obj.set_z_index(0)
		obj.position = Vector2(x, InitialY)
		add_child(obj)
		
	var size = $Road.texture.get_size()
	$Road.set_size(Vector2(size.x + x, size.y))

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
	$TravellersHouse.enable_eyes()
	print("Fuck meee")

func _on_Player_body_entered(body):
	if body.is_in_group("interactive"):
		if body.whois == "traveller":
			$TravellersHouse.enable_eyes()
			$HUD/TalkBox/Text.set_dialog([
				"Hey house. What is your name?",
				"I don't know my name yet",
				"BlablablablBlablablablBlablablablBlablablablBlablablablBlablablablBlablablablBlablablabla"
			])
			$HUD/TalkBox.show()
			$HUD/TalkBox/Text.start()
		elif body.whois == "guard":
			$GuardHouse.enable_eyes()
			$HUD/TalkBox/Text.set_dialog([
				"Bububu"
			])
			$HUD/TalkBox.show()
			$HUD/TalkBox/Text.start()
	#print($Player.get_collider())

func _on_Player_body_exited(body):
	if body.is_in_group("interactive"):
		if body.whois == "traveller":
			$TravellersHouse.disable_eyes()
		if body.whois == "guard":
			$GuardHouse.disable_eyes()
		$InteractExitTimer.start()

func _on_InteractExitTimer_timeout():
	$HUD/TalkBox.hide()
	$HUD/TalkBox/Text.stop()

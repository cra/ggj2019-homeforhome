extends Area2D

export (int) var speed
var screensize

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func start(pos):
	position = pos
	show()
	set_as_toplevel(true)
	$CollisionShape2D.disabled = false

func _ready():
	screensize = get_viewport_rect().size
#	hide()

func _process(delta):
	var velocity = Vector2() # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
#	if Input.is_action_pressed("ui_interact"):
#		print(self.get_overlapping_bodies())
	
	position += velocity * delta
	# hack to prevent going left too far
	if position.x < 100:
		position.x = 100
#	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, screensize.y/2-10, screensize.y/2+70)
	
	if velocity.x >= 0:
		$AnimatedSprite.animation = "right"
	elif velocity.x < 0:
		$AnimatedSprite.animation = "left"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"
	elif velocity.y >= 0:
		$AnimatedSprite.animation = "down"
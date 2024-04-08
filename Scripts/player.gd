extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var move_speed = 125
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

var active = true

func _physics_process(delta):
	if is_on_floor()==false:
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500

	var direction = 0
	if active==true:
		if Input.is_action_just_pressed("drop-through") && is_on_floor():
			drop()
		
		if Input.is_action_just_pressed("jump") && is_on_floor():
			bounce_pad(jump_force)
	
		direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	
	velocity.x = direction * move_speed
	move_and_slide()
	
	update_animations(direction)

func bounce_pad(force):
	AudioPlayer.play_sfx("jump")
	velocity.y = -force

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		if velocity.y < 0:
			animated_sprite.play("Jump")
		else:
			animated_sprite.play("Fall")

func drop():
	position.y += 3


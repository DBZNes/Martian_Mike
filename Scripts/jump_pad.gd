extends Area2D

@export var jump_force = 300

@onready var bounce = $AnimatedSprite2D

func _on_body_entered(body):
	if body is Player:
		bounce.play("Jump")
		body.bounce_pad(jump_force)





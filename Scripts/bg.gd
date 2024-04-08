extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Sprite2D

@export var bg_texture: CompressedTexture2D = preload("res://Assests/textures/bg/Blue.png")
@export var scroll_speed = 50

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	sprite.region_rect.position += Vector2(scroll_speed, scroll_speed) * delta
	if sprite.region_rect.position >= Vector2(64, 64):
		sprite.region_rect.position = Vector2.ZERO

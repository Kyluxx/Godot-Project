extends Area2D
signal collide
var speed: int
var rotation_speed: int
var directionX: float

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var width := get_viewport().get_visible_rect().size[0]
	var randomX := rng.randf_range(0, width)
	var randomY := rng.randi_range(-150, -50)
	position = Vector2(randomX, randomY)
	
	# rand graphic
	var graphic_path := "res://custom_meteor/met" + str(rng.randi_range(1,7)) + ".png"
	$Sprite2D.texture = load(graphic_path)
	
	# glob var
	speed = rng.randi_range(300, 800)
	directionX = rng.randf_range(-0.4, 0.4)
	rotation_speed = rng.randi_range(180, 720)

func _process(delta):
	position += Vector2(directionX, 1.0) * delta * speed
	rotation_degrees += rotation_speed * delta

func _on_body_entered(_body) -> void:
	collide.emit()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()

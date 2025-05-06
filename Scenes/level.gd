extends Node2D

@export var health := 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().call_group('ui', 'set_health', health)
	# stars
	var size := get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	for star in $Stars.get_children():
		# star pos
		star.position = Vector2(rng.randf_range(0, size.x), rng.randf_range(0, size.y))
		
		# star scale
		var rand_scale = rng.randf_range(0.35, 0.9)
		star.scale = Vector2(rand_scale,rand_scale)
		
		# star speed
		star.speed_scale = rng.randf_range(0.5, 1.5)

var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")


func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	
	meteor.connect("collide", on_meteor_collide)

func on_meteor_collide():
	print("Collided")
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health < 1:
		print("dead")
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")


func _on_spaceship_laser(pos: Variant) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Lasers.add_child(laser)
	

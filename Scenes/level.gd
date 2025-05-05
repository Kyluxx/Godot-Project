extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)

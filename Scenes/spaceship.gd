extends CharacterBody2D
@export var speed := 500
var isOnCD := false

signal laser(pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#position += Vector2(1, 1) * speed * delta
	#if get_node("SpaceshipImage").rotation < PI:
	#$SpaceshipImage.rotation += 3 * delta
	if Input.is_action_pressed("kR"):
		position = Vector2(640, 360)
	 
	var direction = Input.get_vector("kLeft", "kRight", "kUp", "kDown")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_pressed("shoot") && not isOnCD:
		laser.emit($LaserStartingPos.global_position)
		isOnCD = true
		$LaserCD.start()

func _on_laser_cd_timeout() -> void:
	isOnCD = false

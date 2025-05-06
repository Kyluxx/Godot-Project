extends CanvasLayer
static var image = load("res://heart.png")
var score := 0

func set_health(amount):
	
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()

	for i in amount:
		var TextRect = TextureRect.new()
		TextRect.texture = image
		$MarginContainer2/HBoxContainer.add_child(TextRect)

 
func _on_score_timer_timeout() -> void:
	score += 1
	$MarginContainer/Label.text = str(score)
	Global.score = score

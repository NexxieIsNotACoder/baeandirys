extends CharacterBody2D
@onready var game = $".."
signal game_fail
func _physics_process(delta):
	var direction = Input.get_axis("left","right")
	velocity.x = direction * 600
	move_and_slide()
	if game.points < 0:
		game_fail.emit()

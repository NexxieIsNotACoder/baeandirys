extends Area2D
var speed = 60
var velocity = Vector2()
@onready var fail_sound = $fail
@onready var hit = $hit
@onready var game = $".."



func _physics_process(delta):
	velocity.y += speed * delta
	position.y += velocity.y * delta


func _on_body_entered(body):
	if (body.name == "borders"):
		fail()
	else:
		print("hit!")
		game.add_points()
		velocity.y = 0
		$CollisionShape2D.queue_free()
		hit.play() 
		await get_tree().create_timer(1).timeout 
		queue_free()



func fail():
	fail_sound.play()
	print("oh no!")
	game.subtract_points()
	await get_tree().create_timer(1.5).timeout 
	queue_free()



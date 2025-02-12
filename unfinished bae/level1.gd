extends Node2D
var points = 0
@onready var area_2d = $Area2D

func subtract_points():
	points -= 1
	print(points)
	

func add_points():
	points += 1
	print(points)
	

func spawn_bae():
	var new_bae = preload("res://fruit.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_bae.global_position = %PathFollow2D.global_position
	add_child(new_bae)
	
func _on_timer_timeout():
	spawn_bae()
	



func _on_character_body_2d_game_fail():
	await get_tree().create_timer(1.3).timeout 
	get_tree().paused = true
	print("game over!")


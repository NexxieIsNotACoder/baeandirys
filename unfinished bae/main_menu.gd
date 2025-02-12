extends Node

func _ready():
	$menu_noise.play()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://level1.tscn")

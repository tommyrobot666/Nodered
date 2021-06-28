extends Control

func _on_Button_pressed():
	var _scene = get_tree().change_scene_to(load("res://game/game.tscn"))

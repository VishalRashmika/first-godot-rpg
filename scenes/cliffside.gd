extends Node2D

func _process(delta):
	change_scene()


func _on_cliffside_exitpoint_body_entered(body):
	if body.has_method("player"):
		Globalgamescript.transition_scene = true
		


func _on_cliffside_exitpoint_body_exited(body):
	if body.has_method("player"):
		Globalgamescript.transition_scene = false
		

func change_scene():
	if Globalgamescript.transition_scene == true:
		if Globalgamescript.current_scene == "cliffside":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			Globalgamescript.finish_changescene()	

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globalgamescript.game_first_loadin == true:
		$player.position.x = Globalgamescript.player_start_posx
		$player.position.y = Globalgamescript.player_start_posy
	else:
		$player.position.x = Globalgamescript.player_exit_cliffside_posx
		$player.position.y = Globalgamescript.player_exit_cliffside_posy
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		Globalgamescript.transition_scene = true
		


func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		Globalgamescript.transition_scene = false
		

func change_scene():
	if Globalgamescript.transition_scene:
		if Globalgamescript.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/cliffside.tscn")
			Globalgamescript.game_first_loadin = false
			Globalgamescript.finish_changescene()

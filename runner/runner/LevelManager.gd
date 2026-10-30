extends Node
var current_level = 0
var levels = ["res://Level1.tscn","res://Level1.5.tscn","res://Level2.tscn","res://Level3.tscn"]

func load_next_level():
	current_level+=1
	
	if current_level< levels.size():
		get_tree().paused=false
		get_tree().change_scene_to_file(levels[current_level])
	else:
		print("end screen needed")

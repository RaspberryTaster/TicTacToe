extends Node
class_name Player

@export var marker : CompressedTexture2D
signal on_make_move(_board,_marker)
signal on_move_made(_button)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func make_move(_board):
	
	on_make_move.emit(_board,marker)


func print_grid(rows: int, columns: int, _state):
	for row in range(rows):
		var line = ""
		for column in range(columns):
			var nag = ""
			if( _state[row][column] != null):
				nag = _state[row][column].name
			var s = "["+ nag+ "] "
			line += s
		print(line)
		

	
		 	
func button_chosen(_button):
	on_move_made.emit(_button)
	var state = $"../..".get_current_game_state()
	var availableChoices = $"../..".available_choices_in_game_state(state)

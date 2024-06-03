extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_player_on_make_move(_board, _marker):
	$"../../CanvasLayer/VBoxContainer/TurnLabel".text = "Blue turn"
	$"../..".set_buttons(true)
	#first enable buttons for the board, only if they have not been selected yet
	#then replace its sprite with your marker.
	pass # Replace with function body.


func _on_player_on_move_made(_button):
	$"../..".set_buttons(false)
	$"../.."._next_player_turn()

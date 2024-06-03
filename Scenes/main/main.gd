extends Node

@export var players : Array[Player]
@export var board := [[null,null,null],[null,null,null],[null,null,null]]
var playerQueue := []
var currentPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	var gridChildren = $CanvasLayer/VBoxContainer/PanelContainer/GridContainer.get_children()
	var index = 0
	for y in range(3):
		for x in range(3):
			board[x][y] = gridChildren[index]
			board[x][y].boardPosition = Vector2(x,y)
			index+= 1
	
	for player in players:
		playerQueue.append(player)

	set_buttons(false)
	available_choices_in_game_state(get_current_game_state())
	_next_player_turn()

func available_choices():
	var value := []
	for row in board:
		for cell in row:
			if cell.player == null:
				value.append(cell)
	return value
	
func available_choices_in_game_state(_game_state):
	var value := []
	for y in range(3):
		for x in range(3):
			if(_game_state[x][y] == null):
				value.append(board[x][y].boardPosition)
	return value

	
func evaluate(board,playerA,playerB):
	for row in board:
		if row[0] == row[1] &&  row[1] == row[2]:
			if row[0] == playerA:
				return "Winner"
			elif row[0] == playerB:
				return "Loser"

	for col in range(3):
		if board[0][col] == board[1][col] && board[1][col] == board[2][col]:
			if board[0][col] == playerA:
				return "Winner"
			elif board[0][col] == playerB:
				return "Loser"
	
	if board[0][0] == board[1][1] && board[1][1] == board[2][2]:
		if board[0][0] == playerA:
			return "Winner"
		elif board[0][0] == playerB:
			return "Loser"
	
	if board[0][2] == board[1][1] && board[1][1] == board[2][0]:
		if board[0][2] == playerA:
			return "Winner"
		elif board[0][2] == playerB:
			return "Loser"
	
	for row in range(3):
		for column in range(3):
			if board[row][column] == null:
				return null

	return "Draw"
	
func set_buttons(_activate):
	for row in board:
		for cell in row:
			cell.set_button(_activate)

func get_current_game_state():
	var value := [[null,null,null],[null,null,null],[null,null,null]]
	for y in range(3):
		for x in range(3):
			#print(Vector2(x,y),board[x][y].boardPosition)
			value[x][y] = (board[x][y].player)	
	return value

	
func _next_player_turn():
	if evaluate(get_current_game_state(), $ComputerPlayer/ComputerPlayer, $HumanPlayer/HumanPlayer) == "Winner":
		$CanvasLayer/VBoxContainer/Label.text = $ComputerPlayer/ComputerPlayer.name + " won!"
		return
	elif evaluate(get_current_game_state(), $ComputerPlayer/ComputerPlayer, $HumanPlayer/HumanPlayer) == "Loser":
		$CanvasLayer/VBoxContainer/Label.text = $HumanPlayer/HumanPlayer.name + " won!"
		return
	elif evaluate(get_current_game_state(), $ComputerPlayer/ComputerPlayer, $HumanPlayer/HumanPlayer) == "Draw":
		$CanvasLayer/VBoxContainer/Label.text ="Draw!"
		return
		
	currentPlayer = playerQueue.pop_front() as Player
	playerQueue.push_back(currentPlayer)
	currentPlayer.make_move(board)


	
func on_button_pressed(_button):
	if _button.can_assign_player(currentPlayer):
		_button.assign_player(currentPlayer)
		currentPlayer.button_chosen(_button)
	


func _on_button_pressed():
	get_tree().reload_current_scene()

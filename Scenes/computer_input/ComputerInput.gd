extends Node

@export var humanPlayer : Player
@export var computerPlayer : Player

func _on_player_on_make_move(_board, _marker):
	print("Computer Turn")
	$"../../CanvasLayer/VBoxContainer/TurnLabel".text = "Red turn"
	var state = $"../..".get_current_game_state()
	var availableChoices = $"../..".available_choices_in_game_state(state)
	var bestChoice = bestMove(state)
	if(bestChoice != null):
		$"../..".board[bestChoice.x][bestChoice.y]._on_button_pressed()

func  bestMove(state):
	var bestScore := -INF
	var bestChoice = null
	for x in range(3):
		for y in range(3):
			if state[x][y] == null:
				state[x][y] = computerPlayer
				var score = minimax(state,0,-INF,INF,false)
				state[x][y] = null

				if score > bestScore:
					bestScore = score
					bestChoice = Vector2(x,y)
	print("Best ", bestScore," ",bestChoice)
	return bestChoice	
			

var score = {"Winner": 1, "Loser":-1, "Draw":0}

func minimax(state,depth,alpha,beta,isMaximizing) -> int:
	var result = $"../..".evaluate(state,computerPlayer,humanPlayer)
	if result != null:
		return score[result]
		
	if isMaximizing:
		var bestScore = -INF
		for x in range(3):
			for y in range(3):
				if state[x][y] == null:
					state[x][y] = computerPlayer 
					var score = minimax(state,depth+1,alpha,beta, !isMaximizing)
					state[x][y] = null
					bestScore = max(bestScore,score)
					alpha = max(bestScore, alpha)
					if beta <= alpha:
						break	
		return bestScore	
	else:
		var bestScore = INF
		for x in range(3):
			for y in range(3):
				if state[x][y] == null:
					state[x][y] = humanPlayer
					var score = minimax(state,depth+1,alpha,beta, !isMaximizing)
					state[x][y] = null
					bestScore = min(bestScore,score)	
					beta = min(bestScore, beta)
					if beta <= alpha:
						break	
		return bestScore	

func _on_player_on_move_made(_button):
	$"../..".set_buttons(false)
	$"../.."._next_player_turn()

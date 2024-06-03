extends ColorRect
class_name GridButton
var player = null
var boardPosition
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_button(_active):
	$Button.disabled = !_active

func can_assign_player(_player):
	if player != null:
		return false
	else:
		return true

func assign_player(_player):
	$Icon.texture = _player.marker
	$Icon.visible = true
	player = _player

	
func _on_button_pressed():
	$"../../../../..".on_button_pressed(self)
	#send a signal to the main sending yourself 
	#the main will then assign you a player and you will change your icon color
	pass # Replace with function body.


func _on_button_mouse_entered():
	pass
	#print(boardPosition)

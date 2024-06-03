extends Node



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	print_grid(3, 3)

func print_grid(rows: int, columns: int):
	for row in range(rows):
		var line = ""
		for column in range(columns):
			line += "[ ] "
		print(line)

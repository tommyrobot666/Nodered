extends Panel

var coal = PackedScene

func _ready():
	coal = load("res://Nodes/Coal.tscn")
	var mines = []
	for _i in range(0,651):
		mines.append(rand_range(-10000,10000))
	for o in mines.size()-1:
		var coal_mine = coal.instance()
		get_node("GraphEdit").add_child(coal_mine)
		coal_mine.offset = Vector2(mines[o],mines[o+1])

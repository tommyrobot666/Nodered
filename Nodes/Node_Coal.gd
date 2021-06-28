extends GraphNode

var type = "Coal"

func _ready():
	set_slot(0,false,0,Color.aqua,true,0,Color.blueviolet)

func _process(_delta):
	var chance = int(rand_range(0,22))
	if chance == 10:
		get_node("Label").text = str(int(get_node("Label").text) + 1)

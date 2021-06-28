extends GraphNode

var type = "Storage"
#you start with some stuff
var steel = 0
var coal = 1
var bluet = 10

func _ready():
	set_slot(0,true,1,Color.darkorange,false,1,Color.blueviolet)

func _process(_delta):
	#how full it is
	var fill = coal+steel+bluet
	#let the user know how full it is
	get_node("Label").text = str(fill)
	get_node("TextureProgress").value = fill

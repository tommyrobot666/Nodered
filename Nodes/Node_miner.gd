extends GraphNode

var type = "Miner"

func _ready():
	set_slot(0,true,0,Color.aqua,true,1,Color.blueviolet)


func _on_Miner_close_request():
	get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").steel += 10
	queue_free()

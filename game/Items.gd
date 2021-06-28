extends ItemList

var add_miner = 0
var miner_index = []

func _process(_delta):
	if add_miner > 0:
		add_item("Miner",load("res://game/tiles/Miner_PLACEHOLDER.png"),true)
		add_miner -= 1
		miner_index.append(get_item_count()-1)

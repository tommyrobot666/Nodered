extends GraphEdit

func _ready():
	pass

func _on_GraphEdit_connection_request(from, from_slot, to, to_slot):
	if get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").bluet > 0:
		var _connect_node = connect_node(from,from_slot,to,to_slot)

func _on_GraphEdit_disconnection_request(from, from_slot, to, to_slot):
	disconnect_node(from,from_slot,to,to_slot)
	get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").bluet =+ 1

func _process(_delta):
	for i in get_connection_list().size():
		var list = get_connection_list()
		if get_node_or_null(list[i].from) != null:
			if get_node_or_null(list[i].to) != null:
				var from = get_node(list[i].from)
				var _from_port = list[i].from_port
				var to = get_node(list[i].to)
				var _to_port = list[i].to_port
				#print(list,from,from_port,to,to_port)
				if to.type == "Storage":
					if from.type == "Miner":
						if from.get_node("Label").text != "0":
							if to.get_node("Label").text != "1000":
								to.coal += 1
								from.get_node("Label").text = str(int(from.get_node("Label").text)-1)
				if to.type == "Miner":
					if from.type == "Coal":
						var chance = int(rand_range(0,11))
						if chance == 10:
							if to.get_node("Label").text != "500":
								if from.get_node("Label").text != "0":
									to.get_node("Label").text = str(int(to.get_node("Label").text) + 1)
									from.get_node("Label").text = str(int(from.get_node("Label").text) - 1)

extends Camera2D

onready var steel = get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").steel
onready var coal = get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").coal
onready var bluet = get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").bluet

func Shop_can_not_buy():
	get_node("Panel/Popup").show()
	yield(get_tree().create_timer(10.0), "timeout")
	get_node("Panel/Popup").hide()
	
func _process(_delta):
	get_node("Panel/ColorRect/VBoxContainer/Label").text = "Steel:" + str(steel)
	get_node("Panel/ColorRect/VBoxContainer/Label2").text = "Coal:" + str(coal)
	get_node("Panel/ColorRect/VBoxContainer/Label3").text = "Bluet:" + str(bluet)

func _on_Button_pressed():
	get_node("Panel/Shop").show()


func _on_Shop_custom_action(action):
	if action == "Buy Miner":
		if coal >= 1:
			if 10 <= steel:
				get_node("Panel/ColorRect2/ItemList").add_miner =+ 1
				get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").coal -= 1
				get_tree().root.get_node("Camera2D/Panel/GraphEdit/Storage").steel -= 10
			else:
				Shop_can_not_buy()
		else:
			Shop_can_not_buy()

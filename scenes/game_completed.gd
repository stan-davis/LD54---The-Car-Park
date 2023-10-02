extends Control

const text_life_time := 3.0
@onready var labels = $Labels

func _ready():
	for label in labels.get_children():
		label.show()
		await get_tree().create_timer(text_life_time).timeout
		label.hide()
		await get_tree().create_timer(0.3).timeout
	
	Transition.change_scene("res://scenes/main_menu.tscn")

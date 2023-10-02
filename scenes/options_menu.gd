extends CenterContainer

enum WindowMode {WINDOWED, FULLSCREEN}

@onready var master_volume := $Panel/MarginContainer/VBoxContainer/MasterVolume/Slider

func _ready():
	hide()
	set_master_volume()

func _on_option_button_item_selected(index):
	match index:
		WindowMode.WINDOWED:
			get_window().set_mode(Window.MODE_WINDOWED)
		WindowMode.FULLSCREEN:
			get_window().set_mode(Window.MODE_EXCLUSIVE_FULLSCREEN)

func _on_slider_drag_ended(value_changed):
	if value_changed:
		set_master_volume()

func set_master_volume():
	var db : float = linear_to_db(master_volume.value / 100)
	AudioServer.set_bus_volume_db(0, db)

func _on_done_button_pressed():
	hide()

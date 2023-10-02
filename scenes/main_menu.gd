extends Control

@onready var options_menu = $OptionsMenu
@onready var controls_menu = $ControlsMenu

func _on_play_button_pressed():
	GameplayGlobal.current_progress = GameplayGlobal.Progress.START
	Transition.change_scene("res://scenes/level_01.tscn")

func _on_options_button_pressed():
	options_menu.show()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_controls_button_pressed():
	controls_menu.show()

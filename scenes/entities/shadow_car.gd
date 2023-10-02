extends Node3D

@onready var audio_player = $AudioStreamPlayer3D

func _ready():
	hide()

func start():
	show()
	audio_player.play()
	await get_tree().create_timer(0.05).timeout
	hide()
	await get_tree().create_timer(0.04).timeout
	show()
	await get_tree().create_timer(0.07).timeout
	hide()

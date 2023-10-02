extends CanvasLayer

@onready var label = $MarginContainer/Label
@onready var audio_player = $AudioStreamPlayer
@onready var timer = $Timer

func _ready():
	hide()

func popup(text : String, audio : AudioStream):
	audio_player.stream = audio
	label.set_text(text)
	show()
	audio_player.play()
	timer.start()

func _on_timer_timeout():
	hide()

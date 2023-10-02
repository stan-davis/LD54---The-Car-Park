extends Label3D

var phrases : Array[String] = ["F34R", "D34TH", "3SCAPE", "K1LL", "FL3SH", "H3LP", "UHGGHH", "!#3^!2F", "?$%66", "$B*!#4", "*%$@#A"]

func _ready():
	text = phrases.pick_random()

func _on_timer_timeout():
	text = phrases.pick_random()

extends CanvasLayer

@onready var anim_player := $AnimationPlayer

func play(str_name : String):
	anim_player.play(str_name)
	await anim_player.animation_finished

func change_scene(path : String):
	await play("fade_in")
	
	get_tree().change_scene_to_file(path)
	
	await play("fade_out")

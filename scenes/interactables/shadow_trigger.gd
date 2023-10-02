class_name ImmediateTrigger extends Area3D

signal is_interacted

@export var shadow_car : Node3D
var interacted := false

func _on_is_interacted():
	if GameplayGlobal.current_progress < GameplayGlobal.Progress.KETCHUP_FOUND or interacted:
		return
	
	interacted = true
	await shadow_car.start()
	queue_free()

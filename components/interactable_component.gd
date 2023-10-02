class_name InteractableComponent extends Area3D

signal is_interacted

@export_multiline var popup_text := ""
@export var audio : AudioStream = null
@export var delete : Node3D = null
@export var progression := true
@export var required_flag : GameplayGlobal.Progress = 0

func _on_is_interacted():
	if progression:
		if required_flag == GameplayGlobal.current_progress:
			GameplayGlobal.current_progress += 1
		else:
			return
	
	InformationPopup.popup(popup_text, audio)
	
	if delete:
		delete.queue_free()

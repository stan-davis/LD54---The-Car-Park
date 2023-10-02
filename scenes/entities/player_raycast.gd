extends RayCast3D

func _process(delta):
	var collider := get_collider()
	
	if not collider:
		return
	
	if collider is ImmediateTrigger:
		collider.is_interacted.emit()
	
	if Input.is_action_just_pressed("interact"):
		if collider is InteractableComponent:
			collider.is_interacted.emit()

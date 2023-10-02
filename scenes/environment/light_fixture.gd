extends MeshInstance3D

@export var flicker := false
@export var broken := false

@onready var spot_light = $Lights/SpotLight3D
@onready var emission_bar_01 := $Lights/EmissionBar
@onready var emission_bar_02 := $Lights/EmissionBar2

@onready var flicker_timer = $FlickerTimer

func _ready():
	var rand := randi_range(0, 8)
	
	match rand:
		0:
			set_emission(emission_bar_01, false)
		1:
			set_emission(emission_bar_02, false)

	if broken:
			set_emission(emission_bar_01, false)
			set_emission(emission_bar_02, false)
			spot_light.set_visible(false)
	
	if flicker:
		start_flicker_timer()

func set_emission(geometry : GeometryInstance3D, value : bool):
	geometry.material_override.set("emission_enabled", value)

func start_flicker_timer():
	var time := randf_range(10,60)
	flicker_timer.start(time)

func _on_flicker_timer_timeout():
	set_emission(emission_bar_01, false)
	set_emission(emission_bar_02, false)
	spot_light.set_visible(false)
	
	await get_tree().create_timer(0.03).timeout
	
	set_emission(emission_bar_01, true)
	set_emission(emission_bar_02, true)
	spot_light.set_visible(true)
	
	start_flicker_timer()


func _on_done_button_pressed():
	pass # Replace with function body.

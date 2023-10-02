extends Label3D

const plate_number_start : Array[String] = ["P00P", "W33D", "L0RD", "S0UP", "P4WN", "B4LL", "DUMB"]
const plate_number_end : Array[String] = ["GUN", "H0P", "1CE", "CUM", "H0G", "B0G", "G0D", "W3T", "A1R", "HUH", "BU5", "4P3", "C0W"]

func _ready():
	var start : String = plate_number_start.pick_random()
	var end : String = plate_number_end.pick_random()
	
	text = "%s %s" % [start, end]

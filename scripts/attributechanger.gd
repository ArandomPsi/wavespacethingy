extends Area2D
@export var speedmod : float = 1
@export var anglemod : float = 45

func _on_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	body.angle = anglemod
	body.speedmod = speedmod
	

extends Node2D

@export var moving : bool = false
@export var movingdir : int = 1
@export var movingtime : float = 0.4

var ogpos : Vector2
func _ready() -> void:
	$enabaler.visible = true
	ogpos = global_position


func _on_enabaler_screen_entered() -> void:
	if moving:
		position.y += movingdir * -150
		var tween = create_tween()
		tween.tween_property(self,"position",ogpos,movingtime)
		print("yes")

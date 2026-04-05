extends Node2D

var dir : int = 0
var angle : float = 45
var speed : int = 900
var speedmod : float = 1

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("press"):
		dir = -1
	else:
		dir = 1
	
	if position.y < 647 and position.y > 1:
		$Sprite2D.rotation_degrees = lerpf($Sprite2D.rotation_degrees,angle * dir,0.5)
		
	else:
		$Sprite2D.rotation_degrees = lerpf($Sprite2D.rotation_degrees,0,0.5)
		
	
	var tempangle = deg_to_rad(angle)
	var base = sin(deg_to_rad(45.0))
	
	if angle == 45:
		position.x += speed * delta * speedmod
		position.y += (sin(tempangle) / base) * speed * delta * dir * speedmod
		scale = Vector2(1,1)
	else:
		position.x += speed * delta * speedmod
		position.y += (sin(63.5) / base) * speed * delta * dir * speedmod * 2
		scale = Vector2(0.6,0.6)
	
	createtrail()
	
	position.y = clamp(position.y,0,648)
	
	$offset.global_position = Vector2(0,0)
	$offset.global_rotation = 0
	$offset.global_scale = Vector2(1,1)
	
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://scenes/testmap.tscn")
	
	

func createtrail():
	$offset/trail.add_point(global_position)
	if $offset/trail.get_point_count() > 120:
		$offset/trail.remove_point(0)


func _on_area_2d_body_entered(body: Node2D) -> void:
	die()

func die():
	angle = 45
	speedmod = 1
	position.x = 0
	position.y = 648/2
	$offset/trail.clear_points()

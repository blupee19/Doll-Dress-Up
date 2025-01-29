extends Node2D

var draggable = false
var isInsideDrop = false
var bodyRef
var offset: Vector2
var initPos: Vector2

func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("LMB"):
			initPos = global_position
			offset = get_global_mouse_position() - global_position
			global.isDragging = true
		if Input.is_action_pressed("LMB"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("LMB"):
			global.isDragging = false
			var tween = get_tree().create_tween()
			if isInsideDrop:
				tween.tween_property(self, "position", bodyRef.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initPos, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_body_entered(body: StaticBody2D) -> void:
	if body.is_in_group('hat') and is_in_group('hat_drop'):
		isInsideDrop = true
		body.modulate = Color(Color.GREEN, 0.2)
		bodyRef = body
	elif body.is_in_group('shirt') and is_in_group('shirt_drop'):
		isInsideDrop = true
		body.modulate = Color(Color.GREEN, 0.2)
		bodyRef = body
	elif body.is_in_group('pants') and is_in_group('pants_drop'):
		isInsideDrop = true
		body.modulate = Color(Color.GREEN, 0.2)
		bodyRef = body
	elif body.is_in_group('shoes') and is_in_group('shoes_drop'):
		isInsideDrop = true
		body.modulate = Color(Color.GREEN, 0.2)
		bodyRef = body



func _on_area_2d_body_exited(body: StaticBody2D) -> void:
	isInsideDrop = false
	body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)


func _on_area_2d_mouse_entered() -> void:
	if not global.isDragging:
		draggable = true


func _on_area_2d_mouse_exited() -> void:
	if not global.isDragging:
		draggable = false

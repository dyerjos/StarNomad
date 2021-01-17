extends Node2D

func _ready() -> void:
	yield(get_tree().create_timer(8.0), "timeout")
	queue_free()

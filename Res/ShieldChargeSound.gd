extends AudioStreamPlayer

func _on_ShieldChargeSound_ready() -> void:
	play()

func _on_ShieldChargeSound_finished() -> void:
	queue_free()

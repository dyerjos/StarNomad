extends AudioStreamPlayer

func _on_ShieldHitSound_finished():
	queue_free()

func _on_ShieldHitSound_ready():
	play()


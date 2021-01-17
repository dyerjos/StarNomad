extends LineEdit

onready var gameManager = $"/root/GameManager"

func _ready():
	pass
	# uncomment for final game
#	text = 'Booting command line...'
#	yield(get_tree().create_timer(5.0), "timeout")
#	text = 'Ready'
#	yield(get_tree().create_timer(1.0), "timeout")
#	clear()
	
func _on_Terminal_text_entered(text):
	print(text, ' executed')
	gameManager.target = text
	print('target is now ', gameManager.target)
	clear()

extends LineEdit

onready var gameManager = $"/root/GameManager"


func _on_Terminal_text_entered(text):
	print(text, ' executed')
	gameManager.target = text
	print('target is now ', gameManager.target)
	clear()

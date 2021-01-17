extends Control

onready var announcement = $Announcements

func _ready():
	GameManager.connect("hit_target", self, "process_command")
	GameManager.connect("shields_online", self, "after_shields")
	announcement.text = 'Captain, awaiting your commands in the terminal below'
	yield(get_tree().create_timer(3.0), "timeout")
	announcement.text = 'Bring your shields online with the command [ Activate Shields ]'

func process_command(text):
	text = text.to_lower()
	print('received signal execute commmand ', text)
	if GameManager.sector == 0:
		if text == 'activate shields' and GameManager.shield_activating == false:
			announcement.text = 'Bringing shields online...'
			GameManager.shield_activating = true
		elif text == 'jump' and GameManager.can_jump == true:
			GameManager.sector = 1
			GameManager.can_jump = false
#	else:
#		if text == 

func after_shields():
	announcement.text = "Calculating path to possible new home..."
	yield(get_tree().create_timer(3.0), "timeout")
	announcement.text = 'Route aquired'
	yield(get_tree().create_timer(2.0), "timeout")
	announcement.text = '[Jump] ?'
	GameManager.can_jump = true

extends Control

onready var announcement = $Announcements
onready var sector = $Sector

func _ready():
	GameManager.connect("hit_target", self, "process_command")
	GameManager.connect("shields_online", self, "after_shields")
	
	GameManager.connect("sector_1", self, "hud_sector_1")
	GameManager.connect("sector_2", self, "hud_sector_2")
	GameManager.connect("sector_3", self, "hud_sector_3")
	GameManager.connect("sector_4", self, "hud_sector_4")
	GameManager.connect("sector_5", self, "hud_sector_5")
	GameManager.connect("sector_6", self, "hud_sector_6")
	GameManager.connect("sector_7", self, "hud_sector_7")
	GameManager.connect("sector_8", self, "hud_sector_8")
	GameManager.connect("sector_9", self, "hud_sector_9")
	GameManager.connect("sector_10", self, "hud_sector_10")
	GameManager.connect("end_game", self, "hud_end_game")
	GameManager.connect("next_sector", self, "player_instruction")
	
	GameManager.connect("no_health", self, "game_over")
	announcement.text = 'Captain, awaiting your commands in the terminal below'
	yield(get_tree().create_timer(3.0), "timeout")
	announcement.text = 'Bring your shields online with the command [ Activate Shields ]'

func player_instruction():
	announcement.text = '[ Jump ] ?'
	
func process_command(text):
	text = text.to_lower()
	print('received signal execute commmand ', text)
	if GameManager.sector == 0:
		if text == 'activate shields' and GameManager.shield_activating == false:
			announcement.text = 'Bringing shields online...'
			GameManager.shield_activating = true
		elif text == 'jump':
			GameManager.sector = 1
			GameManager.can_jump = false
	else:
		if text == 'jump':
			GameManager.sector += 1
			GameManager.can_jump = false

func after_shields():
	announcement.text = "Calculating path to possible new home..."
	yield(get_tree().create_timer(3.0), "timeout")
	announcement.text = 'Route aquired'
	yield(get_tree().create_timer(2.0), "timeout")
	announcement.text = '[ Jump ] ?'
	GameManager.can_jump = true

func game_over():
	announcement.text = 'Game developed by Joshua Dyer for Godot Wild Jam #29'
	sector.text = 'Game Over'
	
func hud_sector_1():
	announcement.text = ''
	sector.text = 'Sector 1'
func hud_sector_2():
	announcement.text = ''
	sector.text = 'Sector 2'
func hud_sector_3():
	announcement.text = ''
	sector.text = 'Sector 3'
func hud_sector_4():
	announcement.text = ''
	sector.text = 'Sector 4'
func hud_sector_5():
	announcement.text = ''
	sector.text = 'Sector 5'
func hud_sector_6():
	announcement.text = ''
	sector.text = 'Sector 6'
func hud_sector_7():
	announcement.text = ''
	sector.text = 'Sector 7'
func hud_sector_8():
	announcement.text = ''
	sector.text = 'Sector 8'
func hud_sector_9():
	announcement.text = ''
	sector.text = 'Sector 9'
func hud_sector_10():
	announcement.text = ''
	sector.text = 'Sector 10'
func hud_end_game():
	announcement.text = 'Game developed by Joshua Dyer for Godot Wild Jam #29'
	sector.text = 'You Win!'


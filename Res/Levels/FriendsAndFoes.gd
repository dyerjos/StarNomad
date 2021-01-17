extends YSort

var enemyShip = load("res://Enemies/EnemyShip.tscn")

onready var centerRight = $CenterRight
onready var centerLeft = $CenterLeft
onready var farRight = $FarRight
onready var farLeft = $FarLeft
onready var centerTop = $CenterTop
onready var directCenter = $DirectCenter


func _ready():
	GameManager.connect("sector_1", self, "spawn_sector_1")
	GameManager.connect("sector_2", self, "spawn_sector_2")
	GameManager.connect("sector_3", self, "spawn_sector_3")
	GameManager.connect("sector_4", self, "spawn_sector_4")
	GameManager.connect("sector_5", self, "spawn_sector_5")
	GameManager.connect("sector_6", self, "spawn_sector_6")
	GameManager.connect("sector_7", self, "spawn_sector_7")
	GameManager.connect("sector_8", self, "spawn_sector_8")
	GameManager.connect("sector_9", self, "spawn_sector_9")
	GameManager.connect("sector_10", self, "spawn_sector_10")
#	GameManager.connect("enemy_destroyed", self, "combat_check")


func _process(delta):
	GameManager.enemy_count = get_child_count()
	if GameManager.enemy_count <= 6 and GameManager.sector > 0:
		GameManager.can_jump = true
		GameManager.enemy_count = 0

#func combat_check():
#	if GameManager.enemy_count <= 6:
#		GameManager.can_jump = true
#		GameManager.enemy_count = 0
#	print(GameManager.enemy_count)

func spawn_sector_1():
	var enemyCenterTop = enemyShip.instance()
	enemyCenterTop.transform = centerTop.transform
	add_child(enemyCenterTop)

func spawn_sector_2():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)

func spawn_sector_3():
	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)
	
	var enemyCenterRight = enemyShip.instance()
	enemyCenterRight.transform = centerRight.transform
	add_child(enemyCenterRight)

func spawn_sector_4():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyCenterTop = enemyShip.instance()
	enemyCenterTop.transform = centerTop.transform
	add_child(enemyCenterTop)

	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)

func spawn_sector_5():
	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)

	var enemyCenterTop = enemyShip.instance()
	enemyCenterTop.transform = centerTop.transform
	add_child(enemyCenterTop)
	
	var enemyCenterRight = enemyShip.instance()
	enemyCenterRight.transform = centerRight.transform
	add_child(enemyCenterRight)

func spawn_sector_6():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)
	
	var enemyCenterRight = enemyShip.instance()
	enemyCenterRight.transform = centerRight.transform
	add_child(enemyCenterRight)

	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)

func spawn_sector_7():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)

	var enemyCenterTop = enemyShip.instance()
	enemyCenterTop.transform = centerTop.transform
	add_child(enemyCenterTop)
	
	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)


func spawn_sector_8():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)

	var enemyCenterRight = enemyShip.instance()
	enemyCenterRight.transform = centerRight.transform
	add_child(enemyCenterRight)

	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)


func spawn_sector_9():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)

	
	var enemyCenterRight = enemyShip.instance()
	enemyCenterRight.transform = centerRight.transform
	add_child(enemyCenterRight)

	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)

	var enemyDirectCenter = enemyShip.instance()
	enemyDirectCenter.transform = directCenter.transform
	add_child(enemyDirectCenter)

func spawn_sector_10():
	var enemyFarLeft = enemyShip.instance()
	enemyFarLeft.transform = farLeft.transform
	add_child(enemyFarLeft)

	var enemyCenterLeft = enemyShip.instance()
	enemyCenterLeft.transform = centerLeft.transform
	add_child(enemyCenterLeft)

	var enemyCenterTop = enemyShip.instance()
	enemyCenterTop.transform = centerTop.transform
	add_child(enemyCenterTop)
	
	var enemyCenterRight = enemyShip.instance()
	enemyCenterRight.transform = centerRight.transform
	add_child(enemyCenterRight)

	var enemyFarRight = enemyShip.instance()
	enemyFarRight.transform = farRight.transform
	add_child(enemyFarRight)

	var enemyDirectCenter = enemyShip.instance()
	enemyDirectCenter.transform = directCenter.transform
	add_child(enemyDirectCenter)

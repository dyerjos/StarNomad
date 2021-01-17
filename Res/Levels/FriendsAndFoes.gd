extends YSort

var enemyShip = load("res://Enemies/EnemyShip.tscn")

func _ready():
	GameManager.connect("sector_1", self, "spawn_sector_1")

func spawn_sector_1():
	pass

extends KinematicBody2D

var ship_health = 5 setget set_health
var max_health = 20 setget set_max_health

func _ready():
	self.max_health = GameManager.max_health
	self.ship_health = GameManager.ship_health
	GameManager.connect("health_changed", self, "set_health")
	GameManager.connect("max_health_changed", self, "set_max_health")
	GameManager.connect("no_health", self, "queue_free")

func set_health(value):
	ship_health = clamp(value, 0, max_health)
	print('ship_health in PlayerShip: ', ship_health)
#	if heartUIFull != null:
#		heartUIFull.rect_size.x = hearts * HEART_SIZE
	
func set_max_health(value):
	max_health = max(value, 1)
	print('max health changed!')
	self.ship_health = min(ship_health, max_health)
#	if heartUIEmpty != null:
#		heartUIEmpty.rect_size.x = max_hearts * HEART_SIZE

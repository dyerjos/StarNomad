extends KinematicBody2D

const SHIELD_CHARGE_SOUND = preload("res://Player/ShieldChargeSound.tscn")

var ship_health = 100 setget set_health
var max_health = 100 setget set_max_health

var hullSprite = load("res://Ship/Cockpit_v2.png")
var shieldSprite1 = load("res://Ship/Cockpit_shield1.png")
var shieldSprite2 = load("res://Ship/Cockpit_shield2.png")
var shieldSprite3 = load("res://Ship/Cockpit_shield3.png")

onready var cockPit = $CockPit

func _ready():
	self.max_health = GameManager.max_health
	self.ship_health = GameManager.ship_health
	GameManager.connect("health_changed", self, "set_health")
	GameManager.connect("max_health_changed", self, "set_max_health")
	GameManager.connect("no_health", self, "queue_free")
	GameManager.connect("shields_activating", self, "raise_shields")

func set_health(value):
	ship_health = clamp(value, 0, max_health)
	print('ship_health in PlayerShip: ', ship_health)
	if ship_health <= 25:
		cockPit.texture = hullSprite
	elif ship_health > 25 and ship_health <=50:
		cockPit.texture = shieldSprite1
	elif ship_health > 50 and ship_health <=75:
		cockPit.texture = shieldSprite2
	
func set_max_health(value):
	max_health = max(value, 1)
	print('max health changed!')
	self.ship_health = min(ship_health, max_health)

func raise_shields():
	var shieldChargeSound = SHIELD_CHARGE_SOUND.instance()
	get_parent().add_child(shieldChargeSound)
	yield(get_tree().create_timer(2.0), "timeout")
	cockPit.texture = shieldSprite1
	yield(get_tree().create_timer(2.0), "timeout")
	cockPit.texture = shieldSprite2
	yield(get_tree().create_timer(2.0), "timeout")
	cockPit.texture = shieldSprite3
	yield(get_tree().create_timer(3.0), "timeout")
	GameManager.shield_on = true

extends Node2D

export var enemy_id = 1
export(String) var enemy_label = null
export var cooldown = 0.5

var Missile = load("res://Enemies/Missile.tscn")

var can_shoot = false
var gameManager = GameManager
var turn = randi() % 2

onready var label = $Label
onready var missile_launcher_1 = $MissileLauncher1
onready var missile_launcher_2 = $MissileLauncher2
#onready var playerHull = get_node("/root/Main/PlayerShip/Hull")

func _ready():
	gameManager.connect("hit_target", self, "hit_check")
	gameManager.connect("no_health", self, "queue_free")
	assign_name()
	scale = Vector2( 0.1, 0.1 )
	yield(get_tree().create_timer(4.0), "timeout")
	can_shoot = true

func hit_check(text):
	print('received signal to delete ', text)
	if text.capitalize() == label.text:
		GameManager.target_destroyed += 1
		queue_free()

func assign_name():
	if enemy_label != null:
		label.text = enemy_label
	else:
		name = gameManager.name_hopper[0]
		label.text = name
		GameManager.name_hopper.remove(0)

func launch_missiles():
	if can_shoot:
		if turn == 0:
			var a = Missile.instance()
			get_parent().add_child(a)
			a.start(missile_launcher_1.global_transform)
			reload(1)
		elif turn == 1:
			var b = Missile.instance()
			get_parent().add_child(b)
			b.start(missile_launcher_2.global_transform)
			reload(0)
			
func _process(delta):
	launch_missiles()
	if scale < Vector2( 1, 1 ):
		scale +=  Vector2( 0.001, 0.001 )
		
func reload( missile):
	can_shoot = false
	turn = missile
	yield(get_tree().create_timer(cooldown), "timeout")
	can_shoot = true

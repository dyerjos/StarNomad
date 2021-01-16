extends Node2D

export var enemy_id = 1
export(String) var enemy_label = null
export var cooldown = 0.5

var Missile = load("res://Enemies/Missile.tscn")

var can_shoot = true
var gameManager = GameManager

onready var label = $Label
onready var missile_launcher_1 = $MissileLauncher1
onready var missile_launcher_2 = $MissileLauncher2
onready var target = $Target

func _ready():
	gameManager.connect("hit_target", self, "hit_check")
	assign_name()
	missile_launcher_1.look_at(target.global_position)
	missile_launcher_2.look_at(target.global_position)

func hit_check(text):
	print('received signal to delete ', text)
	if text == label.text:
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
		var a = Missile.instance()
		var b = Missile.instance()
		get_parent().add_child(a)
		get_parent().add_child(b)
		a.start(missile_launcher_1.global_transform, target)
		b.start(missile_launcher_2.global_transform, target)
		can_shoot = false
		yield(get_tree().create_timer(cooldown), "timeout")
		can_shoot = true
			
func _process(delta):
	missile_launcher_1.look_at(target.global_position)
	missile_launcher_2.look_at(target.global_position)
	launch_missiles()
		

extends Node2D

#const EnemyDeathEffect = preload("res://Action RPG Resources/Effects/EnemyDeathEffect.tscn")

export var enemy_id = 1
export(String) var enemy_label = null

var gameManager = GameManager

onready var label = $Label

func _ready():
	gameManager.connect("hit_target", self, "hit_check")
	assign_name()

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

extends Node2D

signal hit_target(text)

export var total_names = 20

var target =  null setget set_target
var name_hopper = [] # add setget gen_more_names if running out is concern

func _ready() -> void:
	randomize()
	var res = preload("res://nameGenerator.tres")
	var adjectives = res.adjectives.capitalize()
	var nouns = res.nouns.capitalize()
	name_generator(adjectives, nouns)
	
func set_target(text):
	target = text
	emit_signal("hit_target", text)

func name_generator(adjectives, nouns):
	var adj_comma_arr = adjectives.split(" ", true, 0)
	var noun_comma_arr = nouns.split(" ", true, 0)
	var total_adj = adj_comma_arr.size()
	var total_nouns = noun_comma_arr.size()
	var format_string = "%s %s"
	var name_counter = 0
	
	while name_counter < total_names:
		var adjective = adj_comma_arr[randi() % total_adj - 1]
		var noun = noun_comma_arr[randi() % total_nouns - 1]
		var new_name = format_string % [adjective, noun]
		name_hopper.append(new_name)
		name_counter += 1

	print('precompiled array ', name_hopper)

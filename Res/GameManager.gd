extends Node2D

signal hit_target(text)
signal no_health
signal health_changed(value)
signal max_health_changed(value)
signal shields_activating
signal shields_online


export var total_names = 5
export(int) var max_health = 5 setget set_max_health


var shield_activating = false setget activate_shields
var shield_on = false setget shieldOn
var ship_health = max_health setget set_health
var res = preload("res://nameGenerator.tres")
var target =  null setget set_target
var name_hopper = [] # add setget gen_more_names if running out is concern
var sector = 0 setget load_sector
var can_jump = false

func _ready():
	randomize()
	self.ship_health = max_health
	name_generator()

	
func set_target(text):
	target = text
	emit_signal("hit_target", text)

func name_generator():
	var adjectives = res.adjectives.capitalize()
	var nouns = res.nouns.capitalize()
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
	
func set_max_health(value):
	max_health = value
	self.ship_health = min(ship_health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	ship_health = value
	print(ship_health)
	emit_signal("health_changed", ship_health)
	if ship_health <= 0:
		emit_signal("no_health")
		# end game (que fre everything?)

func activate_shields(value):
	shield_activating = value
	print('gameManager is now activating shields')
	emit_signal("shields_activating")
	
func shieldOn(value):
	shield_on = value
	emit_signal('shields_online')
	
func load_sector(value):
	print('loading sector ', value)
	can_jump = false
	emit_signal('sector_1')

extends Area2D

const SHIELD_HIT_SOUND = preload("res://Player/ShieldHitSound.tscn")

export var speed = 300
export var steer_force = 50.0
export var damage = 1

onready var gameManager = GameManager

var velocity = Vector2.DOWN
var acceleration = Vector2.ZERO
var target = null

func _ready() -> void:
	gameManager.connect("no_health", self, "queue_free")

func start(_transform, _target):
	global_transform = _transform
	rotation = velocity.angle()
#	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed
	target = _target
	scale = Vector2( 0.01, 0.01 )

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta
#	scale +=  Vector2( 0.002, 0.002 )
	if scale < Vector2( .1, .1 ):
		scale +=  Vector2( 0.001, 0.001 )
	else:
		scale +=  Vector2( 0.01, 0.01 )

func _on_Missile_body_entered(body):
	print('boom')
	gameManager.ship_health -= damage
	var shieldHitSound = SHIELD_HIT_SOUND.instance()
	get_parent().add_child(shieldHitSound)
	queue_free()

func _on_Lifetime_timeout():
	queue_free()
	
func seek():
	var steer = velocity
	if target:
		var desired = (target.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

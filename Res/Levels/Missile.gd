extends Area2D

const SHIELD_HIT_SOUND = preload("res://Player/ShieldHitSound.tscn")

export var speed = 15
export var steer_force = 1.0
export var damage = 5

onready var gameManager = GameManager
onready var playerHull = get_node("/root/Main/PlayerShip/Hull")

var velocity = Vector2.DOWN
var acceleration = Vector2.ZERO
var target = null

func _ready() -> void:
	gameManager.connect("no_health", self, "queue_free")

func start(_transform):
	global_transform = _transform
	target = playerHull
	rotation = velocity.angle()
#	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed
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

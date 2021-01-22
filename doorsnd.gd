extends AudioStreamPlayer3D

const wall_width: float = 2.4384
const interval: float = 64.0 / 70.0
var time: float = 0
var initial_position: Vector3 = transform.origin - Vector3(wall_width * 2.5, 0, 0)
var phase: int = -1

func _ready():
	transform.origin = initial_position
	next_phase()

func _process(delta):
	time += delta
	if phase == 0:
		transform.origin = initial_position + Vector3(wall_width / ((interval - time) / interval), 0, 0)
	elif phase == 3:
		transform.origin = initial_position + Vector3(wall_width / (time / interval), 0, 0)
	if time >= interval:
		next_phase()

func next_phase():
	time = 0
	phase += 1
	if phase > 6:
		phase = 0
	if phase == 0:
		stream = load("res://OPENDOORSND.wav")
		play()
	elif phase == 3:
		stream = load("res://CLOSEDOORSND.wav")
		play()

extends CharacterBody3D

@export var speed: float = 5.0
@export var sprintSpeed: float = 10.0
@export var jump_strength: float = 10.0
@export var mouse_sensitivity: float = 0.002
@export var gravity: float = 30.0
@export var grabForce: float = 10.0  # Force to apply to grabbed object
@export var release_force: float = 0.5  # Force applied when releasing the object

var yaw := 0.0
var pitch := 0.0

var grab: RigidBody3D = null  # Reference to the currently grabbed object

@onready var camera: Camera3D = $camPivot/Camera3D
@onready var grab_ray: RayCast3D = $camPivot/Camera3D/GrabRay  # Raycast for object grabbing
@onready var grab_target: Node3D = $camPivot/Camera3D/GrabRay/GrabTarget  # Target point where grabbed object will go
@onready var camera_pivot: Node3D = $camPivot

# Initialize the player controls and camera
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED  # Captures the mouse for first-person control

func _input(event):
	# Handle mouse movement for camera rotation
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity
		pitch = clamp(pitch, deg_to_rad(-89), deg_to_rad(89))

		rotation.y = yaw
		camera_pivot.rotation.x = pitch

# Update player movement and grab actions
func _physics_process(delta):
	var input_dir = Vector3.ZERO

	# Handle movement input
	if Input.is_action_pressed("move_forward"):
		input_dir.z -= 1
	if Input.is_action_pressed("move_backward"):
		input_dir.z += 1
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
	if Input.is_action_pressed("EXIT"):
		get_tree().quit()

	# Sprinting logic
	if Input.is_action_pressed("sprint"):
		speed = sprintSpeed
	else:
		speed = 5.0

	# Normalize direction to prevent diagonal speed increase
	input_dir = input_dir.normalized()

	# Calculate the desired movement direction in world space
	var direction = (transform.basis * input_dir).normalized()

	# Apply movement
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	# Jump logic
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_strength  # Apply upward force on jump

	# Apply gravity if not on the floor
	if not is_on_floor():
		velocity.y -= gravity * delta

	# move character using physics engine and whatnot
	move_and_slide()

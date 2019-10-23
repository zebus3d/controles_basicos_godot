extends KinematicBody

var speed = 660 
var gravity = -18
var velocity = Vector3()
const jump = 80 

func _physics_process(delta):
	var dir = Vector3()
	var rot = Vector3(self.rotation.x, self.rotation.y, self.rotation.z) 
	
	if (Input.is_action_pressed("KEY_W") or Input.is_action_pressed("ui_up") ):
		dir.z -= 1
	if (Input.is_action_pressed("KEY_S") or Input.is_action_pressed("ui_down")):
		dir.z += 1
	if Input.is_action_pressed("KEY_A"):
		rot.y += 1
		self.rotation_degrees.y += 1
	if Input.is_action_pressed("KEY_D"):
		rot.y -= 1
		self.rotation_degrees.y -= 1

	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right") :
		dir.x += 1
		
	# saltar:
	if is_on_floor():
		speed = 660
		if Input.is_action_just_pressed("space"):
			dir.y = jump
	else:
		speed = 750

	dir = dir.normalized()
	dir = dir * speed * delta
	
	velocity.y += delta * gravity + dir.y
		
	velocity.x = dir.x
	velocity.z = dir.z
	
	# rotando el vector segun la rotacion del KB_Player:
	velocity = velocity.rotated(Vector3(0, 1, 0), rot.y)
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))

extends RigidBody

var cantidad_rot = 90
var velocidad_rot = 0.04

func _process(delta):
	var vel_rot = velocidad_rot * delta
	
	if Input.is_action_pressed("ui_left"):
		#self.rotation.y += cantidad_rot 
		self.rotation.y = lerp(
		self.rotation.y, 
		self.rotation.y+cantidad_rot, 
		vel_rot)
	
	if Input.is_action_pressed("ui_right"):
		#self.rotation.y -= cantidad_rot
		self.rotation.y = lerp(
		self.rotation.y, 
		self.rotation.y-cantidad_rot, 
		vel_rot)

	if Input.is_action_pressed("ui_up"):
		self.translation -= self.transform.basis.z.normalized()/20
		
	if Input.is_action_pressed("ui_down"):
		self.translation += self.transform.basis.z.normalized()/20
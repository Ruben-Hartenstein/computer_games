# name: Ruben Hartenstein

extends Panel

# Declare the nodes
var panel
var label
var button

var counter_active = false
var elapsed_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create the panel
	panel = Panel.new()
	panel.size = Vector2(200, 200)
	self.add_child(panel)
	
	# Create the label
	label = Label.new()
	label.size = Vector2(200, 40)
	label.position = Vector2(0, (panel.size.y - label.size.y) / 2)
	panel.add_child(label)
	
	# Create the button
	button = Button.new()
	button.size = Vector2(100, 40)
	button.position = Vector2(50, 120) 
	panel.add_child(button)
	
	# Update the text of the label
	label.text = "Hello!"
	
	button.pressed.connect(self._button_pressed)

func _button_pressed():
	if counter_active:
		counter_active = false
	else:
		counter_active = true
		# Not sure if I am supposed to reset the timer so I commented it out
			#elapsed_time =  0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counter_active:
		elapsed_time += delta
		label.text = str(round_to_dec(elapsed_time, 2))
		
func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

# Why is it important to know the time between two frames in the game?
# It is important to make calculation independent of the framerate
# in order to achieve the same behaviour of the game in different setups.
# For example for the physics engine. If we would take the framerate to
# determine the speed of an object one could slow down the object by
# setting the graphics to high, or having a bad setup, etc.
# It is also important for input handling. By scaling the movement and input
# of the player based on delta time, the game responds more predictable and
# smooth to player actions.
# Another point is for the Game Logic and AI. Delta time is used to update
# the internal game state to allow for time-dependent actions such as cooldown,
# timed events or AI decision-making regardless of the framerate
# It can also help to monitor the delta time to identify performance issues.
# A high delta time indicates frame rate drops or performance bottlenecks

# name: Ruben Hartenstein

extends Panel

# Define enum for states
enum States {BED, HOME, WORK}

# Initialize variables
var current_state = States.BED
var action_h_pressed = false
var action_w_pressed = false
var action_b_pressed = false
var label

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Handle action_h
	if Input.is_action_pressed("action_h") and not action_h_pressed:
		if current_state != States.HOME:
			current_state = States.HOME
			action_h_pressed = true
			queue_redraw()
	elif not Input.is_action_pressed("action_h"):
		action_h_pressed = false
		
	# Handle action_w
	if Input.is_action_pressed("action_w") and not action_w_pressed:
		if current_state == States.HOME:
			current_state = States.WORK
			action_w_pressed = true
			queue_redraw()
	elif not Input.is_action_pressed("action_w"):
		action_w_pressed = false
	
	# Handle action_b
	if Input.is_action_pressed("action_b") and not action_b_pressed:
		if current_state == States.HOME:
			current_state = States.BED
			action_b_pressed = true
			queue_redraw()
	elif not Input.is_action_pressed("action_b"):
		action_b_pressed = false
	
	# Update label with current state
	label.text = States.keys()[current_state]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _draw():
	# Draw a rectangle with color based on the current state
	var color
	match current_state:
		States.BED:
			color = Color.GREEN
		States.HOME:
			color = Color.BLUE
		States.WORK:
			color = Color.RED
	
	draw_rect(Rect2(Vector2.ZERO, size), color)
	

# How do you come to this implementation?
# Input Handling:
#	- I referenced the InputMap documentation to capture keyboard inputs.
# 	- Three actions were created, one for each button, to handle input using is_action_pressed().
# 	- Button debouncing was implemented using flags to ensure each button press is handled only once per loop iteration.
# State Machine Implementation:
#	- Based on the current state and pressed button I could change the current state based on the given state machine.
#	- Starting in the BED state, I chose to represent states using an enum for readability, memory efficiency, and type safety.
# Visual Representation:
#	- To visually represent state changes, I used queue_redraw() to update the panel's appearance everytime the state changes.
#	- In the _draw() function, a color is chosen based on the current state, and the panel is filled with that color.
#
# How could be further improved for this implementation when there are more than 100 states?
# Optimized Data Structures
#	- Instead of relying on an enum, more dynamic data structures could be used like a directed graph or a lookup table.
#	- Directed graphs can represent complex state transitions efficiently allowing for more scalability.
#	- Lookup tables provide a more efficient mapping between input events and state transitions.
# State Management Optimization
#	- A more advanced state management technique could be used like hierarchical state machines
#	- Hierarchical state machines organize states into hierarchical structures and therefore reducing complexity and improving modularity.

extends Area2D

@onready var timer: Timer = $Timer

# Detect when the player enters the killzone.
func _on_body_entered(body: Node2D) -> void:
	# Ensure that the body is the player.
	if body.name == "Player":  # Make sure to use the correct player node name
		Engine.time_scale = 0.25  # Slow down time for dramatic effect
		
		# Free the player's collision shape to prevent further collisions.
		var collision_shape = body.get_node("CollisionShape2D")
		if collision_shape:
			collision_shape.queue_free()
		
		# Play the player's death animation.
		var sprite = body.get_node("AnimatedSprite2D")
		sprite.play("death")
		
		# Start the timer to reload the scene after the death animation.
		timer.start()

# Reset the time scale and reload the scene when the timer finishes.
func _on_timer_timeout() -> void:
	Engine.time_scale = 1  # Restore the normal time scale
	get_tree().reload_current_scene()  # Reload the current scene

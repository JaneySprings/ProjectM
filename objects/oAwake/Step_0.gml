if (instance_exists(oPlayer))
	if (distance_to_object(oPlayer) < 380) {
		instance_activate_object(AwakeId);
		instance_destroy();
	}
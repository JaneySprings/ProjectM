//HideLight
if (instance_exists(oPlayer)) {
	if (distance_to_object(oPlayer) > 420) {
		with (instance_create_layer(x,y,"SpecialLayer",oAwake)) AwakeId = other.id;
		instance_deactivate_object(id);
	}
}
//Light flashing
if (Flash < FlashMax) Flash += 0.01;
if (Flash > FlashMax) Flash -= 0.01;
if (Flash == FlashMax) {
	part_emitter_burst(FireSystem,FireEmitter,FlickParticle,1);
	FlashMax = choose(0.5,0.6,0.7);
}

with (LightId) Alpha = other.Flash;
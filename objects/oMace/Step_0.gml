//Optimize memory awake object create
if (instance_exists(oPlayer)) {
	if (distance_to_object(oPlayer) > 770) {
		with (instance_create_layer(x,y,"NpcLayer",oAwake)) AwakeId = other.id;
		instance_deactivate_object(id);
	}
}

AngleAccelerration = -0.2 * dcos(Angle);
    
AngleVelocity += AngleAccelerration;
Angle += AngleVelocity;
  
//Speed down
//AngleVelocity *= VelocityDampening;

var new_x = AnchorX + lengthdir_x(Distance , Angle);
var new_y = AnchorY + lengthdir_y(Distance , Angle);

hsp = new_x - x;
vsp = new_y - y;

x += hsp;
y += vsp;

image_angle = Angle+90;
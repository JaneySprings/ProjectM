/// @function scrPartSprite(Part_id,Sprite, index_random, Xscale, Yscale, Animation)
/// @param particle_id
/// @param sprite_index
/// @param image_index_random
/// @param pt_xscale
/// @param pt_yscale
/// @param animation

var Particle =		argument0;
var Sprite =		argument1;
var Index =         argument2;
var Xscale =		argument3;
var Yscale =		argument4;
var Animation =		argument5;

part_type_sprite(Particle,Sprite,Animation,true,Index);
part_type_scale(Particle,Xscale,Yscale);
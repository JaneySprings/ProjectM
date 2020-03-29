/// @function scrPartTypeMain(Particle, Type, Xscale, Yscale, Gravity, DravDir, minLife, maxLife, blend)
/// @param particle_id
/// @param pt_type 
/// @param pt_xscale
/// @param pt_yscale
/// @param grv_size
/// @param grv_dir
/// @param min_life 
/// @param max_life
/// @param blend

var Particle =		argument0;
var Type =			argument1;
var Xscale =		argument2;
var Yscale =		argument3;
var Grav =			argument4;
var GravDir =		argument5;
var MinLive =		argument6;
var MaxLive =		argument7;
var ColorBlend =    argument8;

if (Type != noone) { 
    part_type_shape(Particle,Type);
    part_type_scale(Particle,Xscale,Yscale);
}

part_type_gravity(Particle,Grav,GravDir);
part_type_blend(Particle,ColorBlend);
part_type_life(Particle,MinLive,MaxLive);
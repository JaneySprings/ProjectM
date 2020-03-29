/// @desc Shorthand for part_type_speed
/// @param ind
/// @param minSpeed
/// @param optionalMaxSpeed
/// @param optionalIncr
/// @param optionalWiggle

var minSpeed = argument[1];
var maxSpeed = minSpeed;
var incr = 0;
var wiggle = 0;

if (argument_count > 2) {
	maxSpeed = argument[2];
}

if (argument_count > 3) {
    incr = argument[3];
}

if (argument_count > 4) {
    wiggle = argument[4];
}

part_type_speed(argument[0], minSpeed, maxSpeed, incr, wiggle);
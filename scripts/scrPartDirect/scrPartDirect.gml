/// @desc Shorthand for part_type_direction
/// Note: Pass in PT.Any as the first argument for a default set of 0, 364, 0, 0
/// @param Ind
/// @param minDir
/// @param optionalMaxDir
/// @param optionalIncr
/// @param optionalWiggle

var minDir = argument[1];
var maxDir = argument[1];
var incr = 0;
var wiggle = 0;

if (argument_count > 2)
	maxDir = argument[2];
	
if (argument_count > 3)
	incr = argument[3];



part_type_direction(argument[0], minDir, maxDir, incr, wiggle);
/// @desc Shorthand for part_type_color
/// @param Ind
/// @param color1
/// @param optionalColor2
/// @param optionalColor3

if (argument_count == 2) {
    part_type_color1(argument[0], argument[1]);
} else if (argument_count == 3) {
    part_type_color2(argument[0], argument[1], argument[2]);
} else if (argument_count == 4) {
    part_type_color3(argument[0], argument[1], argument[2], argument[3]);
}
/// @desc Shorthand for part_type_alpha
/// @param ind
/// @param alpha1
/// @param optionalAlpha2
/// @param optionalAlpha3

if (argument_count == 2) {
    part_type_alpha1(argument[0], argument[1]);
} else if (argument_count == 3) {
    part_type_alpha2(argument[0], argument[1], argument[2]);
} else if (argument_count == 4) {
    part_type_alpha3(argument[0], argument[1], argument[2], argument[3]);
}
/// @function scrGetNumber(section, key)
/// @param Section
/// @param key

var Section =	argument0;
var Key =		argument1;
var Number =	0;

ini_open("UserData/common.ini");
Number = ini_read_real(Section, Key, -1);
ini_close();

return Number;
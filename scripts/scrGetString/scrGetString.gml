/// @function scrGetString(langtype ,section, key)
/// @param LangType
/// @param Section
/// @param key

var LangType =	argument0;
var Section =	argument1;
var Key =		argument2;
var str =		"";

if (LangType == "en") {
	ini_open("Lang/en.ini");
	str = ini_read_string(Section, Key, "error");
	ini_close();
}

if (LangType == "ru") {
	ini_open("Lang/ru.ini");
	str = ini_read_string(Section, Key, "ошибка");
	ini_close();
	
}

str = string_replace_all(str,"//n","\n");
return str;
//DIRECTION KEYS
global.keyUp =			keyboard_check(vk_up) or keyboard_check(ord("W"));
global.keyDown =		keyboard_check(vk_down) or keyboard_check(ord("S"));
global.keyLeft =		keyboard_check(vk_left) or keyboard_check(ord("A"));
global.keyRight =		keyboard_check(vk_right) or keyboard_check(ord("D"));
	
//DIRECTION KEYS PRESSED
global.keyUpP =			keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
global.keyDownP =		keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
global.keyLeftP =		keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
global.keyRightP =		keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	
//ACTION KEYS
global.keySpace =		keyboard_check(vk_space);
global.keySpaceP =		keyboard_check_pressed(vk_space);
global.keyShiftP =		keyboard_check_pressed(vk_shift);
global.keyOrdfP =		keyboard_check_pressed(ord("F"));

//SUB KEYS
global.keyEnterP =		keyboard_check_pressed(vk_enter);
global.keyEscP =		keyboard_check_pressed(vk_escape); 
global.keyAnyP =		keyboard_check_pressed(vk_anykey);
global.keyTabP =		keyboard_check_pressed(vk_tab);
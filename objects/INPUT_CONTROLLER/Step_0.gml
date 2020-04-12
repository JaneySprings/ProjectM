//DIRECTION KEYS
global.InputKeycodeUP =				keyboard_check(vk_up) or keyboard_check(ord("W"));
global.InputKeycodeDOWN =		keyboard_check(vk_down) or keyboard_check(ord("S"));
global.InputKeycodeLEFT =			keyboard_check(vk_left) or keyboard_check(ord("A"));
global.InputKeycodeRIGHT =			keyboard_check(vk_right) or keyboard_check(ord("D"));
	
//DIRECTION KEYS PRESSED
global.InputKeycodeUP_pressed =			keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
global.InputKeycodeDOWN_pressed =	keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
global.InputKeycodeLEFT_pressed =		keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
global.InputKeycodeRIGHT_pressed =	keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	
//ACTION KEYS
global.InputKeycodeSPACE=						keyboard_check(vk_space);
global.InputKeycodeSPACE_pressed =		keyboard_check_pressed(vk_space);
global.InputKeycodeSHIFT_pressed =		keyboard_check_pressed(vk_shift);
global.InputKeycodeF_pressed =				keyboard_check_pressed(ord("F"));

//SUB KEYS
global.InputKeycodeENTER_pressed =		keyboard_check_pressed(vk_enter);
global.InputKeycodeESCAPE_pressed =		keyboard_check_pressed(vk_escape); 
global.InputKeycodeANYKEY_pressed =		keyboard_check_pressed(vk_anykey);
global.InputKeycodeTAB_pressed =				keyboard_check_pressed(vk_tab);
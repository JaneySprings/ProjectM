/*
///determinant(det)
в конце второй строки указывается параметр обьекта
который говорит. (1/2) и тд
*/
ArrayIndex = 0;
print =			"";

l =				0;
a =				1;
w =				0;
h =				0;
border =		2;
det =			"1";

ypos =			-128;
quit =			false;

VoiceFirst =	noone;
VoiceSecond =	noone;

with (oPlayer) {
	function_DisableUserInput = true;
	function_SetPlayerUiInvisible = true;
}
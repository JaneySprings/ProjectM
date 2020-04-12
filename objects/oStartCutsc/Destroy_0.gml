if (!ShowStartCutsc) with (oPlayer) {
	function_DisableUserInput = false;
	function_SetPlayerUiInvisible  = false;
}
oCamera.follow = oPlayer;
if (ShowKeyMapping) instance_create_layer(x,y,"TextLayer",oKeyMapDraw);
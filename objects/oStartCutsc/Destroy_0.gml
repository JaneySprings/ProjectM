if (!ShowStartCutsc) with (oPlayer) {
	DisableInput = false;
	HideUI  = false;
}
oCamera.follow = oPlayer;
if (ShowKeyMapping) instance_create_layer(x,y,"TextLayer",oKeyMapDraw);
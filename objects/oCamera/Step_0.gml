/// Update camera
//update destenation
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	//update object possition 20
	x = lerp(x,xTo,0.05);
	y = lerp(y,yTo,0.05);
	
}
//keep camera inside room
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);


x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_lenght)*shake_power));

//update object position
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

//paralax
if(layer_exists("BridgeBack1")) { //far
	layer_x("BridgeBack1", x/1.5); 
	layer_y("BridgeBack1",(y-96)/1.2);
}
if(layer_exists("BridgeBack2")) {
	layer_x("BridgeBack2", x/2.5); 
	layer_y("BridgeBack2",(y+256)/1.5);
}

//follow
if(layer_exists("BridgeBackMoon")){
	layer_x("BridgeBackMoon",x-60);
	layer_y("BridgeBackMoon",(y-150)/1.1);
}
if(layer_exists("MainBackGradient")){
	layer_x("MainBackGradient",x);
	layer_y("MainBackGradient",(y-144)/1.1);
}
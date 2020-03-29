/// Set camera
cam = view_camera[0];
follow = oPlayer; 

camera_set_view_size(cam,480,270);

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;

shake_lenght = 0;
shake_power = 0;
shake_remain = 0;
buff = 16;

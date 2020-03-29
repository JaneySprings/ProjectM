varying vec2 v_vTexcoord;

uniform float blur_range;//this is the blur range how blurry everything is
uniform sampler2D surface_factor;//this the sample where it retrieves the red color from the surface, the REDDER the BLURRIER.

float pixel_range=25.0;
//^ This is the soft cap, the "detail" of the blur 
//max number is 127 becouse loops can only get to 255
//decrease for better performance, i recommend about 25 for perforamnce/heavy blur used games
//i recommend 10 if you want a little bit of blur at any point in the game max. ofcourse you can experiment

void main()
{
vec4 target_pixel=vec4(0.0);
float current_pixel=-pixel_range;

while (current_pixel<pixel_range)
    {
    vec4 factor=texture2D(surface_factor,v_vTexcoord);
    
    float get_pixel=1.0/1280.0*current_pixel*(1.0/pixel_range*blur_range*factor.r);
    //^ This is the formula that gets all the pixels in line needed to "normalize" the target_pixel
    //^ the blur_range may go as far as you like but eventually you will see "blocks"
    
    target_pixel=texture2D(gm_BaseTexture,vec2(v_vTexcoord.x+get_pixel,v_vTexcoord.y));//getting the current pixel
    
    target_pixel*=(1.0-abs(cos(90.0/pixel_range*(current_pixel+pixel_range)/180.0*3.14159265359)));
    //^ multiplying the current pixel with all the other pixels, not just simply multiplying.
    //instead of 1+1+1+1+1=5/5 to get the average(which will cause blocky blur effect). 
    //we use cos(60)*1+cos(30)*1+cos(0)+cos(30)*1+cos(60)*1=3.7/5 to get the correct blur, 
    //its more complicated but the more on the edege of the current pixel range the less it takes in account in a cosine wave.(max 90 degress and absolute)
    
    gl_FragColor+=target_pixel/(72.7/100.0*pixel_range);
    //^ didnt want to figure the mathematical formula out on why there are 72.7 total colors at pixel_range 100
    
    current_pixel+=1.0;
    }
}
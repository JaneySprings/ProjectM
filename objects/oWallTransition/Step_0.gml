if (set) {
	alpha -= 0.005;	
	if (alpha == 0.6)
		set = false;
} else {
	alpha += 0.005;	
	if (alpha > 1)
		set = true;
}
image_alpha = alpha;
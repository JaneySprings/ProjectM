if (ToBlack) {
	if (alpha < 1) and (!set) alpha += incr;
	else if (ToClear) set = true;
	else instance_destroy();
}
if (ToClear) {
	if (alpha > 0) and (set) alpha -= incr;
	else if (alpha <= 0) instance_destroy();
}
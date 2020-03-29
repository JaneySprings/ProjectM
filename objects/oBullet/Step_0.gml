/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (LiveTime > 0) Tick++;
if (Tick >= LiveTime) and (LiveTime != -1) instance_destroy();
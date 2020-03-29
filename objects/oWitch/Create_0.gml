/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

CastIndex =			-1;

Triggered =			false;
SetRandonEvent =	true;

EndThisEvent =		false;
CanShoot =			true;

ChoosedInstance =	noone;

//particles
CastSystem = part_system_create();
CastParticle = part_type_create();
CastEmitter = part_emitter_create(CastSystem);	
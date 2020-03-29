var saveSettings;
    
saveSettings = ds_map_secure_load("Configfile");

global.resolution = ds_map_find_value(saveSettings,"resolution");
global.fullscreenMode = ds_map_find_value(saveSettings,"ScreenMode");
global.raytrace = ds_map_find_value(saveSettings,"Raytrace");
global.volumeState = ds_map_find_value(saveSettings,"VolumeState");
global.langtype = ds_map_find_value(saveSettings,"langtype");

ds_map_destroy(saveSettings);
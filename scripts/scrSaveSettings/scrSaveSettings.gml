var saveSettings = ds_map_create();

ds_map_add(saveSettings,"resolution",global.resolution);
ds_map_add(saveSettings,"ScreenMode",global.fullscreenMode);
ds_map_add(saveSettings,"Raytrace",global.raytrace);
ds_map_add(saveSettings,"VolumeState",global.volumeState);
ds_map_add(saveSettings,"langtype",global.langtype);

ds_map_secure_save(saveSettings,"Configfile");

ds_map_destroy(saveSettings);
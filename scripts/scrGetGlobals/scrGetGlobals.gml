/// @function scrGetString(key)
/// @param {string} key

var saveSettings;
var Key = argument0;
    
saveSettings = ds_map_secure_load("user_data");

return ds_map_find_value(saveSettings,Key);

ds_map_destroy(saveSettings);
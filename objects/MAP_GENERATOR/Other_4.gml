switch (GenerationScriptIndex) {
	case 1: GeneratedBlockWidth = 384; GeneratedBlockHeight = 256; break;
	default: GeneratedBlockWidth = room_width; GeneratedBlockHeight = room_height; break;
}

GeneratedRoomWidth =		room_width;
GeneratedRoomHeight =		room_height;

ArrayW =					GeneratedRoomWidth / GeneratedBlockWidth;
ArrayH =					GeneratedRoomHeight / GeneratedBlockHeight;

//Update layer id
MainTileLayer_id =			layer_tilemap_get_id(layer_get_id("BackgroundTilesLayer"));
InterierTileLayer_id =		layer_tilemap_get_id(layer_get_id("MiddlegroundTilesLayer"));
ForwardTileLayer_id =		layer_tilemap_get_id(layer_get_id("ForegroundTilesLayer"));
SettingTileLayer_id =		layer_tilemap_get_id(layer_get_id("TilesCasters"));
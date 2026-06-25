package player

import console "core:fmt"
import "vendor:raylib"

import "../../entities"

@(private)
player_entity: entities.Entity_2D

IMAGE_FILE_PATH :: "atlas.png"

frame_counter: f32
frame_speed: f32
current_frame: f32

load_player_image :: proc() {

	player_entity.sprite = raylib.LoadTexture(IMAGE_FILE_PATH)
	player_entity.translate.position = {400, 300}
}

draw_texture :: proc() {
	raylib.DrawTexture(player_entity.sprite, 15, 40, raylib.WHITE)
}

unload_texture :: proc() {

	raylib.UnloadTexture(player_entity.sprite)
}

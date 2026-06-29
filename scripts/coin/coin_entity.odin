package coin

import "../../entities"
import "vendor:raylib"

@(private)
IMAGE_FILE_PATH :: "atlas.png"

@(private)
MAX_SPEED :: 2.5
@(private)
MIN_SPEED :: 1

@(private)
coin_entity: entities.Entity_2D
@(private)
frame_rectangle: raylib.Rectangle

@(private)
frame_counter: f32 = 0
@(private)
frame_speed: f32 = 8
@(private)
current_frame: int = 1

load_coin_image :: proc() {
	coin_entity.sprite = raylib.LoadTexture(IMAGE_FILE_PATH)
	coin_entity.translate.position = {400, 300}

	frame_rectangle = {
		cast(f32)coin_entity.sprite.width / 3,
		0,
		cast(f32)coin_entity.sprite.width / 3,
		cast(f32)coin_entity.sprite.height / 3,
	}
}

animation_texture :: proc() {
	frame_counter += 1

	if frame_counter >= 60.0 / frame_speed {
		frame_counter = 0

		current_frame += 1
		if (current_frame > 2) {
			current_frame = 1
		}

		frame_rectangle.x = cast(f32)current_frame * (cast(f32)coin_entity.sprite.width / 3)
	}

	if frame_speed > MAX_SPEED {
		frame_speed = MAX_SPEED
	}

	if frame_speed < MIN_SPEED {
		frame_speed = MIN_SPEED
	}
}

draw_texture :: proc() {
	raylib.DrawTextureRec(
		coin_entity.sprite,
		frame_rectangle,
		coin_entity.translate.position,
		raylib.WHITE,
	)
}

unload_texture :: proc() {
	raylib.UnloadTexture(coin_entity.sprite)
}

hit_box_player :: proc() {

}

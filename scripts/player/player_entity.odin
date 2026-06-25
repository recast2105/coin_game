package player

import "../../entities"
import console "core:fmt"
import "vendor:raylib"

IMAGE_FILE_PATH :: "atlas.png"

MAX_SPEED :: 8
MIN_SPEED :: 1

@(private)
player_entity: entities.Entity_2D


frame_rectangle: raylib.Rectangle

frame_counter: f32 = 0
frame_speed: f32 = 8
current_frame: int = 0

load_player_image :: proc() {
	player_entity.sprite = raylib.LoadTexture(IMAGE_FILE_PATH)
	player_entity.translate.position = {400, 300}

	frame_rectangle = {
		0,
		0,
		cast(f32)player_entity.sprite.width / 3,
		cast(f32)player_entity.sprite.height / 2.5,
	}

	console.println("Struct Size player: ", size_of(player_entity), "Bytes")
}

animation_texture :: proc() {
	frame_counter += 1

	if frame_counter >= 60.0 / frame_speed {
		frame_counter = 0

		current_frame += 1
		if (current_frame > 3) {
			current_frame = 0
		}

		frame_rectangle.y = cast(f32)current_frame * (cast(f32)player_entity.sprite.height / 3)
	}

	if raylib.IsKeyPressed(raylib.KeyboardKey.RIGHT) {
		frame_speed += 1
	}

	if raylib.IsKeyPressed(raylib.KeyboardKey.LEFT) {
		frame_speed -= 1
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
		player_entity.sprite,
		frame_rectangle,
		player_entity.translate.position,
		raylib.WHITE,
	)
}

unload_texture :: proc() {
	raylib.UnloadTexture(player_entity.sprite)
}

movement :: proc() {
	if raylib.IsKeyDown(raylib.KeyboardKey.RIGHT) {
		player_entity.translate.position.x += 1
		// console.println("Moving!")
	}

	if raylib.IsKeyDown(raylib.KeyboardKey.LEFT) {
		player_entity.translate.position.x -= 1
		// console.println("Moving!")
	}

	if raylib.IsKeyDown(raylib.KeyboardKey.UP) {
		player_entity.translate.position.y -= 1
		// console.println("Moving!")
	}

	if raylib.IsKeyDown(raylib.KeyboardKey.DOWN) {
		player_entity.translate.position.y += 1
		// console.println("Moving!")
	}
}

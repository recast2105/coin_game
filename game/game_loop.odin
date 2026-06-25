package game

import "../scripts/player"
import "../system"

import "vendor:raylib"

window_config := system.Config {
	width       = 800,
	height      = 600,
	window_name = "Collect Coin Game",
}

start :: proc() {
	raylib.InitWindow(window_config.width, window_config.height, window_config.window_name)

	raylib.SetTargetFPS(60)

	player.load_player_image()
}

update :: proc() {
	for !raylib.WindowShouldClose() {

		player.animation_texture()
		player.movement()
		raylib.BeginDrawing()
		raylib.ClearBackground(raylib.WHITE)

		player.draw_texture()

		raylib.EndDrawing()
	}

	player.unload_texture()
	raylib.CloseWindow()
}

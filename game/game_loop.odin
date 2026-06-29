package game

import "../scripts/coin"
import "../scripts/player"
import "../system"

import "vendor:raylib"

@(private)
window_config := system.Config {
	width       = 800,
	height      = 600,
	window_name = "Collect Coin Game",
}

start :: proc() {
	raylib.InitWindow(window_config.width, window_config.height, window_config.window_name)

	raylib.SetTargetFPS(60)

	coin.load_coin_image()
	player.load_player_image()
}

update :: proc() {
	defer raylib.CloseWindow()

	for !raylib.WindowShouldClose() {
		player.movement()
		draw()
	}

	defer player.unload_texture()
	defer coin.unload_texture()
}

draw :: proc() {

	player.animation_texture()
	coin.animation_texture()
	raylib.BeginDrawing()
	raylib.ClearBackground(raylib.WHITE)

	player.draw_texture()
	coin.draw_texture()

	raylib.EndDrawing()
}

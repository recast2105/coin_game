package game

// Customized Game Package
import "../scripts/player"
import "../system"
// -------- Default Package Odin --------
import console "core:fmt"
import "vendor:raylib"

window_config := system.Config {
	width       = 800,
	height      = 600,
	window_name = "Collect Coin Game",
}

// -------- Initialization --------
start :: proc() {
	raylib.InitWindow(window_config.width, window_config.height, window_config.window_name)
	player.load_player_image()
}

// -------- Game Logic --------
update :: proc() {
	defer console.println("Operation closed")


	for !raylib.WindowShouldClose() {

		raylib.BeginDrawing()
		raylib.ClearBackground(raylib.RAYWHITE)

		player.draw_texture()

		raylib.EndDrawing()
	}

	player.unload_texture()
}

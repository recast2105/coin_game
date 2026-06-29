package coin

import "../../entities"
import console "core:fmt"
import "vendor:raylib"

@(private)
IMAGE_FILE_PATH :: "/home/loganbtgt/Documents/odin-projects/collect_coin_game/atlas.png"

@(private)
coin_entity: entities.Entity_2D

@(private)
frame_rectangle: raylib.Rectangle

// FIXME: A textura esta apenas como placeholder, mudar no futuro
// TODO: Como funciona a escolha do local de desenho do sprite ?
load_coin_image :: proc() {
	coin_entity.sprite = raylib.LoadTexture(IMAGE_FILE_PATH)
	coin_entity.translate.position = {420, 340}

	frame_rectangle = {
		0,
		0,
		cast(f32)coin_entity.sprite.width / 3,
		cast(f32)coin_entity.sprite.height / 3,
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

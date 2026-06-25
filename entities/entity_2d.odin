package entities

import "vendor:raylib"

Entity_2D :: struct {
	translate: struct {
		position: raylib.Vector2,
	},
	sprite:    raylib.Texture2D,
}

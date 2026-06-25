package entities

import "vendor:raylib"

Entity_2D :: struct {
	translate: struct {
		position: raylib.Vector2,
		size:     struct {
			x, y: f32,
		},
	},
	sprite:    raylib.Texture2D,
}

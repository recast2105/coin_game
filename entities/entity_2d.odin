package entities

import "vendor:raylib"

entity_2d :: struct {
	translate: translate,
	sprite:    raylib.Image,
}

@(private)
translate :: struct {
	position: raylib.Vector2,
}

package main

import "./game"

game_core :: game

// TODO: "colocar coin no mapa"
// -------- Execution of Game core system --------
main :: proc() {

	game_core.start()
	game_core.update()
}

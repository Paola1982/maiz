import cultivos.*
import wollok.game.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	method sembrarMaiz() {
		// Si se quiere se puede validar la posición antes
		game.addVisual(new Maiz(position = position)) 
	}
	
	method sembrarTrigo() {
		game.addVisual(new Trigo(position = position))
	}
	
	method regarPlantas() {
		const cultivosARegar = game.colliders(self)
		// TODO: Dividir en subtareas
		if (cultivosARegar.isEmpty()) { self.error("no tengo nada para regar") }
		cultivosARegar.forEach({ unCultivo => unCultivo.regar() })
	}
}
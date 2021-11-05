import cultivos.*
import wollok.game.*

object hector {

	var monedas = 0
	const plantasCosechadas = []
	var property position = game.center()
	const property image = "jugador.png"

	// SEMBRAR

	method sembrarMaiz() {
		self.sembrar(new Maiz(position = position))
	}
	
	method sembrarTrigo() {
	   		self.sembrar(new Trigo(position = position))
	}

	method sembrarTomaco() {
		// TODO: Completar
	}
	
	// Si necesita sembrar más cosas hay que agregar más métodos


	method sembrar(unCultivo) {
		if(not self.hayAlgoSembrado())
			game.addVisual(unCultivo)
	}

	method hayAlgoSembrado() {
		return not game.colliders(self).isEmpty()
	}
	
	method regarPlantasDebajo() {
		self.cultivoDebajo().regar()
	}

	method cosecharPlantasDebajo() {
		const unCultivo = self.cultivoDebajo()
		if (not unCultivo.sePuedeCosechar()) {
			unCultivo.error("No estoy lista para cosechar")
		}
		game.removeVisual(unCultivo)
		plantasCosechadas.add(unCultivo)
	}
	
	method venderTodo() {
		monedas += self.ganancia()
		plantasCosechadas.clear()
	}
	
	method ganancia() {
		return plantasCosechadas.sum({ unCultivo => unCultivo.valor()})
	}
	
	method monedas() { return monedas }
	method plantasCosechadas() { return plantasCosechadas }

	method cultivoDebajo() {
		if (not self.hayAlgoSembrado()) {
			self.error("no hay plantas aquí") 
		}
		return game.colliders(self).first()
	}

}


import cultivos.*
import wollok.game.*

object hector {

	var monedas = 0
	const plantasCosechadas = []
	var property position = game.center()
	const property image = "jugador.png"

	// SEMBRAR

	method sembrarMaiz() {
		game.addVisual(new Maiz(position = position))
	}
	
	method sembrarTrigo() {
		game.addVisual(new Trigo(position = position))
	}

	method sembrarTomaco() {
		game.addVisual(new Tomaco(position = position))
	}
	
	// Si necesita sembrar más cosas hay que agregar más métodos


	method regarPlantasDebajo() {
		self.cultivosDebajo().forEach({ unCultivo => unCultivo.regar()})
	}

	method cosecharPlantasDebajo() {
		self.cultivosDebajo().forEach({ unCultivo => self.cosechar(unCultivo)})
	}
	
	method cosechar(unCultivo) {
		if (not unCultivo.listoParaCosechar()) {
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

	method cultivosDebajo() {
		const cultivosARegar = game.colliders(self)
		if (cultivosARegar.isEmpty()) {
			self.error("no hay plantas aquí") 
		}
		return cultivosARegar
	}

}


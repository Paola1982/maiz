import wollok.game.*
import hector.*

object puntaje {
	const property position = game.at(1, 9)
	method text() { 
		return "Monedas: " + hector.monedas().toString()
	}
}

object cosechas {
	const property position = game.at(7, 9)
	method text() { 
		return "Plantas cosechadas: " + hector.plantasCosechadas().size().toString()
	}	
}

object mercado {
	const property position = game.origin()
	const property image = "mercado.png"
	method iniciar() {
		game.addVisual(self)
		game.onCollideDo(self, { cliente => 
			game.say(self, "Hola " + cliente.toString())
		})
	}
}

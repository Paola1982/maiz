import wollok.game.*

class Maiz {
	const property position
	var esAdulta = false

	method image() {
		return "corn_" + self.sufijo() + ".png"
	}

	method regar() {
		esAdulta = true
	}
	
	method sufijo() { return if (esAdulta) "adult" else "baby" }

}

class Trigo {

	const property position

// TODO: Completar
}

class Tomaco {

	const property position

// TODO: Completar
}


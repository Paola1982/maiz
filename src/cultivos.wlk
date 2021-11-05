import wollok.game.*

class Maiz {

	const property position
	var esAdulto = false

	method image() {
		const sufijo = if (esAdulto) "adulto" else "bebe"
		return "maiz_" + sufijo + ".png"
	}

	method regar() {
		esAdulto = true
	}

	method sePuedeCosechar() {
		return esAdulto
	}

	method valor() {
		return 150
	}

}

class Trigo {

	const property position

// TODO: Completar
}

class Tomaco {

	const property position

// TODO: Completar
}


import wollok.game.*

object manzana {
	const base = 5
	var madurez = 1
	
	method image() = "manzana.png"
	
	method position() = game.at(2, 4)
	
	method energiaQueOtorga() = base * madurez
	
	method madurar() {
		madurez += 1
	}
}

object alpiste {
	method image() = "alpiste.png"
	
	method position() = game.at(5, 3)
	
	method energiaQueOtorga() = 20
}
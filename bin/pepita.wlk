import wollok.game.*
import extras.*

object pepita {
	var property position = game.center()
	var energia = 100
	
	method text() = "Energia:" + energia
	
	method textColor() = "009933FF"
	
	method image() = if (self.esCazadoPorSilvestre() or self.estaCansada())
	                 	"pepita-gris.png"
	                 else "pepita.png"
	
	method position() = position
	
	method mover(nuevaPosicion) {
		if (((not self.estaCansada()) && self.estaDentroDelTablero(
			nuevaPosicion
		)) && (not self.hayMuroEn(nuevaPosicion))) {
			self.volar(position.distance(nuevaPosicion))
			position = nuevaPosicion
		}
	}
	
	method estaCansada() = energia <= 0
	
	method estaDentroDelTablero(
		currentPosition
	) = (((currentPosition.x() >= 0) && (currentPosition.x() < game.width())) && (currentPosition.y() >= 0)) && (currentPosition.y() < game.height())
	
	method hayMuroEn(posicionDePepita) = muro.position() == posicionDePepita
	
	method comer(comida) {
		if (not self.estaCansada()) {
			energia += comida.energiaQueOtorga()
			game.removeVisual(comida)
		}
	}
	
	method pierdeVuelo(distancia) {
		if (not self.hayMuroEn(position)) {
			position = game.at(position.x(), 0.max(position.y() - distancia))
		}
	}
	
	method volar(kms) {
		energia = (energia - 10) - kms
	}
	
	method energia() = energia
	
	method esCazadoPorSilvestre() = position == silvestre.position()
}
import wollok.game.*
import extras.*

object pepita {
	var property position = game.center()
	var energia = 100
	
	method image() {
      return if(self.esCazadoPorSilvestre()){
	     "pepita-gris.png"
          } else{"pepita.png"}
	}
	
	method position() = position
	
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method esCazadoPorSilvestre() = position == silvestre.position()
}
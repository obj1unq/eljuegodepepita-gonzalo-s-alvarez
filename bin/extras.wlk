import wollok.game.*
import pepita.*

object silvestre {
  method image() = "silvestre.png"
  
  method position() = game.at(pepita.position().x().max(3), 0)
}

object muro {
  method image() = "muro.png"
  
  method position() = game.at(4, 5)
}
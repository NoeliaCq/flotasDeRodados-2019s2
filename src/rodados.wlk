import dependenciasMuni.*
import wollok.game.*
		///////################  ETAPA 1  #################////////
class Corsa {
	var property color
	
	method capacidad() { return 4 }
	method velocidadMax() { return 150 }
	method peso() { return 1300 }
	
	method puedeHacerPedido(pedido) { 
		return self.velocidadMax() >= pedido.velocidadRequerida() + 10 
			and self.capacidad() >= pedido.cantidadDePasajeros()
			and not pedido.coloresIncompatibles().contains(self.color())
	}
	/////////######## EXTRA: GEOGRAFÍA ########/////////////
	
}

class Kwid {
	var property tieneTanque
	
	method capacidad() { return if (tieneTanque) {3} else {4} }
	method velocidadMax() { return if (tieneTanque) {120} else {110} }
	method peso() { return if (tieneTanque) {1350} else {1200} }
	method color() { return azul }
	method puedeHacerPedido(pedido) { 
		return self.velocidadMax() >= pedido.velocidadRequerida() + 10 
			and self.capacidad() >= pedido.cantidadDePasajeros()
			and not pedido.coloresIncompatibles().contains(self.color())
	}
}

object traffic {
	var property interior
	var property motor
	
	method capacidad() { return interior.capacidad() }
	method velocidadMax() { return motor.velocidadMax() }
	method peso() { return 4000 + interior.peso() + motor.peso() }
	method color() { return blanco }
	method puedeHacerPedido(pedido) { 
		return self.velocidadMax() >= pedido.velocidadRequerida() + 10 
			and self.capacidad() >= pedido.cantidadDePasajeros()
			and not pedido.coloresIncompatibles().contains(self.color())
	}
}

class AutoEspecial {
	var property capacidad
	var property velocidadMax
	var property peso
	var property color
	method puedeHacerPedido(pedido) { 
		return self.velocidadMax() >= pedido.velocidadRequerida() + 10 
			and self.capacidad() >= pedido.cantidadDePasajeros()
			and not pedido.coloresIncompatibles().contains(self.color())
	}
}

//interiores
object comodo {
	method capacidad() { return 5 }
	method peso() { return 700}
}
object popular {
	method capacidad() { return 12 }
	method peso() { return 1000}
}
//motores
object pulenta {
	method peso() { return 800 }
	method velocidadMax() { return 130 }
}
object bataton {
	method peso() { return 500 }
	method velocidadMax() { return 80 }
}
//colores
object rojo { }
object blanco { }
object azul { }
object violeta { }
object verde { }
object negro { }
object beige { }

//Direcciones
object norte {}
object sur {}
object oeste {}
object este {}

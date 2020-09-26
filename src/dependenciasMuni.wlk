 import rodados.*
		///////################  ETAPA 1  #################////////
 class Dependencia {
 	var property empleados = 0
 	var flota = []
 	var pedidos = [] 
 	method agregarAFlota(rodado) { flota.add(rodado) }
 	method quitarDeFlota(rodado) { flota.remove(rodado) }
 	method llenarFlota(lista) { flota.addAll(lista) }
 	method pesoTotalFlota() { return flota.sum({rod=> rod.peso()}) }
 	method capacidadTotal() { return flota.sum({rod=> rod.capacidad()}) }
 	method estaBienEquipada() { return flota.size() >= 3 and flota.all({rod=> rod.velocidadMax() >= 100}) }
 	method capacidadTotalEnColor(color) {
 		return flota.filter({rod=> rod.color() == color}).sum({rod=> rod.capacidad()})
 	}
 	method colorDelRodadoMasRapido() { return flota.max({rod=> rod.velocidadMax()}).color() }
 	method capacidadFaltante() { return self.empleados() - self.capacidadTotal() }
 	method esGrande() { return self.empleados() >= 40 and flota.size() >=5 }
 		
 		///////################  ETAPA 3  #################////////	
 	method agregarPedido(pedido) { pedidos.add(pedido) }
 	method quitarPedido(pedido) { pedidos.remove(pedido) }
 	method totalDePasajeros() { 
 		return pedidos.sum({pedido=> pedido.cantidadDePasajeros()})
 	}
 	method noPuedeSatisfacerPedido() { 
 		return pedidos.filter({pedido=> not pedido.puedeSatisfacerPedido(flota)})
 	}
 	method colorIncompatibleParaTodos(color) {
 		return pedidos.all({pedido=> pedido.coloresIncompatibles() == color })
 	}
 	method relajarPedidos() { pedidos.forEach({pedido=> pedido.relajar()}) }
 }
 
 
 		///////################  ETAPA 2  #################////////
 
class Pedido {
	var property coloresIncompatibles = []
	var property distanciaARecorrer = 0
	var property tiempoMax = 0
	var property cantidadDePasajeros = 0
	
	method velocidadRequerida() { return self.distanciaARecorrer() / self.tiempoMax() }
	method puedeSatisfacerPedido(auto) { 
		return auto.velocidadMax() >= self.velocidadRequerida() + 10 
			and auto.capacidad() >= self.cantidadDePasajeros()
			and not coloresIncompatibles.contains(auto.color())
	}
	method acelerar() { tiempoMax -= 1 }
	method relajar() { tiempoMax += 1 }
}
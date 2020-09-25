 import rodados.*
 
 class Dependencia {
 	var property empleados = 0
 	var flota = []
 	
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
 }
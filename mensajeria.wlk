import mensajeros.*

object mensajeria {
	const property mensajeros = []
	const property enviados = []
	const property pendientes = []
	var property facturado = 0
	method contratar(empleado) {mensajeros.add(empleado)} 
	method despedir(empleado) {mensajeros.remove(empleado)}
	method despedirATodos() {mensajeros.clear()}
	method esGrande() {return mensajeros.size() > 2}
	method elPrimeroPuedeEntregarlo() {return paquete.puedeSerEntregadoPor(mensajeros.first())}
	method pesoDelUltimoMensajero() {return mensajeros.last().peso()}
	method mensajeros() {return mensajeros}
	method enviados() {return enviados}
	method pendientes() {return pendientes}
	method alguienPuedeEntregar(unPaquete) {return mensajeros.any({mensajero=>unPaquete.puedeSerEntregadoPor(mensajero)})}
	method quienesPuedenEntregar(unPaquete) {return mensajeros.filter({mensajero=>unPaquete.puedeSerEntregadoPor(mensajero)})}
	method tieneSobrepeso() {return mensajeros.sum({mensajero=>mensajero.peso()})/mensajeros.size() > 500}
	method enviar(unPaquete) {
		if (self.alguienPuedeEntregar(unPaquete)) {
			enviados.add(unPaquete)
			facturado += unPaquete.precio()}
		else {pendientes.add(unPaquete)}
	}
	method facturacion() {return facturado}
	method enviarVarios(paquetes) {paquetes.forEach({paq=>self.enviar(paq)})}
	method pendienteMasCaro() {return pendientes.max({paq=>paq.precio()})}
	method enviarPendienteMasCaro() {
		const caro = self.pendienteMasCaro()
		pendientes.remove(caro)
		self.enviar(caro)	
	}
}

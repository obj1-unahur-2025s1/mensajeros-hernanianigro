//DESTINOS
object brooklyn {
	method dejarPasar(mensajero) {return mensajero.peso() < 1000}
}
object matrix {
	method dejarPasar(mensajero) {return mensajero.puedeLlamar()}
}
//MENSAJEROS
object roberto {
	var property peso = 90
	var property transporte = camion
	method peso(nuevoPeso){peso = nuevoPeso}
	method peso() {return peso + transporte.peso()}
	method puedeLlamar() {return false}
	method transporte(vehiculo) {transporte = vehiculo}
}
object neo { 
	var property tieneCredito = false
	method peso() {return 0}
	method puedeLlamar() {return tieneCredito}
	method recargar() {tieneCredito = true}
}    
object chuck { 
	method peso() {return 80}
	method puedeLlamar() {return true}
}
object mensajeroNuevo { 
	method peso() {return 700}
	method puedeLlamar() = false
	
} 
//VEHICULOS
object camion {
	var property acoplados = 2
	method peso() {return acoplados * 500}
	method acoplados(cantidadAcoplados) {acoplados = cantidadAcoplados}
}
object bicicleta {
	const peso = 5
	method peso() {return peso}
}
//PAQUETES
object paquete {
	var property pago = false
	var property destino = brooklyn
	method pagar() {pago = true}
	method estaPago() {return pago}
	method destino(lugar) {destino = lugar}
	method puedeSerEntregadoPor(mensajero) {return destino.dejarPasar(mensajero) and self.estaPago()}
	method precio() = 50
}
object paquetito {
	method puedeSerEntregadoPor(mensajero) {return true}
	method precio() {return 0}
}
object paquetonViajero {
	const property destinos = [brooklyn,matrix]
	const property precioPorDestino = 100
	var property importePagado = 0
	method pagar(importe) {importePagado = importePagado + importe}
	method estaPago() {return importePagado >= self.precio()}
	method precio() {return destinos.size()*precioPorDestino}
	method puedeSerEntregadoPor(mensajero) {return self.puedePasarPorDestinos(mensajero) && self.estaPago()}
	method puedePasarPorDestinos(mensajero) {return destinos.all{d=>d.dejarPasar(mensajero)}}
}
object paqueteNuevo {
	var property destino = matrix
	var property importePagado = 0
	method puedeSerEntregadoPor(mensajero) {return destino.dejarPasar(mensajero) and self.estaPago()}
	method precio() = 1000
	method pagar(importe) {importePagado = importePagado + importe}
	method estaPago() {return importePagado >= self.precio()}
}

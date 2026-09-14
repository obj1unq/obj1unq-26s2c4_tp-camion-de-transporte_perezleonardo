import cosas.*

object camion {
	const property cosas = []
	const pesoMax = 2500 
	const tara = 1000
	method cargar(unaCosa) {
		if (not self.excedidoDePeso(unaCosa)) cosas.add(unaCosa)
	}
	method excedidoDePeso(unaCosa){
		return ((self.cargaActual() + unaCosa.peso()) > pesoMax)
	}

	method descargar(unaCosa){
		if (cosas.contains(unaCosa)) cosas.remove(unaCosa) 
	}
	method pesoTotal (){
		return (tara + self.cargaActual()) 
	}
	method cargaActual(){
		return cosas.sum{ cosa => cosa.peso()}
	}
	method objetosPeligrosos(nivel){
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method objetosMasPeligrososQue (_cosa){
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > _cosa.nivelPeligrosidad() })
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.objetosPeligrosos(nivelMaximoPeligrosidad).isEmpty()
	}
	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({cosa => cosa.peso().between(min,max)})
	} 
	method cosaMasPesada(){
		return cosas.max{ cosa => cosa.peso()}
	}
	method totalBultos(){
		return cosas.sum{ cosa => }
	}
	method pesos(){
		return cosas.map{ cosa => cosa.peso()}
	} 
}

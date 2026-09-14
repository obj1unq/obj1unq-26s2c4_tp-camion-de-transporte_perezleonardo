object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	const cantidadLadrillos = 0
	const pesoLadrillo = 2
	const pesoRefuerzo = 10
	method peso(){ 
		return ((pesoLadrillo * cantidadLadrillos)+(pesoRefuerzo* self.cantidadRefuerzosPara(cantidadLadrillos)))
		}
	method cantidadRefuerzosPara(_cant){
		return if (cantidadLadrillos <= 1000) (_cant / 100).roundUp() else (_cant / 50).roundUp()  
		}
	method nivelPeligrosidad(){ return 50 - self.cantidadRefuerzosPara(cantidadLadrillos)}
}

object arena {
  var peso = 0 
  method peso(){return peso}
  method nivelPeligrosidad(){return 1}
}
object bateriaAntiaerea {
  var estaConMisiles = true
  method peso(){return if (estaConMisiles) 300 else 200}
  method nivelPeligrosidad(){return if (estaConMisiles) 100 else 0}  
}

object contenedorPortuario {
  const property cosas = []
  method cargaActual(){
	return cosas.sum{cosa => cosa.peso()}
  }
  method peso() {
	return 100 + self.cargaActual()
  }
  method nivelPeligosidad() {
	return if (cosas.isEmpty()) 0 else () else //max, niveles de peligrosidad de cosas
  }  
}

object residuosRadioactivos {
  var peso = 0
  method peso(){return peso} 
  method nivelDePeligrosidad(){return 200}
}

object embalajeDeSeguridad {
  var cosa = algo
  method peso(){
	return cosa.peso()
  } 
  method nivelDePeligrosidad(){
	return cosa.nivelDePeligrosidad()*0.5
  }
}
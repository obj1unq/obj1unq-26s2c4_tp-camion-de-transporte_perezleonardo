object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
  method bulto(){return 1}
  method transformar(){ //No hace nada
  }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = false }
  method bulto(){return 2}
}

object paqueteDeLadrillos{
	var property cantidadLadrillos = 0
	const pesoLadrillo = 2
	const pesoRefuerzo = 10
	method peso(){ 
		return ((pesoLadrillo * cantidadLadrillos)+(pesoRefuerzo* self.cantidadRefuerzosPara(cantidadLadrillos)))
		}
	method cantidadRefuerzosPara(_cant){
		return if (cantidadLadrillos <= 1000) (_cant / 100).roundUp() else (_cant / 50).roundUp()  
		}
	method nivelPeligrosidad(){ return (50 - self.cantidadRefuerzosPara(cantidadLadrillos)).max(0)}
  method bulto(){
    return if (cantidadLadrillos <= 100) 1 else if (cantidadLadrillos <= 300) 2 else 3
    }
  method transformar(){cantidadLadrillos -= 12}
}

object arena {
  var property peso = 0 
  method peso(){return peso}
  method nivelPeligrosidad(){return 1}
  method bulto(){return 1}
  method transformar(){ peso = (peso - 15).max(0)} //Caso borde que sea negativo

}
object bateriaAntiaerea {
  var tieneMisiles = false
  method peso(){ return if (tieneMisiles) 300 else 200 }
  method nivelPeligrosidad(){return if (tieneMisiles) 100 else 0} 
  method bulto(){return if (tieneMisiles) 2 else 1}
  method transformar(){tieneMisiles = true}
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
	return if (cosas.isEmpty()) 0 else (cosas.map{ cosa => cosa.nivelPeligrosidad()}.max())
  }  
  method bulto(){return 1 + cosas.sum{ cosa => cosa.bulto()}}
  method transformar (){
    cosas.map{cosa => cosas.transformar()}
  }

}

object residuosRadioactivos {
  var property peso = 0
  method peso(){return peso} 
  method nivelPeligrosidad(){return 200}
  method bulto(){return 1}
  method transformar() { peso += 15}

}

object embalajeDeSeguridad {
  var cosa = bumblebee
  method peso(){
	return cosa.peso()
  } 
  method nivelPeligrosidad(){
	return cosa.nivelPeligrosidad()*0.5
  }
  method bulto(){return 2}
  method transformar(){
    //No hace nada
  }
}
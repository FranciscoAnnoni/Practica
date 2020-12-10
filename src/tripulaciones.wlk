import Piratas.*

class barco{
	var resistencia
	var poderAlFuego
	var municion
	var tripulacion = []
    var bando
    
	
	method capitanDelBarco(){											//quien es el capitan del barco 
		return tripulacion.max({tripulante => tripulante.poderDelMando()})
	}
	
	method fuerzaDelBarco(){
		return tripulacion.sum({tripulante => tripulante.poderDelMando()})
	}
	
	method ganaEnfrentamientoContra(otroVarco){
		return self.fuerzaDelBarco() > otroVarco.fuerzaDelBarco()
	}
	
	method enfrentar(otroBarco){										//pelea entre dos varcos
		if(self.ganaEnfrentamientoContra(otroBarco)){
			tripulacion.add(otroBarco.tripulacionFuerte())
			otroBarco.tripulacionHerida()
			otroBarco.eliminarTripulacion()
			otroBarco.quedarDesolado()
		} else otroBarco.enfrentar(self)
	}
	
	method tripulacionHerida(){
		tripulacion.forEach({tripulante => tripulante.resultarHerido()})
	}
	
	method eliminarTripulacion(){
		tripulacion = []
	}
	
	method quedarDesolado(){
		 resistencia = 0
		 poderAlFuego = 0
		 municion = 0
	}
	
	method tripulacionFuerte(){
		return tripulacion.filter({tripulante => tripulante.poderDelMando() > 100})
	}
	
		
	method dispararCanionazos(cantidad,otroBarco){						//Hacer que un barco dispare una cantidad de cañonazos a otro
		if(cantidad <= municion){
			municion -= cantidad
			otroBarco.perderResistencia(cantidad*50)
			otroBarco.perderTripulacionSegunSuEnergia(20)
		}else throw new Exception(message = "la municion no es suficiente para la cantidad ingresada")
	}
	
	method perderTripulacionSegunSuEnergia(valor){
		tripulacion = tripulacion.filter({tripulante => tripulante.energia() > valor})
	}
	
	method perderResistencia(valor){
		resistencia -= valor
	}
	
	method aumentarMunicion(porcentaje){
		municion += municion*(porcentaje/100)
	}
															//no se como hacer esto en una sola funcion porque no me deja ponerlo en una variable cambiable.
	method aumentarPoderDeFuego(porcentaje){
		poderAlFuego += poderAlFuego*(porcentaje/100)
	}
	
	method duplicarTripulacion(){
		tripulacion.addAll([tripulacion])
	}
	
	method AplicarBonus(){
		bando.bonus(self)
	}
	
}


object laArmadaInglesa{
	method bonus(unBarco){
		unBarco.aumentarMunicion(30)
	}
}

object laUnionPirata{
	method bonus(unBarco){
		unBarco.aumentarPoderDeFuego(60)
	}
}

object laArmadaDelHolandesErrante{
	method bonus(unBarco){
		unBarco.duplicartripulacion()
	}
}



const titanic = new barco(resistencia =100, poderAlFuego = 50, municion = 10,tripulacion = [donato, JackSparrow], bando = laArmadaDelHolandesErrante)
const lancha =  new barco(resistencia =1, poderAlFuego = 5, municion = 0, bando = laArmadaInglesa)


class Pirata {
	var tipoPirata 
	var property energia
    var property poderDePelea
    var property vitalidad
    var property inteligencia
    var property moral
    var ingredientes = #{}
       
    method poderDelMando(){
    	return tipoPirata.poderDelMando(self)
	}
	
	method cantidadDeIngredientes(){             
		return  ingredientes.size()
	}
	
	method tomarRonConOtro(otroPirata){
		tipoPirata.tomarRonConOtro(self,otroPirata)
	}
	
	method ingredientes(){
		return ingredientes
	}
	
	method tipoPirata(){
		return tipoPirata
	}
	
	
	method esDelTipo(tipo){
		return self.tipoPirata() == tipo
	}
	
	method perderPoderDePelea(){
		poderDePelea = poderDePelea/2
	}
	
	method perderInteligencia(){
		inteligencia = inteligencia/2
	}
	
	method perderMoral(){
		moral = moral/2
	}
	
	method cambiarEnergia(valorconSigno){
		energia = energia + valorconSigno
	}
	
	method perderIngrediente(ingrediente){
		ingredientes.remove(ingrediente)
	}
	
	method robarIngrediente(otroPirata){
		var ingredienteRobado = otroPirata.ingredientes().anyOne()
		otroPirata.perderIngrediente(ingredienteRobado)
		ingredientes.add(ingredienteRobado)
	}
	
	method resultarHerido(){
		tipoPirata.resultarHerido(self)
	}
	
}

//tipos de piratas //

object guerreroPirata{
	
	method poderDelMando(pirata){
		return pirata.poderDePelea()*pirata.vitalidad()
	}
	
	method resultarHerido(pirata){
		pirata.perderPoderDePelea()
	}
}

object navegadoresPirata{
	
	method poderDelMando(pirata){
		return pirata.inteligencia()**2
	}
	
	method resultarHerido(pirata){
		pirata.perderInteligencia()
	}
}

object cocineroPirata{
	
	method poderDelMando(pirata){
		return pirata.moral()*pirata.cantidadDeIngredientes()
	}
	method resultarHerido(pirata){
		pirata.perderMoral()
	}
}

object jackSparrow{
	
	method poderDelMando(pirata){
		return pirata.poderDePelea()*pirata.inteligencia()*pirata.energia()
	}
	
	method tomarRonConOtro(unPirata,otroPirata){
		unPirata.cambiarEnergia(100)
		otroPirata.cambiarEnergia(-50)
		if(otroPirata.esDelTipo(cocineroPirata)){
			unPirata.robarIngrediente(otroPirata)
		}
	}
	
		
	method resultarHerido(pirata){ 			//jack nunca resulta herido, (lo invente el problema no lo aclara).

	}
	
}

//-------------------------//




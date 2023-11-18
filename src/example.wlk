

class Persona{
	const property edad
	method inteligencia(){
		if(edad>= 20 && edad<=40){
			return 12
		}
		else{
			return 8
		}
	}
	
	method potencia(){
		return 20
	}
	
	method esDestacada(){
		return edad==25 || edad==35
	}
	
	method tributar(planeta){}
	
	method valor(){
		return self.potencia() + self.inteligencia()
	}
	
}

class Atleta inherits Persona{
	var masaMuscular = 4
	var tecnicas	 = 2
	
	override method potencia(){
		return super() + masaMuscular * tecnicas
	}
	
	override method esDestacada(){
		return super() || tecnicas>5
	}
	
	method entrenar(dias){
		masaMuscular += dias.div(5)
	}
	
	method aprenderTecnica(){
		tecnicas += 1
	}
	override method tributar(planeta){
		planeta.construirMuralla(2)
	}

}

class Docente inherits Persona{
	var cursos=0
	
	override method inteligencia(){
		return super() + cursos*2
	}
	
	override method esDestacada(){
		return cursos>3
	}
	
	override method tributar(planeta){
		planeta.fundarMuseo()
	}
	
	override method valor(){
		return super() +5
	}
}

class Soldado inherits Persona{
	var armas =[]
	
	override method potencia(){
		return super() + armas.potenciaDeArmas()
	}
	method potenciaDeArmas()= return armas.sum({arma => arma.potencia()})
}

class Pistolete{
	var largo
	
	method potencia(soldado){
		if(soldado.edad()>30){
			return largo*3
		}
		else{
			return largo*2
		}
	}
}

class Espadon{
	var peso
	
	method potencia(soldado){
		if(soldado.edad() > 40){
			return peso.div(2)
		}
		else{
			return 6
		}
	}
}

const dustin = new Soldado  (edad=30, armas=[pistol])
const pistol = new Pistolete(largo=25)

class Planeta{
	const personas = {}
	var property museos 
	var murallas  
	
	method delegacionDiplomatica(){
		return personas.filter({persona=>persona.esDestacada()})
	}
	
	method esCulto(){
		return museos>2 && self.todosInteligentosos()
	}
	
	method todosInteligentosos(){
		return personas.all{persona=>persona.inteligencia() >=10}
	}
	
	method potenciaReal(){
		return personas.sum{persona=>persona.potencia()}
	}
	
	method construirMurallas(km){
	 	murallas+=km
	 }
	method fundarMuseo(){
		museos+=1
	}
	
	method potenciaAparente(){
		return self.habitanteMasPotente().potencia()*self.cantidadDeHabitantes()
	}
	method habitanteMasPotente(){
		return personas.max({persona=>persona.potencia()})
	}
	method cantidadDeHabitantes(){
		return personas.size()
	}
	
	method necesitaReforzarse(){
		return self.potenciaAparente()*2.div(self.potenciaReal())>=2
	}
	
	method recibirTributo(){
		personas.forEach({persona=> persona.tributar(self)})
	}
	
	method habitantesValiosos(){
		return personas.filter({persona=>persona.valor()>=40})
	}
	
	method apaciguar(planeta){
		self.habitantesValiosos().forEach({persona=>persona.tributar(planeta)})
	}
}

const julieta = new Persona(edad=42)
const ana	  = new Atleta (edad=25)
const rosa	  = new Atleta (edad=45, tecnicas=8)
const perla	  = new Atleta (edad=28, tecnicas=4, masaMuscular=6)
const monica  = new Docente(edad=45, cursos=6)
const luisa	  = new Docente(edad=35, cursos=1)
const triton  = new Planeta(personas=[julieta,ana,rosa,perla,monica,luisa], museos=2, murallas=5)
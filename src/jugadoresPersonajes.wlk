object luisa {
	var personajeActivo
	method setPersonaje(personaje) { personajeActivo = personaje }
	
	method aparece(elemento){
		personajeActivo.encontrar(elemento)
	}
}


object floki {
	var arma
	
	method setArma(nuevaArma) {arma = nuevaArma}
	
	method encontrar(elemento){ elemento.recibirAtaque(arma)
	}
}

object mario {
	var valorRecolectado = 0
	var alturaDeUltimoElemento
	
	method encontrar(elemento){
	 valorRecolectado = valorRecolectado + elemento.otorgarValor()
	 elemento.recibirTrabajo()
	 alturaDeUltimoElemento = elemento.altura()
	}
	
	method esFeliz(){
		return (valorRecolectado >= 50 or alturaDeUltimoElemento >= 10)
	}
}

object ballesta {
	var flechas = 10
	
	
	method usar(){ if ( self.estaCargada() ) { flechas = flechas - 1 } }
	method potencia(){ return 4 }
	method estaCargada() { return (flechas >= 1) }
}

object jabalina {
	var cargada = true
	
	method usar(){ cargada = false}
	method potencia() { return 30 }
	
	method estaCargada() { return cargada }
}

object castillo {
	var defensa = 150
	
	method altura() { return 20 }
	
	method recibirAtaque(arma) {
		if ( arma.estaCargada() ) { defensa = defensa - arma.potencia() }
		arma.usar()
	}
	method otorgarValor(){
		return defensa / 5
	}
	
	method recibirTrabajo(){
		if (defensa <= 200) {
			defensa = defensa + 20
			defensa = 200.min(defensa)
		}
	}
}


object aurora {
	var estaViva = true
	
	method altura() { return 1 }
	
	method recibirAtaque(arma) {
		if ( arma.estaCargada() and arma.potencia() >= 10) { estaViva = false }
		arma.usar()
	}
	
	method otorgarValor(){
		return 15
	}
	
	method recibirTrabajo() { }
}

object tipa {
	var altura = 8
	
	method altura() { return altura }	
	method recibirAtaque(arma){ arma.usar() }
	method otorgarValor(){ return altura * 2}
	method recibirTrabajo(){ altura = altura + 1}
}

package ar.edu.info.unlp.ejercicio06;

public class Agua implements Topografia {

	public double proporcionAgua(){
		return 1;
	}
	
	public double proporcionTierra(){
		return 0;
	}

	public boolean equals(Topografia otraTopografia){
		return otraTopografia.igualAgua();
	}

	public boolean igualAgua(){
		return true;
	}

	public boolean igualTierra(){
		return false;
	}

	public boolean igualPantano(){
		return false;
	}

	public boolean igualMixta(TopografiaMixta otraTopografia){
		return false;
	}
}

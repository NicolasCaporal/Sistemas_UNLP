package ar.edu.info.unlp.ejercicio06;

public interface Topografia {

	public abstract double proporcionAgua();

	public abstract double proporcionTierra();

	public abstract boolean equals(Topografia otraTopografia);

	public abstract boolean igualAgua();

	public abstract boolean igualTierra();

	public abstract boolean igualPantano();

	public abstract boolean igualMixta(TopografiaMixta otraTopografia);
}

package ar.edu.info.unlp.ejercicioDemo;


public class Lavarropas {

	private ProgramaLavado programa;

	public Lavarropas(){
		this.programa = new ProgramaLavadoDiario();
	}

	public void setPrograma(ProgramaLavado programa){
		this.programa = programa;
	}

	public int lavar(){
		return this.programa.lavar(this);
	}

	public void agregarAgua(int porcentaje){
		System.out.println("Lavando " + porcentaje + "%");
	}

	public void agregarJabonEnPolvo(){
		System.out.println("Agregando jabon en polvo");
	}

	public void lavar(int minutos){
		System.out.println("Lavando " + minutos + " minutos");
	}

	public void vaciarAgua(){
		System.out.println("Vaciando agua");
	}

	public void agregarEnjuague(){
		System.out.println("Agregando enjuague");
	}

	public void enjuagar(int minutos){
		System.out.println("Enjuagando " + minutos + " minutos");
	}

	public void centrifugar(int minutos){
		System.out.println("Centrifugando " + minutos + " minutos");
	}

}

package ar.edu.unlp.info.oo1.ejercicio6;

import java.util.List;
import java.util.ArrayList;

public class Farola {
	private boolean state;
	private List<Farola> neighbors;
	
	public Farola() {
		this.state = false;
		this.neighbors = new ArrayList<Farola>();
	}
	
	
	public List<Farola> getNeighbors() {
		return this.neighbors;
	}
	
	
	public void pairWithNeighbor(Farola farola) {
		this.getNeighbors().add(farola);
		farola.getNeighbors().add(this);
	}
	
	
	public boolean isOn() {
		return this.state;
	}
	
	
	public void turnOn() {
		if (! this.isOn()){
			this.state = true;
			this.getNeighbors().forEach(f -> f.turnOn());			
		}
	}
	
	
	public void turnOff() {
		if (this.isOn()){
			this.state = false;
			this.getNeighbors().forEach(f -> f.turnOff());
		}
	}

}

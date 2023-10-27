package ar.edu.unlp.info.oo1.ejercicio8;

import java.util.List;
import java.util.stream.Collectors;
import java.util.ArrayList;

public class Distribuidora {
	private double precioKWh;
	private List<Usuario> usuarios;
	
	
	public Distribuidora(double precioKWh) {
		this.precioKWh = precioKWh;
		this.usuarios = new ArrayList<Usuario>();
	}
	
	
	
	public List<Usuario> getUsuarios() {
		return this.usuarios;
	}
	
	
	public void agregarUsuario(Usuario usuario){
		this.usuarios.add(usuario);
	}
	
	
	public List<Factura> facturar() {
		return this.usuarios.stream().map(usuario -> usuario.facturarEnBaseA(precioKWh)).collect(Collectors.toList());
	}
	
	
	public double consumoTotalActiva() {
		return this.usuarios.stream().mapToDouble(usuario -> usuario.ultimoConsumoActiva()).sum();
	}
	
	
	public void setPrecioKW(double precio) {
		this.precioKWh = precio;
	}
	
	
	public double getPrecioKW() {
		return this.precioKWh;
	}

}

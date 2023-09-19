package ar.edu.unlp.info.oo1.ejercicio3bis;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Ticket {
	private LocalDate fecha;
	private List<Producto> productos;
	private static final double IVA = 0.21;
	
	public Ticket(List<Producto> productos){
		this.fecha = LocalDate.now();
		this.productos = new ArrayList<Producto>(productos);
	}
	
	public int getCantidadDeProductos(){
		return this.productos.size();
	}
	
	public double getPesoTotal(){
		return this.productos.stream().mapToDouble(producto -> producto.getPeso()).sum();
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public double getPrecioTotal() {
		return this.productos.stream().mapToDouble(producto -> producto.getPrecio()).sum();
	}
	

	public double impuesto(){
		return this.getPrecioTotal() * IVA;
	}
	
	public List<Producto> getProductos(){
		return this.productos;
	}

	
}

package ar.edu.unlp.info.oo1.ejercicio3bis;

import java.util.ArrayList;
import java.util.List;

public class Balanza {
	private List<Producto> productos;
	
	public Balanza() {
		this.productos = new ArrayList<Producto>();
	}
	
	public void ponerEnCero() {
		this.productos.clear();
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size(); 
	}
	
	public double getPrecioTotal() {
		return this.productos.stream().mapToDouble(p -> p.getPrecio()).sum();
	}

	
	public double getPesoTotal() {
		return this.productos.stream().mapToDouble(p -> p.getPeso()).sum();
	}
	
	public void agregarProducto(Producto producto) {
		this.productos.add(producto);
	}
	
	public Ticket emitirTicket() {
			return new Ticket(this.productos);
	}

	
	public List<Producto> getProductos() {
		return new ArrayList<Producto>(this.productos);
	}
	
}

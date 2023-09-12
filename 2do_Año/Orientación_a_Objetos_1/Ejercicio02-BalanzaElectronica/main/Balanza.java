package ar.edu.unlp.info.oo1.ejercicio2;

public class Balanza {
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	
	public Balanza() {
		this.cantidadDeProductos = 0;
		this.precioTotal = 0;
		this.pesoTotal = 0;
	}
	
	public void ponerEnCero() {
		this.cantidadDeProductos = 0;
		this.precioTotal = 0;
		this.pesoTotal = 0;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	
	public void incrementarProductos() {
		this.cantidadDeProductos++;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public void sumarPrecio(double precio) {
		this.precioTotal += precio;
	}
	
	public void sumarPeso(double peso) {
		this.pesoTotal += peso;
	}
	
	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public void agregarProducto(Producto producto) {
		this.sumarPrecio(producto.getPrecio());
		this.incrementarProductos();
		this.sumarPeso(producto.getPeso());
	}
	
	public Ticket emitirTicket() {
			Ticket ticket = new Ticket(this.cantidadDeProductos, this.getPesoTotal(), this.getPrecioTotal());
			return ticket;
	}
	 
	
}

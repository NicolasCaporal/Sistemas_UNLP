package ar.edu.unlp.info.oo1.ejercicio9;

public class CuentaCorriente extends Cuenta {
	private double limiteDescubierto;
	
	
	public CuentaCorriente() {
		super();
		this.limiteDescubierto = 0;
	}
	
	
	
	public double getLimiteDescubierto() {
		return this.limiteDescubierto;
	}
	
	
	public void setLimiteDescubierto(double limiteDescubierto) {
		this.limiteDescubierto = limiteDescubierto;
	}

	
	@Override
	public boolean puedeExtraer(double monto) {
		if (this.getSaldo() - monto >= -this.limiteDescubierto) {
			return true;
		}
		return false;
	}
	
}

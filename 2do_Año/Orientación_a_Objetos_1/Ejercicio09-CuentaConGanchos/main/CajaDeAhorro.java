package ar.edu.unlp.info.oo1.ejercicio9;

public class CajaDeAhorro extends Cuenta {
	
	public CajaDeAhorro() {
		super();
	}

	
	
	private double costoAdicional(double monto) {
		return monto * 0.02;
	}
	
	
	public boolean puedeExtraer(double monto) {
		if (this.getSaldo() >= monto) {
			return true;
		}
		return false;
	}
	
	
	@Override
	public boolean extraer(double monto) {
		return super.extraer(monto + this.costoAdicional(monto));
	}
	
	
	@Override
	public void depositar(double monto) {
		super.depositar(monto - this.costoAdicional(monto));
	}
	
	
	@Override
	public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
		return super.transferirACuenta(monto + this.costoAdicional(monto), cuentaDestino);
	}
	
}

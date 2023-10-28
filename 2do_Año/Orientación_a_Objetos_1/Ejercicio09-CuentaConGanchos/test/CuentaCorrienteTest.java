package ar.edu.unlp.info.oo1.ejercicio9;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

public class CuentaCorrienteTest {
	private CuentaCorriente cuenta;

	@BeforeEach
	public void setUp(){
		cuenta = new CuentaCorriente();
	}
	
	@Test 
	public void testConstructor() {
		assertEquals(0, cuenta.getSaldo());
		assertEquals(0, cuenta.getLimiteDescubierto());
	}
	
	@Test 
	public void testDepositar() {
		cuenta.depositar(260611);
		assertEquals(260611, cuenta.getSaldo());
	}
	
	@Test
	public void testExtraer() {
		assertFalse(cuenta.extraer(1));
		cuenta.depositar(500);
		cuenta.setLimiteDescubierto(500);
		assertTrue(cuenta.extraer(1000));
		assertEquals(-500, cuenta.getSaldo());
	}
	
	@Test
	public void testTransferir() {
		Cuenta cuentaDestino = new CuentaCorriente();
		assertFalse(cuenta.transferirACuenta(1, cuentaDestino));
		cuenta.depositar(300);
		cuenta.setLimiteDescubierto(200);
		assertTrue(cuenta.transferirACuenta(500, cuentaDestino));
		assertEquals(-200, cuenta.getSaldo());
		assertEquals(500, cuentaDestino.getSaldo());
	}
	
}

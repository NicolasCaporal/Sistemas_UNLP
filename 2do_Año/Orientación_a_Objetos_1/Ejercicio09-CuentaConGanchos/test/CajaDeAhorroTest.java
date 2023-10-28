package ar.edu.unlp.info.oo1.ejercicio9;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

public class CajaDeAhorroTest {
	private CajaDeAhorro cuenta;

	@BeforeEach
	public void setUp(){
		cuenta = new CajaDeAhorro();
	}
	
	@Test 
	public void testConstructor() {
		assertEquals(0, cuenta.getSaldo());
	}
	
	@Test 
	public void testDepositar() {
		cuenta.depositar(100);
		assertEquals(98, cuenta.getSaldo());
	}
	
	@Test
	public void testExtraerSinPlataSuficiente() {
		cuenta.depositar(100);
		assertFalse(cuenta.extraer(100));
	}
	
	@Test
	public void testExtraerConPlataSuficiente() {
		cuenta.depositar(410);
		assertTrue(cuenta.extraer(100));
		assertEquals(299.8, cuenta.getSaldo());
	}
	
	@Test
	public void testTransferirSinPlataSuficiente() {
		Cuenta cuentaDestino = new CajaDeAhorro();
		cuenta.depositar(100);
		assertFalse(cuenta.transferirACuenta(100, cuentaDestino));
	}
	
	@Test
	public void testTransferirConPlataSuficiente() {
		Cuenta cuentaDestino = new CajaDeAhorro();
		cuenta.depositar(410);
		assertTrue(cuenta.transferirACuenta(100, cuentaDestino));
		assertEquals(299.8, cuenta.getSaldo());
		assertEquals(99.96, cuentaDestino.getSaldo());
	}
	
}

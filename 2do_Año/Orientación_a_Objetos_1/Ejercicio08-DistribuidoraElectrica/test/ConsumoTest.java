package ar.edu.unlp.info.oo1.ejercicio8;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ConsumoTest {

	private Consumo consumo;

	@BeforeEach
	public void setUp() {
		this.consumo = new Consumo(LocalDate.of(2020, 8, 20), 200d, 300d);
	}

	@Test
	public void testConsumo() {
		assertEquals(LocalDate.of(2020, 8, 20), this.consumo.getFecha());
		assertEquals(200d, this.consumo.getConsumoDeEnergiaActiva());
		assertEquals(300d, this.consumo.getConsumoDeEnergiaReactiva());
	}

	@Test
	public void testFactorDePotencia() {
		// 200 / sqrt(2oo^2 + 300^2)
		assertEquals(0.55, this.consumo.factorDePotencia(), 0.01);
	}

	@Test
	public void testCostoEnBase() {
		// 200d * 25
		assertEquals(5000d, this.consumo.costoEnBase(25d));
	}
}

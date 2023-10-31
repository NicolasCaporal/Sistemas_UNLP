package ar.edu.unlp.info.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class InversionEnAccionesTest {
	private InversionEnAcciones inversionAcciones;
	
	@BeforeEach
	public void setUp() {
		inversionAcciones = new InversionEnAcciones("meli", 5, 1000);
	}
	
    @Test
    public void testConstructot() {
        assertEquals("meli", inversionAcciones.getNombre());
        assertEquals(5, inversionAcciones.getCantidad());
        assertEquals(1000, inversionAcciones.getValorUnitario());
    }
    
    @Test
    public void testValorActual() {
		assertEquals(5000, inversionAcciones.valorActual());
		
    }
}


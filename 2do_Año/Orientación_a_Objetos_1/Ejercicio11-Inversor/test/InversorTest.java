package ar.edu.unlp.info.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;

public class InversorTest {
	
	private Inversor jorge;
	private PlazoFijo plazoFijo;
	private InversionEnAcciones inversionAcciones;
	private InversionEnAcciones inversionAcciones2;
	
	@BeforeEach
	public void setUp() {
		jorge = new Inversor("Jorge");
		LocalDate fechaDeConstitucion = LocalDate.now().minus(10,ChronoUnit.DAYS);
		plazoFijo = new PlazoFijo(fechaDeConstitucion, 3000, 1);
		inversionAcciones = new InversionEnAcciones("meli", 5, 1000);
		inversionAcciones2 = new InversionEnAcciones("vercel", 2, 100);
	}
	
    @Test
    public void testConstructot() {
        assertEquals("Jorge", jorge.getNombre());
        assertNotNull(jorge.getInversiones());
        assertEquals(0, jorge.getInversiones().size());
    }
    
  
    @Test
    public void testAgregarInversion() {
		jorge.agregarInversion(plazoFijo);
		jorge.agregarInversion(inversionAcciones);
		assertEquals(2, jorge.getInversiones().size());
    }
    
    @Test
    public void testValorActual() {
		jorge.agregarInversion(plazoFijo);
		jorge.agregarInversion(inversionAcciones);
		jorge.agregarInversion(inversionAcciones2);
		
		assertEquals(8500, jorge.valorActual());
		
    }
}

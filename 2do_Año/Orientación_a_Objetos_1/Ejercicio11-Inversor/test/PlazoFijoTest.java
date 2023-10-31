package ar.edu.unlp.info.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;

public class PlazoFijoTest {
	
	private PlazoFijo plazoFijo;
	
	@BeforeEach
	public void setUp() {
		LocalDate fechaDeConstitucion = LocalDate.now().minus(10,ChronoUnit.DAYS);
		plazoFijo = new PlazoFijo(fechaDeConstitucion, 3000, 1);
	}
	
    @Test
    public void testConstructot() {
        assertEquals(LocalDate.now().minus(10,ChronoUnit.DAYS), plazoFijo.getFechaDeConstitucion());
        assertEquals(3000, plazoFijo.getMontoDepositado());
        assertEquals(1, plazoFijo.getPorcentajeDeInteresDiario());
    }
    
    @Test
    public void testValorActual() {
		assertEquals(3300, plazoFijo.valorActual());
		
    }
}
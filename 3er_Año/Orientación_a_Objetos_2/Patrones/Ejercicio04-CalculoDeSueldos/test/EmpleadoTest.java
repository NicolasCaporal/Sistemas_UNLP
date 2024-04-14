package ar.edu.info.unlp.ejercicio04;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmpleadoTest {
	Empleado empleadoTemporario;
	Empleado empleadoPasante;
	Empleado empleadoPlanta;
	
	@BeforeEach
	void setUp() throws Exception {
		empleadoTemporario = new EmpleadoTemporario(2, true, 80);
		empleadoPasante = new EmpleadoPasante(2, true, 20);
		empleadoPlanta = new EmpleadoPlanta(2, true, 20);
	}

	@Test
	public void testSueldo() {
		assertEquals(46830, empleadoTemporario.sueldo());
		assertEquals(55400, empleadoPasante.sueldo());
		assertEquals(90050, empleadoPlanta.sueldo());
	}

    @Test
    public void testDescuento() {
		assertEquals(5720+450, empleadoTemporario.descuento(empleadoTemporario.basico(), empleadoTemporario.adicional()));
		assertEquals(2600+2000, empleadoPasante.descuento(empleadoPasante.basico(), empleadoPasante.adicional()));
		assertEquals(6500+2450, empleadoPlanta.descuento(empleadoPlanta.basico(), empleadoPlanta.adicional()));
    }
}

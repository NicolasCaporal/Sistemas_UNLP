package ar.edu.info.unlp.ejercicio04;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmpleadoPlantaTest {
    EmpleadoPlanta empleadoPl1;
    EmpleadoPlanta empleadoPl2;

    @BeforeEach
    void setUp() throws Exception {
        empleadoPl1 = new EmpleadoPlanta(5, true, 10);
        empleadoPl2 = new EmpleadoPlanta(0, false, 0);
    }

    @Test
    public void testBasico() {
        assertEquals(empleadoPl1.basico(), empleadoPl2.basico());
    }

    @Test
    public void testAdicional() {
        assertEquals(35000, empleadoPl1.adicional());
        assertEquals(0, empleadoPl2.adicional());
    }
}

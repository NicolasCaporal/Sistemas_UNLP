package ar.edu.info.unlp.ejercicio04;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmpleadoPasanteTest {
    EmpleadoPasante empleadoPa1;
    EmpleadoPasante empleadoPa2;

    @BeforeEach
    void setUp() throws Exception {
        empleadoPa1 = new EmpleadoPasante(5, true, 10);
        empleadoPa2 = new EmpleadoPasante(0, false, 0);
    }

    @Test
    public void testBasico() {
        assertEquals(empleadoPa1.basico(), empleadoPa2.basico());
    }

    @Test
    public void testAdicional() {
        assertEquals(20000, empleadoPa1.adicional());
        assertEquals(0, empleadoPa2.adicional());
    }
}

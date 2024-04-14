package ar.edu.info.unlp.ejercicio04;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmpleadoTemporarioTest {
    EmpleadoTemporario empleadoT1;
    EmpleadoTemporario empleadoT2;

    @BeforeEach
    void setUp() throws Exception {
        empleadoT1 = new EmpleadoTemporario(5, true, 10);
        empleadoT2 = new EmpleadoTemporario(0, false, 0);
    }

    @Test
    public void testBasico() {
        assertEquals(23000, empleadoT1.basico());
        assertEquals(20000, empleadoT2.basico());
    }

    @Test
    public void testAdicional() {
        assertEquals(15000, empleadoT1.adicional());
        assertEquals(0, empleadoT2.adicional());
    }
}

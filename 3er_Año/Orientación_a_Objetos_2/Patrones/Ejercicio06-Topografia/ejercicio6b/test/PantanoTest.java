package ar.edu.info.unlp.ejercicio06;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class PantanoTest {

    Pantano pantano;

    @BeforeEach
    void setUp() throws Exception {
        pantano = new Pantano();
    }

    @Test
    public void testProporcionTierra() {
        assertEquals(0.3, pantano.proporcionTierra());
    }

    @Test
    public void testProporcionAgua() {
        assertEquals(0.7, pantano.proporcionAgua());
    }

    @Test
    public void testEquals(){
        assertFalse(pantano.equals(new Agua()));
        assertFalse(pantano.equals(new Tierra()));
        assertTrue(pantano.equals(new Pantano()));
    }
}

package ar.edu.info.unlp.ejercicio06;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TopografiaMixtaTest {

    TopografiaMixta mixtaD;
    Agua agua;
    Tierra tierra;
    Topografia mixtaC;

    @BeforeEach
    void setUp() throws Exception {
        tierra = new Tierra();
        agua = new Agua();
        mixtaC = new TopografiaMixta(agua, tierra, tierra, agua);
        mixtaD = new TopografiaMixta(agua, tierra, tierra, mixtaC);
    }

    @Test
    public void testProporcionTierra() {
        double cuentaC = (double) (0+1+1+0)/4;
        double cuentaD = (double) (0+1+1+cuentaC)/4;
        assertEquals(cuentaC, mixtaC.proporcionTierra());
        assertEquals(cuentaD, mixtaD.proporcionTierra());
    }

    @Test
    public void testProporcionAgua() {
        double cuentaC = (double) (1+0+0+1)/4;
        double cuentaD = (double) (1+0+0+cuentaC)/4;
        assertEquals(cuentaC, mixtaC.proporcionAgua());
        assertEquals(cuentaD, mixtaD.proporcionAgua());
    }

    @Test
    public void testEquals(){
        TopografiaMixta mixtaCopiaD = new TopografiaMixta(agua, tierra, tierra, mixtaC);
        TopografiaMixta mixtaDiferenteAlaC = new TopografiaMixta(agua, tierra, tierra, tierra);
        TopografiaMixta mixtaDiferenteAlaD = new TopografiaMixta(agua, tierra, tierra, mixtaDiferenteAlaC);
        assertTrue(mixtaD.equals(mixtaCopiaD));
        assertFalse(mixtaD.equals(mixtaDiferenteAlaD)); // Es CASI igual difiere solo en un cuadradito interior
    }
}

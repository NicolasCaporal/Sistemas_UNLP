package ar.edu.info.unlp.ejercicio06;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AguaTest {

	Agua agua;
	
	@BeforeEach
	void setUp() throws Exception {
		agua = new Agua();
	}
	
    @Test
    public void testProporcionTierra() {
        assertEquals(0, agua.proporcionTierra());
	}

	@Test
	public void testProporcionAgua() {
		assertEquals(1, agua.proporcionAgua());
	}

	@Test
	public void testEquals(){
		assertTrue(agua.equals(new Agua()));
		assertFalse(agua.equals(new Tierra()));
	}
}

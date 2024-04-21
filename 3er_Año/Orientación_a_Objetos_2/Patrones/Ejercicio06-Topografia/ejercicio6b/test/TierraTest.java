package ar.edu.info.unlp.ejercicioDemo;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TierraTest {

	Tierra tierra;
	
	@BeforeEach
	void setUp() throws Exception {
		tierra = new Tierra();
	}
	
    @Test
    public void testProporcionTierra() {
        assertEquals(1, tierra.proporcionTierra());
	}

	@Test
	public void testProporcionAgua() {
		assertEquals(0, tierra.proporcionAgua());
	}

	@Test
	public void testEquals(){
		assertTrue(tierra.equals(new Tierra()));
		assertFalse(tierra.equals(new Agua()));
		assertFalse(tierra.equals(new Pantano()));
	}
}

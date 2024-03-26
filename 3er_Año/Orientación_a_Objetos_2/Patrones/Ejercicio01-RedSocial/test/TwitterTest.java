package ar.edu.info.unlp.ejercicio01;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


public class TwitterTest {

	Twitter twitter;

	
	@BeforeEach
	void setUp() throws Exception {
		twitter = new Twitter();
		twitter.crearUsuario("@ElVengadorInfantil");
	}
	
    @Test
    public void testCrearUsuario() {
		assertTrue(twitter.crearUsuario("@MrTicTac"));
		assertFalse(twitter.crearUsuario("@ElVengadorInfantil"));
    }

	@Test
	public void testEliminarUsuario(){
		assertEquals(1, twitter.getUsuarios().size());
		assertFalse(twitter.eliminarUsuario("@Lampone"));
		assertTrue(twitter.eliminarUsuario("@ElVengadorInfantil"));
		assertEquals(0, twitter.getUsuarios().size());
	}

}

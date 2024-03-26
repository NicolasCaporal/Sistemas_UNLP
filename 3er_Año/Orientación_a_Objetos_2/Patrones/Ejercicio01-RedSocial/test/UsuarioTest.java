package ar.edu.info.unlp.ejercicio01;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;


public class UsuarioTest {

	Usuario maximoCozzetti;
	Tweet tweet1;

	
	@BeforeEach
	void setUp() throws Exception {
		maximoCozzetti = new Usuario("@TortugaMaritima");
		maximoCozzetti.publicarTweet("En la puta vida probó el pan, era celiaco");
		maximoCozzetti.publicarTweet("UUUUH PEPITAS");
		tweet1 = new Tweet("Cuchame cumpleaños, dónde están las sartenes de acero para pescado?");
		maximoCozzetti.retwittear(tweet1);
		//Si no entendés, dejá de estudiar y ponete a mirar Los Simuladores
	}
	
    @Test
    public void testGetScreenName() {
		assertEquals("@TortugaMaritima", maximoCozzetti.getScreenName());
    }

	@Test
	public void testCaracteresPublicarTweet(){
		assertTrue(maximoCozzetti.publicarTweet("Yo no voté a Pablo. Tic Tac, me pareció más humano"));
		assertFalse(maximoCozzetti.publicarTweet(""));
		assertFalse(maximoCozzetti.publicarTweet("Juegan los niños en los escaparates, en la jugueteria del señor simon! " +
														"Juegan con autos, juegan con tractores, prefieren osos que a sus progenitores. " +
														"Sueñan los niños en la jugueteria, de nuestro amigo el señor simon... " +
														"No todo brilla en la jugueteria, que irresponsable que es el señor Simon infunde el miedo, " +
														"promueve la violencia, alienta al odio y la discriminacion"));
	}

	@Test
	public void testBorrarTweets(){
		assertEquals(3, maximoCozzetti.getPublicaciones().size());
		maximoCozzetti.borrarTweets();
		assertEquals(0, maximoCozzetti.getPublicaciones().size());
	}

}

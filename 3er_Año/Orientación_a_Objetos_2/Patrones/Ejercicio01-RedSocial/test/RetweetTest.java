package ar.edu.info.unlp.ejercicio01;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;


public class RetweetTest {
	
	Tweet tweet1;
	Retweet retweet1;
	
	@BeforeEach
	void setUp() throws Exception {
		tweet1 = new Tweet("En la puta vida probó el pan, era celiaco");
		//Si no entendés, dejá de estudiar y ponete a mirar Los Simuladores
		retweet1 = new Retweet(tweet1);
	}
	
    @Test
    public void testGetTexto() {
		assertEquals(tweet1.getTexto(), retweet1.getTexto());
	}
}

package ar.edu.info.unlp.ejercicio01;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;


public class TweetTest {

	Tweet tweet1;
	
	@BeforeEach
	void setUp() throws Exception {
		tweet1 = new Tweet("Just setting up my twttr");
	}
	
    @Test
    public void testCaracteres() {
		assertTrue((!tweet1.getTexto().isEmpty()) && (tweet1.getTexto().length() <= 280));
    }

}

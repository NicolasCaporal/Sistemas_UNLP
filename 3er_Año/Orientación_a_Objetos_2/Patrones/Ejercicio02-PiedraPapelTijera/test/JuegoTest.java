package ar.edu.info.unlp.ejercicio02;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase
 *
 */
public class JuegoTest {

	Juego juego;
	Jugada jugadaPiedra;
	Jugada jugadaPapel;
	Jugada jugadaTijera;
	Jugada jugadaLagarto;
	Jugada jugadaSpock;

	@BeforeEach
	void setUp() throws Exception {
		juego = new Juego();
		jugadaPiedra = new Piedra();
		jugadaPapel = new Papel();
		jugadaTijera = new Tijera();
		jugadaLagarto = new Lagarto();
		jugadaSpock = new Spock();
	}

	@Test
	public void testPiedra() {
		assertEquals("Gana Piedra",juego.jugarPartida(jugadaPiedra, jugadaTijera));
		assertEquals("Empate",juego.jugarPartida(jugadaPiedra, jugadaPiedra));
		assertEquals("Gana Papel",juego.jugarPartida(jugadaPiedra, jugadaPapel));
		assertEquals("Gana Piedra", juego.jugarPartida(jugadaPiedra, jugadaLagarto));
		assertEquals("Gana Spock", juego.jugarPartida(jugadaPiedra, jugadaSpock));
	}

	@Test
	public void testPapel() {
		assertEquals("Gana Papel",juego.jugarPartida(jugadaPapel, jugadaPiedra));
		assertEquals("Empate",juego.jugarPartida(jugadaPapel, jugadaPapel));
		assertEquals("Gana Tijera",juego.jugarPartida(jugadaPapel, jugadaTijera));
		assertEquals("Gana Papel", juego.jugarPartida(jugadaPapel, jugadaSpock));
		assertEquals("Gana Lagarto", juego.jugarPartida(jugadaPapel, jugadaLagarto));
	}

	@Test
	public void testTijera() {
		assertEquals("Gana Tijera",juego.jugarPartida(jugadaTijera, jugadaPapel));
		assertEquals("Empate",juego.jugarPartida(jugadaTijera, jugadaTijera));
		assertEquals("Gana Piedra",juego.jugarPartida(jugadaTijera, jugadaPiedra));
		assertEquals("Gana Tijera", juego.jugarPartida(jugadaTijera, jugadaLagarto));
		assertEquals("Gana Spock", juego.jugarPartida(jugadaTijera, jugadaSpock));
	}

	@Test
	public void testLagarto() {
		assertEquals("Gana Lagarto", juego.jugarPartida(jugadaLagarto, jugadaPapel));
		assertEquals("Gana Lagarto", juego.jugarPartida(jugadaLagarto, jugadaSpock));
		assertEquals("Empate", juego.jugarPartida(jugadaLagarto, jugadaLagarto));
		assertEquals("Gana Tijera", juego.jugarPartida(jugadaLagarto, jugadaTijera));
		assertEquals("Gana Piedra", juego.jugarPartida(jugadaLagarto, jugadaPiedra));
	}

	@Test
	public void testSpock(){
		assertEquals("Gana Spock", juego.jugarPartida(jugadaSpock, jugadaTijera));
		assertEquals("Gana Spock",juego.jugarPartida(jugadaSpock, jugadaPiedra));
		assertEquals("Empate", juego.jugarPartida(jugadaSpock, jugadaSpock));
		assertEquals("Gana Lagarto", juego.jugarPartida(jugadaSpock, jugadaLagarto));
		assertEquals("Gana Papel", juego.jugarPartida(jugadaSpock, jugadaPapel));
	}

}

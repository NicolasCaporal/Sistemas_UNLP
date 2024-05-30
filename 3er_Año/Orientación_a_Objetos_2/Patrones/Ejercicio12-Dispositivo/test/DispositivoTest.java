package ar.edu.info.unlp.ejercicioDemo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DispositivoTest {
	private Dispositivo dispositivoWifi16;
	private Dispositivo dispositivoFourG32;

	@BeforeEach
	public void setUp() throws Exception {
		this.dispositivoWifi16 = new Dispositivo();
		this.dispositivoFourG32 = new Dispositivo();
		this.dispositivoFourG32.conectarCon(new FourGAdapter());
		this.dispositivoFourG32.configurarCRC(new CRC32_Calculator());
	}

	@Test
	public void testSend() {
		assertEquals("Wifi Connection: Datos 63276",this.dispositivoWifi16.send("Datos"));
		assertEquals("4G Connection: Datos -1873146224",this.dispositivoFourG32.send("Datos"));
	}

	@Test
	public void testConectarCon() {
		assertEquals("Connection changed", this.dispositivoWifi16.conectarCon(new FourGAdapter()));
		assertEquals("Connection changed", this.dispositivoFourG32.conectarCon(new WifiConnection()));
	}

	@Test
	public void testConfigurarCRC() {
		assertEquals("Crc calculator changed",this.dispositivoWifi16.configurarCRC(new CRC32_Calculator()));
		assertEquals("Crc calculator changed",this.dispositivoFourG32.configurarCRC(new CRC16_Calculator()));
	}

}
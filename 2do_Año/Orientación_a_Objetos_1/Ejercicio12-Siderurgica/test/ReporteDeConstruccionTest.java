package ar.edu.unlp.info.oo1.ejercicio12;

import java.util.List;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReporteDeConstruccionTest {
	private ReporteDeConstruccion reporte;
	private Cilindro cilindro;
	private PrismaRectangular prisma;
	private Esfera esfera;
	private Esfera esferaAluminio;
	
	@BeforeEach
	public void setUp() {
		reporte = new ReporteDeConstruccion();
		cilindro = new Cilindro("Hierro", "Rojo", 2, 5);
		esfera = new Esfera("Hierro", "Rojo", 4);
		esferaAluminio = new Esfera("Aluminio", "Azul", 4);
		prisma = new PrismaRectangular("Hierro", "Rojo", 4, 2, 10);
	}
	
	@Test
	public void testConstructor() {
		assertNotNull(reporte.getPiezas());
		assertEquals(0, reporte.getPiezas().size());
	}
	
	@Test
	public void testAgregarPieza() {
		reporte.agregarPieza(cilindro);
		List<Pieza> piezas = reporte.getPiezas();
		assertEquals(1, piezas.size());
		assertEquals("Hierro", piezas.get(piezas.size() - 1).getMaterial());
	}

	@Test
	public void testGetVolumenDeMaterial() {
		reporte.agregarPieza(cilindro);
		reporte.agregarPieza(esfera);
		reporte.agregarPieza(esferaAluminio);
		reporte.agregarPieza(prisma);
		
		double resultadoEsperado = (62.83185307179586 + 268.082573106329 + 80);
		assertEquals(resultadoEsperado, reporte.getVolumenDeMaterial("Hierro"));
	}
	
	@Test
	public void testGetSuperficieDeColor() {
		reporte.agregarPieza(cilindro);
		reporte.agregarPieza(esfera);
		reporte.agregarPieza(esferaAluminio);
		reporte.agregarPieza(prisma);
		
		double resultadoEsperado = (87.96459430051421 + 201.06192982974676 + 136);
		assertEquals(resultadoEsperado, reporte.getSuperficieDeColor("Rojo"));
		
	}
	
}

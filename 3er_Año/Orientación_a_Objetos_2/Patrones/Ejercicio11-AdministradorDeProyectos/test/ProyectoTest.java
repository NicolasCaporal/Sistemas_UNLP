package ar.edu.info.unlp.ejercicio11;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

// Normalmente los enunciados piden implementar todos los test que creas necesarios,
// pero en este caso pedía solo uno muy especifico, por mi joya menos laburo ¯\_(ツ)_/¯

/*  Implemente un test para aprobar un proyecto con las siguientes características:
    (i) se encuentra en evaluación,
    (ii) se llama “Vacaciones de invierno”,
    (iii) tiene como objetivo “salir con amigos”,
    (iv) lo integran 3 personas.
 */

public class ProyectoTest {
	LocalDate fechaInicio;
	LocalDate fechaFin;
	Proyecto proyecto;


	@BeforeEach
	void setUp() throws Exception {
		fechaInicio = LocalDate.of(2024, 7, 15);
		fechaFin = LocalDate.of(2024, 7, 22);
		proyecto = new Proyecto("Vacaciones de invierno", "Salir con amigos", fechaInicio, fechaFin, 3, 100);
		proyecto.aprobarEtapa(); //Pasa a "en evaluacion"
	}


    @Test
    public void testAprobarEtapa() {
        this.proyecto.aprobarEtapa();
		assertTrue(proyecto.getEstado() instanceof EstadoConfirmada);

		RuntimeException exception = assertThrows(RuntimeException.class, proyecto::aprobarEtapa);
		assertEquals("CONFIRMADA: El Proyecto ya está confirmado", exception.getMessage());
	}


	@Test
	public void testCostoDelProyecto(){
		assertEquals(2100, this.proyecto.costoDelProyecto());
	}


	@Test
	public void testPrecioDelProyecto(){
		assertEquals(2247, this.proyecto.precioDelProyecto());
	}


	@Test
	public void setMargenDeGanancia(){
		assertFalse(proyecto.cambiarMargenDeGanancia(10));
		assertTrue(proyecto.cambiarMargenDeGanancia(11));
		assertEquals(11, proyecto.getMargenDeGanancia());
	}


	@Test
	public void cancelarProyecto(){
		proyecto.cancelarProyecto();
		assertTrue(proyecto.getEstado() instanceof EstadoCancelado);
		assertEquals("Salir con amigos (Cancelado)", proyecto.getObjetivo());

		RuntimeException exception = assertThrows(RuntimeException.class, proyecto::cancelarProyecto);
		assertEquals("CANCELADO: El Proyecto fue cancelado", exception.getMessage());
	}
}

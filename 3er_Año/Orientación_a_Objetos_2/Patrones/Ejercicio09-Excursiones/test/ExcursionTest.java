package ar.edu.info.unlp.ejercicio09;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;


// Normalmente los enunciados piden implementar todos los test que creas necesarios, pero en este caso pedía solo uno muy especifico :)

// Escriba un test para inscribir a un usuario en la excursión “Dos días en kayak bajando el Paraná”, con cupo mínimo de
// 1 persona y cupo máximo 2, con dos personas ya inscriptas. Implemente todos los mensajes que considere necesarios.

public class ExcursionTest {
	
	Usuario usuario1, usuario2, usuario3;
	Excursion excursion;
	LocalDate fechaInicio, fechaFin;
	
	@BeforeEach
	void setUp() throws Exception {
		fechaInicio = LocalDate.of(2024, 5, 15);
		fechaFin = LocalDate.of(2024, 5, 17);
		excursion = new Excursion("Dos días en kayak bajando el Paraná", fechaInicio, fechaFin, "Ruta nacional 12 km1282", 200000, 1, 2);
		usuario1 = new Usuario("Maximo", "Cosseti", "tortuga@maritima.com");
		usuario2 = new Usuario("Pablo", "Lamponne", "nomeagacho@gmail.com");
		usuario3 = new Usuario("Mario", "Santos", "fuegotiene@argentina.com");
		excursion.inscribir(usuario1);
		excursion.inscribir(usuario2);
	}
	
    @Test
    public void testExcursionLlena() {
		excursion.inscribir(usuario3);
        assertEquals(0, excursion.usuariosFaltantesMaximo());
		assertEquals(2, excursion.cantInscriptos());
		assertEquals(1, excursion.cantEnEspera());
    }
}

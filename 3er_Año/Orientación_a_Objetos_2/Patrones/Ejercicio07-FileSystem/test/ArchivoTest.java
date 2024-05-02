package ar.edu.info.unlp.ejercicio07;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;


public class ArchivoTest {
	
	Archivo archivo;
	Archivo archivo2;
	LocalDate fecha;

	@BeforeEach
	void setUp() throws Exception {
		fecha = LocalDate.of(2022, 11, 23);
		archivo = new Archivo("notas.txt", fecha, 20);
	}
	
    @Test
    public void testListadoContenido() {
        assertEquals(archivo.listadoContenido("/directorio1"), "/directorio1/notas.txt\n");
    }

	@Test
	public void testBuscarTodos(){
		archivo2 = new Archivo("notas2.pdf", fecha, 40);
		ArrayList<FileSystem> lista = new ArrayList<FileSystem>();

		archivo.buscarTodos("/notas.txt", lista);
		archivo2.buscarTodos("/noExisto.java", lista);

		assertTrue(lista.contains(archivo));
		assertFalse(lista.contains(archivo2));
	}
}

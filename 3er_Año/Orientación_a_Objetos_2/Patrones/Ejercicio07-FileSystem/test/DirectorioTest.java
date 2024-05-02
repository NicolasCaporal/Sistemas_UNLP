package ar.edu.info.unlp.ejercicio07;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;


public class DirectorioTest {

    Directorio directorioRaiz;
    Directorio subdirectorio;
    Archivo archivo;
    Archivo archivo2;
    Archivo archivoGrande;
    LocalDate fecha;
    LocalDate fechaMasNueva;


    @BeforeEach
    void setUp() throws Exception {
        fecha = LocalDate.of(2022, 11, 23);
        fechaMasNueva = LocalDate.now();

        archivo = new Archivo("notas.txt", fecha, 20);
        archivo2 = new Archivo("notas2.pdf", fecha, 40);
        archivoGrande = new Archivo("notas.txt", fechaMasNueva, 100);

        directorioRaiz = new Directorio("C:", fecha);
        subdirectorio = new Directorio("carpeta", fecha);

        subdirectorio.agregar(archivoGrande);
        directorioRaiz.agregar(archivo);
        directorioRaiz.agregar(archivo2);
        directorioRaiz.agregar(subdirectorio);
    }

    @Test
    public void testTamañoOcupado() {
        int suma = 32000+32000+20+40+100;
        assertEquals(suma, directorioRaiz.tamañoOcupado());
    }

    @Test
    public void testArchivoMasGrande(){
        assertEquals(archivoGrande, directorioRaiz.archivoMasGrande());
    }

    @Test
    public void testArchivoMasNuevo(){
        assertEquals(archivoGrande, directorioRaiz.archivoMasNuevo());
    }

    @Test
    public void testBuscar(){
        assertEquals(archivo, directorioRaiz.buscar("/notas.txt"));
        assertNotEquals(archivoGrande, directorioRaiz.buscar("/notas.txt"));
    }

    @Test
    public void testBuscarTodos(){
        ArrayList<FileSystem> lista = directorioRaiz.buscarTodos("/notas.txt");
        assertTrue(lista.contains(archivo));
        assertTrue(lista.contains(archivoGrande));
    }

    @Test
    public void testListadoContenido(){
        String esperado = "/C:\n" +
                "/C:/notas.txt\n" +
                "/C:/notas2.pdf\n" +
                "/C:/carpeta\n" +
                "/carpeta/notas.txt\n";

        assertEquals(esperado, directorioRaiz.listadoContenido(""));
    }
}

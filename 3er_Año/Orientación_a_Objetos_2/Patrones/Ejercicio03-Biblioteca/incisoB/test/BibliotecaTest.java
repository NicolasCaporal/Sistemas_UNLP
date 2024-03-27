package ar.edu.unlp.info.oo2.biblioteca;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class BibliotecaTest {
    Biblioteca biblioteca;
    Socio socio1;
    Socio socio2;


    @BeforeEach
    void setUp() throws Exception {
        biblioteca = new Biblioteca();
        socio1 = new Socio("Maximo Cozzeti", "tortuga_maritima@gmail.com", "21322");
        socio2 = new Socio("Lampone", "nomeagacho@gmail.com", "123456");
        biblioteca.agregarSocio(socio1);
        biblioteca.agregarSocio(socio2);
    }

   /* @Test
    public void testAgregarSocio() {
        Socio socio3 = new Socio("Señor Simon", "jugueteria@hotmail.com", "987654");
        biblioteca.agregarSocio(socio3);

    }*/

    @Test
    public void testExportarSocios(){
        biblioteca.exportarSocios();
        assertTrue(this.biblioteca.exportarSocios().contains("Maximo Cozzeti"));
        assertTrue(this.biblioteca.exportarSocios().contains("tortuga_maritima@gmail.com"));
        assertTrue(this.biblioteca.exportarSocios().contains("21322"));
        assertTrue(this.biblioteca.exportarSocios().contains("Lampone"));
        assertTrue(this.biblioteca.exportarSocios().contains("nomeagacho@gmail.com"));
        assertTrue(this.biblioteca.exportarSocios().contains("123456"));
    }

    @Test
    public void testExportarSociosJSONSimple(){
        JSONAdapter jsonSimpleExporter = new JSONAdapter();
        biblioteca.setExporter(jsonSimpleExporter);
        biblioteca.exportarSocios();
        assertTrue(this.biblioteca.exportarSocios().contains("Maximo Cozzeti"));
        assertTrue(this.biblioteca.exportarSocios().contains("tortuga_maritima@gmail.com"));
        assertTrue(this.biblioteca.exportarSocios().contains("21322"));
        assertTrue(this.biblioteca.exportarSocios().contains("Lampone"));
        assertTrue(this.biblioteca.exportarSocios().contains("nomeagacho@gmail.com"));
        assertTrue(this.biblioteca.exportarSocios().contains("123456"));
    }

}

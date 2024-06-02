package ar.edu.info.unlp.ejercicio15;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.LocalDate;

public class FileManagerTest {

    private FileOO2 file;
    private FileOO2 name, extension, creationDate, permissions, size;
    private LocalDate creation;
    private LocalDate modifi;


    @BeforeEach
    void setUp() throws Exception {
        creation = LocalDate.of(2003, 9, 3);
        modifi = LocalDate.of(2024, 6, 8);
        file = new File("DessingPatterns", ".pdf", 4000, creation, modifi, "-rwx -wx r--");
    }

    @Test
    public void testPrettyPrint1() {
        name = new AspectName(file);
        extension = new AspectExtension(name);

        String expected = "Archivo:\n" +
                "DessingPatterns\n" +
                ".pdf";

        assertEquals(expected, extension.prettyPrint());
    }

    @Test
    public void testPrettyPrint2(){
        name = new AspectName(file);
        extension = new AspectExtension(name);
        creationDate = new AspectDateCreated(extension);

        String expected = "Archivo:\n" +
                "DessingPatterns\n" +
                ".pdf\n" +
                "2003-09-03";

        assertEquals(expected, creationDate.prettyPrint());
    }

    @Test
    public void testPrettyPrint3(){
        permissions = new AspectPermissions(file);
        name = new AspectName(permissions);
        extension = new AspectExtension(name);
        size = new AspectSize(extension);

        String expected = "Archivo:\n" +
                "-rwx -wx r--\n" +
                "DessingPatterns\n" +
                ".pdf\n" +
                "4000.0";

        assertEquals(expected, size.prettyPrint());
    }

}

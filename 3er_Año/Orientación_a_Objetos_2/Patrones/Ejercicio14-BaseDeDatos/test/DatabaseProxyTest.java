package ar.edu.unlp.info.oo2.accesobd;

import java.util.Arrays;
import java.util.Collections;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class DatabaseProxyTest {
    private DatabaseRealAccess database;
    private final String apiKey = "ABC123";
    private DatabaseProxy proxy;

    @BeforeEach
    void setUp() throws Exception {
        this.database = new DatabaseRealAccess();
        this.proxy = new DatabaseProxy(apiKey, database);
    }

    @Test
    void testLogin(){
        assertFalse(proxy.checkAuthentication());
        assertFalse(proxy.login("987XYZ"));
        assertTrue(proxy.login("ABC123"));
        assertTrue(proxy.checkAuthentication());
    }

    @Test
    void testLogout(){
        proxy.login("ABC123");
        proxy.logout();
        assertFalse(proxy.checkAuthentication());
    }

    @Test
    void testGetSearchResults() {
        RuntimeException exception;

        exception = assertThrows(RuntimeException.class, () -> proxy.getSearchResults("un string"));
        assertEquals("403 Forbidden: Access denied", exception.getMessage());

        assertTrue(proxy.login("ABC123"));

        assertEquals(Arrays.asList("Spiderman", "Marvel"), proxy.getSearchResults("select * from comics where id=1"));
        assertEquals(Collections.emptyList(), proxy.getSearchResults("select * from comics where id=10"));
    }

    @Test
    void testInsertNewRow() {
        RuntimeException exception;

        exception = assertThrows(RuntimeException.class, () -> proxy.insertNewRow(Arrays.asList("Patoruzú", "La flor")));
        assertEquals("403 Forbidden: Access denied", exception.getMessage());

        assertTrue(proxy.login("ABC123"));

        assertEquals(3, this.database.insertNewRow(Arrays.asList("Patoruzú", "La flor")));
        assertEquals(Arrays.asList("Patoruzú", "La flor"), this.database.getSearchResults("select * from comics where id=3"));
    }
}
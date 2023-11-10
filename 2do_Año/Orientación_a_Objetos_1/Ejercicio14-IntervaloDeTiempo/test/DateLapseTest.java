package ar.edu.unlp.info.oo1.ejercicio14;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class DateLapseTest {
	private DateLapse dateLapse;
	private LocalDate from;
	private LocalDate to;
	private LocalDate yes;
	
	@BeforeEach
	public void setUp() {
		from = LocalDate.of(2023, 11, 11);
		to = LocalDate.of(2023, 11, 21);
		yes = LocalDate.of(2023, 11, 15);
		dateLapse = new DateLapse(from, to);
	}
	
	@Test
	public void testContructor() {
		assertEquals(LocalDate.of(2023, 11, 11), dateLapse.getFrom());
		assertEquals(LocalDate.of(2023, 11, 21), dateLapse.getTo());
	}
	
	@Test
	public void testSizeInDays() {
		assertEquals(10, dateLapse.sizeInDays());
	}
	
	@Test
	public void includeDates() {
		assertFalse(dateLapse.includesDate(from));
		assertFalse(dateLapse.includesDate(to));
		assertTrue(dateLapse.includesDate(yes));
	}
	
	
}

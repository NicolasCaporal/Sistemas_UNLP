package ar.edu.info.unlp.ejercicio08;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class ToDoItemTest {
	
	ToDoItem pending;
	ToDoItem inProgress;
	ToDoItem paused;
	ToDoItem finished;


	@BeforeEach
	void setUp() throws Exception {
		pending = new ToDoItem("TareaPendiente");

		inProgress = new ToDoItem("TareaEnProgreso");
		inProgress.start();

		paused = new ToDoItem("TareaPausada");
		paused.start();
		paused.togglePause();

		finished = new ToDoItem("TareaFinalizada");
		finished.start();
		finished.finish();
	}


	@Test
	public void testInit() {
		assertEquals(pending.getName(), "TareaPendiente");
		assertTrue(pending.getState() instanceof PendingState);
	}


    @Test
    public void testStart() {
        pending.start();
		assertTrue(pending.getState() instanceof inProgressState);

		inProgress.start();
		assertTrue(inProgress.getState() instanceof inProgressState);

		paused.start();
		assertTrue(paused.getState() instanceof PausedState);

		finished.start();
		assertTrue(finished.getState() instanceof FinishedState);
	}


	@Test
	public void testTogglePause(){
		RuntimeException exception;
		exception = assertThrows(RuntimeException.class, pending::togglePause);
		assertEquals("STATE PENDDING: La tarea aún no se inició, no podés pausarla", exception.getMessage());

		inProgress.togglePause();
		assertTrue(inProgress.getState() instanceof PausedState);

		paused.togglePause();
		assertTrue(paused.getState() instanceof inProgressState);

		finished.start();
		assertTrue(finished.getState() instanceof FinishedState);

		exception = assertThrows(RuntimeException.class, finished::togglePause);
		assertEquals("STATE FINISHED: La tarea ya finalizó, no podés pausarla", exception.getMessage());
	}


	@Test
	public void testFinish(){
		pending.finish();
		assertTrue(pending.getState() instanceof PendingState);

		inProgress.finish();
		assertTrue(inProgress.getState() instanceof FinishedState);

		paused.finish();
		assertTrue(paused.getState() instanceof FinishedState);

		finished.finish();
		assertTrue(finished.getState() instanceof FinishedState);
	}


	@Test
	public void testWorkedTime(){
		RuntimeException exception;
		exception = assertThrows(RuntimeException.class, pending::workedTime);
		assertEquals("STATE PENDDING: La tarea aún no se inició, no hay tiempo de trabajo", exception.getMessage());


		finished.setStart(LocalDateTime.of(2024, 4, 10, 20, 40, 0));
		finished.setEnd(LocalDateTime.of(2024, 4, 10, 21, 41, 20));
		assertEquals(3680,this.finished.workedTime().getSeconds());
	}


	@Test
	public void testAddComment(){
		String comentarioUno = "Pendiente, como el final de ISO";
		pending.addComment(comentarioUno);
		assertTrue(pending.getComments().contains(comentarioUno));

		String comentarioDos = "Comentario en progreso, como OO2";
		inProgress.addComment(comentarioDos);
		assertTrue(inProgress.getComments().contains(comentarioDos));

		String comentarioTres = "yo pausé CPLP...";
		paused.addComment(comentarioTres);
		assertTrue(paused.getComments().contains(comentarioTres));

		String comentarioCuatro = "Ojalá esto fuese el semestre, estoy cansado";
		finished.addComment(comentarioCuatro);
		assertFalse(finished.getComments().contains(comentarioCuatro));
	}

}

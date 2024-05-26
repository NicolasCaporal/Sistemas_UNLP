package ar.edu.info.unlp.ejercicio08;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ToDoItem {
	private String name;
	private State state;
	private LocalDateTime timeStart;
	private LocalDateTime timeEnd;
	private List<String> comments;


	/**
	 * Instancia un ToDoItem nuevo en estado pending con <name> como nombre.
	 */
	public ToDoItem(String name){
		this.name = name;
		this.state = new PendingState(this);
		this.comments = new ArrayList<String>();
		// Esto rompe el encapsulamiento, pero el libro de Gamma dice que el Contexto puede pasarse a si mismo
		// como parámetro para que el objeto Estado pueda acceder al Contexto si fuera necesario.
		// La justificación es que tiene sentido que, en el patrón State, las clases estén fuertemente acopladas y conozcan
		// el funcionamiento interno de las otras clases.
	}


	/**
	 * Pasa el ToDoItem a in-progress, siempre y cuando su estado actual sea
	 * pending. Si se encuentra en otro estado, no hace nada.
	 */
	public void start(){
		this.state.start();
	}


	/**
	 * Pasa el ToDoItem a paused si su estado es in-progress, o a in-progress si su
	 * estado es paused. Caso contrario (pending o finished) genera un error
	 * informando la causa específica del mismo.
	 */
	public void togglePause(){
		this.state.togglePause();
	}


	/**
	 * Pasa el ToDoItem a finished, siempre y cuando su estado actual sea
	 * in-progress o paused. Si se encuentra en otro estado, no hace nada.
	 */
	public void finish(){
		this.state.finish();
	}


	/**
	 * Retorna el tiempo que transcurrió desde que se inició el ToDoItem (start)
	 * hasta que se finalizó. En caso de que no esté finalizado, el tiempo que
	 * haya transcurrido hasta el momento actual. Si el ToDoItem no se inició,
	 * genera un error informando la causa específica del mismo.
	 */
	public Duration workedTime(){
        return this.state.workedTime();
    }


	/**
	 * Agrega un comentario al ToDoItem siempre y cuando no haya finalizado. Caso
	 * contrario no hace nada."
	 */
	public void addComment(String comment){
		this.state.addComment(comment);
	}


	public List<String> getComments(){
		return this.comments;
	}


	public void setStart(LocalDateTime time){
		this.timeStart = time;
	}


	public LocalDateTime getStart(){
		return this.timeStart;
	}


	public void setEnd(LocalDateTime time){
		this.timeEnd = time;
	}


	public LocalDateTime getEnd(){
		return this.timeEnd;
	}


	public State getState(){
		return this.state;
	}


	public void setState(State state){
		this.state = state;
	}


	public String getName(){
		return this.name;
	}

}
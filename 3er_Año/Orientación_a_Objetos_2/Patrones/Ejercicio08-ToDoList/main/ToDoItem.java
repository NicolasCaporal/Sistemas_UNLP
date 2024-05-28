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
		this.state = new PendingState();
		this.comments = new ArrayList<String>();
	}


	/**
	 * Pasa el ToDoItem a in-progress, siempre y cuando su estado actual sea
	 * pending. Si se encuentra en otro estado, no hace nada.
	 */
	public void start(){
		this.state.start(this);
	}


	/**
	 * Pasa el ToDoItem a paused si su estado es in-progress, o a in-progress si su
	 * estado es paused. Caso contrario (pending o finished) genera un error
	 * informando la causa específica del mismo.
	 */
	public void togglePause(){
		this.state.togglePause(this);
	}


	/**
	 * Pasa el ToDoItem a finished, siempre y cuando su estado actual sea
	 * in-progress o paused. Si se encuentra en otro estado, no hace nada.
	 */
	public void finish(){
		this.state.finish(this);
	}


	/**
	 * Retorna el tiempo que transcurrió desde que se inició el ToDoItem (start)
	 * hasta que se finalizó. En caso de que no esté finalizado, el tiempo que
	 * haya transcurrido hasta el momento actual. Si el ToDoItem no se inició,
	 * genera un error informando la causa específica del mismo.
	 */
	public Duration workedTime(){
        return this.state.workedTime(this);
    }


	/**
	 * Agrega un comentario al ToDoItem siempre y cuando no haya finalizado. Caso
	 * contrario no hace nada."
	 */
	public void addComment(String comment){
		this.state.addComment(this, comment);
	}


	public List<String> getComments(){
		return this.comments;
	}

	public String getName(){
		return this.name;
	}

	protected void setStart(LocalDateTime time){
		this.timeStart = time;
	}


	protected LocalDateTime getStart(){
		return this.timeStart;
	}


	protected void setEnd(LocalDateTime time){
		this.timeEnd = time;
	}


	protected LocalDateTime getEnd(){
		return this.timeEnd;
	}


	protected State getState(){
		return this.state;
	}


	protected void setState(State state){
		this.state = state;
	}

}
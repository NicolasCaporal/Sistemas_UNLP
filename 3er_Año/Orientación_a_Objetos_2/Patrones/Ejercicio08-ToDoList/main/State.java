package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;

public abstract class State {

    public State(){ }

    public abstract void start(ToDoItem task);

    public abstract void togglePause(ToDoItem task);

    public abstract void finish(ToDoItem task);

    public abstract Duration workedTime(ToDoItem task);

    public abstract void addComment(ToDoItem task, String comment);
}

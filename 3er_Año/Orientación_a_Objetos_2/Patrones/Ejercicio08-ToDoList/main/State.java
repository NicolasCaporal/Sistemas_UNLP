package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;

public abstract class State {
    protected ToDoItem task; //Context

    public State(ToDoItem task){
        this.task = task;
    }

    public abstract void start();

    public abstract void togglePause();

    public abstract void finish();

    public abstract Duration workedTime();

    public abstract void addComment(String comment);
}

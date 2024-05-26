package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class PendingState extends State{

    public PendingState(ToDoItem task){
        super(task);
    }

    @Override
    public void start() {
        this.task.setStart(LocalDateTime.now());
        this.task.setState(new inProgressState(task));
    }

    @Override
    public void togglePause() {
        throw new RuntimeException("STATE PENDDING: La tarea aún no se inició, no podés pausarla");
    }

    @Override
    public void finish() {
        //No hace nada
    }

    @Override
    public Duration workedTime() {
        throw new RuntimeException("STATE PENDDING: La tarea aún no se inició, no hay tiempo de trabajo");
    }

    @Override
    public void addComment(String comment) {
        task.getComments().add(comment);
    }

}

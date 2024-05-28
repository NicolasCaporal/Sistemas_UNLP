package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class PendingState extends State{

    public PendingState(){
        super();
    }

    @Override
    public void start(ToDoItem task) {
        task.setStart(LocalDateTime.now());
        task.setState(new inProgressState());
    }

    @Override
    public void togglePause(ToDoItem task) {
        throw new RuntimeException("STATE PENDDING: La tarea aún no se inició, no podés pausarla");
    }

    @Override
    public void finish(ToDoItem task) {
        //No hace nada
    }

    @Override
    public Duration workedTime(ToDoItem task) {
        throw new RuntimeException("STATE PENDDING: La tarea aún no se inició, no hay tiempo de trabajo");
    }

    @Override
    public void addComment(ToDoItem task, String comment) {
        task.getComments().add(comment);
    }

}

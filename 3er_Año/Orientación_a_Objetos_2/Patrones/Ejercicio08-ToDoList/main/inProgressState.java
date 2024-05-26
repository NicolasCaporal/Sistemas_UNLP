package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class inProgressState extends State {

    public inProgressState(ToDoItem task){
        super(task);
    }

    @Override
    public void start() {
        // No hace nada
    }

    @Override
    public void togglePause() {
        this.task.setState(new PausedState(task));
    }

    @Override
    public void finish() {
        this.task.setEnd(LocalDateTime.now());
        this.task.setState(new FinishedState(task));
    }

    @Override
    public Duration workedTime() {
        return Duration.between(task.getStart(), LocalDateTime.now());
    }

    @Override
    public void addComment(String comment) {
        task.getComments().add(comment);
    }
}

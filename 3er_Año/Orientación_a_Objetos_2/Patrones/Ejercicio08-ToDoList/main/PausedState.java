package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class PausedState extends State {
    public PausedState(ToDoItem task) {
        super(task);
    }

    @Override
    public void start() {
        // No hace nada
    }

    @Override
    public void togglePause() {
        this.task.setState(new inProgressState(task));
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

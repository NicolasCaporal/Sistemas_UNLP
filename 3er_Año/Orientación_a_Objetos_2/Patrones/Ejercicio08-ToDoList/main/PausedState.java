package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class PausedState extends State {
    public PausedState() {
        super();
    }

    @Override
    public void start(ToDoItem task) {
        // No hace nada
    }

    @Override
    public void togglePause(ToDoItem task) {
        task.setState(new inProgressState());
    }

    @Override
    public void finish(ToDoItem task) {
        task.setEnd(LocalDateTime.now());
        task.setState(new FinishedState());
    }

    @Override
    public Duration workedTime(ToDoItem task) {
        return Duration.between(task.getStart(), LocalDateTime.now());
    }

    @Override
    public void addComment(ToDoItem task, String comment) {
        task.getComments().add(comment);
    }
}

package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class FinishedState extends State {
    public FinishedState() {
        super();
    }

    @Override
    public void start(ToDoItem task) {
        // No hace nada
    }

    @Override
    public void togglePause(ToDoItem task) {
        throw new RuntimeException("STATE FINISHED: La tarea ya finalizó, no podés pausarla");
    }

    @Override
    public void finish(ToDoItem task) {
        // No hace nada
    }

    @Override
    public Duration workedTime(ToDoItem task) {
        return Duration.between(task.getStart(), task.getEnd());
    }

    @Override
    public void addComment(ToDoItem task, String comment) {
        // No hace nada
    }
}

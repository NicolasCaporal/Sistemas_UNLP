package ar.edu.info.unlp.ejercicio08;

import java.time.Duration;
import java.time.LocalDateTime;

public class FinishedState extends State {
    public FinishedState(ToDoItem task) {
        super(task);
    }

    @Override
    public void start() {
        // No hace nada
    }

    @Override
    public void togglePause() {
        throw new RuntimeException("STATE FINISHED: La tarea ya finalizó, no podés pausarla");
    }

    @Override
    public void finish() {
        // No hace nada
    }

    @Override
    public Duration workedTime() {
        return Duration.between(task.getStart(), task.getEnd());
    }

    @Override
    public void addComment(String comment) {
        // No hace nada
    }
}

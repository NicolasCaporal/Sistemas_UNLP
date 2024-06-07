# Ejercicio 2.2


## Código Original
```java
public class Juego {
    // ......
    public void incrementar(Jugador j) {
        j.puntuacion = j.puntuacion + 100;
    }
    public void decrementar(Jugador j) {
        j.puntuacion = j.puntuacion - 50;
    }
}

public class Jugador {
    public String nombre;
    public String apellido;
    public int puntuacion = 0;
}
```

## Bad Smell 1: Inconsistent naming, de incrementar() y decrementar()

### Refactoring: Rename Method

```java
public class Juego {
    // ......
    public void incrementarPuntuación(Jugador j) {
        j.puntuacion = j.puntuacion + 100;
    }
    public void decrementarPuntuación(Jugador j) {
        j.puntuacion = j.puntuacion - 50;
    }
}

public class Jugador {
    public String nombre;
    public String apellido;
    public int puntuacion = 0;
}
```

## Bad Smell 2: Feature Envy de incrementarPuntuación() y decrementarPuntuación() y DataClass en Jugador

### Refactoring: Move Method

```java
public class Juego {
    private List<Jugador> jugadores;
    // ......
    public void incrementarPuntuacion (Jugador jugador){
        jugador.incrementarPuntuación();
    }
    
    public void decrementarPuntuacion (Jugador jugador){
        jugador.incrementarPuntuación();
    }

}

public class Jugador {
    public String nombre;
    public String apellido;
    public int puntuacion = 0;

public void incrementarPuntuación() {
    this.puntuacion = this.puntuacion + 100;
}

public void decrementarPuntuación() {
    this.puntuacion = this.puntuacion - 50;
}

}
```


## Bad Smell 3: Inconsistent naming, de incrementarPuntuacion() y decrementarPuntuacion() en Juego

### Refactoring: Move Method

```java
public class Juego {
    private List<Jugador> jugadores;
    // ......
    public void incrementarPuntuacionJugador (Jugador jugador){
        jugador.incrementarPuntuación();
    }
    
    public void decrementarPuntuacionJugador (Jugador jugador){
        jugador.incrementarPuntuación();
    }

}

public class Jugador {
    public String nombre;
    public String apellido;
    public int puntuacion = 0;

public void incrementarPuntuación() {
    this.puntuacion = this.puntuacion + 100;
}

public void decrementarPuntuación() {
    this.puntuacion = this.puntuacion - 50;
}

}
```

## Bad Smell 4: Falta constructor en ambas clases
### Refactoring: No tiene un nombre

```java
public class Juego {
    private List<Jugador> jugadores;

    public Juego(){
        this.jugadores = new ArrayList<Jugador> jugadores();
    }

    // ......

    public void incrementarPuntuacionJugador (Jugador jugador){
        jugador.incrementarPuntuación();
    }
    
    public void decrementarPuntuacionJugador (Jugador jugador){
        jugador.incrementarPuntuación();
    }

}

public class Jugador {
    public String nombre;
    public String apellido;
    public int puntuacion;

    public Jugador(String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.puntuacion = 0;
    }

public void incrementarPuntuación() {
    this.puntuacion = this.puntuacion + 100;
}

public void decrementarPuntuación() {
    this.puntuacion = this.puntuacion - 50;
}

}
```



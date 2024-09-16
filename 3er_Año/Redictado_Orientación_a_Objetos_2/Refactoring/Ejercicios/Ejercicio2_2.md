# Ejercicio 2
Para cada una de las siguientes situaciones, realice en forma iterativa los siguientes pasos:
(i) indique el mal olor,
(ii) indique el refactoring que lo corrige,
(iii) aplique el refactoring, mostrando el resultado final (código y/o diseño según
corresponda).
Si vuelve a encontrar un mal olor, retorne al paso (i).

## 2.2 Juego
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

---

#### Mal olor: Feature envy 
(¿o innapropiate intimacy? no estoy seguro...)
#### Refactoring: Move Function
> Sometimes, only a part of a function suffers from envy, in which
case use Extract Function on the jealous bit, and Move Function to give it a dream home. 

```java
public class Juego {
// ......
    public void incrementar(Jugador j) {
        j.incrementar();
    }
    public void decrementar(Jugador j) {
        j.decrementar();
    }
}

public class Jugador {
    public String nombre;
    public String apellido;
    public int puntuacion = 0;

    public void incrementar(){
        this.puntuacion += 100;
    }

    public void decrementar(){
        this.puntuacion -= 50;
    }

}
```

---

#### Mal olor: Global data
> Whenever I see a public field, I consider using Encapsulate Variable (in that case often called Encapsulate Field) to reduce its visibility.

#### Refactoring:: Encapsulate field
```java
public class Juego {
// ......
    public void incrementar(Jugador j) {
        j.incrementar();
    }
    public void decrementar(Jugador j) {
        j.decrementar();
    }
}

public class Jugador {
    private String nombre;
    private String apellido;
    private int puntuacion = 0;

    public void incrementar(){
        this.puntuacion += 100;
    }

    public void decrementar(){
        this.puntuacion -= 50;
    }

}
```

---

#### Mal olor: Mysterious name
Lo hago en un paso para todas los métodos, pero habría que hacerlo uno por uno

#### Refactoring: Change Function Declaration
```java
public class Juego {
// ......
    public void incrementarPuntuacionDeJugador(Jugador j) {
        j.incrementarPuntuacion();
    }
    public void decrementarPuntuacionDeJugador(Jugador j) {
        j.decrementarPuntuacion();
    }
}

public class Jugador {
    private String nombre;
    private String apellido;
    private int puntuacion = 0;

    public void incrementarPuntuacion(){
        this.puntuacion += 100;
    }

    public void decrementarPuntuacion(){
        this.puntuacion -= 50;
    }

}
```

---

#### Mal olor: No constructor
#### Refactoring: Extract method
```java
public class Juego {
// ......
    public void incrementarPuntuacionDeJugador(Jugador j) {
        j.incrementarPuntuacion();
    }
    public void decrementarPuntuacionDeJugador(Jugador j) {
        j.decrementarPuntuacion();
    }
}

public class Jugador {
    private String nombre;
    private String apellido;
    private int puntuacion = 0;

    public Jugador(String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.puntuacion = 0;
    }

    public void incrementarPuntuacion(){
        this.puntuacion += 100;
    }

    public void decrementarPuntuacion(){
        this.puntuacion -= 50;
    }

}
```
> ¿El hecho de agregar un constructor no es modificar el comportamiento? IDK, buena pregunta...
> En el TP del año pasado puse bad smell de que no había constructor, y aprobé con promoción, así que supongo que así está bien, que se yoo
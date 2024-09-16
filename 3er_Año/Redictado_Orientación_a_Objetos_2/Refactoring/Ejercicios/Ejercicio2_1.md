# Ejercicio 2
Para cada una de las siguientes situaciones, realice en forma iterativa los siguientes pasos:
(i) indique el mal olor,
(ii) indique el refactoring que lo corrige,
(iii) aplique el refactoring, mostrando el resultado final (código y/o diseño según
corresponda).
Si vuelve a encontrar un mal olor, retorne al paso (i).

## 2.1 Empleados
```java
public class EmpleadoTemporario {
    public String nombre;
    public String apellido;
    public double sueldoBasico = 0;
    public double horasTrabajadas = 0;
    public int cantidadHijos = 0;
    // ......

    public double sueldo() {
        return this.sueldoBasico + (this.horasTrabajadas * 500) +
    (this.cantidadHijos * 1000) - (this.sueldoBasico * 0.13);
        }
}

public class EmpleadoPlanta {
    public String nombre;
    public String apellido;
    public double sueldoBasico = 0;
    public int cantidadHijos = 0;
    // ......

    public double sueldo() {
    return this.sueldoBasico + (this.cantidadHijos * 2000) -
    (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPasante {
    public String nombre;
    public String apellido;
    public double sueldoBasico = 0;
    // ......

    public double sueldo() {
    return this.sueldoBasico - (this.sueldoBasico * 0.13);
}
```
---

#### Mal olor: Global data
> Whenever I see a public field, I consider using Encapsulate Variable (in that case often called Encapsulate Field) to reduce its visibility.

#### Refactoring: Encapsulate field
```java
public class EmpleadoTemporario {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    private double horasTrabajadas = 0;
    private int cantidadHijos = 0;
    // ......

    public double sueldo() {
        return this.sueldoBasico + (this.horasTrabajadas * 500) +
    (this.cantidadHijos * 1000) - (this.sueldoBasico * 0.13);
        }
}

public class EmpleadoPlanta {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    private int cantidadHijos = 0;
    // ......

    public double sueldo() {
    return this.sueldoBasico + (this.cantidadHijos * 2000) -
    (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPasante {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    // ......

    public double sueldo() {
    return this.sueldoBasico - (this.sueldoBasico * 0.13);
}
```

---

#### Mal olor: No constructor
#### Refactoring: Extract method
```java
public class EmpleadoTemporario {
    private String nombre;
    private String apellido;
    private double sueldoBasico;
    private double horasTrabajadas;
    private int cantidadHijos;

    public EmpleadoTemporario(String nombre, String apellido){}
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
        this.horasTrabajadas = 0;
        this.cantidadHijos = 0;
    }
    // ......

    public double sueldo() {
        return this.sueldoBasico + (this.horasTrabajadas * 500) +
    (this.cantidadHijos * 1000) - (this.sueldoBasico * 0.13);
        }
}

public class EmpleadoPlanta {
    private String nombre;
    private String apellido;
    private double sueldoBasico;
    private int cantidadHijos;

    public EmpleadoPlanta(String nombre, String apellido){}
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
        this.cantidadHijos = 0;
    }

    public double sueldo() {
    return this.sueldoBasico + (this.cantidadHijos * 2000) -
    (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPasante {
    private String nombre;
    private String apellido;
    private double sueldoBasico;

    public EmpleadoPasante(String nombre, String apellido){}
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
    }
    // ......

    public double sueldo() {
    return this.sueldoBasico - (this.sueldoBasico * 0.13);
}
```

---

#### Mal olor: Duplicate code
> If I see two classes doing similar things, I can take advantage of the basic mechanism of inheritance to pull their similarities together into a superclass. I can use Pull Up Fie to move common data into the superclass, and Pull Up Method to move the common behavior.

#### Refactoring: Extract superclass
* Crea una superclase vacía. Haz que las clases originales sean sus subclases.
* Si es necesario, usa Change Function Declaration (124) en los constructores.
* Prueba.
* Uno por uno, usa Pull Up Constructor Body (355), Pull Up Method y Pull Up Field para mover los elementos comunes a la superclase.
* Examina los métodos restantes en las subclases. Ve si hay partes comunes. Si es así, usa Extract Function seguido de Pull Up Method.
* Revisa los clientes de las clases originales. Considera ajustarlos para que utilicen la interfaz de la superclase.

```java
public class Empleado{
    private String nombre;
    private String apellido;
    private double sueldoBasico;

    public Empleado(String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
    }

    public double descuento(){
        this.sueldoBasico * 0.13;
    }

    public abstract double bono();

    public double sueldo(){
        return this.sueldoBasico + this.bono() - this.descuento();
    }

}

public class EmpleadoTemporario extends Empleado {
    private double horasTrabajadas;
    private int cantidadHijos;

    public EmpleadoTemporario(String nombre, String apellido){
        super(nombre, apellido);
        this.horasTrabajadas = 0;
        this.cantidadHijos = 0;
    }
    // ......

    public double bono(){
        return this.horasTrabajadas * 500 + this.cantidadHijos * 1000;
    }
    
}

public class EmpleadoPlanta extends Empleado{
    private int cantidadHijos;

    public EmpleadoPlanta(String nombre, String apellido){
        super(nombre, apellido);
        this.cantidadHijos = 0;
    }

    public double bono(){
        return this.cantidadHijos * 2000;
    }

}

public class EmpleadoPasante extends Empleado{
    private String nombre;
    private String apellido;

    public EmpleadoPasante(String nombre, String apellido){
        super(nombre, apellido);
    }
    // ......

    public double bono(){
        return 0;
    }

}
```
> En el libro lo hace paso por paso, yo lo hice en un solo paso :)

---

#### Mal olor: Magic numbers
#### Refactoring: Extract number to constant

```java
public class Empleado{
    private String nombre;
    private String apellido;
    private double sueldoBasico;
    private static final double porcentajeDescuento;

    public Empleado(String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
        this.porcentajeDescuento = 0.13;
    }

    public double descuento(){
        this.sueldoBasico * this.porcentajeDescuento;
    }

    public abstract double bono();

    public double sueldo(){
        return this.sueldoBasico + this.bono() - this.descuento();
    }

}

public class EmpleadoTemporario extends Empleado {
    private double horasTrabajadas;
    private int cantidadHijos;
    private static final double valorHoraTrabajada;
    private static final double extraPorHijo;

    public EmpleadoTemporario(String nombre, String apellido){
        super(nombre, apellido);
        this.horasTrabajadas = 0;
        this.cantidadHijos = 0;
    }
    // ......

    public double bono(){
        return this.horasTrabajadas * this.valorHoraTrabajada + this.cantidadHijos * this.extraPorHijo;
    }
    
}

public class EmpleadoPlanta extends Empleado{
    private int cantidadHijos;
    private static final double extraPorHijo;

    public EmpleadoPlanta(String nombre, String apellido){
        super(nombre, apellido);
        this.cantidadHijos = 0;
    }

    public double bono(){
        return this.cantidadHijos * this.extraPorHijo;
    }

}

public class EmpleadoPasante extends Empleado{
    private String nombre;
    private String apellido;

    public EmpleadoPasante(String nombre, String apellido){
        super(nombre, apellido);
    }
    // ......

    public double bono(){
        return 0;
    }
}
```

##### A tener en cuenta, mucho muy importante: 
> Por ejemplo, la variable "cantidadHijos" se setea en 0 y no se puede modificar nunca (ya que no hay ningún setter implementado), ergo en la cuenta del bono, siempre se suma cero. Ese error lógico original NO HAY QUE ARREGLARLO, si lo arreglamos estamos cambiando el comportamiento, y nos salimos de la definición de Refactoring

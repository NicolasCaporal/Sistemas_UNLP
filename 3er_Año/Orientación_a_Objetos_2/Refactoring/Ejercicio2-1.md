# Ejercicio 2.1

## Código original
```java
public class EmpleadoTemporario {
    public String nombre;
    public String apellido;
    public double sueldoBasico = 0;
    public double horasTrabajadas = 0;
    public int cantidadHijos = 0;
    // ......

    public double sueldo() {
        return this.sueldoBasico
        (this.horasTrabajadas * 500) 
        (this.cantidadHijos * 1000) 
        (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPlanta {
    public String nombre;
    public String apellido;
    public double sueldoBasico = 0;
    public int cantidadHijos = 0;
    // ......
    
    public double sueldo() {
        return this.sueldoBasico 
        + (this.cantidadHijos * 2000)
        - (this.sueldoBasico * 0.13);
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
}
```

## Bad smell 1: V.i publicas

### Refactoring: Encapsulate fields

Consiste en hacer los atributos privados, y hacer métodos de acceso para los mismos.
En este caso no hace falta hacer getters y setters (por ahora) ya que las v.i no se usan desde el resto de las clases. Hacerlo sería romper con el encapsulamiento.

```java
public class EmpleadoTemporario {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    private double horasTrabajadas = 0;
    private int cantidadHijos = 0;
    // ......

    public double sueldo() {
        return this.sueldoBasico
        (this.horasTrabajadas * 500) 
        (this.cantidadHijos * 1000) 
        (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPlanta {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    private int cantidadHijos = 0;
    // ......
    
    public double sueldo() {
        return this.sueldoBasico 
        + (this.cantidadHijos * 2000)
        - (this.sueldoBasico * 0.13);
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
}
```


## Bad smell 2: Inconsistent naming

### Refactoring: Rename Method 

Consiste en renombrar un método para que tengo un nombre correcto

```java
public class EmpleadoTemporario {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    private double horasTrabajadas = 0;
    private int cantidadHijos = 0;
    // ......

    public double calcularSueldo() {
        return this.sueldoBasico
        (this.horasTrabajadas * 500) 
        (this.cantidadHijos * 1000) 
        (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPlanta {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    private int cantidadHijos = 0;
    // ......
    
    public double calcularSueldo() {
        return this.sueldoBasico 
        + (this.cantidadHijos * 2000)
        - (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPasante {
    private String nombre;
    private String apellido;
    private double sueldoBasico = 0;
    
    // ......
    
    public double calcularSueldo() {
        return this.sueldoBasico - (this.sueldoBasico * 0.13);
    }
}
```


## Bad smell 3: Las clases no tienen constructor 

### Refactoring: No hay un nombre especifico

Consiste 

```java
public class EmpleadoTemporario {
    private String nombre;
    private String apellido;
    private double sueldoBasico;
    private double horasTrabajadas;
    private int cantidadHijos;
    
    
    public EmpleadoTemporario (String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
        this.horasTrabajadas = 0;
        this.cantidadHijos = 0;
    }

    public double calcularSueldo() {
        return this.sueldoBasico
        (this.horasTrabajadas * 500) 
        (this.cantidadHijos * 1000) 
        (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPlanta {
    private String nombre;
    private String apellido;
    private double sueldoBasico;
    private int cantidadHijos;
    
    public EmpleadoPlanta (String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico;
        this.cantidadHijos;
    }
    
    public double calcularSueldo() {
        return this.sueldoBasico 
        + (this.cantidadHijos * 2000)
        - (this.sueldoBasico * 0.13);
    }
}

public class EmpleadoPasante {
    private String nombre;
    private String apellido;
    private double sueldoBasico;
    
    public EmpleadoTemporario (String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;
        this.sueldoBasico = 0;
    }
    
    public double calcularSueldo() {
        return this.sueldoBasico - (this.sueldoBasico * 0.13);
    }
}
```


## Bad smell 4: Duplicate Code, las 3 clases tienen V.I. repetidas y métodos de igual nombre pero distinta implementación 

### Refactoring: Extract SuperClass

Consiste en pasar a la superclase todo lo común de las subclases, para no repetir código

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
    
    public double getSueldoBasico(){
        return this.sueldoBasico;
    }

    public abstract double calcularSueldo();
}

public class EmpleadoTemporario extends Empleado {
    private double horasTrabajadas;
    private int cantidadHijos
    
    
    public EmpleadoTemporario (String nombre, String apellido){
        super();
        this.horasTrabajadas = 0;
        this.cantidadHijos = 0;
    }

    public double calcularSueldo() {
        return this.getSueldoBasico()
        (this.horasTrabajadas * 500) 
        (this.cantidadHijos * 1000) 
        (this.getSueldoBasico() * 0.13);
    }
}

public class EmpleadoPlanta extends Empleado {
    private int cantidadHijos;
    
    public EmpleadoPlanta (String nombre, String apellido){
        super();
        this.cantidadHijos = 0;
    }
    
    public double calcularSueldo() {
        return this.getSueldoBasico() 
        + (this.cantidadHijos * 2000)
        - (this.getSueldoBasico() * 0.13);
    }
}

public class EmpleadoPasante extends Empleado {
    
    public EmpleadoTemporario (String nombre, String apellido){
        super();
    }
    
    public double calcularSueldo() {
        return this.getSueldoBasico() - (this.getSueldoBasico() * 0.13);
    }
}
```
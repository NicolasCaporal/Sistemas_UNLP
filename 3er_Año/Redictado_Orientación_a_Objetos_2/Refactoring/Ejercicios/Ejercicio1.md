# 1.1 Protocolo de Cliente
La clase Cliente tiene el siguiente protocolo. ¿Cómo puede mejorarlo?

```java
/**
* Retorna el límite de crédito del cliente
*/
protected double lmtCrdt() {...
/**
* Retorna el monto facturado al cliente desde la fecha f1 a la fecha f2
*/
protected double mtFcE(LocalDate f1, LocalDate f2) {...
/**
* Retorna el monto cobrado al cliente desde la fecha f1 a la fecha f2
*/
protected double mtCbE(LocalDate f1, LocalDate f2) {...
```

## Respuesta
### Bad Smell: Improper Method Names
Los tres métodos del código anterior tienen nombres poco descriptivos.
Hay que aplicar el refactoring Rename Method:

* lmtCrdt -> getLimiteCredito
* mtcFcE -> getMontoFacturadoEntre
* mtCbE -> getMontoCobradoEntre

### Bad Smell: Improper Parameter Names
Los nombres de los parámetros de los últimos dos métodos podrían mejorarse tienen nombres poco descriptivos.
Hay que aplicar el refactoring Rename Parameter:

* f1 -> fechaDesde
* f2 -> fechaHasta


###### Aclaraciones:
* Sin conocer el contexto o dominio del programa, no se puede afirmar ni negar que la visibilidad de un método (public, private o protected) sea o no sea un bad smell

---

# 1.2 Participación en proyectos
Al revisar el siguiente diseño inicial (Figura 1), se decidió realizar un cambio para evitar lo
que se consideraba un mal olor. El diseño modificado se muestra en la Figura 2. Indique
qué tipo de cambio se realizó y si lo considera apropiado. 
Justifique su respuesta.

## Respuesta
El cambio realizado es correcto.
La responsabilidad de verificar si una persona participa de un proyecto es de la clase Proyecto.
Este bad smell es Feature Envy, donde la clase Persona estaba usando los datos de la otra clase para resolver la consulta (hace un getParticipantes(), necesitaba el atributo de la otra clase, lo que es incorrecto y denota una responsabilidad mal asignada)

---

# 1.3 Cálculos
Analice el código que se muestra a continuación. 
Indique qué defectos encuentra y cómo pueden corregirse.

```java
public void imprimirValores() {
    int totalEdades = 0;
    double promedioEdades = 0;
    double totalSalarios = 0;
    for (Empleado empleado : personal) {
        totalEdades = totalEdades + empleado.getEdad();
        totalSalarios = totalSalarios + empleado.getSalario();
    }
    promedioEdades = totalEdades / personal.size();
    String message = String.format("El promedio de las edades es %s y el
    total de salarios es %s", promedioEdades, totalSalarios);
    System.out.println(message);
}
```

## Respuesta

### Bad Smell: Long Method
El método imprimirValores() realiza muchas lineas de código que se pueden agrupar con un nombre común para mejorar la legibilidad y reulización de código.
Aplicando Extract Method quedaría:
```java

private double calcularEdadTotal(List<Empleado> personal){
    int totalEdades = 0;
    for (Empleado empleado : personal) {
        totalEdades = totalEdades + empleado.getEdad();
    }
    return totalEdades;
}

private double calcularTotalSalario(List<Empleado> personal){
    double totalSalarios = 0;
    for (Empleado empleado : personal) {
        totalSalarios = totalSalarios + empleado.getSalario();
    }
    return totalSalarios;
}

private double calcularPromedioEdad(List<Empleado> personal){
    return this.calcularEdadTotal() / personal.size();
}

public void imprimirValores() {    
    String message = String.format("El promedio de las edades es %s y el
    total de salarios es %s", this.calcularPromedioEdad(), this.calcularTotalSalario);
    System.out.println(message);
}
```

###### Aclaraciones:
* El uso del for no es necesariamente un bad smell, en este caso es correcto. Puede estar mal si, por ejemplo, pára saber el tamaño de una lista se usa un for y un contador, en vez de usar lista.size();
* El programa tiene un error: no chequea una posible división por 0 al calcular el promedio con personal.size(). **Es muy importante no corregir ese error de lógica**, si lo arreglamos, estamos cambiando el comportamiento del programa, por tanto ya no cuenta como refactoring.

---
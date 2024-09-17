# Ejercicio 2
Para cada una de las siguientes situaciones, realice en forma iterativa los siguientes pasos:
(i) indique el mal olor,
(ii) indique el refactoring que lo corrige,
(iii) aplique el refactoring, mostrando el resultado final (código y/o diseño según
corresponda).
Si vuelve a encontrar un mal olor, retorne al paso (i).

## 2.4  Carrito de compras
```java
public class Producto {
    private String nombre;
    private double precio;

    public double getPrecio() {
        return this.precio;
    }
}

public class ItemCarrito {
    private Producto producto;
    private int cantidad;

    public Producto getProducto() {
        return this.producto;
    }

    public int getCantidad() {
        return this.cantidad;
    }
}


public class Carrito {
    private List<ItemCarrito> items;
    public double total() {
        return this.items.stream().mapToDouble(item ->
        item.getProducto().getPrecio() * item.getCantidad()).sum();
    }
}
```


#### Mal olor: Feature envy 
#### Refactoring: Move Function
> Sometimes, only a part of a function suffers from envy, in which
case use Extract Function on the jealous bit, and Move Function to give it a dream home. 

```java
public class Producto {
    private String nombre;
    private double precio;

    public double getPrecio() {
        return this.precio;
    }
}

public class ItemCarrito {
    private Producto producto;
    private int cantidad;

    public Producto getProducto() {
        return this.producto;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public double getPrecio(){
        return this.producto.getPrecio() * this.cantidad;
    }

}


public class Carrito {
    private List<ItemCarrito> items;
    public double total() {
        return this.items.stream().mapToDouble(item ->
        item.getPrecio()).sum();
    }
}
```
#### Mal olor: Speculative Generality 
#### Refactoring: Remove death code
```java
public class Producto {
    private String nombre;
    private double precio;

    public double getPrecio() {
        return this.precio;
    }
}

public class ItemCarrito {
    private Producto producto;
    private int cantidad;

    public double getPrecio(){
        return this.producto.getPrecio() * this.cantidad;
    }
}


public class Carrito {
    private List<ItemCarrito> items;
    public double total() {
        return this.items.stream().mapToDouble(item ->
        item.getPrecio()).sum();
    }
}
```
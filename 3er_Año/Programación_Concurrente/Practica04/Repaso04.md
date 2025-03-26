## Repaso

**En una oficina existen 100 empleados que envían documentos para imprimir en 5 impresoras compartidas.** 
**Los pedidos de impresión son procesados por orden de llegada y se asignan a la primera impresora que** 
**se encuentre libre:**
**a) Implemente un programa que permita resolver el problema anterior usando PMA.**

```java
chan colaImpresion (Documento);
chan impresiones (Documento);

process administrativo[id: 1 .. 100]{
    while (true){
        int tiempoDeTrabajo = randomTime();
        trabajar(tiempoDeTrabajo);
        Documento documento = new Documento(data);
        send colaImpresion (documento);
    }
}

process impresora[id: 1 .. 5]{
    Documento documento;
    while (true){
        receive colaImpresion(documento);
        imprimir(documento);
        send impresiones (documento);
    }
}
```

**b) Resuelva el mismo problema anterior pero ahora usando PMS**
```java
process empleado [id: 1 .. R]{
    while(true){
        int tiempoDeTrabajo = randomTime();
        trabajar(tiempoDeTrabajo);
        Documento documento = new Documento(data);
        buffer! colaImpresion (documento);
    }
}

process impresora [id: 1 .. 5]{
    while(true){
        buffer!pedido (id);
        buffer? (virus);    
        hacerPruebas(virus);
    }
}

process buffer[1]{
    Cola impresiones;
    int idImpresora;
    while(true){
        Direccion url;
        do  empleado[*]?colaImpresion (documento); -> impresiones.push(documento);
            ◻ impresiones.lenght() > 0 : impresora?pedido[*](idImpresora) -> impresora![idImpresora](impresiones.pop());
        od
    }
    
}
```
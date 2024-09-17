# Ejercicio 6: Antlr lab
Con cada uno de los siguientes ejemplos,
1. Considere que en el lenguaje dado por la cátedra el llamado a una función o método retorna el valor generado por la evaluacion de la última sentencia (stat, en la gramática)
2. Determine si hay un code smell y cual es.
3. Evalue el código en antlr lab usando las especificaciones del lexer y el parser
4. Estudie el árbol generado por antlr lab
5. Escriba un pseudocódigo que permita detectar el code smell en el árbol

## 6.3
```
f(x,y) {
    a = 4;
    x + a;
}
```

## Code Smells
* Innecesary parameter en 'y'

## Arbol
![alt text](image.png)

## Pseudocódigo:
### Innecesary parameter en 'y'
```
nodoActual = raiz;
while (not terminoArbol(nodoActual)){
    recorroArbol(nodoActual);
    if (nodoActual.contains('def')){
        listaFunciones.add(nodoActual);
    }
}

for (funcion : listaFunciones){

    listaParametros = funcion.getParametros();

    for (parametro : listaParametros){
        badSmell = true;
        while (badSmell == true){
            recorroArbol(nodoActual);
            if (nodoActual.contains(parametro)){
                badSmell = false;
            }
        }

        if badSmell ? informarBadSmell(parametro) : skip; 
    }   
}
```
# Ejercicio 2
Para cada una de las siguientes situaciones, realice en forma iterativa los siguientes pasos:
(i) indique el mal olor,
(ii) indique el refactoring que lo corrige,
(iii) aplique el refactoring, mostrando el resultado final (código y/o diseño según
corresponda).
Si vuelve a encontrar un mal olor, retorne al paso (i).

## 2.3 Publicaciones
```java
/**
* Retorna los últimos N posts que no pertenecen al usuario user
*/
public List<Post> ultimosPosts(Usuario user, int cantidad) {

    List<Post> postsOtrosUsuarios = new ArrayList<Post>();

    for (Post post : this.posts) {
        if (!post.getUsuario().equals(user)) {
            postsOtrosUsuarios.add(post);
        }
    }
    
    // ordena los posts por fecha
    for (int i = 0; i < postsOtrosUsuarios.size(); i++) {
        int masNuevo = i;
        for(int j= i +1; j < postsOtrosUsuarios.size(); j++) {
            if (postsOtrosUsuarios.get(j).getFecha().isAfter(
                postsOtrosUsuarios.get(masNuevo).getFecha())) {
                    masNuevo = j;
            }
        }
        Post unPost = postsOtrosUsuarios.set(i,postsOtrosUsuarios.get(masNuevo));
        postsOtrosUsuarios.set(masNuevo, unPost);
    }


    List<Post> ultimosPosts = new ArrayList<Post>();
    int index = 0;
    Iterator<Post> postIterator = postsOtrosUsuarios.iterator();

    while (postIterator.hasNext() && index < cantidad) {
        ultimosPosts.add(postIterator.next());
    }

    return ultimosPosts;
}
```

#### Mal olor: Large method
#### Refactoring: Extract method
Habría que hacerlo uno por uno (una vez para cada método), yo lo hago en un paso
```java

private List<Post> crearListaOtrosUsuarios(Usuario user){
    List<Post> postsOtrosUsuarios = new ArrayList<Post>();
    for (Post post : this.posts) {
        if (!post.getUsuario().equals(user)) {
            postsOtrosUsuarios.add(post);
        }
    }
    return postsOtrosUsuarios;
}

private void ordenarPostsPorFecha(List<Posts> posts){
    for (int i = 0; i < postsOtrosUsuarios.size(); i++) {
        int masNuevo = i;
        for(int j= i +1; j < postsOtrosUsuarios.size(); j++) {
            if (postsOtrosUsuarios.get(j).getFecha().isAfter(
                postsOtrosUsuarios.get(masNuevo).getFecha())) {
                    masNuevo = j;
            }
        }
        Post unPost = postsOtrosUsuarios.set(i,postsOtrosUsuarios.get(masNuevo));
        postsOtrosUsuarios.set(masNuevo, unPost);
    }
}

private List<Post> obtenerUltimosPosts(List<Post> postsOtrosUsuarios, int cantidad) {
    List<Post> ultimosPosts = new ArrayList<Post>();
    int index = 0;
    Iterator<Post> postIterator = postsOtrosUsuarios.iterator();

    while (postIterator.hasNext() && index < cantidad) {
        ultimosPosts.add(postIterator.next());
    }

    return ultimosPosts;
}

public List<Post> ultimosPosts(Usuario user, int cantidad) {

    List<Post> postsOtrosUsuarios = crearListaOtrosUsuarios(user);
    
    ordenarPostsPorFecha(postsOtrosUsuarios);

    List<Post> ultimosPosts = obtenerUltimosPosts(postsOtrosUsuarios, cantidad);

    return ultimosPosts;
}
```

#### Mal olor: Reinventar la rueda
#### Refactoring: Substitute Algorithm
// Este paso lo hizo chatGPT, yo no tenía ganas de pensar en Streams, pero confiemos (?
```java
private List<Post> crearListaOtrosUsuarios(Usuario user) {
    return this.posts.stream()
            .filter(post -> !post.getUsuario().equals(user))
            .collect(Collectors.toList());
}

private void ordenarPostsPorFecha(List<Post> posts) {
    posts.sort(Comparator.comparing(Post::getFecha).reversed());
}

private List<Post> obtenerUltimosPosts(List<Post> postsOtrosUsuarios, int cantidad) {
    return postsOtrosUsuarios.stream()
            .limit(cantidad)
            .collect(Collectors.toList());
}

public List<Post> ultimosPosts(Usuario user, int cantidad) {
    List<Post> postsOtrosUsuarios = crearListaOtrosUsuarios(user);
    ordenarPostsPorFecha(postsOtrosUsuarios);
    return obtenerUltimosPosts(postsOtrosUsuarios, cantidad);
}
```
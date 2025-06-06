package io.github.unlp;

public class Mensajero {
    private String nombre;
    private Cifrador cifrador;

    public Mensajero(String nombre, Cifrador cifrador) {
        this.cifrador = cifrador;
        this.nombre = nombre;
    }

    public void setCifrador(Cifrador cifrador) {
        this.cifrador = cifrador;
    }

    public void enviar(String msj) {
        String cifrado = cifrador.cifrar(msj);
        System.out.println(nombre + " envía: " + cifrado);
        recibir(cifrado);
    }

    public void recibir(String msj) {
        String original = cifrador.decifrar(msj);
        System.out.println(nombre + " recibe: " + original);
    }
}

package io.github.unlp;

public class RC4Adapter implements Cifrador {
    private String clave;
    private RC4 rc4;

    public RC4Adapter(String key) {
        this.clave = key;
        this.rc4 = new RC4();
    }

    @Override
    public String cifrar(String msj) {
        return rc4.encriptar(msj, clave);
    }

    @Override
    public String decifrar(String msj) {
        return rc4.desencriptar(msj, clave);
    }
}

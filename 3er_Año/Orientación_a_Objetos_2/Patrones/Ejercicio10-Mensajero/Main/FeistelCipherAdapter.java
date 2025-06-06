package io.github.unlp;

public class FeistelCipherAdapter implements Cifrador {
    private FeistelCipher feistel;

    public FeistelCipherAdapter(String key) {
        this.feistel = new FeistelCipher(key);
    }

    @Override
    public String cifrar(String msj) {
        return feistel.encode(msj);
    }

    @Override
    public String decifrar(String msj) {
        return feistel.encode(msj);
    }
}

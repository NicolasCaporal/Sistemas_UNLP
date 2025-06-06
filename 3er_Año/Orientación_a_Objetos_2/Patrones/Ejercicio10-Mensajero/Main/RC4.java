/**
 * 
 */
package io.github.unlp;

import java.util.Base64;

/**
 * @author gperez
 *
 */
public class RC4 {
    private byte[] S;
    private int i, j;

    private void keySetup(byte[] key) {
        S = new byte[256];
        for (i = 0; i < 256; i++) S[i] = (byte) i;
        for (j = i = 0; i < 256; i++) {
            j = (j + S[i] + key[i % key.length]) & 0xFF;
            byte temp = S[i]; S[i] = S[j]; S[j] = temp;
        }
        i = j = 0;
    }

    private byte[] process(byte[] data, byte[] key) {
        keySetup(key);
        byte[] result = new byte[data.length];
        for (int n = 0; n < data.length; n++) {
            i = (i + 1) & 0xFF;
            j = (j + S[i]) & 0xFF;
            byte temp = S[i]; S[i] = S[j]; S[j] = temp;
            result[n] = (byte) (data[n] ^ S[(S[i] + S[j]) & 0xFF]);
        }
        return result;
    }


    public String encriptar(String mensaje, String clave) {
        byte[] encrypted = process(mensaje.getBytes(), clave.getBytes());
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public String desencriptar(String mensajeCifrado, String clave) {
        byte[] decoded = Base64.getDecoder().decode(mensajeCifrado);
        return new String(process(decoded, clave.getBytes()));
    }

}
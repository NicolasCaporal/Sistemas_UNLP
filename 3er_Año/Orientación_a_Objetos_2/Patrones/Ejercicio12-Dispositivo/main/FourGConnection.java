package ar.edu.info.unlp.ejercicioDemo;

public class FourGConnection {
    private String symb;

    public FourGConnection() {
        this.symb = "Symb 4G";
    }

    public String transmit(String data, Integer crc) {
        return "4G Connection: " + data + " " + crc;
    }

    public String symb() {
        return this.symb;
    }
}
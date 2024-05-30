package ar.edu.info.unlp.ejercicioDemo;

public class WifiConnection implements Connection {
    private String pict;

    public WifiConnection() {
        this.pict = "Symb Wifi";
    }

    @Override
    public String sendData(String data, Integer crc) {
        return "Wifi Connection: " + data + " " + crc;
    }

    @Override
    public String pict() {
        return this.pict;
    }
}
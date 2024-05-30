package ar.edu.info.unlp.ejercicioDemo;

public interface Connection {

    public abstract String sendData(String data, Integer crc);

    public abstract String pict();

}

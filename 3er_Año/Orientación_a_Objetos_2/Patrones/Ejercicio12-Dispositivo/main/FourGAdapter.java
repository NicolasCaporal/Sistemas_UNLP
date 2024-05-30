package ar.edu.info.unlp.ejercicioDemo;

public class FourGAdapter implements Connection {
    private final FourGConnection fourGConn;

    public FourGAdapter() {
        this.fourGConn = new FourGConnection();
    }

    @Override
    public String sendData(String data, Integer crc) {
        return this.fourGConn.transmit(data, crc);
    }

    @Override
    public String pict() {
        return this.fourGConn.symb();
    }
}
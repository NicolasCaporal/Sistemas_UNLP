package ar.edu.info.unlp.ejercicioDemo;

public class Dispositivo {
    private CRC crcCalculator;
    private Ringer ringer;
    private Display display;
    private Connection connection;

    public Dispositivo() {
        this.crcCalculator = new CRC16_Calculator();
        this.ringer = new Ringer();
        this.display = new Display();
        this.connection = new WifiConnection();
    }

    public String send(String data){
        return this.connection.sendData(data, this.crcCalculator.crcFor(data));
    }

    public String conectarCon(Connection connection){
        this.connection = connection;
        return "Connection changed";
    }

    public String configurarCRC(CRC crcCalculator) {
        this.crcCalculator = crcCalculator;
        return "Crc calculator changed";
    }
}

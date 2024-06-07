package ar.edu.info.unlp.ejercicio16;

public class PresionAtmosferica extends WeatherDecorator{

    public PresionAtmosferica(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Presion: " + this.getPresion();
    }
}

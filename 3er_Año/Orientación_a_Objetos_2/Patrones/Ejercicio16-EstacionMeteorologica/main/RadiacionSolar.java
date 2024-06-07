package ar.edu.info.unlp.ejercicio16;

public class RadiacionSolar extends WeatherDecorator{

    public RadiacionSolar(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Radiacion: " + this.getRadiacionSolar();
    }
}

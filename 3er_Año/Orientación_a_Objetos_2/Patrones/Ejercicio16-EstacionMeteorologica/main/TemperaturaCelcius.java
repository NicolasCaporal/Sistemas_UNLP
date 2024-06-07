package ar.edu.info.unlp.ejercicio16;

public class TemperaturaCelcius extends WeatherDecorator{

    public TemperaturaCelcius(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        String celcius = Double.toString((this.getTemperatura() - 32) / 1.8);
        return super.displayData() + "Temperatura C°: " + celcius;
    }
}

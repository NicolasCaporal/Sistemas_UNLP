package ar.edu.info.unlp.ejercicio16;

public class TemperaturaFahrenheit extends WeatherDecorator{

    public TemperaturaFahrenheit(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Temperatura F°: " + this.getTemperatura();
    }
}

package ar.edu.info.unlp.ejercicio16;

public class PromedioTemperaturaFahrenheit extends WeatherDecorator{

    public PromedioTemperaturaFahrenheit(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Promedio F°: " + this.getTemperaturas().stream().mapToDouble(Double::doubleValue).average();
    }
}

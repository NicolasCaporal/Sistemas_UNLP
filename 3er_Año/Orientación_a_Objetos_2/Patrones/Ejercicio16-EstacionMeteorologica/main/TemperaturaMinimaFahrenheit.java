package ar.edu.info.unlp.ejercicio16;

public class TemperaturaMinimaFahrenheit extends WeatherDecorator{

    public TemperaturaMinimaFahrenheit(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Minima F°: " + this.getTemperaturas().stream().max((t2, t1) -> Double.compare(t1, t2)).orElseThrow();
    }
}

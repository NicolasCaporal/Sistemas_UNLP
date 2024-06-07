package ar.edu.info.unlp.ejercicio16;

public class TemperaturaMaximaFahrenheit extends WeatherDecorator{

    public TemperaturaMaximaFahrenheit(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Maxima F°: " + this.getTemperaturas().stream().max((t1, t2) -> Double.compare(t1, t2)).orElseThrow();
    }
}

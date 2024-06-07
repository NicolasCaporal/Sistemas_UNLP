package ar.edu.info.unlp.ejercicio16;

public class TemperaturaMaximaCelcius extends WeatherDecorator{

    public TemperaturaMaximaCelcius(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        double celcius = ( this.getTemperaturas().stream().max((t1, t2) -> Double.compare(t1, t2)).orElseThrow() - 32)/1.8 ;
        return super.displayData() + "Maxima C°: " + celcius;
    }
}

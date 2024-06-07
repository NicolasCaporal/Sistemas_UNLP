package ar.edu.info.unlp.ejercicio16;

public class TemperaturaMinimaCelcius extends WeatherDecorator{

    public TemperaturaMinimaCelcius(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        double celcius = ( this.getTemperaturas().stream().max((t2, t1) -> Double.compare(t1, t2)).orElseThrow() - 32)/1.8 ;
        return super.displayData() + "Minima C°: " + celcius;
    }
}

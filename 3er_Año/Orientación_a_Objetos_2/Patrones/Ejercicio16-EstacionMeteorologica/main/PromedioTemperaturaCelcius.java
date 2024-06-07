package ar.edu.info.unlp.ejercicio16;

public class PromedioTemperaturaCelcius extends WeatherDecorator{

    public PromedioTemperaturaCelcius(WeatherData component){
        super(component);
    }

    @Override
    public String displayData() {
        return super.displayData() + "Promedio C°: " + this.getTemperaturas().stream().mapToDouble(valor -> ((valor - 32)/1.8)).average().orElseThrow();
    }
}

package ar.edu.info.unlp.ejercicio16;

import java.util.List;

public class HomeWeatherAdapter implements WeatherData{

    private HomeWeatherStation adaptee;

    public HomeWeatherAdapter(HomeWeatherStation station) {
        this.adaptee = station;
    }

    //retorna la temperatura en grados Fahrenheit.
    public double getTemperatura(){
        return this.adaptee.getTemperatura();
    }

    //retorna la presión atmosférica en hPa
    public double getPresion(){
        return this.adaptee.getPresion();
    }

    //retorna la radiación solar
    public double getRadiacionSolar(){
        return this.adaptee.getRadiacionSolar();
    }

    //retorna una lista con todas las temperaturas sensadas hasta el momento, en grados Fahrenheit
    public List<Double> getTemperaturas(){
        return this.adaptee.getTemperaturas();
    }

    //retorna  un reporte de todos los datos: temperatura, presión, y radiación solar.
    public String displayData(){
        return "";
    }


}

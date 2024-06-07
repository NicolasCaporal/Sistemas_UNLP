package ar.edu.info.unlp.ejercicio16;

import java.util.List;

public interface WeatherData {
    public abstract  double getTemperatura();

    public abstract double getPresion();

    public abstract double getRadiacionSolar();

    public abstract List<Double> getTemperaturas();

    public abstract String displayData();
}

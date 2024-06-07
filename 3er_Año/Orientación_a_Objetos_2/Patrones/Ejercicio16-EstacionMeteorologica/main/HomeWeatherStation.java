package ar.edu.info.unlp.ejercicio16;

import java.util.List;

public class HomeWeatherStation implements WeatherData {
	private double temperatura;
	private double presion;
	private double radacioSolar;
	private List<Double> temperaturas;

	public HomeWeatherStation(double temperatura, double presion, double radacioSolar, List<Double> temperaturas) {
		this.temperatura = temperatura;
		this.presion = presion;
		this.radacioSolar = radacioSolar;
		this.temperaturas = temperaturas;
	}

	//retorna la temperatura en grados Fahrenheit.
	public double getTemperatura(){
		return this.temperatura;
	}

	//retorna la presión atmosférica en hPa
	public double getPresion(){
		return this.presion;
	}

	//retorna la radiación solar
	public double getRadiacionSolar(){
		return this.radacioSolar;
	}

	//retorna una lista con todas las temperaturas sensadas hasta el momento, en grados Fahrenheit
	public List<Double> getTemperaturas(){
		return this.temperaturas;
	}

	//retorna  un reporte de todos los datos: temperatura, presión, y radiación solar.
	public String displayData(){
		return "Temperatura F: " + this.getTemperatura() +
				"Presión atmosf: " + this.getPresion() +
				"Radiación solar: " + this.getRadiacionSolar();
	}


}

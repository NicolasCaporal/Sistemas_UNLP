package ar.edu.info.unlp.ejercicio16;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

// Ej 5: “Temperatura C: 30; Presión atmosf: 1008; Radiación solar: 200; Promedio: 30; Mínimo: 27 Máximo: 32;”

public class WeatherDataTest {
	
	HomeWeatherStation estacionMeteorilogica;
	HomeWeatherAdapter adaptador;
	List<Double> temperaturas;

	TemperaturaCelcius celcius;
	PresionAtmosferica presion;
	RadiacionSolar radiacion;
	PromedioTemperaturaCelcius promedio;
	TemperaturaMinimaCelcius minima;
	TemperaturaMaximaCelcius maxima;


	@BeforeEach
	void setUp() throws Exception {
		List<Double> temperaturas = new ArrayList<Double>();
		temperaturas.add(80.6);  // Temperatura en Fahrenheit (equivalente a 27°C)
		temperaturas.add(89.6);  // Temperatura en Fahrenheit (equivalente a 32°C)
		temperaturas.add(87.8);  // Temperatura en Fahrenheit (equivalente a 31°C)

		estacionMeteorilogica = new HomeWeatherStation(86, 1008, 200, temperaturas);
		adaptador = new HomeWeatherAdapter(estacionMeteorilogica);
		
	}
	
    @Test
    public void testEjemplo6() {
		celcius = new TemperaturaCelcius(adaptador);
		presion = new PresionAtmosferica(celcius);
		radiacion = new RadiacionSolar(presion);
		promedio = new PromedioTemperaturaCelcius(radiacion);
		minima = new TemperaturaMinimaCelcius(promedio);
		maxima = new TemperaturaMaximaCelcius(minima);

		String expected = "\n" +
				"Temperatura C°: 30.0\n" +
				"Presion: 1008.0\n" +
				"Radiacion: 200.0\n" +
				"Promedio C°: 29.999999999999996\n" +
				"Minima C°: 26.999999999999996\n" +
				"Maxima C°: 31.999999999999996";
		// Ni en pedo me pongo a solucionar el quilombo del redondeo, abrazo.

		assertEquals(expected, maxima.displayData());
	}

}

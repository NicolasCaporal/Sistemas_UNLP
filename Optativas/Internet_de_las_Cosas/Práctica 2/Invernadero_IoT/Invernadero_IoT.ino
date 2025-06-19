#include <WiFi.h>
#include <PubSubClient.h>

#define LED_VENTANA 2  // LED integrado

// — tus datos WiFi —
const char* ssid = "*WiFi2.4GHz";
const char* password = "01234";

// — broker MQTT —
const char* mqttServer = "192.";
const int mqttPort = 1883;
const char* mqttTopic = "invernadero/temperatura";

// Intervalos de tiempo
const int intervaloTemperatura = 15000;    // Cada 15 segundos
const int duracionLED = 10000;             // LED encendido por 10 segundos
const unsigned long intervaloEstado = 180000; // Cada 3 minutos

WiFiClient espClient;
PubSubClient client(espClient);

// Variables de estado
bool ventanaAbierta = false;
bool ledEncendido = false;
bool modoAutomatico = true;

float temperatura;
unsigned long tiempoUltimaTemperatura = 0;
unsigned long tiempoInicioLED = 0;
unsigned long tiempoUltimoInformeEstado = 0;

// Control de parpadeo
unsigned long tiempoParpadeo = 0;
bool estadoLED = false;
int parpadeosRestantes = 0;

// ================== FUNCIONES ================== //

void conectarMQTT() {
  client.setServer(mqttServer, mqttPort);
  while (!client.connected()) {
    if (client.connect("ESP32-Invernadero")) {
      Serial.println("MQTT conectado");
    } else {
      Serial.print("Error MQTT, rc=");
      Serial.print(client.state());
      Serial.println(" - Reintentando en 2s...");
      delay(2000);
    }
  }
}

void conectarWiFi() {
  WiFi.begin(ssid, password);
  Serial.print("Conectando a WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("¡WiFi conectado! IP: ");
  Serial.println(WiFi.localIP());
}

void iniciarParpadeo(int veces) {
  parpadeosRestantes = veces * 2; // Parpadeos completos (ON-OFF)
  tiempoParpadeo = millis();
}

void abrirVentana() {
  digitalWrite(LED_VENTANA, HIGH);
  ventanaAbierta = true;
  ledEncendido = true;
  tiempoInicioLED = millis();
  Serial.println("Ventana ABIERTA");
}

void cerrarVentana() {
  digitalWrite(LED_VENTANA, HIGH);
  ledEncendido = true;
  ventanaAbierta = false;
  tiempoInicioLED = millis();
  Serial.println("Ventana CERRADA");
}

void censadoTemperatura() {
  if (temperatura > 30.00 && !ventanaAbierta) {
    Serial.println("Temperatura alta: ABRIENDO ventana");
    abrirVentana();
  } else if (temperatura < 20.00 && ventanaAbierta) {
    Serial.println("Temperatura baja: CERRANDO ventana");
    cerrarVentana();
  }
}

void informarStatus() {
  tiempoUltimoInformeEstado = millis();
  String estado = ventanaAbierta ? "Abierta" : "Cerrada";
  
  Serial.println("\n===== ESTADO ACTUAL =====");
  Serial.print("Ventana: ");
  Serial.println(estado);
  Serial.print("Temperatura: ");
  Serial.print(temperatura, 2);
  Serial.println(" °C");
  Serial.println("=========================\n");
}

void publicarTemperatura() {
  char payload[16];
  dtostrf(temperatura, 4, 2, payload);
  
  if (client.publish(mqttTopic, payload)) {
    Serial.print("[MQTT] Publicado: ");
    Serial.println(payload);
  } else {
    Serial.println("[MQTT] Error en publicación!");
  }
}

// ================== SETUP & LOOP ================== //

void setup() {
  pinMode(LED_VENTANA, OUTPUT);
  digitalWrite(LED_VENTANA, LOW);
  
  Serial.begin(115200);
  delay(1000);
  Serial.println("INICIANDO SISTEMA INVERNADERO");
  
  conectarWiFi();
  conectarMQTT();
  
  iniciarParpadeo(3);  // Señal de inicio
  randomSeed(analogRead(0));
  
  Serial.println("Sistema listo ✅");
}

void loop() {
  unsigned long tiempoActual = millis();

  // Manejo de parpadeo LED
  if (parpadeosRestantes > 0) {
    if (tiempoActual - tiempoParpadeo >= 150) {
      estadoLED = !estadoLED;
      digitalWrite(LED_VENTANA, estadoLED);
      tiempoParpadeo = tiempoActual;
      if (!estadoLED) parpadeosRestantes--;
    }
  }

  // Reconexión MQTT si es necesario
  if (!client.connected()) {
    conectarMQTT();
  }
  client.loop();

  // Generar y publicar temperatura
  if (tiempoActual - tiempoUltimaTemperatura >= intervaloTemperatura) {
    tiempoUltimaTemperatura = tiempoActual;
    
    // Simular temperatura (15.00°C a 35.00°C)
    temperatura = random(1500, 3501) / 100.0;
    
    Serial.print("Temperatura: ");
    Serial.print(temperatura, 2);
    Serial.println(" °C");
    
    publicarTemperatura();
    
    if (modoAutomatico) {
      censadoTemperatura();
    }
  }

  // Informe periódico de estado
  if (tiempoActual - tiempoUltimoInformeEstado >= intervaloEstado) {
    informarStatus();
  }

  // Apagar LED después de tiempo de operación
  if (ledEncendido && (tiempoActual - tiempoInicioLED >= duracionLED)) {
    ledEncendido = false;
    digitalWrite(LED_VENTANA, LOW);
    Serial.println("LED apagado (fin operación ventana)");
  }
}
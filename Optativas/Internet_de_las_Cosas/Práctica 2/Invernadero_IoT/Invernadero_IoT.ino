#include <WiFi.h>
#include <PubSubClient.h>

#define LED_VENTANA 2  // LED integrado

// datos WiFi 
const char* ssid = "WiFi 2.4GHz";
const char* password = "01234";

// — broker MQTT —
const char* mqttServer = "192...";
const int mqttPort = 1883;
const char* mqttTopicTemp = "invernadero/temperatura";
const char* mqttTopicControl = "invernadero/ventana/control";  // topic para recibir comandos
const char* mqttTopicEstado = "invernadero/ventana/estado";    // topic para publicar estado

// Intervalos de tiempo
const int intervaloTemperatura = 15000;    // Cada 15 segundos
const int duracionLED = 10000;             // LED encendido por 10 segundos
const unsigned long intervaloEstado = 180000; // Cada 3 minutos

WiFiClient espClient;
PubSubClient client(espClient);

// Variables de estado
bool ventanaAbierta = false;
bool ledEncendido = false;

float temperatura;
unsigned long tiempoUltimaTemperatura = 0;
unsigned long tiempoInicioLED = 0;
unsigned long tiempoUltimoInformeEstado = 0;

// Control de parpadeo
unsigned long tiempoParpadeo = 0;
bool estadoLED = false;
int parpadeosRestantes = 0;

// ================== FUNCIONES ================== //

void callbackMQTT(char* topic, byte* payload, unsigned int length) {
  // Convertir payload a String
  String mensaje;
  for (int i = 0; i < length; i++) {
    mensaje += (char)payload[i];
  }
  
  Serial.print("Mensaje recibido [");
  Serial.print(topic);
  Serial.print("]: ");
  Serial.println(mensaje);

  if (String(topic) == String(mqttTopicControl)) {
    // Parseo manual del JSON
    int payloadIndex = mensaje.indexOf("\"payload\":\"");
    if (payloadIndex >= 0) {
      int start = payloadIndex + 11; // Posición después de "payload":"
      int end = mensaje.indexOf("\"", start);
      
      if (end > start) {
        String comando = mensaje.substring(start, end);
        Serial.print("Comando extraído: ");
        Serial.println(comando);
        
        if (comando == "abrir") {
          abrirVentana();
        } 
        else if (comando == "cerrar") {
          cerrarVentana();
        }
        return;
      }
    }
    Serial.println("Error: Formato JSON inválido");
  }
}

void conectarMQTT() {
  client.setServer(mqttServer, mqttPort);
  client.setCallback(callbackMQTT);
  
  while (!client.connected()) {
    if (client.connect("ESP32-Invernadero")) {
      Serial.println("MQTT conectado 🌐");
      client.subscribe(mqttTopicControl); 
      Serial.print("Suscripción a: ");
      Serial.println(mqttTopicControl);
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
  Serial.print("¡WiFi conectado! 🛜");
}

void iniciarParpadeo(int veces) {
  parpadeosRestantes = veces * 2;
  tiempoParpadeo = millis();
}

void abrirVentana() {
  digitalWrite(LED_VENTANA, HIGH);
  ventanaAbierta = true;
  ledEncendido = true;
  tiempoInicioLED = millis();
  Serial.println("Ventana ABIERTA por comando");
  publicarEstadoVentana();  // Publicar nuevo estado
}

void cerrarVentana() {
  digitalWrite(LED_VENTANA, HIGH);
  ledEncendido = true;
  ventanaAbierta = false;
  tiempoInicioLED = millis();
  Serial.println("Ventana CERRADA por comando");
  publicarEstadoVentana();  // Publicar nuevo estado
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
  
  if (client.publish(mqttTopicTemp, payload)) {
    Serial.print("[MQTT] Publicado: ");
    Serial.println(payload);
  } else {
    Serial.println("[MQTT] Error en publicación!");
  }
}

void publicarEstadoVentana() {
  const char* estado = ventanaAbierta ? "abierta" : "cerrada";
  
  if (client.publish(mqttTopicEstado, estado)) {
    Serial.print("[MQTT] Estado ventana: ");
    Serial.println(estado);
  } else {
    Serial.println("[MQTT] Error publicando estado!");
  }
}

// ================== SETUP & LOOP ================== //

void setup() {
  pinMode(LED_VENTANA, OUTPUT);
  digitalWrite(LED_VENTANA, LOW);
  
  Serial.begin(115200);
  delay(1000);
  Serial.println("INICIANDO SISTEMA INVERNADERO (Modo Remoto)");
  
  conectarWiFi();
  conectarMQTT();
  
  iniciarParpadeo(3);  // Señal de inicio
  randomSeed(analogRead(0));
  
  Serial.println("Sistema listo - Esperando comandos MQTT ✅");
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

  // Mantener conexión MQTT
  if (!client.connected()) {
    conectarMQTT();
  }
  client.loop();

  // Publicar temperatura periódicamente
  if (tiempoActual - tiempoUltimaTemperatura >= intervaloTemperatura) {
    tiempoUltimaTemperatura = tiempoActual;
    
    // Simular temperatura (15.00°C a 35.00°C)
    temperatura = random(1500, 3501) / 100.0;
    
    Serial.print("Temperatura: ");
    Serial.print(temperatura, 2);
    Serial.println(" °C");
    
    publicarTemperatura();
  }

  // Informe periódico de estado
  if (tiempoActual - tiempoUltimoInformeEstado >= intervaloEstado) {
    informarStatus();
    publicarEstadoVentana();
  }

  // Apagar LED después de tiempo de operación
  if (ledEncendido && (tiempoActual - tiempoInicioLED >= duracionLED)) {
    ledEncendido = false;
    digitalWrite(LED_VENTANA, LOW);
    Serial.println("LED apagado (fin operación ventana)");
  }
}
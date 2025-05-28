#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <UniversalTelegramBot.h>

const char* ssid = "";
const char* password = "";
const char* botToken = "";
const char* chat_id = "";

WiFiClientSecure client;
UniversalTelegramBot bot(botToken, client);

#define LED_VENTANA 2  // LED integrado

const int intervaloTemperatura = 15000;     // Cada 15 segundos simula temperatura
const int duracionLED = 10000;             // LED encendido por 10 segundos

unsigned long tiempoUltimoInformeEstado = 0;
const unsigned long intervaloEstado = 180000; // Cada 3 minutos informa el estado por telegram

bool ventanaAbierta = false;
bool ledEncendido = false;  // controla el motor/el LED

bool modoAutomatico = true;

float temperatura;
unsigned long tiempoUltimaTemperatura = 0;
unsigned long tiempoInicioLED = 0;
unsigned long tiempoActual;

unsigned long tiempoBotTelegram;

void setup() {
  pinMode(LED_VENTANA, OUTPUT);
  digitalWrite(LED_VENTANA, LOW);
  randomSeed(analogRead(0));
  Serial.begin(115200);
  delay(1000);
  Serial.println("INICIANDO PROGRAMA");
  conectarWiFi();
  parpadearLED();
  Serial.println("Todo OK ✅");
}

void loop() {
  tiempoActual= millis();

  if (modoAutomatico){
  // Simular temperatura cada 15 segundos 
    if (tiempoActual - tiempoUltimaTemperatura >= intervaloTemperatura) {
      tiempoUltimaTemperatura = tiempoActual;

      // Temperatura con dos decimales entre 15.00 y 35.00 °C
      temperatura = random(1500, 3501) / 100.0;

      Serial.print("Temperatura simulada: ");
      Serial.print(temperatura, 2);
      Serial.println(" °C");

      censadoTemperatura();

      if (millis() - tiempoUltimoInformeEstado > intervaloEstado) {
        informarStatus();
      }
    }
  }

  // Apagar el LED luego de 10 segundos si está encendido
  if (ledEncendido && (tiempoActual - tiempoInicioLED >= duracionLED)) {
    ledEncendido = false;
    digitalWrite(LED_VENTANA, LOW);
    Serial.println("LED apagado (fin de apertura/cierre)");
  }

  telegram();
}

void abrirVentana() {
  digitalWrite(LED_VENTANA, HIGH);
  ventanaAbierta = true;
  ledEncendido = true;
  tiempoInicioLED = tiempoActual;
}

void cerrarVentana() {
    digitalWrite(LED_VENTANA, HIGH);
    ledEncendido = true;
    ventanaAbierta = false;
    tiempoInicioLED = tiempoActual;
}

void censadoTemperatura(){
  // Lógica de apertura/cierre
  if (temperatura > 30.00 && !ventanaAbierta) {
    Serial.println("Temperatura muy alta: ABRIENDO ventana");
    bot.sendMessage(chat_id, "🍃 Motor activado: Abriendo ventana", "");
    abrirVentana();
    
  } else if (temperatura < 20.00 && ventanaAbierta) {
    Serial.println("Temperatura muy baja: CERRANDO ventana");
    bot.sendMessage(chat_id, "🛑 Motor activado: Cerrando ventana", "");
    cerrarVentana();
  } 
}

void informarStatus(){
  tiempoUltimoInformeEstado = millis();
  String msg = ventanaAbierta
    ? "🍃 La ventana está abierta\n"
    : "🔒 La ventana está cerrada\n";
  msg += String("🌡️ Temperatura: ") + String(temperatura, 2) + " °C";
  bot.sendMessage(chat_id, msg, "");  
}

void parpadearLED(){
  for (int i = 0; i < 3; i++) {
    digitalWrite(LED_VENTANA, HIGH);
    delay(150);
    digitalWrite(LED_VENTANA, LOW);
    delay(150);
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
  client.setInsecure(); // para desarrollo
  Serial.println(WiFi.status());
}


void telegram(){
  if (millis() - tiempoBotTelegram > 1000) {
    int numNewMessages = bot.getUpdates(bot.last_message_received + 1);
    while (numNewMessages) {
          for (int i = 0; i < numNewMessages; i++) {
            String text = bot.messages[i].text;


            if (text == "/status") {
              informarStatus();
            } else if (text == "/abrir" && !ventanaAbierta) {
              bot.sendMessage(chat_id, "🔓 Abriendo ventana por comando", "");
              Serial.println("Mensaje de telegram: ABRIENDO ventana");
              parpadearLED();
              abrirVentana();
            } else if (text == "/cerrar" && ventanaAbierta) {
              bot.sendMessage(chat_id, "🔒 Cerrando ventana por comando", "");
              Serial.println("Mensaje de telegram: CERRANDO ventana");
              parpadearLED();
              cerrarVentana();
            } else if (text == "/cerrar" || text == "/abrir"){
              bot.sendMessage(chat_id, "👍 La ventana ya está en ese estado", "");
            } else if (text == "/reanudar") {
              modoAutomatico = true;
              bot.sendMessage(chat_id, "🤖🌡 Automático activado", "");
              parpadearLED();
              Serial.println("Automatico: ON");
            } else if (text == "/pausar") {
              modoAutomatico = false;
              bot.sendMessage(chat_id, "🤖💤 Automático pausado", "");
              parpadearLED();
              Serial.println("Automatico: OFF");
            } else {
              bot.sendMessage(chat_id, "❌ Comando invalido", "");
            } 
          }
          numNewMessages = bot.getUpdates(bot.last_message_received + 1);
        }
        tiempoBotTelegram = millis();
      }
}

String comando = "";

void setup() {
  Serial.begin(115200);
  pinMode(2, OUTPUT);
  digitalWrite(2, LOW);
  Serial.println("Listo para recibir comandos: prender / apagar");
}

void loop() {
  if (Serial.available()) {
    char c = Serial.read();
    if (c == '\n') { // cuando apretás Enter
      comando.trim(); // saca espacios y enters
      if (comando == "prender") {
        digitalWrite(2, HIGH);
        Serial.println("LED encendido 💡");
      } else if (comando == "apagar") {
        digitalWrite(2, LOW);
        Serial.println("LED apagado 💤");
      } else {
        Serial.println("Comando no reconocido 😕");
      }
      comando = ""; // resetea para leer uno nuevo
    } else {
      comando += c;
    }
  }
}

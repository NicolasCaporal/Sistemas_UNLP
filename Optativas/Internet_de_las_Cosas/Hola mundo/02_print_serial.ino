void setup() {
  Serial.begin(115200); // Baudios del monitor
  Serial.println("¡Hola, soy un ESP32!");
}

void loop() {
  Serial.println("Estoy vivo!");
  delay(1000);
}

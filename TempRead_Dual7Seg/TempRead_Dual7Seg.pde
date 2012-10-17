int data = 2;
int clock = 3;
int latch = 4;

int temperaturePin = 0;

void setup() {
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

void writeDecimal(int num) {
  unsigned char upr = num / 10;
  unsigned char lwr = num % 10;
  unsigned char writeValue = (upr * 16) + lwr;
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, writeValue);
  digitalWrite(latch, HIGH);
}


float getVoltage(int pin) {
  return (analogRead(pin) * 0.004882814);
}

void loop() {
  float temperature = getVoltage(temperaturePin);
  temperature = (temperature - 0.5) * 100;
  writeDecimal((int)temperature);
  delay(100); //Wait another 100ms before reading again..
}

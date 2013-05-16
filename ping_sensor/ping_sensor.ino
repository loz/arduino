
const int triggerPin = 7;
const int echoPin = 8;

unsigned long duration, start, finished;

void setup() {
  pinMode(triggerPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  digitalWrite(triggerPin, HIGH);
  delay(1);
  digitalWrite(triggerPin, LOW);
  start = micros();
  while(digitalRead(echoPin) == 0);
  finished = micros();
  duration = finished - start;
  Serial.print("Duration: ");
  Serial.print(duration);
  Serial.print("\n");
}

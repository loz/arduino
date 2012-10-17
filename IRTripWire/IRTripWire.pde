int IRPin = 2;
int lastRead;

void setup() {
  Serial.begin(115200);
  pinMode(IRPin, INPUT);
}

void loop() {
  boolean tripped = false;
  if(analogRead(IRPin) >= 1023) {
    if (!tripped) {
      Serial.println("Tripped");
      tripped = true;
    }
  } else {
    Serial.println(analogRead(IRPin));
    tripped = false;
  }
}

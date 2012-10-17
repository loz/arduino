
void setup() {
  for(int i =2; i < 10; i++) {
    pinMode(i, INPUT);
  }
  Serial.begin(115200);
  Serial.println("Setup Complete");
}

void loop() {
  int note = 0;
  for(int i=2; i< 10; i++) {
     if (digitalRead(i) == LOW) {
       note = i-2;
     }
  }
  Serial.print("Note: ");
  Serial.print(note);
  delay(1000);
}

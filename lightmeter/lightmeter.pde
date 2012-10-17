int lightPin = 0;

int data = 2;
int clock = 3;
int latch = 4;

void setup() {
  Serial.begin(115200);
  pinMode(lightPin, INPUT);
  
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);  
}

void writeBar(int b) {
  int state = 0;
  for(int i=0; i<b; i++) {
    state = (state << 1) + 1;
  }
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, (int)highByte(state));
  shiftOut(data, clock, MSBFIRST, (int)lowByte(state));
  digitalWrite(latch, HIGH);  
}

void loop() {
  int light = map(analogRead(lightPin), 0, 1000, 0, 11);
  writeBar(light);
}

int data = 2;
int clock = 3;
int latch = 4;

int delaySpeed = 100;

void setup() {
  Serial.begin(115200);
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

void loop() {
  word state = 1;
  //Fill Left
  for(int i=0; i< 10; i++) {
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, (int)highByte(state));
    shiftOut(data, clock, MSBFIRST, (int)lowByte(state));
    digitalWrite(latch, HIGH);
    delay(delaySpeed);
    state = (state << 1) + 1;
  }
  //Empty Left
  for(int i=0; i< 10; i++) {
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, (int)highByte(state));
    shiftOut(data, clock, MSBFIRST, (int)lowByte(state));
    digitalWrite(latch, HIGH);
    delay(delaySpeed);
    state = (state << 1);   
  }
  state = 512;
  //Fill Right
  for(int i=0; i< 10; i++) {
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, (int)highByte(state));
    shiftOut(data, clock, MSBFIRST, (int)lowByte(state));
    digitalWrite(latch, HIGH);
    delay(delaySpeed);
    state = (state >> 1) + 512;
  }
  //Empty Right
  for(int i=0; i< 10; i++) {
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, (int)highByte(state));
    shiftOut(data, clock, MSBFIRST, (int)lowByte(state));
    digitalWrite(latch, HIGH);
    delay(delaySpeed);
    state = (state >> 1);
  }
}

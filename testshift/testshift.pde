int data = 2;
int clock = 3;
int latch = 4;

void setup() {
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

void loop() {
  int state1,state2 = 0;
  for (int i=0; i<3; i++) {
    state1 = 1 << i;
    state2 = (state1 << 4) + state1;
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, state2);
    digitalWrite(latch, HIGH);
    delay(100);
  }
  //start with light 4, then shift and add it again till all are full
  state1 = 0;
  for (int i=0; i<4; i++) {
    state1 = (state1 >> 1) + 8;
    state2 = (state1 << 4) + state1;
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, state2);
    digitalWrite(latch, HIGH);
    delay(100);
  }
  
  //shift out final state to single led
  for (int i=0; i<4; i++) {
    state1 = (state1 >> 1);
    state2 = (state1 << 4) + state1;
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, state2);
    digitalWrite(latch, HIGH);
    delay(100);
  }  
}

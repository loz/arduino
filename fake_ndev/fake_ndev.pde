int data = 2;
int clock = 3;
int latch = 4;

/*
  This is how I had wired up the 7 segment LED
  bits related to LEDS
  
      --   6
  8  |  |  5
      --   7
  4  |  |  2
  3   __  .  1
  
*/

int codes[] = {
  B00000100,    //bottom  
  B00001000,    //bottomleft
  B10000000,    //topleft
  B00100000,    //top
  B00010000,    //topright
  B00000010    //bottomright
};

void setup() {
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

void loop() {
  for (int i=0; i< 6; i++) {
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, codes[i]);
    digitalWrite(latch, HIGH);
    delay(200);
  }
}

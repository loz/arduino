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
  B10111110,    //0  
  B00010010,    //1
  B01111100,    //2
  B01110110,    //3
  B11010010,    //4
  B11100110,    //5
  B11101110,    //6
  B00110010,    //7
  B11111110,    //8
  B11110110    //9  
};

void setup() {
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

void loop() {
  for (int i=0; i< 10; i++) {
    digitalWrite(latch, LOW);
    shiftOut(data, clock, MSBFIRST, codes[i]);
    digitalWrite(latch, HIGH);
    delay(1000);
  }
}

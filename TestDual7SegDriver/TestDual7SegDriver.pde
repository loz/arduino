#define MAX(x,y) (x > y ? x : y)
#define MIN(x,y) (x < y ? x : y)
#define CLAMP(x,y,z) MAX(MIN(x,z),y)


int data = 2;
int clock = 3;
int latch = 4;

void setup() {
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

void loop() {
  int delayTime = 1000;
  for(unsigned int i=99; i>= 0; i--) {
    writeDecimal(i);
    delay(delayTime);
  }
}

void writeDecimal(int num) {
  unsigned char upr = num / 10;
  unsigned char lwr = num % 10;
  unsigned char writeValue = (upr * 16) + lwr;
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, writeValue);
  digitalWrite(latch, HIGH);
}

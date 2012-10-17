int IRPin = 2;
int lastRead;

unsigned long arduinofreq = 1000000;
unsigned long frequency = 36000;

int maxBits = 7;

int readMin = 1024;
int readMax = 0;
int lowCount = 1024;

void setup() {
  Serial.begin(115200);
  pinMode(IRPin, INPUT);
  //intialise by reading a little
  for(int i=0; i<1000; i++) {
    analogRead(IRPin);
  }
  for(int i=0; i < 1024; i++ ){
    lastRead = analogRead(IRPin);
    if(lastRead > readMax) {
      readMax = lastRead;
    }
    if(lastRead < readMin) {
      readMin = lastRead;
    }
  }
  Serial.println("Initialised");
  Serial.print("Min:");
  Serial.print(readMin);
  Serial.print(" Max:");
  Serial.println(readMax);
  //frequency = frequency / (arduinofreq / frequency);
  //frequency = frequency / 8;
  //frequency = frequency * (arduinofreq * 1024);
  Serial.print("Frequency: ");
  Serial.print(frequency);
}

void loop() {
  int zCount = 0;
  //Wait for start (none 0)  
  while(analogRead(IRPin) >= readMin) {
  }
  Serial.println("Start");
  unsigned int bits = 0;
  do {
    boolean signal = false;
    //read according to frequency
    for(unsigned long i=0; i < 8; i++) {
      signal = signal | (analogRead(IRPin) < readMin);
      //delayMicroseconds(1);
    }
    if(signal) {
       //1
       //Serial.print("1");
       bits = (bits << 1) + 1;
       //zCount = 0;
       zCount++;
    } else {
      //0
      bits = (bits << 1);
      //Serial.print("0");
      zCount++;
    }
  }while(zCount < maxBits);
  Serial.print(bits);
  Serial.println("");
}

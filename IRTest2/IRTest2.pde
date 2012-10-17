int IRPin = 1;
int lastRead;
int sensitivity = 2;
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
}

void loop() {
  int count = 0;
  int newRead = 0;
  while(analogRead(IRPin) >= readMin) {
    if(count < lowCount) {
      count++;
    }else if(count == lowCount) {
      Serial.println("__");
      Serial.println("__");
      count = lowCount+1;
    }
  }
  if(count < lowCount && count > 0) {
    Serial.print(" (");
    Serial.print(count);
    Serial.print(") ");
  }
  count = 0;
  newRead = analogRead(IRPin);
  do {
    lastRead = newRead;
    newRead = analogRead(IRPin);
    count++;
  }while(newRead == lastRead);
  Serial.print("[");
  Serial.print(count);
  Serial.print("]");
}
  /*
  while(
    (newRead >= (lastRead - sensitivity)) &&
    (newRead <= (lastRead + sensitivity))
    ) {
    if (count > 0 && newRead > 1020) {
      Serial.println("");
      Serial.println("");
    }
    count = 0;
    newRead = analogRead(IRPin);
  }
  
  Serial.print(count);
  count++;
  lastRead = newRead;
}
*/

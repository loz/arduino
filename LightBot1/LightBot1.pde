#include <Servo.h>

// Lower readings on the Pin mean more light.
//
// LeftSignal == @ Left "Ear"
// RightSignal == @ Right "Ear"
// CentreSignal == @ "Nose"

// Servo Position 0 == Fully Left
// Servo Position 180 == Fully Right

int servoPin = 9;
int leftSignal = 2;
int rightSignal = 4;
int centreSignal = 3;

int curPos = 90;

int maxRead = 0;
int maxDegree = 0;

Servo myServo;


void setup() {
  myServo.attach(servoPin);
  pinMode(leftSignal, INPUT);
  pinMode(rightSignal, INPUT);
  pinMode(centreSignal, INPUT);
  Serial.begin(115200);
  myServo.write(curPos);
  //scanRoom();
}

void scanRoom() {
  for(int i=0; i<180; i++) {
    myServo.write(i);
    int left = analogRead(leftSignal);
    int centre = analogRead(centreSignal);
    int right = analogRead(rightSignal);
    int average = (left + centre + right) / 3;
    Serial.print(i);
    Serial.print("deg, average=");
    Serial.println(average);
    if(average > maxRead) {
      maxRead = average;
      maxDegree = i;
    }
  }
  Serial.print("Max Reading:");
  Serial.print(maxRead);
  Serial.print(" @ ");
  Serial.println(maxDegree);
  //Move to maximum reading to start
  myServo.write(maxDegree);
  curPos = maxDegree;
}

void calculateLevel() {
  int left = analogRead(leftSignal);
  int centre = analogRead(centreSignal);
  int right = analogRead(rightSignal);
  maxRead = (left + centre + right) / 3;  
}

void goLeft() {
  Serial.println("Going Right..");
  curPos--;
  if(curPos < 0) {
    curPos = 0;
  } else {
    myServo.write(curPos);
  }
}

void goRight() {
  Serial.println("Going Left..");
  curPos++;
  if(curPos > 180) {
    curPos = 180;
  } else {
    myServo.write(curPos);
  }
}

void loop() {
  int left = analogRead(leftSignal);
  int centre = analogRead(centreSignal);
  int right = analogRead(rightSignal);
  

  if(left < centre) {
    if( right < centre && right < left) {
      goRight();
    } else {
      goLeft();
    }
  } else if (right < centre) {
    goRight();
  }
}

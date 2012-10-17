#include <Servo.h>

int servoPin = 9;

Servo myServo;


void setup() {
  myServo.attach(servoPin);
}

void loop() {
  myServo.write(90);
}

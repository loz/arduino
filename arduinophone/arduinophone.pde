int tones[] = {1915, 1700, 1519, 1432, 1275, 1136, 1014, 956};
char notes[] = {'c', 'd', 'e', 'f', 'g', 'a', 'b', 'C'};
int speakerPin = 13;

void setup() {
  for(int i =2; i < 10; i++) {
    pinMode(i, INPUT);
  }
}

void playnote(int note) {
  int tone = tones[note-1];
  while(digitalRead(note+1) == LOW) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(tone);
  }
}

void loop() {
  int note = 0;
  for(int i=2; i< 10; i++) {
     if (digitalRead(i) == LOW) {
       note = i-1;
     }
  }
  if(note > 0) {
    playnote(note);
  }
}

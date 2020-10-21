#include <Servo.h>
Servo Motor1;
int trigger=8,echo = 10;
float p[2];
float angle=0;
void setup() {
Motor1.attach(9);
pinMode(8,OUTPUT);
pinMode(10,INPUT);
Serial.begin(9600);
}
void loop() {
Motor1.write(angle);
delay(10);
digitalWrite(8, LOW);
  delayMicroseconds(2); 
  digitalWrite(8, HIGH);
  delayMicroseconds(10); 
  digitalWrite(8, LOW);
  int a = pulseIn(10,HIGH);
  float dist=(a/2)*0.0343;
  p[0] = dist;
  p[1] = angle;
  Serial.println((String)p[0] + "\t" + angle);
  angle = angle + 0.5;
}

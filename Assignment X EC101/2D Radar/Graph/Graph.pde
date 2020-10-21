import processing.serial.*;
Serial myPort;
String ss;
float Dist = 0,Angle = 0,c,s,x,y;
void setup() {
  size(800, 800);
  myPort = new Serial(this, "COM5", 9600);
  background(255);
}
void draw() {
  if(myPort.available()>0){ 
  fill(0);
  translate(width/2, height/2);
  ss = myPort.readStringUntil('\n');
  if ( ss != null ) {
    float[] num = float(split(ss, '\t'));
    Dist = abs(num[0]);
    Angle = num[1];
    c = cos((Angle*PI)/180);
    s = sin((Angle*PI)/180);
    x = Dist*c;
    y = Dist*s;
    rectMode(CENTER);
    rect(x,y,2,2);
  }
  }
}

import processing.sound.*;
SoundFile File,File2;
PImage img,back;
//Serial myPort;
int val;
float cc;
float vel,k=0;
int rectx = 60,recty = 625,rectline=600,rectxleft,rectxright,points = 0,level = 1;
PFont f;
void setup()
{
  size(626,831);
  background(255);
  cc = random(100,900);
  f = createFont("Comic Sans MS",48,true);
  textFont(f);
  //myPort = new Serial(this , "COM6" ,9600);
  img = loadImage("bas.png");
  back = loadImage("back.jpg");
  File2 = new SoundFile(this, "subway.mp3");
  File = new SoundFile(this, "Strong.mp3");
  File2.loop();

}

void draw()
{
 vel = level * 3; 
  //if(myPort.available()>0)
 // val = myPort.read();
  //rectx =25 * val;
background(back);
 //cc = random(100,400);
 imageMode(CENTER);
 image(img,rectx,recty,100,100);
 fill(255,245,195);
 ellipse(cc,k,20,40);
 k = k + vel;
 if (k > 900)
 {
  k = 0;
  cc = random(100,400);
 }
 //fill(170,118,68);
 //rectMode(CENTER);
 //rect(rectx,recty,50,50);
if (keyPressed == true && keyCode == LEFT && rectx>10)
{
  rectx = rectx - 10;
}
if (keyPressed == true && keyCode == RIGHT && rectx <616)
{
  rectx = rectx + 10;
}
rectxleft = rectx - 50;
rectxright = rectx + 50;
level = round(points/10)+1;
eggcatch();
textSize(50);
fill(0);
text(points +  " Points",50,50);
text("Level " + level,400,50);
}


void eggcatch()
{
  if (k == rectline && cc < rectxright && cc > rectxleft)
{
  points = points + 1;
  File.play();
  k = 0;
  cc = random(100,600);
//  if (vel<10)
//{
//  vel = 5 + 0.5*(level-1);
//}
//else{ 
//  //vel = 10;}
}}

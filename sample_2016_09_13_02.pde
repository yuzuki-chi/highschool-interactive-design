Shine kira;
int cnt =0;
int timer = 0;

void setup(){
  size(1960/2, 980/2);
  fill(0);
  rect(0,0,1960,980);
}//end void draw

void draw(){

    fill(0,0,80,4);
    rect(0,0,1960,980);
    kira = new Shine(mouseX, mouseY, random(10, 20));
    kira.update();
    kira.display();
}//end void draw

class Shine{

  float x;
  float y;
  float diameter;
  float speed = 2.5;
  

  Shine(float tempX,float tempY,float tempDiameter){
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    cnt++;
    
  }//end Shine
 
  void update(){
    x += random(-60, 60);
    y -= random(-60, 60);
  }//end void move
  
  void display(){
    smooth();
    noStroke();
    fill(255,0,0,random(50, 100));
    ellipse(x, y, diameter, diameter);
  }//end void display
}//end class JitterBug

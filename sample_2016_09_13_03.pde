Shine kira;
int cnt =0;
int timer = 0;
int roop;

void setup(){
  size(1960/2, 980/2);
  fill(0);
  background(0,0,0);
}//end void draw

void draw(){
    roop =+ 1;
    if(roop > 10){
      fill(0,0,0);
      rect(0,0,1960,980);
    }
    fill(0,0,0,4);
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
  int al;

  Shine(float tempX,float tempY,float tempDiameter, float ){
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    al = (int)random(30, 60);
    cnt++;
    
  }//end Shine
 
  void update(){
    x += random(-60, 60);
    y += random(-60, 60);
    if( al > 0) {
    al = al - (int)random(1, 3);
    }
  }//end void move
  
  void display(){
    smooth();
    noStroke();
    fill(random(255),random(255),random(255),60);
    ellipse(x, y, diameter, diameter);
  }//end void display
}//end class JitterBug

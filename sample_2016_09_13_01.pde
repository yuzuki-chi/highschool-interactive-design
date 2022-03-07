Shine kira;
int cnt =0;
int timer = 0;

void setup(){
  size(1960/2, 980/2);
  
}//end void draw

void draw(){
  
  kira = new Shine(width/2, height/2, random(10, 200));
  kira.move();
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
 
  void move(){
    x += random(0, 300);
    y -= random(0, 300);
  }//end void move
  
  void display(){
    smooth();
    noStroke();
    fill(100,100,100,random(10, 30));
    ellipse(x, y, diameter, diameter);
  }//end void display
}//end class JitterBug

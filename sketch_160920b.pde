int num = 20;


Shine[] kira = new Shine[num];


int timer = 0;
int roop;

void setup(){
  size(1960/2, 980/2);
  
  background(0,0,0);
  smooth();
  noStroke();
  for( int i = 0; i < 20; i++){
  kira[i] = new Shine(mouseX,mouseY,random(5,10));
  }

}//end void draw

void draw(){
int i  = 0;


  
  kira[i].move(mouseX, mouseY);
  kira[i].display();
  i++;
  println(i);
  if ( i > 20 ) i = 0;
  
}//end void draw

class Shine{

  float x, mx;
  float y, my;
  float diameter;
  float speed = 2.5;
  int al;
  int cnt;
  float r,g,b;
  
  Shine(float tempX,float tempY,float tempDiameter){
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    
    r = random(255);
    g = random(255);
    b = random(255);
    al = (int)random(30, 60);
  
  }//end Shine

 
  void move(float mx,float my){
    x =  mx; 
    x += 10;
    y = my;
    //y += random(-10, 10);   
  }//end void move
  
  void display(){
        fill(r,g,b,al);
        ellipse(x, y, diameter, diameter);
      
  }//end void display
}//end class JitterBug

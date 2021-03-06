JitterBug bug;
JitterBug jit;

void setup(){
  size(480, 120);
  bug = new JitterBug(width * 0.33, height/2, 20);
  jit = new JitterBug(width * 0.66, height/2, 10);
}

void draw(){
  jit.move();
  jit.display();
  bug.move();
  bug.display();
}

class JitterBug{
  float x;
  float y;
  int diameter;
  float speed = 2.5;
  
  JitterBug(float tempX, float tempY, int tempDiameter){
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  
  void move(){
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void display(){
    ellipse(x, y, diameter, diameter);
  }
}
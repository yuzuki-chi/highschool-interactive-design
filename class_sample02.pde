KasuyaKyosuke kasutin;
TanakaKaito kaitow;

void setup(){
  size(1280, 980);
  kasutin = new KasuyaKyosuke(width/2, height/2, 20);
}

void draw(){
  kasutin.move();
  kasutin.display();
  kaitow.move();
  kaitow.display();
}

class KasuyaKyosuke{
 float x;
 float y;
 int diameter;
 float speed = 2.5;
 
 KasuyaKyosuke(float tempX, float tempY, int tempDiameter){
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

class TanakaKaito{
 float x;
 float y;
 int diameter;
 float speed = 2.5;
 
 TanakaKaito(float tempX, float tempY, int tempDiameter){
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
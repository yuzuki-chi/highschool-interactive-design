int numSpots = 150;
int cnt;

Spot[] spots = new Spot[numSpots];
 
void setup() {
  size(1980/2, 960/2);
  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x = 0;
    float y = 0;
    float rate =  noise(i * 0.01);
    spots[i] = new Spot(x, y, 10, rate);
  }
}
 
void draw() {
  
if (mousePressed) {
  println(frameCount);
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255);
  
  
  spots[cnt].set_mouse();
 
  for (int i = 0; i < spots.length; i++) {
    spots[i].move(); // Move each object
    spots[i].display(); // Display each object
  }
  cnt++;
  if(cnt > (numSpots -1)) cnt = 0;
}else{
  println(frameCount);
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255);
}
}
 
class Spot {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the circle
  float speed; // Distance moved each frame
  int direction = 1; // Direction of motion (1 is down, -1 is up)
 
  // Constructor
  Spot(float xpos, float ypos, float dia, float sp) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
  }
  void set_mouse() {
     x = mouseX;
     y = mouseY;
  }
 
  void move() {
    y += (speed * direction + random(-1,1));
    if ((y > height) || (y < 0)) {
      direction *= random(-1,1);
    }
  }
 
  void display() {

    fill(random(0,255),random(0,255), random(0,255), 60);
    float diasize = 0;
    float diasizeX = 0;
    float diasizeY = 0;
    diasizeX = mouseX - pmouseX;
    diasizeY = mouseY - pmouseY;
    diasize = diasizeX + diasizeY;
    float ellx = 0;
    float elly = 0;
    ellx = x + random(-30,30);
    elly = y + random(-30,30);
    if(diasizeX < random(5,15) && diasizeX > random(-15,-5) && diasizeY > random(-15,-5) && diasizeY < random(5,15)){
      ellx=x;
      elly=y;
    }
    if(diasizeX < 0 && diasizeY < 0){
      diameter=0;
    }
    ellipse(ellx, elly, diameter + diasize, diameter + diasize);
  }
}

int numSpots = 100;
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
  
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  
  
  spots[cnt].set_mouse();
 
  for (int i = 0; i < spots.length; i++) {
    spots[i].move(); // Move each object
    spots[i].display(); // Display each object
  }
  cnt++;
  if(cnt > (numSpots -1)) cnt = 0;
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
    y += (speed * direction + noise(random(-100,-10),random(10,100)));
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
    if(diasizeX < 0 && diasizeY < 0){
      diameter=0;
    }
    ellipse(x + random(-30,30), y +random(-30,30), diameter + diasize, diameter + diasize);
  }
}

Ellipse[] ell = new Ellipse[300];

void setup() {
  size(400, 400);
  noStroke();
  fill(0);

  for (int i = 0; i < ell.length; i++) {
    ell[i] = new Ellipse(200, 200, 10);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < ell.length; i++) {
    ell[i].update();
    ell[i].display();
  }
}

class Ellipse {
  float x, y, velocity;
  int eSize;

  Ellipse (int _x, int _y, int _eSize) {
    x = _x;
    y = _y;
    eSize = _eSize;
  }

  void update() {
    x = x + random(noise(-100, 100)*random(-10, 10));
    y = y + random(noise(-100, 100)*random(-10, 10));
    //y = 10;
  }

  void display() {
    fill(random(0,255),random(0,25),random(0,25),random(0,255));
    ellipse(x, y, eSize, eSize);
  }
}


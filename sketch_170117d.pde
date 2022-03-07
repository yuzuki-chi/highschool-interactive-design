import processing.video.*;

Ellipse[] ell = new Ellipse[30];

int numPixels;
int[] backgroundPixels;
int noiseFilter = 150;
int grX,grY=0;
Capture video;

void setup() {
  size(640, 480);

  video = new Capture(this, 640, 480, 30);

  numPixels = video.width * video.height;
  backgroundPixels = new int[numPixels];
  video.start();
  loadPixels();
  //rectMode(CENTER);
  noStroke();
  fill(0);
  for (int i = 0; i < ell.length; i++) {
    ell[i] = new Ellipse(10);
  }
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
    background(0);
    updatePixels();
    int presenceSum = 0;
    
    for (int y = 0; y < video.height; y += 6) {
      for (int x = 0; x < video.width; x += 6) {
        color currColor = video.pixels[y * video.width + x];
        color bkgdColor = backgroundPixels[y * video.width + x];

        int currR = (currColor >> 16) & 0xFF;
        int currG = (currColor >> 8) & 0xFF;
        int currB = currColor & 0xFF;

        int bkgdR = (bkgdColor >> 16 ) & 0xFF;
        int bkgdG = (bkgdColor >> 8 ) & 0xFF;
        int bkgdB = bkgdColor & 0xFF;

        int diffR = abs(currR - bkgdR);
        int diffG = abs(currG - bkgdG);
        int diffB = abs(currB - bkgdB);

        int pixelColor = video.pixels[y * video.width + x];
        int pr = (pixelColor >> 16) & 0xff;
        int pg = (pixelColor >> 8 ) & 0xff;
        int pb = pixelColor & 0xff;

        if (diffR + diffG + diffB > noiseFilter) {
          int nox = x;
          x = (x - (video.width -1)) * -1;
          pixels[(y * video.width + x)] = color(currR, currG, currB);
          grX = x;
          grY = y;


            for (int i = 0; i < ell.length; i++) {
              ell[i].update();
              ell[i].display();
            }
          
          x = nox;
        } else {
          //break;
        }
        pixels[y * video.width + x] = color(currR, currG, currB);
      }
    }
    for (int y = 0; y < video.height; y ++) {
      for (int x = 0; x < video.width; x ++) {

        int pixelColor = video.pixels[y * video.width + x];

        int r = (pixelColor >> 16) & 0xff;
        int g = (pixelColor >> 8 ) & 0xff;
        int b = pixelColor & 0xff;
        
        int nox2 = x;
        x = (x - (video.width -1)) * -1;
        pixels[y * video.width + x] = color(r, g, b);
        x = nox2;
      }
    }
    presenceSum ++;
  }
}


void mousePressed() {
  println("mousePressed success");
  video.loadPixels();
  arraycopy(video.pixels, backgroundPixels);
}

class Ellipse {
  float x = grX;
  float y = grY;
  int velocity;
  int eSize;
  
  Ellipse (int _eSize) {
    eSize = _eSize;
  }

  void update() {
    //x = grX + random(-10,10);
    //y = grY + random(-10,10);
    x = grX + random(noise(-100, 100)*random(-200, 1));
    y = grY + random(noise(-100, 100)*random(-300, 30));
  }

  void display() {
    //fill(random(0,255),random(0,25),random(0,25),random(0,255));
    ellipse(x, y, eSize, eSize);
  }
}



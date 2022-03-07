/* 2017/01/17 */

import processing.video.*;
import java.util.*;
Capture video;

//CIRCLE INITIALIZE-----------------------------
Circle[] arrayCircle;
int w = 640;
int h = 480;
int c_max = 1000;
int c_dead = 100;
int c_fr_limit = 3;
int c_fr_point = 3;
int c_mouse = 20;
int c_cnt = 0;
int c_blur1 = 5;
int c_blur2 = 50;
float c_dim = 30;
float reset = 10000;
float FC;

//VIDEO INITIALIZE------------------------------
int border = 254;
color _black = color(0, 0, 0);
color _dark = color(240, 240, 240);
int v_grid = 20;
int v_rect = v_grid * v_grid;
float v_rate = 0.1;
int w_grid = w / v_grid;
int h_grid = h / v_grid;
int[][] grids = new int[w_grid + 1][h_grid + 1];

//----------------------------------------------

int numPixels;
int[] backgroundPixels;
int noiseFilter = 150;
int grX,grY=0;

void setup() {
  size(w, h);

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

import java.util.*;
import processing.video.*;
Capture video;

int[] backgroundPixels;
int[] g_currR;
int[] g_currG;
int[] g_currB;
int[] g_diffR;
int[] g_diffG;
int[] g_diffB;

int debug = 0;

//CIRCLE INITIALIZE
Circle[] arrayCircle;
int w = 640;
int h = 480;
int c_max = 2000;//AMOUNT OF ALL
int c_dead =  100;// DEAD CIRCLE 
int c_fr_limit = 30;// MAX LIVE CIRCELS PER ONE FRAME
int c_fr_point = 1;
int c_mouse = 20;
int c_cnt = 0;
int c_blur1 = 5;
int c_blur2 = 50;
float c_dim = 30;
//reset:1000 => 15 sec 
float reset = 10000;
float FC;


//VIDEO INITIALIZE
int border = 150;
color _black = color(0, 0, 0);
color _dark = color(240,240,240);
int v_grid = 20;
int v_rect = v_grid*v_grid;
float v_rate = 0.1;
int w_grid = w / v_grid;
int h_grid = h / v_grid;
int[][] grids = new int[w_grid + 1][h_grid + 1];


void setup() {

  size(640, 480);
  smooth();

  video = new Capture(this, 640, 480, 30);
  video.start();
  
  backgroundPixels = new int[video.width * video.height];
  g_currR = new int[video.width * video.height];
  g_currG = new int[video.width * video.height];
  g_currB = new int[video.width * video.height];
  g_diffR = new int[video.width * video.height];
  g_diffG = new int[video.width * video.height];
  g_diffB = new int[video.width * video.height];
  
  arrayCircle = new Circle[c_max];

  for (int i = 0; i < arrayCircle.length; i++) {
    Circle circle = 
      new Circle(random(width), 
    random(height), 
    random(c_dim));
    arrayCircle[i] = circle;
  }//END for
}//END setup



void draw() {
  background(0);
  loadPixels();
  color[] tmp = new color[w];
  color tmp_c;

  for (int y = 0; y < video.height; y += 6) {
    for (int x = 0; x < video.width; x += 6) {
      color currColor = video.pixels[y * video.width + x];
      color bkgdColor = backgroundPixels[y * video.width + x];

      int currR = (currColor >> 16) & 0xFF;
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      g_currR[y * video.width + x] = currR;
      g_currG[y * video.width + x] = currG;
      g_currB[y * video.width + x] = currB;

      int bkgdR = (bkgdColor >> 16 ) & 0xFF;
      int bkgdG = (bkgdColor >> 8 ) & 0xFF;
      int bkgdB = bkgdColor & 0xFF;

      int diffR = abs(currR - bkgdR);
      int diffG = abs(currG - bkgdG);
      int diffB = abs(currB - bkgdB);
      g_diffR[y * video.width + x] = diffR;
      g_diffG[y * video.width + x] = diffG;
      g_diffB[y * video.width + x] = diffB;
    }
  }//end for

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


  // INITILIZED grids 
  int v_sum = 0;
  for (int n = 0; n < h_grid; n++) {
    for (int m = 0; m < w_grid; m++) {
      grids[m][n] = 0;
    }//END for n
  }//END for m


  // HANTEN SAGYO 
  // COUNTING BRIGHTNESS PIXELS
  int gx, gy;
  for (int y=0; y<h; y++) {
    for (int x=0; x<w; x++) {
      int total_diff = g_diffR[y * video.width + x] + g_diffG[y * video.width + x] + g_diffB[y * video.width + x];
      
      tmp_c = video.pixels[(y+1)*w -x -1];
      // BOEDER KOETA BRIGHTNESS PIXELS 
      if (total_diff > border) {    
        gx = x / v_grid;
        gy = y / v_grid;
        grids[gx][gy] += 1;
        v_sum++;
      }//END if
    }//END x
  }//END y for HANTEN


  // CHECKING THE TOP 3 GRID
  // IF EQUAL of the grids[][] EXCEPTION
  int[][] g_tmp = new int[(w_grid+1)*(h_grid+1)][3];
  int ix, iy;
  int g_cnt = 0;
  for (iy = 0; iy < (h_grid+1); iy++) {
    for (ix = 0; ix < (w_grid+1); ix++) {
      int tmp_g = grids[ix][iy];
      g_tmp[g_cnt][0] = tmp_g;
      g_tmp[g_cnt][1] = ix * v_grid;
      g_tmp[g_cnt][2] = iy * v_grid;
      g_cnt++;
    }//END m
  }//END n



  // SORT FOR g_tmp
  int[][] g_sort = new int[(w_grid+1)*(h_grid+1)][3];
  int[] list_sort= new int[(w_grid+1)*(h_grid+1)];
  for (int si = 0; si < (w_grid+1)*(h_grid+1); si++) {
    list_sort[si] = g_tmp[si][0];
  }
  list_sort = sort(list_sort);
  list_sort = reverse(list_sort);

  for (int si = 0; si <c_fr_point; si++) {
    int s_sum = list_sort[si];
    if (s_sum != 0) {
      for (int searchi = 0; searchi < (w_grid+1)*(h_grid+1); searchi++) {
        if (s_sum == g_tmp[searchi][0]) {
          g_sort[si][0] = s_sum;
          g_sort[si][1] = g_tmp[searchi][1];
          g_sort[si][2] = g_tmp[searchi][2];
          println(s_sum +":"+g_sort[si][1]+","+g_sort[si][2]);
        }//END if
      }//END for searchi
    }//END if s_sum == 0
  }//END for si



  for (int gi = 0; gi < c_fr_point; gi++) {
    int cx, cy;
    int v_per = (g_sort[gi][0] / v_rect);

    cx = g_sort[gi][1];
    cy = g_sort[gi][2];
    
    int tmp_x = cx + v_grid/2;
    int tmp_y = cy + v_grid/2;
    int tmp_cnt = c_cnt;   
    
    for (int i = tmp_cnt; i < (c_fr_limit+ tmp_cnt); i++) {
      c_cnt++;
    
      tmp_x = tmp_x + (int)random(-c_blur1, c_blur1);
      if (tmp_x > w ) tmp_x = w -5;
      arrayCircle[i].x = tmp_x;

      tmp_y = tmp_y + (int)random(-c_blur1, c_blur1);
      if (tmp_y > h ) tmp_y = h - 5;
      arrayCircle[i].y = tmp_y;
    

      //INIT c_cnt
      if (c_cnt > (c_max - c_dead -1)) {
        c_cnt = 0;
        println("CLEAR c_cnt");
      }
    }//END for c_cnt
  }//END for gi

  updatePixels();

  for (Circle circle : arrayCircle) {
    circle.draw();
  }//END for


  // REFLESH CIRCLES
  if (frameCount % reset == 0) reflesh();
}//END draw


void captureEvent(Capture video) {
  video.read();
}//END captureEvent

void mousePressed() {
  println("mousePressed success");
  video.loadPixels();
  arraycopy(video.pixels, backgroundPixels);
/*
  for(int y =0; y < video.height; y++){
    for(int x = 0; y < video.width; x++){
      backgroundPixels[y * video.width + x]
    }
  }
*/
}//END mousePressed

void reflesh() {
  println("SETUP");
  println(frameCount);
  background(100);
  setup();
}//END reflesh



class Circle {
  float x, y, dim, alpha;
  float r, g, b;
  Circle(float x, float y, float dim) {
    this.x = x;
    this.y = y;
    this.dim = dim;
    this.alpha = random(100, 200);
    this.r = random(100, 255);
    this.g = random(100, 255);
    this.b = random(100, 255);
  }

  void draw() {
    noStroke();
    float timeSpeed = 0.02;
    float setMove = 100;
    float setNoise = 30;
    float setAlpha = 1;
    float setDim = 0.1;
    float phase =TWO_PI;
    float complexity = 8;

    FC = frameCount % reset;
    float t = FC * timeSpeed;


    float normx = norm(x, 0, width);
    float normy = norm(y, 0, height);

    float u = noise(
    t + phase, 
    normx * complexity + phase, 
    normy * complexity + phase
      );

    float v = noise(
    t - phase, 
    normx * complexity - phase, 
    normy * complexity + phase
      );

    float speed = (setNoise * noise(t, u, v)) / (c_max/setMove);


    y += lerp(-speed, speed, u);
    x += lerp(-speed, speed, v);
    alpha -= setAlpha * noise(-setAlpha, setAlpha, normx);
    dim -= setDim * noise(-setDim, setDim, normy);


    //if (y>height || y< 0) y = random(0, height);
    //if (x>width  || x< 0) x = random(0, width);
    if (alpha < 0) alpha = random(80, 100);
    if (dim < 0 || dim > c_dim) dim = random(c_dim);
    fill(r, g, b, alpha);
    float nox = x;
    x = (x - (video.width -1)) * -1;
    ellipse(x, y, dim, dim);
    x = nox;
  }//END Circle.draw()
}//END class circle
import processing.video.*;
Capture video;

void setup(){
  size(640, 480);
  video = new Capture(this, 640, 480);
}

void draw(){
  loadPixels();
  video.read();
  for (int y=0; y<height; y++){
    for (int x=0; x<width; x++){
      int pos = (y*width)+x;
      pixels[pos] = video.pixels[pos];
    }
  }
  scale(-1, 1);
  image(video, -width, 0);
  
  updatePixels();
  video.start();
}


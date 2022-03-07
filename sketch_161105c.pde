import gab.opencv.*;
import processing.video.*;

Capture video;
 
void setup() {
  size(1280, 720);
  video = new Capture(this, width, height);
  loadPixels();
  video.start();
}
 
void draw() {
  if (video.available()) {
    video.read();
    image(video, width, 0);
    video.loadPixels();
    
    for (int y = 0; y < video.height; y ++) {
      for (int x = 0; x < video.width; x ++) {
        int pixelColor = video.pixels[y * video.width + x];
 
        int r = (pixelColor >> 16) & 0xff;
        int g = (pixelColor >> 8 ) & 0xff;
        int b = pixelColor & 0xff;
 
        pixels[y * video.width + x] = color(r, g, b);
      }
    }
    updatePixels();
  }
}

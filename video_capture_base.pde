import processing.video.*;
 
Capture video;  //Capture型の変数videoを宣言
 
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480,"Front Camera");
  video.start();
}
 
void draw() {
  if (video.available() == true) {
    video.read();
    image(video, 0, 0);
  }
}


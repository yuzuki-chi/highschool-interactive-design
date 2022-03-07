      float x;
      float y;
      float px;
      float py;
      float easing = 0.1;
      float strokesize = 1;
      float strokecolor = 0;
      float strokecolorR = 0;
      float strokecolorG = 0;
      float strokecolorB = 0;

void setup(){
  size(1920,1080);  
  smooth();
  stroke(0, 180);
  background(200);
  frameRate(1000);

}//end setup()
void draw(){
  fill(0, 0, 0, 10);
  noStroke();
  rect(0, 0, 2000, 2000);
  
  if (mousePressed){
    if (mouseButton == LEFT){
      fill(300, 300, 300, 30);
      triangle(mouseX - 30, mouseY - 50, mouseX + 10, mouseY - 30, mouseX +30, mouseY);
      triangle(mouseX - 50, mouseY - 10, mouseX + 20, mouseY - 40, mouseX , mouseY);
      triangle(mouseX - 30, mouseY - 20, mouseX - 40, mouseY - 30, mouseX + 30, mouseY - 20);
      triangle(mouseX + 20, mouseY, mouseX, mouseY + 30, mouseX -30, mouseY);
      }else{
      fill(200, 10);
      triangle(mouseX - 30, mouseY, mouseX, mouseY - 30, mouseX +30, mouseY);
    }//END else
  }//END if mousePressed
}//END draw()
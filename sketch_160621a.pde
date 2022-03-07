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
      
void keyPressed(){
   if (key == 'q'){
    strokesize = strokesize + 1;
  }else if (key == 'a'){
        strokesize = strokesize -1;    
  }else if (key == 'w'){
        background(200);
      println(strokesize);
  }else if (key == '0'){
    strokecolorR = 0;
    strokecolorG = 0;
    strokecolorB = 0;
  }else if (key == '1'){
    strokecolorR = 255;
    strokecolorG = 0;
    strokecolorB = 0;
}//END keypressed()
}
void setup(){
  size(1920,1080);  
  stroke(0, 180);
}//END setup()

void draw(){
  if (strokesize == 0){
    strokesize = 1;
  }
  if (mousePressed){
    if (mouseButton == LEFT){
      stroke(strokecolorR, strokecolorG, strokecolorB, 180);
      strokeWeight(strokesize);
      println(strokesize);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }else{
      strokecolor = 200;
      stroke(strokecolor, 180);
      strokeWeight(strokesize);
      println(strokesize);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }//END else
  }//END if mousePressed
}//END draw()
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
    //red
    strokecolorR = 237;
    strokecolorG = 26;
    strokecolorB = 61;
  }else if (key == '2'){
    //orange
    strokecolorR = 243;
    strokecolorG = 152;
    strokecolorB = 0;
  }else if (key == '3'){
    //yerrow
    strokecolorR = 255;
    strokecolorG = 212;
    strokecolorB = 0;
  }else if (key == '4'){
    //green
    strokecolorR = 0;
    strokecolorG = 128;
    strokecolorB = 0;
  }else if (key == '5'){
    //light blue
    strokecolorR = 175;
    strokecolorG = 223;
    strokecolorB = 228;
  }else if (key == '6'){
    //blue
    strokecolorR = 0;
    strokecolorG = 103;
    strokecolorB = 192;
  }else if (key == '7'){
    //purple
    strokecolorR = 167;
    strokecolorG = 87;
    strokecolorB = 168;
  }else if (key == '8'){
    //white
    strokecolorR = 255;
    strokecolorG = 255;
    strokecolorB = 255;
  }else if (key == '9'){
    //brown
    strokecolorR = 153;
    strokecolorG = 76;
    strokecolorB = 0;
  }
    
}//END keypressed()
void setup(){
  size(1920,1080);  
  smooth();
  stroke(0, 180);
  background(200);
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
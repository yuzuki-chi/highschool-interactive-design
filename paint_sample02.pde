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

}//end setup()
void draw(){
    //eraser rect
  strokeWeight(1);
  fill (200);
  rect (1800, 1000, 130, 80);
  noStroke ();
  //brak rect
  fill (0, 0, 0);
  rect (1800, 0, 130, 100);
  //red rect
  fill (237, 26, 61);
  rect (1800, 100, 130, 100);
  //orange rect
  fill (243, 152,0);
  rect (1800, 200, 130, 100);
  //yerrow rect
  fill (255, 212, 0);
  rect (1800, 300, 130, 100);
  //green rect
  fill (0, 128, 0);
  rect (1800, 400, 130, 100);
  //light blue rect
  fill (175, 223, 228);
  rect (1800, 500, 130, 100);
  //blue rect
  fill (0, 103, 192);
  rect (1800, 600, 130, 100);
  //purple rect
  fill (167, 87, 168);
  rect (1800, 700, 130, 100);
  //white rect
  fill (255, 255, 255);
  rect (1800, 800, 130, 100);
  //broen rect
  fill (153, 76, 0);
  rect (1800, 900, 130, 100);
  
    if (mouseX > 1800 && mouseY >=0 && mouseY <=100){
    //brack
    strokecolorR = 0;
    strokecolorG = 0;
    strokecolorB = 0;
  }else if (mouseX > 1800 && mouseY > 100 && mouseY <=200){
    //red
    strokecolorR = 237;
    strokecolorG = 26;
    strokecolorB = 61;
  }else if (mouseX > 1800 && mouseY > 200 && mouseY <=300){
    //orange
    strokecolorR = 243;
    strokecolorG = 152;
    strokecolorB = 0;
  }else if (mouseX > 1800 && mouseY >300 && mouseY <= 400){
    //yerrow
    strokecolorR = 255;
    strokecolorG = 212;
    strokecolorB = 0;
  }else if (mouseX > 1800 && mouseY > 400 && mouseY <= 500){
    //green
    strokecolorR = 0;
    strokecolorG = 128;
    strokecolorB = 0;
  }else if (mouseX > 1800 && mouseY > 500 && mouseY <=600){
    //light blue
    strokecolorR = 175;
    strokecolorG = 223;
    strokecolorB = 228;
  }else if (mouseX > 1800 && mouseY > 600 && mouseY <=700){
    //blue
    strokecolorR = 0;
    strokecolorG = 103;
    strokecolorB = 192;
  }else if (mouseX > 1800 && mouseY >700 && mouseY <=800){
    //purple
    strokecolorR = 167;
    strokecolorG = 87;
    strokecolorB = 168;
  }else if (mouseX > 1800 && mouseY >800 && mouseY <=900){
    //white
    strokecolorR = 255;
    strokecolorG = 255;
    strokecolorB = 255;
  }else if (mouseX > 1800 && mouseY > 900 && mouseY <=1000){
    //brown
    strokecolorR = 153;
    strokecolorG = 76;
    strokecolorB = 0;
  }else if (mouseX > 1800 && mouseY > 1000 && mouseY <=1100){
    //eraser
    strokecolorR = 200;
    strokecolorG = 200;
    strokecolorB = 200;
  }
  println (mouseX);
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
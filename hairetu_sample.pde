Maru[] hairetu;
//配列hairetuを宣言。配列の変数の型はMaruクラス。

void setup(){
  size(500,500);
  hairetu= new Maru[1000];
//始めに配列の長さを定義している。 
  for(int i=0; i<hairetu.length; i++){
    Maru maru = new Maru(random(width),random(height));
//ここでクラスの宣言もしつつ、クラス変数maruに値を入力している。 
    hairetu[i]=maru;
//配列にmaruを入力していく。 
  }
}

void draw(){
  background(0);
  for(Maru maru:hairetu){
//配列変数の型　変数名　配列名で配列要素繰り返しを簡単に書ける。 
    maru.draw();
  }
}

class Maru{
  float x,y;
  Maru(float x, float y){
//void setupで入力された値はここにくる。 
    this.x=x;
    this.y=y;
  }
  void draw(){
    noStroke();
    fill(random(255),random(255),random(255),60);
    y+=1;
    if(y>height)y-=height;
    ellipse(x,y,10,10);
  }
}
    

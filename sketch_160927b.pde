import processing.video.*; // Videoを扱うライブラリをインポート
Capture camera; // ライブカメラの映像をあつかうCapture型の変数

void setup() {
  size(480, 320);
  camera = new Capture(this, width, height, 12); // Captureオブジェクトを生成
  camera.start();
}

void draw() {
  image(camera, 0, 0); // 画面に表示
} 

//カメラの映像が更新されるたびに、最新の映像を読み込む
void captureEvent(Capture camera) {
  camera.read();
}

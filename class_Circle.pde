class Circle {
  float x, y, dim, alhpa;
  float r, g, b;
  
  Circle (float x, float y, float dim) {
    this.x = x;
    this.y = y;
    this.dim = dim;
    this.alpha = random(0, 255);
    this.r = random(0, 255);
    this.g = random(0, 255);
    this.b = random(0, 255);
  }//end Circle

  void display() {
    noStroke();
    float timeSpeed = 0.02;
    float setMove = 100;
    float setNoise = 30;
    float setAlpha = 1;
    float setDim = 0.1;
    float phase = 0.1;
    float complexity = 8;
    //↑微調整してください↑
    
    FC = frameCount % reset;
    float t = FC * timeSpeed;
    
    float normx = norm(x, 0, width);
    float normy = norm(y, 0, height);
    
    float u = noise(
    t + phase,
    normx * complexity - phase,
    normy * complexity + phase );
    
    float v = noise(
    t - phase,
    normx * complexity - phase,
    normy * complexity + phase );
    
    float speed = (setNoise * noise(t, y, v)) / (c_max/setMove);
    
    y += lerp(-speed, speed, u);
    x += lerp(-speed, speed, v);
    alpha -= setAlpha * noise(-setAlpha, setAlpha, normx);
    dim -= setDim + noise(-setDim, setDim, normy);
    
    if (y>height || y< 0) y = random(0, height);
    if (x>width  || x< 0) x = random(0, width);
    if (alpha < 0) alpha = random(80, 100);
    if (dim < 0 || dim > c_dim) dim = random(c_dim);
    fill(r, g, b, alpha);
    ellipse(x, y, dim, dim);
  }//end Circle.display()
}//end class circle

class Bubble {
  float x, y;
  float sz, sp;
  float r, g, b;

  Bubble() {
    sz = (int)(Math.random()*80+20);
    r = (float)(Math.random()*256);
    g = (float)(Math.random()*256);
    b = (float)(Math.random()*256);
    x = (float)(Math.random()*width);
    y = height + sz;
    sz = (float)(Math.random()*30)+5;
    sp = sz * sz * factor;
  }
  Bubble(float r_, float g_, float b_) {
    this();
    r = r_;
    g = g_;
    b = b_;
  }
  
  Bubble(float x_, float y_) {
    this();
    x = x_;
    y = y_;
  }
  void move() {
    x += (int)(Math.random()*5)-2;
    if (r > 225 ||y > filterHeight+sz/2) {
      y -= sp;
    }
  }
  void show() {
    fill(r, g, b, 150);
    ellipse(x, y, sz, sz);
  }
}

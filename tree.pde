class Tree {
  float x, y, w, h;

  Tree(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  void display() {
    // Set ellipses and rects to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER);
    // tree body
    stroke(0);
    fill(175);
    rect(x, y, w, h);
  }
}

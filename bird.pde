class Bird {
  // bird's variables
  float x, y, w, h, circleSize;

  // bird constructor
  Bird(float tempX, float tempY, float tempW, float tempH, float tempcircleSize) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    circleSize = tempcircleSize;
  }
  //Bird hide
  void hide() {
    //bird move to center
    if (fgcolor<30) {
      x=width/2;
      y=height/2;
    }
  }
  // Move Bird
  void jiggle() { 
    // Change the location
    x = x + random(-5, 5);
    y = y + random(-5, 5);
    // Constrain Zoog to window
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  // Display 
  void display() {
    // Set ellipses and rects to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER);  
    // // Draw Zoog's arms with a for loop
    // for (float i = y-h/3; i < y + h/2; i += 10) {
    //   stroke(0);
    //   line(x-w/4,i,x + w/4,i);
    // }
    // // Draw Zoog's body
    // stroke(0);
    // fill(175);
    // rect(x,y,w/6,h);
    // Draw Zoog's head
    stroke(0);
    fill(255);
    ellipse(x, y-h, w, h);
    // // Draw Zoog's eyes
    // fill(0);
    // ellipse(x-w/3,y-h,eyeSize,eyeSize*2);
    // ellipse(x + w/3,y-h,eyeSize,eyeSize*2);
    // // Draw Zoog's legs
    // stroke(0);
    // line(x-w/12,y + h/2,x-w/4,y + h/2 + 10);
    // line(x + w/12,y + h/2,x + w/4,y + h/2 + 10);
  }
}

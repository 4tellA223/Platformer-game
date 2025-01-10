class Button {
  // instance var
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;
 PImage img;
 boolean isImg =false;


  //construct
  Button(String t, int x1, int y1, int w1, int h1, color norm, color high) {
    x =x1;
    y = y1;
    w = w1;
    h= h1;
    highlight = high;
    normal = norm;
    text = t;
    clicked = false;
  }Button(PImage img1, int x1, int y1, int w1, int h1, color norm, color high) {
    img =img1;
    x =x1;
    y = y1;
    w = w1;
    h= h1;
    highlight = high;
    normal = norm;
    clicked = false;
    isImg =true;
  }
  
   //behaving function
  void show() {
    drawButton();
    drawLabel();
    clicks();
  if(clicked)ispaused = !ispaused;
  }


  boolean touchingMouse() {
    return mouseX> x-w/2 && mouseX<x+w/2 && mouseY > y-h/2 && mouseY< y+h/2;
  }


  void drawButton() {
    rectMode(CENTER);
    stroke(0);
    strokeWeight(4);
    if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    rect(x, y, w, h, 30);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    textSize(w/4);
    if (touchingMouse()) {

      fill(normal);
    } else {
      fill(highlight);
    }
    if(!isImg)
    text(text, x, y);
    if(isImg){
      imageMode(CENTER);
    image(img,x,y,150,150);
    }
  }


  void clicks() {
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked =false;
    }
  }
}

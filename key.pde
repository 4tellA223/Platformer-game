void keyPressed() {
  if (isDead) return;
  if (key == 'w' || key =='W') {
    wkey = true;
  }
  if (key == 'a' || key =='A')akey = true;
  if (key == 'd' || key =='D')dkey = true;
  if (key == 's' || key =='S')skey = true;
  if (key == 'e' || key =='E')ekey = true;
  if (key == 'm' || key =='M')zkey = true;

  if (keyCode == UP)upkey = true;
  if (keyCode == RIGHT)rightkey =true;
  if (keyCode == LEFT) leftkey =true;
  if (keyCode == DOWN) downkey =true;
}

void keyReleased() {
  if (isDead) return;
  if (key == 'w' || key =='W')wkey = false;
  if (key == 'a' || key =='A')akey = false;
  if (key == 'd' || key =='D')dkey = !true;
  if (key == 's' || key =='S')skey = false;
  if (key == 'e' || key =='E')ekey = !true;
  if (key == 'm' || key =='M')zkey =!true;


  if (keyCode == UP)upkey = !true;
  if (keyCode == RIGHT)rightkey = !true;
  if (keyCode == LEFT) leftkey = !true;
  if (keyCode == DOWN) downkey =!true;
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}

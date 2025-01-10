class FBluebat extends FGameObject {

  int direction = L;
  int frame = 0;
  int speed = 85;
  int timer = 200;

  FBluebat(float x, float y) {
    super();
    setName("bluebat");
    setPosition(x, y);
    setRotatable(false);
  }
  void act() {
    if (!ispaused) {
      animate();
      collide();
      move();
      ThrowHammer();
    }
  }

  void animate() {
    if (frame >= Bluebat.length) frame = 0;
    if (frameCount%5 == 0) {
      if (direction == R)attachImage(reverseImage(Bluebat[frame]));
      if (direction == L)attachImage(Bluebat[frame]);
      frame++;
    }
  }
  void collide() {
    if (checkForCollisions("goombaWall")) {
      direction *= -1;
      setPosition(getX()+direction*gridSize/6, getY());
    }
    if (checkForCollisions("player")) {
      if (player.getY() < getY() - gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        player.lives--;
        player.setPosition(200, 0);
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
  //==========================================
  void ThrowHammer() {
    timer--;

    if (timer < 0) {
      FBox hammer = new FBox(10, 10);
      hammer.setPosition(getX(), getY());
      hammer.setVelocity(200*direction, -500);
      hammer.setAngularVelocity(55);
      hammer.setSensor(true);
      hammer.attachImage(Hammer);
      hammer.setName("hammer");
      world.add(hammer);
      timer=(int)random(200, 300);
    }
  }
}

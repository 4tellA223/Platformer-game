class FCrackshot extends FGameObject {

  int direction = L;
  int frame = 0;
  int speed = 85;

  FCrackshot(float x, float y) {
    super();
    setName("Crackshot");
    setPosition(x, y);
    setRotatable(false);
  }
  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= crackshot.length) frame = 0;
    if (frameCount%5 == 0) {
      if (direction == R)attachImage(crackshot[frame]);
      if (direction == L)attachImage(reverseImage(crackshot[frame]));
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
        player.setVelocity(player.getVelocityX(),-300);
      } else {
        player.lives--;
        player.setPosition(200, 0);
      }
    }
  }
  
  void move(){
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}

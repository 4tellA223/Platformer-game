class FLadders extends FGameObject {

  FLadders(float x, float y) {
    super();
    setName("ladders");
    setPosition(x, y);
    setRotatable(false);
    setSensor(true);
    setStatic(true);
  }
  void act() {
    animate();
    climb();
  }

  void climb() {
    float vx = player.getVelocityX();
    if (wkey && checkForCollisions("player")) player.setVelocity(vx, -450);
    else if (wkey && checkForCollisions("player") )player.setVelocity(vx, 450);
  }

  void animate() {
    attachImage(ladders);
  }
}

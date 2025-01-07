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
    if (checkForCollisions("player")) {
      player.setVelocity(vx * 0.5f, player.getVelocityY());
      if (wkey) {
        player.setVelocity(vx, -200);
      } else if (skey) {
        player.setVelocity(vx, 200);
      }
    }
  }

  void animate() {
    attachImage(ladders);
  }
}

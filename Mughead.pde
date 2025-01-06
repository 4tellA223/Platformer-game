class FMughead extends FGameObject {

  int direction = L;
  int frame = 0;

  FMughead(float x, float y) {
    super();
    setName("Mughead");
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    animate();
  }
  void animate() {
    if (frame == 5) frame = 0;
    if (player.getX()<getX())attachImage(reverseImage(mughead[frame]));
    else attachImage(mughead[frame]);
    if (frameCount % 20 ==0) frame++;
  }
}

class FBridge extends FGameObject {

  FBridge(float x, float y) {
    super();
    setName("bridge");
    setPosition(x, y);
    attachImage(bridge);
    setFriction(34);
    setStatic(true);
  }
  void act() {
    if (checkForCollisions("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}

class FPortal extends FGameObject {

  int frame = 0;

  FPortal(float x, float y) {
    super();
    setName("portal");
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    if (!ispaused) {
      animate();
      switchMap();
    }
  }
  void animate() {
    if (openPortal) {
      if (frame == 9) frame = 0;
      attachImage(reverseImage(portal[frame]));
      if (frameCount % 5 ==0) frame++;
    } else {
      attachImage(reverseImage(closedPortal));
    }
  }

  void switchMap() {
    if (mapMode == 0 && checkForCollisions("player") && openPortal) {
      mapMode = 1;
      MODE = MAPB;
      loadWorld(map[mapMode]);
      world.add(player);
      player.setPosition(180, 380);
    }
    if (mapMode == 2 && checkForCollisions("player") && openPortal) {
      mapMode = 0;
      MODE = MAPA;
      loadWorld(map[mapMode]);
      world.add(player);
      player.setPosition(80, 180);
    }
    if ( mapMode == 1 && checkForCollisions("player") && openPortal) {
      gameover();
    }
  }
}

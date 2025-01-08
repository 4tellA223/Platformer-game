class FPlayer extends FGameObject {

  //fields
  int frame;
  int direction;
  int lives;
  int respawnTimer = 20;

  FPlayer() {
    super();
    frame = 0;
    direction = R;
    setPosition(1780, 1500);
    setRotatable(false);
    setName("player");
  }
  void act() {
    if (isDead) {
      handleDeath();
    } else {
      handleInput();
      animate();
      checkPoints();
      playerDeath();
    }
  }
  //=================================================INPUT==============================================
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (vy <= 2 && player.checkForCollisions("ground")) {
      action = idle;
    }
    if (akey && respawnTimer >= 15) {
      action = run;
      direction =L;
      setVelocity(-500, vy);
    }
    if (dkey && respawnTimer >= 15) {
      action = run;
      direction =R;
      setVelocity(500, vy);
    }
    if (!player.checkForCollisions("ground")) {
      action = jump;
    }
    if (wkey && player.checkForCollisions("ground") && respawnTimer >= 15) {
      setVelocity(vx, -450);
    }
    if (zkey) {
      zoom = 0.35;
    } else if (!zkey)zoom = 1.5;
  }
  //============================================ANIMATE==============================================
  void animate() {

    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R)attachImage(action[frame]);
      else if (direction == L)attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  //================================CHECK POINT==================================
  void checkPoints() {
    if (player.checkForCollisions("Mughead")) {
      respondX = getX();
      respondY = getY();
    }
  }
  //==============================HARMFUL VARIABLE============================
  void playerDeath() {
    if (player.checkForCollisions("spikes") || player.checkForCollisions("world edge")) {
      isDead =true;
      setPosition(respondX, respondY);
      setVelocity(0, 0);
      resetKeys();
      if (countHealth>1)
        countHealth --;
      else
        gameover = true;
    }
  }
  //=========================DEATH COUNTDOWN=======================================
  void handleDeath() {
    if (isDead) {
      setVelocity(0, 0);
      respawnTimer--;
      if (respawnTimer <= 0) {
        isDead = false;
        setPosition(respondX, respondY);
        resetKeys();
        respawnTimer = 20;
      }
    }
  }
  //=============================RESET KEY=================================
  void resetKeys() {
    akey = false;
    dkey = false;
    wkey = false;
    skey = false;
    upkey = false;
    downkey = false;
    rightkey = false;
    leftkey = false;
  }
  //==============================GAMEOVERBG==================
}

class FPlayer extends FGameObject {

  //fields
  int frame;
  int direction;
  int lives;

  FPlayer() {
    super();
    frame = 0;
    direction =R;
    if(mapMode == 0)
    setPosition(80, 180);
    else if(mapMode ==1)
    setPosition(180,400);
    setRotatable(false);
    setName("player");
  }
  void act() {
    handleInput();
    animate();
    checkPoints();
    playerDeath();
  }
  //=================================================INPUT==============================================
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (vy <= 2 && player.checkForCollisions("ground")) {
      action = idle;
    }
    if (akey) {
      action = run;
      direction =L;
      setVelocity(-500, vy);
    }
    if (dkey) {
      action = run;
      direction =R;
      setVelocity(500, vy);
    }
    if (!player.checkForCollisions("ground")) {
      action = jump;
    }
    if (wkey && player.checkForCollisions("ground")) {
      setVelocity(vx, -450);
    }if(zkey){
      zoom = 0.35;
    }else if(!zkey)zoom = 1.5;
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
    //CONTACTING HARMFUL OBJECTS
    if (player.checkForCollisions("spikes")) {
      setPosition(respondX, respondY);
    }else if (player.checkForCollisions("world edge")) {
      setPosition(respondX, respondY);
    }
    
  }
}

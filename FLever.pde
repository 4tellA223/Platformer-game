 class FLever extends FGameObject {
   boolean open = false;

  FLever(float x, float y) {
    super();
    setName("lever");
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setSensor(true);
  }
  
  void act() {
    animate();
    countLeverOpen();
  }
  void animate(){
    if(ekey && checkForCollisions("player") && !open){
      countLever--;
      open = true;
      print(countLever);
    }
    if(!open)attachImage(closeLever);
      else if(open){
        attachImage(openLever);
      }
  }
  void countLeverOpen(){
    if(countLever == 0) openPortal =true;
   }

  
}

void mapB(PImage img) {
  // RESET
  openPortal = false;
  countLever= 5;
  countHealth = 6;

  //CREATE MAP
  for (int  y = 0; y<img.height; y++) {
    for (int x = 0; x < img.width; x++ ) {

      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setNoStroke();
      b.setStatic(true);
      b.setGrabbable(false);
      b.setFriction(46);

      color c = img.get(x, y); //color of current pixel
      color s = img.get(x, y+1); // color below current pixel
      color w = img.get(x-1, y); // color west of current pixel
      color e = img.get(x+1, y); //color east of current pixel
      color n = img.get(x, y-1); //color ontop of current pixel

      if (c == grass) {   //GROUND
        b.attachImage(rock);
        b.setName("ground");
        world.add(b);
      } else if (c == lightGreen) { //Rock with moss
        b.attachImage(mossRock);
        b.setName("ground");
        world.add(b);
      } else if (c == orange) { // LADDER
        FLadders ld = new FLadders(x*gridSize, y*gridSize);
        lve.add(ld);
        world.add(ld);
      } else if (c == darkGreen) { //VINE
        b.attachImage(vine);
        b.setName("vine");
        b.setStatic(true);
        b.setSensor(true);
        world.add(b);
      } else if (c == yellow) { // bridge
        FBridge bg = new FBridge(x*gridSize, y*gridSize);
        lve.add(bg);
        world.add(bg);
      } else if (c == spike) { // gooomba floor
        b.setName("goombaFloor");
        b.setFill(255, 0);
        world.add(b);
      } else if (c == blueCuphead) {
        b.setName("goombaWall");
        b.setStatic(true);
        b.setSensor(true);
        b.setFill(255, 0);
        world.add(b);
      } else if ( c == purple) {
        FBluebat bb = new FBluebat(x*gridSize, y*gridSize);
        npc.add(bb);
        world.add(bb);
      } else if ( c == black) {
        FPortal prt = new FPortal(x*gridSize, y*gridSize);
        Portal = prt;
        world.add(prt);
      } else if ( c == brown) {
        FLever lev = new FLever(x*gridSize, y*gridSize);
        lve.add(lev);
        world.add(lev);
      } else if (c == red) {
        FMughead mgh = new FMughead(x*gridSize, y*gridSize);
        npc.add(mgh);
        world.add(mgh);
      }
    }
  }
}

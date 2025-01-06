void mapA(PImage img) {
  loadAWorld(img);
}
//===========================================================================
void loadAWorld(PImage img) {

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

      if (c == grass && n != grass && w == grass && e == grass) {   //GROUND TOP MID 
        b.attachImage(grasstopmid);
        b.setName("ground");
        world.add(b);
      } else if( c== grass && w != grass && n != grass  ){ // GROUND TOP LEFT
        b.attachImage(grasstopleft);
        b.setName("ground");
        world.add(b);
      }else if( c == grass && e != grass && n != grass){// GROUND TOP RIGHT
        b.attachImage(grasstopright);
        b.setName("ground");
        world.add(b);
      }else if (c == grass && n == grass) { //GROUND BOTTOM
        b.attachImage(grassbottom);
        b.setName("wall");
        world.add(b);
      } else if (c == blueCuphead) { //npc cuphead
        FMughead mgh = new FMughead(x*gridSize, y*gridSize);
        npc.add(mgh);
        world.add(mgh);
      } else if (c == spike && e == grass && s != grass && w != grass ) {//spikes right
        b.attachImage(spikesRight);
        b.setName("spikes");
        world.add(b);
      } else if ( c== spike && n == spike && e == grass && s == grass && w != grass) {
        b.attachImage(spikesRight);
        b.setName("spikes");
        world.add(b);
      } else if (c == spike && e == grass && s == grass && n == grass) {//spikes left
        b.attachImage(spikesLeft);
        b.setName("spikes");
        world.add(b);
      } else if (c == spike && w == grass && s == spike) {// spikes on spikes left
        b.attachImage(spikesLeft);
        b.setName("spikes");
        world.add(b);
      } else if (c== spike && s == grass && w == grass && n == spike) {// spikes below spikes left
        b.attachImage(spikesLeft);
        b.setName("spikes");
        world.add(b);
      } else if ( c == spike ) {
        b.attachImage(spikes);
        b.setName("spikes");
        world.add(b);
      } else if (c == black) { // World Edge
        b.setName("world edge");
        b.attachImage(walls);
        world.add(b);
      } else if (c == lever) {//Lever
        FLever lev = new FLever(x*gridSize, y*gridSize);
        lve.add(lev);
        world.add(lev);
      } else if (c == purple) { //teleport portal
        FPortal prt = new FPortal(x*gridSize,y*gridSize);
        Portal = prt;
        world.add(prt);
      }else if( c == lightGreen){ //goomba wall
        b.setName("goombaWall");
        b.setStatic(true);
        b.setSensor(true);
        b.setFill(255,0);
        world.add(b);
      }else if( c == brown){// crackshot
        FCrackshot cs = new FCrackshot(x*gridSize,y*gridSize);
        enemies.add(cs);
        world.add(cs);
      }
    }
  }
}

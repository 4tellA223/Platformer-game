void mapB(PImage img) {
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
        FLadders ld = new FLadders(x*gridSize, x*gridSize);
        lve.add(ld);
        world.add(ld);
      }else if(c == darkGreen){ //VINE
        b.attachImage(vine);
        b.setName("vine");
        b.setStatic(true);
        b.setSensor(true);
        world.add(b);
      }
    }
  }
}

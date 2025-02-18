import fisica.*;
FWorld world;

//VARIABLE
int gridSize = 32;
float zoom = 1.5;
boolean keyReleased, wasPressed;
boolean gameover;
PFont game;
Button pause;
boolean mouseReleased;
color dark = #B2FFE2;
color light = #B2B5FF;
boolean ispaused = false;

//Map variables
PImage[] map;
PImage background, gameoverBG, gameoverWin;
PImage grasstopmid, grassbottom, grasstopleft, grasstopright;
PImage closedPortal;
PImage spikes, spikesRight, spikesLeft;
PImage openLever, closeLever;
PImage walls, ladders;
PImage Hammer;


float respondX = 80;
float respondY = 180;
int countLever = 0;
boolean openPortal = false;
int countHealth = 6;

// MAPB
PImage rock, mossRock;
PImage vine;
PImage bridge;

int MODE = 0;
final int INTRO   = 0;
final int MAPA    = 1;
final int MAPB    = 2;
final int GAMEOVER= 3;
int mapMode = 2;

//PLAYER VAIRABLE
FPlayer player;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, ekey, zkey;
boolean isDead = false;
boolean Death = false;
PImage[] action;
PImage[] idle;
PImage[] aim;
PImage[] run;
PImage[] jump;

PImage[] mughead;
PImage[] Bluebat;
PImage[] portal;
PImage[] crackshot;
PImage[] health;

//COLORS
color grass = #a8e61d;
color blueCuphead = #00b7ef;
color spike = #b4b4b4;
color black = #000000;
color lever = #ff7e00;
color purple = #6f3198;
color brown = #9c5a3c;
color lightGreen = #d3f9bc;

color darkGreen = #22b14c;
color orange = #ff7e00;
color yellow =#fff200;
color red = #ed1c24;

//GAME
ArrayList<FGameObject> npc;
ArrayList<FGameObject> lve;
ArrayList<FGameObject> enemies;
FGameObject Portal;



//=========================================SETUP==============================================

void setup() {

  //DEFAULT
  
  //fullScreen();
  size(900, 900);
  Fisica.init(this);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  npc = new ArrayList();
  lve= new ArrayList();
  Portal = new FGameObject();
  enemies = new ArrayList();
  map = new PImage[3];

  game = createFont("GAME_glm.ttf", 128);
  pause = new Button("pause",800,70,150,90,dark,light);


  //LOAD IMAGE
  loadImages();


  //LOAD VARIABLE

  loadWorld(map[mapMode]);
  loadPlayer();
}
//=======================================LOAD IMAGE=========================
void loadImages() {
  //LOAD IMAGE
  map[0] = loadImage("map.png");
  map[1] = loadImage("map2.png");
  map[2] = loadImage("Intromap.png");
  gameoverBG = loadImage("texture/gameOver.jpg");
  background = loadImage("background1.png");
  gameoverWin = loadImage("gameoverWin.jpg");

  //MAP A
  spikes = loadImage("texture/spike.png");
  spikesRight =loadImage("texture/spike_right.png");
  spikesLeft = loadImage("texture/spike_left.png");
  openLever = loadImage("texture/Lever_open.png");
  closeLever = loadImage("texture/Lever_close.png");
  walls = loadImage("texture/wall.png");
  closedPortal = loadImage("texture/portal/closedPortal.png");
  grasstopmid = loadImage("texture/grass_topmid.png");
  grassbottom = loadImage("texture/grass_mid.png");
  grasstopright = loadImage("texture/grass_topright.png");
  grasstopleft = loadImage("texture/grass_topleft.png");

  // MAPB
  rock = loadImage("texture/rock.png");
  mossRock = loadImage("texture/rockMoss.jpg");
  ladders = loadImage("texture/Ladders.png");
  vine = loadImage("texture/vine.png");
  bridge = loadImage("texture/bridge.jpg");
  Hammer = loadImage("texture/spear.png");

  //MAP


  //RESIZE
  grasstopmid.resize(gridSize, gridSize);
  grasstopright.resize(gridSize, gridSize);
  grasstopleft.resize(gridSize, gridSize);
  grassbottom.resize(gridSize, gridSize);
  background.resize(width, height);
  gameoverBG.resize(width, height);
  gameoverWin.resize(width,height);
  spikes.resize(gridSize, gridSize);
  spikesRight.resize(gridSize, gridSize);
  spikesLeft.resize(gridSize, gridSize);
  openLever.resize(gridSize, gridSize);
  closeLever.resize(gridSize, gridSize);
  walls.resize(gridSize, gridSize);
  closedPortal.resize(gridSize*2, gridSize*2);


  //MAPB
  rock.resize(gridSize, gridSize);
  mossRock.resize(gridSize, gridSize);
  ladders.resize(gridSize, gridSize);
  ladders.resize(gridSize, gridSize);
  vine.resize(gridSize, gridSize);
  bridge.resize(gridSize, gridSize);
  Hammer.resize(gridSize,gridSize);

  //GIF MAP VARIABLE===============================================
  portal = new PImage[9];

  for (int i = 0; i<portal.length; i++) {
    portal[i] = loadImage("texture/portal/frame_"+i+"_delay-0.1s.gif");
    portal[i].resize(gridSize*2, gridSize*2);
  }


  //PLAYER MOVEMENT ===================================================
  //IDLE
  idle = new PImage[5];

  for (int i = 0; i<idle.length; i++) {
    idle[i] = loadImage("cuphead/idle/cuphead_idle_000" + i + ".png");
    idle[i].resize(gridSize, gridSize);
  }

  //RUN
  run = new PImage[16];

  for (int i = 1; i<= run.length; i++) {
    run[i-1] = loadImage("cuphead/run/cuphead_run_000" + i + ".png");
    run[i-1].resize(gridSize, gridSize);
  }

  //JUMP
  jump = new PImage[8];

  for (int i = 1; i <= jump.length; i ++) {
    jump[i-1] = loadImage("cuphead/jump/cuphead_jump_000" + i + ".png");
    jump[i-1].resize(gridSize, gridSize);
  }
  
  //BLUEBAT
  Bluebat = new PImage[5];

  for (int i = 1; i<= Bluebat.length; i++) {
    Bluebat[i-1] = loadImage("NPC/BlueBat/Imp idle__devil_ph3_small_demon_idle_000" + i + ".png");
    Bluebat[i-1].resize(gridSize, gridSize);
  }

  //HEALTH BAR
  health = new PImage[countHealth];
  for (int i = 1; i <= health.length; i ++) {
    health[i-1] = loadImage("texture/healthBar0" + i + ".png");
    health[i-1].resize(gridSize*4, gridSize);
  }

  action = idle;

  //==========================CHARACTER IMAGE==========================

  //mughead
  mughead = new PImage[5];
  for (int i = 1; i <= mughead.length; i ++) {
    mughead[i-1] = loadImage("NPC/MugHead/mugman_idle_000" + i + ".png");
    mughead[i-1].resize(gridSize, gridSize);
  }

  crackshot = new PImage[12];
  for (int i = 1; i <= crackshot.length; i ++) {
    crackshot[i-1] = loadImage("NPC/Crackshot/crackshot_ex_idle_000" + i + ".png");
    crackshot[i-1].resize(gridSize, gridSize);
  }
}

//==========================================LOAD WORLD=============================================

void loadWorld(PImage img) {
  //LOAD MAP
  world = new FWorld(-3000, -3000, 3000, 3000);
  world.setGravity(0, 900);


  if (mapMode == 2) {
    intro(img);
  } else if (mapMode == 0) {
    mapA(img);
  } else if (mapMode == 1) {
    mapB(img);
  }
  
}
//==========================================LOAD PLAYERS=============================================

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

//==========================================DRAW=============================================

void draw() {
  background(255);

  
    drawWorld();
    player.act();
    
  if(ispaused || gameover){
    fill(0, 0, 0, 128); 
    rect(0, 0, width+width, height+height); 
    
    fill(255);
    textSize(48);
    if(ispaused)
    text("Game Paused", width / 2, height / 2);
  }
}

//==========================================DRAW WORLD=============================================

void drawWorld() {

  image(background, 0, 0);


  if (mapMode == 2) {
    textFont(game);
    textSize(48);
    fill(0, 408, 612);
    text("WALK TO PORTAL TO BEGIN", 450, 200);
    fill(0, 408, 612);
  }



  pushMatrix();
  if (!zkey)translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);

  scale(zoom);
  world.step();
  world.draw();

  popMatrix();

  for (int i = 0; i<npc.size(); i++) {
    FGameObject n = npc.get(i);
    n.act();
  }
  for (int i = 0; i < lve.size(); i++) {
    FGameObject l = lve. get(i);
    l.act();
  }
  for ( int i = 0; i < enemies.size(); i++) {
    FGameObject emy = enemies.get(i);
    emy.act();
  }

  Portal.act();
  //ONTOP EVERYTHING
  if(!gameover){
  image(health[countHealth-1], 40, 50);
  click();
  pause.show();
  }

  if (gameover) gameover();
}
//============================================================
void drawBackground(PImage img) {
  image(img, 0, 0);
}

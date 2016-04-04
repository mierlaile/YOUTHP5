import ddf.minim.*;
import ddf.minim.analysis.*;
import peasy.*;

PImage bg;
PeasyCam cam;
float easing=0.01;;
PVector center = new PVector(0, 0, 0);
Attactor [] attactor;
float []posx,posy,posz;
color [] col = {#c437ff, #3446ff, #357bfd, #346efe, #8927b2, #2265b4,#31d4ff,#dd2aff};
ArrayList <Particle> particles;
Minim minim;
AudioPlayer music;
PShape shapezhui;
//PShape circle;
PFont posFont;
int Step=0;
int starti,endi;
float starts, ends,startm,endm;
int lineGnum=15;
Icosahedron ico;
CreateImage  []create;
float icoSize=1;
float icoRot = 60;
int fading=0;
PImage youth;
ArrayList<Logo> logo;
float logoAngel=0;
//ArrayList<Particle> particlesyouth;
int r=0;
PointCloud pc;
PImage [] imglist;
PImage testImg;
boolean showImage = false, randomImage = true, transparentBackground = true, moveRandom = false, doPause = false;
int count=0;
int page=1;
float theta=0.0;
PImage []cygc,jh,sjb,sys,sl;
String [] bumenname = {"Design","Message","Salon","Interaction","Laboratory"};
void setup() {
  size(1024, 768, P3D);
  bg = loadImage("bg1.jpg");
  pixelDensity(1);
  cam = new PeasyCam(this,300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(600);
  posx = new float [5];
  posy = new float [5];
  posz = new float [5];
  for(int i=0;i<5;i++){
    posx[i] = cos(radians(72*i))*random(150,180);
    posy[i] = sin(radians(72*i))*random(150,180);
    posz[i] = random(-250,250);
  }
  attactor = new Attactor [6];
  for (int i=0; i<5; i++) {
    attactor[i] = new Attactor(i);
  }
  attactor[5] = new Attactor(center);
  particles = new ArrayList<Particle> ();
  minim = new Minim(this);
  music = minim.loadFile("Girls.mp3");
  music.play();
  //music.loop();
  shapezhui = createShape();
  initialShapezhui();
  //  circle = createShape(ELLIPSE,0,0,1,1);
  posFont = loadFont("ACaslonPro-Regular-48.vlw");
  //posFont = loadFont("MicrosoftYaHeiLight-48.vlw");
  starti=0;
  starts=second();
  startm=minute();
  rectMode(CENTER);
  ico  = new Icosahedron(icoSize);
  create = new CreateImage[20];
  for (int i=0; i<20; i++) {
    create[i] = new CreateImage();
    create[i].creat();
  }
  youth = loadImage("youth.jpg");
  logo = new ArrayList<Logo>();
  //ico.create();
  youth.loadPixels();
  for(int i=0;i<youth.width;i=i+10){
    for(int j=0;j<youth.height;j=j+10){
      float loc = i+j*youth.width;
      if(youth.get(i,j) !=color(255)) {
         logo.add(new Logo(new PVector(i-width/2,j-height/2,0)));
      }
    }
  }
  youth.updatePixels();
  //particlesyouth = new ArrayList<Particle>();
  //for(int i=0;i<logo.size();i++){
  //  particlesyouth.add(new Particle(center));
  //}
  imglist = new PImage [0];
  imglist = (PImage []) append (imglist, loadImage ("youthb.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("all.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("cy.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("jh.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("sjb.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("sl.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("sys.jpg"));

  //for (int i = 0; i < imglist.length; i++)
  //{
  //  if (imglist[i].width != width) imglist[i].resize (width, height);
  //}

  testImg = imglist [0];


  pc = new PointCloud (8000);

  float cx, cy;
  while (pc.p.length <= pc.length)
  {
    float [] [] target = (float[] []) findTargets (1, testImg);
    
    cx = random (width);
    cy = random (height);
    pc.addPatricel (new TargetParticle(cx, cy, target[0][0], target[0][1]));
  }
  cygc = new PImage[5];
  for(int i=0;i<5;i++){
    cygc[i] = loadImage("cy"+nf(i+1,1)+".jpg"); 
  }
  jh = new PImage[5];
  for(int i=0;i<5;i++){
    jh[i] = loadImage("jh"+nf(i+1,1)+".jpg"); 
  }
  sjb = new PImage[5];
  for(int i=0;i<5;i++){
    sjb[i] = loadImage("sjb"+nf(i+1,1)+".jpg"); 
  }
  sl = new PImage[5];
  for(int i=0;i<5;i++){
    sl[i] = loadImage("sl"+nf(i+1,1)+".jpg"); 
  }
  sys = new PImage[5];
  for(int i=0;i<5;i++){
    sys[i] = loadImage("sys"+nf(i+1,1)+".PNG"); 
  }
  spherelinesetup();
  //pp = new PImage [10];
  //rd=new PVector(width, height);
  //rt=new PVector(width, 0);
  //ld=new PVector(0, height);
  //lt=new PVector(0, 0);
  //p1=new PVector();
  //p2=new PVector();
  //p3=new PVector();
  //p4=new PVector();
  //mid=new PVector();

  
  //hotZone=200;
  //turnLeft=false;
  //turnRight=false;
}

void draw() {
  //println(width+" "+height);
  //translate(width/2, height/2, 350);
  //directionalLight(255,255,255,-4, 92, -70);
  //directionalLight(255,255,255,61, -11, -105);
  //directionalLight(255,255,255,70,  104, -100);
  //directionalLight(255,255,255,-686,  -427, -116);
  //directionalLight(255,255,255,101,  -28, 229);
  background(bg);
  if(Step==0||Step==1||Step==2){
    pushMatrix();
    translate(0,0,-100);
    stroke(255,50);
    //fill(255);
    noFill();
    ellipse(0,0,music.mix.level()*4000,music.mix.level()*4000);
    ellipse(0,0,music.left.level()*4000,music.left.level()*4000);
    ellipse(0,0,music.right.level()*4000,music.right.level()*4000);
    popMatrix();
  }
  pushMatrix();
  if(Step==0||Step==1||Step==2){
    rotateY(-frameCount*PI/600);
  }
  if (Step==0)displayShapezhui(music.mix.level()*40);
  if (Step==1){IcosahedronPlay();spherelinedraw();}
  if (Step==2){IcosahedronPlay();fade();}
  if (Step==3)Youth();
  if (Step==4)YouthFade();
  if (Step==5) {background (255);System();}
  if (Step==6){background(255);bumen();}
  if(Step==0||Step==1){
  for (int i=0; i<5; i++) {
    attactor[i].display(i);
  }
  }
  if(Step==0||Step==1||Step==2)ball();
  popMatrix();
  STEP();
}
void keyPressed(){
  if(key=='1')Step=1;
  if(key=='2')Step=2;
  if(key=='3')Step=3;
  if(key=='4')Step=4;
  if(key=='5')Step=5;
}
void mousePressed(){

  if(Step==6){
    //if (mouseX>width-hotZone && mouseX<width && mouseY>height-hotZone && mouseY<height)
    //turnLeft=true;
    //if (mouseX>0 && mouseX<hotZone && mouseY>height-hotZone && mouseY<height)
    //turnRight=true;
    if(mouseButton==RIGHT)page++;
    if(mouseButton==LEFT)page--;
  }
  if(Step==5){
    if(count==2){count=7;
      //pp=cygc;
    }
    if(count==3){count=8;
      //pp=jh;
    }
    if(count==4){count=9;
      //pp=sjb;
    }
    if(count==5){count=10;
      //pp=sl;
    }
    if(count==6){count=11;
      //pp=sys;
    }
    //front=pp[0];
    //next=pp[1];
    //back=pp[pp.length-1];
  if(count==0) count=1;
  else if(count>=1&&count<=6){
      if(mouseX>350 && mouseX<600 && mouseY<250) count=4;//sjb
      else if(mouseX<320 && mouseY>230 && mouseY<400)count=2;//cy
      else if(mouseX>250 && mouseX<450 && mouseY>460)count=5;//sl
      else if(mouseX>550 && mouseX<760 && mouseY>460)count=6;//sys
      else if(mouseX>650 && mouseY>220 && mouseY<400)count=3;//jh
      //if(mouseX>510 && mouseX<830 && mouseY<215) count=4;//sjb
      //else if(mouseX<510 && mouseY>215 && mouseY<420)count=2;//cy
      //else if(mouseX<620 && mouseY>420)count=5;//sl
      //else if(mouseX>740 && mouseY>420)count=6;//sys
      //else if(mouseX>830 && mouseY>215 && mouseY<420)count=3;//jh
  }

  }
}
void mouseWheel(){
  if(count>=2) {Step=5;count=1;page=1;theta=0;} 
}
void STEP() {
  //endi = millis();
  ends = second();
  endm = minute();
  //if (endi-starti>=28000 && Step==0)Step=1;
  if ((ends-starts==23||ends-starts==-37 )&& Step==0)Step=1;
  if((ends-starts==40||ends-starts==-20 )&&(endm-startm==7||endm-startm==-53 )&& Step==1)Step=2;
  //if(Step==3)Step=4;
  if(count>=7) {  Step=6;}
}

void bumen(){
    if(count==7)cy();
    else if(count==8)jh();
    else if(count==9)sjb();
    else if(count==10)sl();
    else if(count==11)sys();
}
void System(){
  pushMatrix();
  translate(-width/2,-height/2);
  if (transparentBackground)
  {
    noStroke();
    fill (255, 80);
    rect (0, 0, width, height);
  }
  else background (255);
  pc.draw();
  if (pc.paused)
  {
    if (randomImage) testImg = imglist [count];
    updatePointCloud (testImg, moveRandom ? 1 : 0);
  }
  popMatrix();
}
void updatePointCloud (PImage img, int mode)
{
  float [] [] target = (float[] []) findTargets (pc.p.length, img);
  if (mode == 0) pc.update (target);
  else pc.updateSimple (target);
}
void YouthFade(){
  for(int i=0;i<logo.size();i++){
    Logo l = logo.get(i);
    l.youthfade();
    l.display();
    if(l.isDead())
     logo.remove(i);
  }
  if(logo.size()<20){
   fill(255);
   ellipse(0,0,r,r);
   r+=5;
  }
  if(r>1024){Step=5;music.pause();}
}
void Youth(){
  pushMatrix();
  translate(150,0,-300);
  rotateX(logoAngel);
  rotateY(logoAngel);
  rotateZ(logoAngel);
  logoAngel += PI/120;
  for(Logo l:logo){
    l.update();
    l.display();
  }
  popMatrix();
}
void fade(){
  //if(fading<particles.size()){
  //  for(int i=0;i<500;i++){
  //    if(i+fading<particles.size())
  //    {particles.remove(i+fading); i=500;}
  //  }
  //  fading=fading+500;
  //}
  for(int i=0;i<particles.size();i++){
    Particle p = particles.get(i);
    p.life--;
    if(p.isDead())
    particles.remove(i); 
  }
  //else 
  //Step=3;
}
void IcosahedronPlay() {
  if(Step==1)
  icoSize+=(50-icoSize)*easing;
  else if(Step==2){
    icoSize+=(0-icoSize)*easing;
    if(icoSize<1)Step=3;
  }
  pushMatrix();
  icoRot += (130-icoRot)*easing;
  rotateX(frameCount*PI/icoRot);
  noFill();
  stroke(col[0]);
  strokeWeight(2);
  pushMatrix();
  rotateX(TWO_PI*5/6);
  //lineG(icoSize*2.6);
  ellipse(0,0,icoSize*3,icoSize*3);
  popMatrix();
  stroke(col[1]);
  pushMatrix();
  rotateY(TWO_PI*5/6);
  //lineG(icoSize*3.5);
  ellipse(0,0,icoSize*3.5,icoSize*3.5);
  popMatrix();
  pushMatrix();
  scale(icoSize);
  //if(music.mix.level()*10+1>1.15)rotateX(frameCount*PI/50);
  //else rotateX(frameCount*PI/80);
  //rotateX(frameCount*PI/frame);
  //frame += (80-frame)*easing;
  //rotateY(frameCount*PI*(music.mix.level()+1)/200);
  
  ico.create();
  popMatrix();
  //shape(ico.Shape);
  popMatrix();
  noStroke();
}
void lineG(float a){
   for(int i=0;i<lineGnum;i++){
     
     pushMatrix();
     
     rotateZ(i*TWO_PI/lineGnum);
     stroke(col[2]);
     noFill();
     rect(0,0,a,a);
     popMatrix();
   } 
}
void ball() {
  if (music.mix.level()*10+1>1.26 && Step==0 ) {
    for (int i=0; i<50; i++) {
      particles.add(new Particle());
    }
  }
  if (music.mix.level()*10+1>1.8 && Step==1 ) {
      particles.add(new Particle());
  }
  for (Particle p : particles) {
    if (Step==1||Step==2) {
      if (PVector.sub(p.pos, attactor[p.att].location).magSq()>25) {
        p.applyForce(attactor[p.att].attactor(p));
      } else   p.att--;
      if (p.att<0)p.att=attactor.length-1;
    }
    p.update();
    p.display();
    //for(int j=0;j<5;j++){
    //  if(p.isDead(attactor[j]))
    //  particles.remove(i);
    //}
  }
}
void initialShapezhui() {
  //noStroke();
  //lights();
  //directionalLight(255,255,255,-100, -100, -100);
  //directionalLight(255,255,255,100, -100, -100);
  //directionalLight(255,255,255,100,  100, -100);
  //directionalLight(255,255,255,-100,  100, -100);
  //directionalLight(255,255,255,0,    0,  -400);
  //ambientLight(255,255,255);
  //ambient(220,220,220);

  //directionalLight(255,255,255,100,  100, 100);
  //directionalLight(255,255,255,0,    0,  -400);
  //ambientLight(255,255,255);
  //ambient(220,220,220);
  shapezhui.beginShape(QUAD_STRIP);
  shapezhui.noStroke();
  shapezhui.fill(255);
  shapezhui.vertex(0, 15, 0);
  shapezhui.vertex(15, -15, 0);
  shapezhui.vertex(0, 0, 30);

  shapezhui.vertex(0, 15, 0);
  shapezhui.vertex(-15, -15, 0);
  shapezhui.vertex(0, 0, 30);

  shapezhui.vertex(15, -15, 0);
  shapezhui.vertex(-15, -15, 0);
  shapezhui.vertex(0, 0, 30);

  shapezhui.vertex(0, 15, 0);
  shapezhui.vertex(15, -15, 0);
  shapezhui.vertex(0, 0, -17);

  shapezhui.vertex(0, 15, 0);
  shapezhui.vertex(-15, -15, 0);
  shapezhui.vertex(0, 0, -17);

  shapezhui.vertex(15, -15, 0);
  shapezhui.vertex(-15, -15, 0);
  shapezhui.vertex(0, 0, -17);
  shapezhui.endShape();
}
void displayShapezhui(float a) {
  pushMatrix();
  rotateX(PI/2);
  rotateZ(PI/6);
  scale(a);
  shape(shapezhui);
  popMatrix();
}
//void displayCircle(float a,color c){
//  scale(a);
//  circle.setStroke(false);
//  circle.setFill(c);
//  shape(circle);
//}
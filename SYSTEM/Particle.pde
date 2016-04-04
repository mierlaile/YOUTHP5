class Particle {
   PVector pos;
   PVector vel;
   PVector dir;
   PVector acc;
   color  c;
   float r;
   float maxforce;
   int att;
   int life;
   Particle(){
     pos = new PVector(0,0,0);
     acc = new PVector(0,0,0);
     vel = PVector.random3D();
 //    vel.mult(random(0.5,0.7));
     c = col [int(random(8))];
     r = R();
     //r= random(15);
     vel . mult(0.4);
     maxforce = 0.3;
     att=attactor.length-1;
     life=255;
 //    physics.addParticle(this);
    // physics.addBehavior(new AttractionBehavior(this, r*4, -1));
   }
   Particle(PVector center){
     pos = center;
     c = col [int(random(8))];
     r = R();
   }
   //void applyForce(PVector force){
   ////PVector f = PVector.div(force,m);
   //  acc.addSelf(force);
   //}
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acc.add(force);
  }
   void update(){
     //vel.limit(23);
     vel.add(acc);
     //if(music.mix.level()*10+1>1.7 && Step==1)
     //vel.mult(1.1);
     if(music.mix.level()*10+1>1.5 && Step==1)
     vel.mult(music.mix.level()*r/4.5+1);
     else if(music.mix.level()*10+1>1.2 && Step==0)
     vel.mult(music.mix.level()*r/2.5+1);
     if(vel.mag()>0.9)vel.mult(0.9);
     pos.add(vel);
     acc.mult(0);
   } 
   void display(){
    // noLights();
     fill(c,life);
     noStroke();
     pushMatrix();
     translate(pos.x,pos.y,pos.z);
     rotateY(frameCount*PI/600);
     ellipse(0,0,r,r);
     //sphere(r);
     //displayCircle(r,c);
     popMatrix();
   }
   //float pandist(Attactor a){
   //   PVector dis = PVector.sub(a.location,pos);
   //    dist = dis.mag();
   //   return dist;
   //}
   boolean isDead(){
    if(life<=0) return true;
    else return false;     
   }
}

float R(){
  float ran = random(1);
  float r=0;
  if(ran < 0.6) r=random(0,6);
  else r=random(6,12);
  return r;
}
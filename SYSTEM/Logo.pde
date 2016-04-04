class Logo{
  PVector pos;
  float r;
  PVector ori;
  //PVector ori1;
  color c;
  PVector vel;
  PVector acc;
  int life;
  Logo(PVector _ori) {
    c = col [int(random(8))];
    r = R();
    ori = _ori;
    //ori1=_ori;
    //pos=new PVector(0,0,-1000);
    pos = new PVector(random(-1000,1000),random(-1000,1000),random(-1000,1000));
    vel = new PVector(random(-1,1)/10000,random(-1,1)/10000,random(-1,1)/10000 );
    acc = new PVector( 0,0,0 );
    life=255;
  }
  void youthfade(){
    ori.x+=(0-ori.x)*easing;
    ori.y+=(0-ori.y)*easing;
    ori.z+=(0-ori.z)*easing;
    life--;
  }
  boolean isDead(){
    if(life<=0) return true;
    else return false;
  }
  void update(){
    acc.x = (pos.x-ori.x)/50000;
    acc.y = (pos.y-ori.y)/50000;
    acc.z = (pos.z-ori.z)/50000;
    vel.add(acc);
    ori.add(vel);
    
    //vel = PVector.sub(ori,pos);
    //vel.normalize();
    //vel.mult(50);
    //pos.add(vel);
    //pos.x+=(ori.x-pos.x)*easing;
    //pos.y+=(ori.y-pos.y)*easing;
    //pos.z+=(ori.z-pos.z)*easing;
    
  }
  void display() {
     fill(c);
     noStroke();
     pushMatrix();
     translate(ori.x,ori.y,ori.z);
     //println(pos.x+","+pos.y);
     //rotateY(frameCount*PI/600);
     ellipse(0,0,r,r);
     //sphere(r);
     //displayCircle(r,c);
     popMatrix();
  }
}
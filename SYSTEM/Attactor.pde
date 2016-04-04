class Attactor {
  PVector location;
  float x1,y1,z1;
  Attactor(int i){ 
     location = new PVector();
     //location.mult(random(100,300));
     location.x = posx[i];
     location.y = posy[i];
     location.z = posz[i];
     x1=0;y1=0;z1=0;
  }
  Attactor(PVector center){
    location = center;
  }
  PVector attactor(Particle p){
    PVector dir = PVector.sub(location,p.pos);
    float distance = dir.mag();
    dir.normalize();
    dir =dir.sub(p.vel.get().normalize());
    distance = constrain(distance,0,6.8);
    float strength = p.r/(distance*distance);
    dir.mult(strength);
    return dir;
  }
  void display(int i){
    //noLights();
    if(Step==0){
    stroke(255,music.mix.level()*5000);
    line(0,0,0,x1,y1,z1);}
    pushMatrix();
    x1 += (location.x - x1)*easing;
    y1 += (location.y - y1)*easing;
    z1 += (location.z - z1)*easing; 
    //println(location.x);
    translate(x1,y1,z1);
    postext(i);
    displayShapezhui(0.25);
    popMatrix();
  }
  void postext(int i){
    fill(255);
    textFont(posFont,5);
    text(bumenname[i]+"["+int(cos(frameCount*PI/600)*450+x1)+","+int(sin(frameCount*PI/600)*450+y1)+"]",10,10);
  }
}
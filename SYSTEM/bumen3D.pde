void sys(){
  pushMatrix();
  imageMode(CENTER);
  camera(0,0,4024,0,0,0,0,1,0);
  theta += (page*PI/ceil(sys.length/2.0)- theta) * 0.1;
  rotateY(theta);
  for(int i=0;i<sys.length;i++){
    pushMatrix();
    rotateY(i*PI/ceil(sys.length/2.0)+PI);
    translate(0,0,-3200);
    rotateY(PI);
    image(sys[i],0,0);
    popMatrix();
  }
  popMatrix();
}
void sjb(){
  pushMatrix();
  imageMode(CENTER);
  camera(0,0,4024,0,0,0,0,1,0);
  theta += (page*PI/ceil(sjb.length/2.0)- theta) * 0.1;
  rotateY(theta);
  for(int i=0;i<sjb.length;i++){
    pushMatrix();
    rotateY(i*PI/ceil(sjb.length/2.0)+PI);
    translate(0,0,-3200);
    rotateY(PI);
    image(sjb[i],0,0);
    popMatrix();
  }
  popMatrix();
}
void sl(){
  pushMatrix();
  imageMode(CENTER);
  camera(0,0,4024,0,0,0,0,1,0);
  theta += (page*PI/ceil(sl.length/2.0)- theta) * 0.1;
  rotateY(theta);
  for(int i=0;i<sl.length;i++){
    pushMatrix();
    rotateY(i*PI/ceil(sl.length/2.0)+PI);
    translate(0,0,-3200);
    rotateY(PI);
    image(sl[i],0,0);
    popMatrix();
  }
  popMatrix();
}
void jh(){
  pushMatrix();
  imageMode(CENTER);
  camera(0,0,4024,0,0,0,0,1,0);
  theta += (page*PI/ceil(jh.length/2.0)- theta) * 0.1;
  rotateY(theta);
  for(int i=0;i<jh.length;i++){
    pushMatrix();
    rotateY(i*PI/ceil(jh.length/2.0)+PI);
    translate(0,0,-3200);
    rotateY(PI);
    image(jh[i],0,0);
    popMatrix();
  }
  popMatrix();
}
void cy(){
  pushMatrix();
  imageMode(CENTER);
  camera(0,0,4024,0,0,0,0,1,0);
  theta += (page*PI/ceil(cygc.length/2.0)- theta) * 0.1;
  rotateY(theta);
  for(int i=0;i<cygc.length;i++){
    pushMatrix();
    rotateY(i*PI/ceil(cygc.length/2.0)+PI);
    translate(0,0,-3200);
    rotateY(PI);
    image(cygc[i],0,0);
    popMatrix();
  }
  popMatrix();
}
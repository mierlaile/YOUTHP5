int linecount=20;
float [][]x = new float [linecount][50];
float [][]y = new float [linecount][50];
float [][]z = new float [linecount][50];
float stheta1,stheta2;
int R=80;
int []top = new int [linecount];
int []add = new int [linecount];
int []alpha = new int [linecount];
boolean dra = false;
void spherelinesetup(){
  for(int i=0;i<linecount;i++){
    stheta1 = random(TWO_PI);
    for(int j=0;j<50;j++){
      stheta2 = j*TWO_PI/50;
      x[i][j] = R*sin(stheta2)*sin(stheta1);
      y[i][j] = R*sin(stheta2)*cos(stheta1);
      z[i][j] = R*cos(stheta2);
    }
  }
  for(int i=0;i<linecount;i++){
   top[i] = int(random(2,50));
   alpha[i] = 255;
  }
}
void spherelinedraw(){
  pushMatrix();

  noFill();
  strokeWeight(2);
  rotateX(-PI/2);
  for(int i=0;i<linecount;i++){
    
    beginShape();
    for(int j=0;j<add[i];j++){
        stroke(255,alpha[i]);
      vertex(x[i][j],y[i][j],z[i][j]);
      //point(x[i][j],y[i][j],z[i][j]);
      
    }
    endShape();
    if(dra)add[i]++;  
    if(add[i]>=top[i]-1){add[i]=top[i]-1;  alpha[i]--;if(alpha[i]<=0)alpha[i]=0;}  
  }
  dra=false; 
  popMatrix();
  booldra();
}
boolean booldra(){
  if(music.mix.level()*10+1>1.8 && Step==1)dra=true; 
  else dra = false;
  return dra;  
}
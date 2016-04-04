//PVector p1, p2, p3, p4, mid, rd, rt, ld, lt;
//float k;   
///***************************************/
//PImage front,back,next; //定义当前状态下对应的上页，下页，当前页
//PImage [] pp;
//int hotZone;  //左下，右下角 翻书触发区域
//boolean turnLeft, turnRight; //定义翻书状态
////boolean active;

//void bumenBook(){
//  //background(255);

//  //translate(-width/2,-height/2);
//  imageMode(CENTER);
//  image(front, 0, 0);
//  stroke(50, 50);
//  //strokeWeight(100);
//  line(width/2, 0, width/2, height);
//  ///////////////////////////////////////
//  if (turnLeft) turnToLeft();
//  if (turnRight) turnToRight(); 
//}



///***********释放鼠标时的状态判断及更新****************************/
//void mouseReleased() {
//  if (mouseX<width/4 && turnLeft==true ) {
//      PImage temp;
//      for(int j=0;j<pp.length-1;j++){
//      temp=pp[j];
//      pp[j]=pp[j+1];
//      pp[j+1]=temp;
//      }
//      front=pp[0];
//      next=pp[1];
//      back=pp[pp.length-1];
//  }
// if (mouseX>width*3/4 && turnRight==true ) {
//      PImage temp;
//      for(int j=pp.length-1;j>0;j--){
//      temp=pp[j];
//      pp[j]=pp[j-1];
//      pp[j-1]=temp;
//      }
//      front=pp[0];
//      next=pp[1];
//      back=pp[pp.length-1];
//  }
//  turnLeft=false;
//  turnRight=false;
//}

///********已知两点直线，求另外一点关于该直线的对称点*******************************/
//PVector getSymmetricPoint(PVector startPoint, PVector endPoint, PVector q) {  
//  PVector p = startPoint;  
//  PVector d = PVector.sub(endPoint, startPoint);  
//  d.normalize();  
//  float   t = PVector.dot(d, PVector.sub(q, p));  
//  PVector _q = PVector.add(p, PVector.mult(d, t));  
//  return PVector.sub(_q, PVector.sub(q, _q));
//}  
///********翻书效果，向左翻书*******************************/
//void turnToLeft() {
//  p1=new PVector(mouseX, mouseY);
//  fill(#CECCCC);
//   noStroke();
//  strokeWeight(0);
//  mid=new PVector((p1.x+rd.x)/2, (p1.y+rd.y)/2);
//  k=-(p1.x-rd.x)/(p1.y-rd.y);
//  p2.y=height;
//  p2.x=1/k*(p2.y-mid.y)+mid.x;
//  if (p2.x<width/2) p2.x=width/2;
//  p3.x=width;
//  p3.y=k*(p3.x-mid.x)+mid.y;
//  p4 = null;
//  p1 = getSymmetricPoint(p2, p3, rd);
//  if (p3.y<0 || p3.y>height) {
//    p3.y=0;
//    p3.x=1/k*(p3.y-mid.y)+mid.x;
//    if (p3.x<width/2) p3.x=width/2;
//    p1 = getSymmetricPoint(p2, p3, rd);
//    p4 = getSymmetricPoint(p2, p3, rt);
//  }
//  //texture the BackPage
//  noLights();
//  beginShape();  
//  noStroke();
//  texture(next);  
//  vertex(p1.x, p1.y, 0, height);  
//  vertex(p2.x, p2.y, width-p2.x, p2.y);  
//  if (p3.x==width) vertex(p3.x, p3.y, 0, p3.y); 
//  else vertex(p3.x, p3.y, width-p3.x, p3.y);    
//  if (p4 != null) vertex(p4.x, p4.y, 0, 0);  
//  endShape(CLOSE);  

//  //texture the NextPage    
//  noLights();
//  beginShape();  
//  texture(next);  
//  vertex(p2.x, p2.y, p2.x, p2.y);  
//  vertex(rd.x, rd.y, rd.x, rd.y);  
//  if (p4 != null) vertex(rt.x, rt.y, rt.x, rt.y);  
//  vertex(p3.x, p3.y, p3.x, p3.y );          
//  endShape(CLOSE);
//}
///********翻书效果，向右翻书*******************************/
//void turnToRight() {
//  p1=new PVector(mouseX, mouseY);
//  //fill(255, 0, 200);
//  fill(#CECCCC);
//  noStroke();
//  strokeWeight(0);
//  mid=new PVector((p1.x+ld.x)/2, (p1.y+ld.y)/2);
//  k=-(p1.x-ld.x)/(p1.y-ld.y);
//  p2.y=height;
//  p2.x=1/k*(p2.y-mid.y)+mid.x;
//  if (p2.x>width/2) p2.x=width/2;
//  p3.x=0;
//  p3.y=k*(p3.x-mid.x)+mid.y;
//  p4 = null;
//  p1 = getSymmetricPoint(p2, p3, ld);
//  if (p3.y<0 || p3.y>height) {
//    p3.y=0;
//    p3.x=1/k*(p3.y-mid.y)+mid.x;
//    if (p3.x>width/2) p3.x=width/2;
//    p1 = getSymmetricPoint(p2, p3, ld);
//    p4 = getSymmetricPoint(p2, p3, lt);
//  }
//  //texture the BackPage
//  lights();
//  //noFill();
//  beginShape();  
//  noStroke();
//  texture(back);  
//  vertex(p1.x, p1.y, width, height);  
//  vertex(p2.x, p2.y, width-p2.x, p2.y);  
//  if (p3.x==0) vertex(p3.x, p3.y, width, p3.y); 
// else vertex(p3.x, p3.y, width-p3.x, p3.y);    
//  if (p4 != null) vertex(p4.x, p4.y, width, 0);  
//  endShape(CLOSE);  

//  //texture the NextPage    
//  lights();
//  beginShape();  
//  texture(back);  
//  vertex(p2.x, p2.y, p2.x, p2.y);  
//  vertex(ld.x, ld.y, ld.x, ld.y);  
//  if (p4 != null) vertex(lt.x, lt.y, lt.x, lt.y);  
//  vertex(p3.x, p3.y, p3.x, p3.y );          
//  endShape(CLOSE);
//}
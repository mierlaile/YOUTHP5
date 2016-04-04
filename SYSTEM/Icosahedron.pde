class CreateImage {
  PImage image;
  color [] c = new color[2];
  float []wid = new float[2];
  int ran;
  CreateImage() {
    image = createImage(100, 100, RGB);
    //c[0] = new color ();
    //c[1] = new color ();
    c[0] = col [int(random(8))];
    c[1] = col [int(random(8))];
    if (c[0]==c[1]) c[1] = #FFFFFF;
    ran = int(random(10,20));
    wid[0] = ran*random(0.3,1);
    wid[1] = ran - wid[0];
  }
  void creat() {
    image.loadPixels();
    for (int i=0; i<image.height; i++) {
      for (int j=0; j<image.width; j++) {
        int loc = j+i*image.width; 
        if ((i%ran)/wid[0]<1) image.pixels[loc] = c[0];
        else image.pixels[loc] = c[1];
      }
    }
    image.updatePixels();
  }
}


class Dimension3D {
  float w, h, d;

  Dimension3D(float w, float h, float d) {
    this.w=w;
    this.h=h;
    this.d=d;
  }
}




abstract class Shape3D {
  float x, y, z;
  float w, h, d;

  Shape3D() {
  }

  Shape3D(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  Shape3D(PVector p) {
    x = p.x;
    y = p.y;
    z = p.z;
  }


  Shape3D(Dimension3D dim) {
    w = dim.w;
    h = dim.h;
    d = dim.d;
  }

  Shape3D(float x, float y, float z, float w, float h, float d) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
    this.h = h;
    this.d = d;
  }

  Shape3D(float x, float y, float z, Dimension3D dim) {
    this.x = x;
    this.y = y;
    this.z = z;
    w = dim.w;
    h = dim.h;
    d = dim.d;
  }

  Shape3D(PVector p, Dimension3D dim) {
    x = p.x;
    y = p.y;
    z = p.z;
    w = dim.w;
    h = dim.h;
    d = dim.d;
  }

  void setLoc(PVector p) {
    x=p.x;
    y=p.y;
    z=p.z;
  }

  void setLoc(float x, float y, float z) {
    this.x=x;
    this.y=y;
    this.z=z;
  }


  // override if you need these
  void rotX(float theta) {
  }

  void rotY(float theta) {
  }

  void rotZ(float theta) {
  }


  // must be implemented in subclasses
  abstract void init();
  abstract void create();
}




class Icosahedron extends Shape3D {

  // icosahedron
  PVector topPoint;
  PVector[] topPent = new PVector[5];
  PVector bottomPoint;
  PVector[] bottomPent = new PVector[5];
  float angle = 0, radius = 150;
  float triDist;
  float triHt;
  float a, b, c;
  PShape Shape;
  // constructor
  Icosahedron(float radius) {
    this.radius = radius;
    Shape = createShape();
    init();
  }

  Icosahedron(PVector v, float radius) {
    super(v);
    this.radius = radius;
    init();
  }

  // calculate geometry
  void init() {
    c = dist(cos(0)*radius, sin(0)*radius, cos(radians(72))*radius, sin(radians(72))*radius);
    b = radius;
    a = (float)(Math.sqrt(((c*c)-(b*b))));

    triHt = (float)(Math.sqrt((c*c)-((c/2)*(c/2))));

    for (int i=0; i<topPent.length; i++) {
      topPent[i] = new PVector(cos(angle)*radius, sin(angle)*radius, triHt/2.0f);
      angle+=radians(72);
    }
    topPoint = new PVector(0, 0, triHt/2.0f+a);
    angle = 72.0f/2.0f;
    for (int i=0; i<topPent.length; i++) {
      bottomPent[i] = new PVector(cos(angle)*radius, sin(angle)*radius, -triHt/2.0f);
      angle+=radians(72);
    }
    bottomPoint = new PVector(0, 0, -(triHt/2.0f+a));
  }

  // draws icosahedron 
  void create() {
    for (int i=0; i<topPent.length; i++) {
      // icosahedron top
      beginShape(TRIANGLE);
      //textureMode(NORMAL);
      texture(create[i].image);
      noStroke();
      if (i<topPent.length-1) {
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 50, 0);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z, 0, 100);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z, 100, 100);
      } else {
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 50, 0);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z, 0, 100);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z, 100, 100);
      }
      endShape(CLOSE);

      // icosahedron bottom
      beginShape(TRIANGLE);
      texture(create[i+1].image);
      if (i<bottomPent.length-1) {
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z, 50, 0);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z, 0, 100);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z, 100, 100);
      } else {
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z, 50, 0);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z, 0, 100);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z, 100, 100);
      }
      endShape(CLOSE);
    }

    // icosahedron body
    for (int i=0; i<topPent.length; i++) {
      if (i<topPent.length-2) {
        beginShape(TRIANGLE);
        texture(create[topPent.length+i].image);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 50, 0);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z, 0, 100);
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z, 100, 100);
        endShape(CLOSE);

        beginShape(TRIANGLE);
        texture(create[topPent.length+i+1].image);
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z, 50, 0);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 0, 100);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z, 100, 100);
        endShape(CLOSE);
      } else if (i==topPent.length-2) {
        beginShape(TRIANGLE);
        texture(create[topPent.length+i].image);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 50, 0);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z, 0, 100);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z, 100, 100);
        endShape(CLOSE);

        beginShape(TRIANGLE);
        texture(create[topPent.length+i-2].image);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z, 50, 0);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 0, 100);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z, 100, 100);
        endShape(CLOSE);
      } else if (i==topPent.length-1) {
        beginShape(TRIANGLE);
        texture(create[topPent.length+i].image);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 50, 0);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z, 0, 100);
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z, 100, 100);
        endShape(CLOSE);

        beginShape(TRIANGLE);
        texture(create[topPent.length+i-4].image);
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z, 50, 0);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z, 0, 100);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z, 100, 100);
        endShape(CLOSE);
      }
    }
  }

  // overrided methods fom Shape3D
  void rotZ(float theta) {
    float tx=0, ty=0, tz=0;
    // top point
    tx = cos(theta)*topPoint.x+sin(theta)*topPoint.y;
    ty = sin(theta)*topPoint.x-cos(theta)*topPoint.y;
    topPoint.x = tx;
    topPoint.y = ty;

    // bottom point
    tx = cos(theta)*bottomPoint.x+sin(theta)*bottomPoint.y;
    ty = sin(theta)*bottomPoint.x-cos(theta)*bottomPoint.y;
    bottomPoint.x = tx;
    bottomPoint.y = ty;

    // top and bottom pentagons
    for (int i=0; i<topPent.length; i++) {
      tx = cos(theta)*topPent[i].x+sin(theta)*topPent[i].y;
      ty = sin(theta)*topPent[i].x-cos(theta)*topPent[i].y;
      topPent[i].x = tx;
      topPent[i].y = ty;

      tx = cos(theta)*bottomPent[i].x+sin(theta)*bottomPent[i].y;
      ty = sin(theta)*bottomPent[i].x-cos(theta)*bottomPent[i].y;
      bottomPent[i].x = tx;
      bottomPent[i].y = ty;
    }
  }

  void rotX(float theta) {
  }

  void rotY(float theta) {
  }
}
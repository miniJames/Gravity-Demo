ArrayList<mover> items;
ArrayList<mover> temp;
//mover m;
//mover a;
float vastness = 1000;
int xoff=0, yoff=0;
float zoom = vastness;
float mapClickX=0, mapClickY=0;
float magnif=(float)1/vastness;
float mapOffx = 0, mapOffy=0;
void setup() {
  //size(1000, 1000,P2D);
  fullScreen(P3D);
  //m=new mover( 1, width/2, height/2);
  //a=new mover(10, width/2, height/4);
  //m.vel = PVector.random2D();

  items=new ArrayList<mover>();
  temp=new ArrayList<mover>();
  for (int i=0; i<250; i++) {
    mover m=new mover(.25, random(width*vastness ), random(height*vastness ));
    m.vel = PVector.random2D().mult(1);
    m.mass=3;
    m.c = color(128, 128, 255 );
    items.add(m);
  }
  for (int i=0; i<1500; i++) {
    mover m=new mover(random(1, 3), random(width*vastness ), random(height*vastness ));
    //m.vel = PVector.random2D().mult(1);
    m.c = color(255, 0, 255);
    items.add(m);
  }
  for (int i=0; i<500; i++) {
    mover m=new mover(random(10, 30), random(width*vastness ), random(height*vastness ));
    m.vel = PVector.random2D().mult(1);
    m.c = color(0, 255, 0);
    items.add(m);
  }
  for (int i=0; i<100; i++) {
    mover m=new mover(random(45, 100), random(width*vastness), random(height*vastness ));
    m.vel = PVector.random2D().mult(1);
    m.c = color(255, 255, 0);
    items.add(m);
  }
  for (int i=1; i<50; i++) {
    mover m=new mover(100, random(width *vastness ), random(height *vastness ));
    m.vel = PVector.random2D().mult(10);
    items.add(m);
  }
  mover m; 
  //m=new mover(50, (random(width*vastness)), random(height*vastness));
  //m.mass = 100000; 
  ////m.pos.x = mouseX-xoff;
  ////m.pos.y = mouseY-yoff;
  //m.r = 50; 
  //m.c = color(255, 0, 0);
  //m.vel = PVector.random2D().mult(1);
  //items.add(m);
  //m=new mover(50, (random(width*vastness)), random(height*vastness));
  //m.mass = 100000; 
  ////m.pos.x = mouseX-xoff;
  ////m.pos.y = mouseY-yoff;
  //m.r = 50; 
  //m.c = color(255, 0, 0);
  //m.vel = PVector.random2D().mult(1);
  //items.add(m);
  m=new mover(50, (random(width*vastness)), random(height*vastness));
  m.mass = 21000000; 
  m.pos.x = width*vastness/2;
  m.pos.y =height*vastness/2;
  m.r = 50000; 
  m.c = color(255, 0, 0);
  m.vel = PVector.random2D().mult(1);
  items.add(m);
}
void mouseDragged() {
  if (mouseY > height *.8 && mouseX < width *.2) {
    mapClick();
  }
}
void mouseClicked() {
  if (mouseY > height *.8 && mouseX < width *.2) {
    mapClick();
  } else {
    for (int i=0; i<50; i++) {
      mover m=new mover(1, random(width*vastness ), random(height*vastness ));
      m.vel = PVector.random2D().mult(1);
      m.mass=3;
      m.c = color(128, 128, 255 );
      items.add(m);
    }
    for (int i=0; i<10; i++) {
      mover m=new mover(random(.5), (random(width *vastness) ), ( random(height *vastness) ));
      m.vel = PVector.random2D().mult(2);
      m.mass*=100;
      m.c = color(255, 255, 0);//, map(m.mass, 3, 1500, 20, 255));
      items.add(m);
    }
  }    
  mover m=new mover(100, random(width *vastness ), random(height *vastness ));
  m.vel = PVector.random2D().mult(10);
  items.add(m);
  m=new mover(50, (random(width*vastness)), random(height*vastness));
  m.mass = 100;  
  m.c = color(255, 0, 0);
  items.add(m);
  m=new mover(50, (random(width*vastness)), random(height*vastness));
  m.mass = 100; 
  //m.pos.x = width*vastness/2;
  //m.pos.y =height*vastness/2;
  m.r = 50; 
  m.c = color(255, 0, 0);
  m.vel = PVector.random2D().mult(1);
  items.add(m);
}
void mouseWheel(MouseEvent event) {

  float e = event.getCount();
  //println(e);

  zoom+=e;
  if (zoom<1) zoom=1;
  if (zoom>vastness) zoom=vastness;
  //println(zoom);
}
void draw() {
  //}
  //mover mm=new mover(1, (random(width)), random(height));
  //mm.vel = PVector.random2D().mult(3);
  // items.add(mm);
  //void mouseClicked(){
  background(2);
  temp.clear();
  //for (int i1= items.size()-1; i1>0; i1--) {
  //  mover m1=items.get(i1);
  //  m1.show();
  //  m1.update();
  //  for (int i2= i1-1; i2>0; i2--) {
  //    mover m2 = items.get(i2);
  //    if (m2!=m1) {
  //      m1.attract(m2);
  //      m1.checkCollision(m2);
  //    }
  //  }
  //  if (items.get(i1).deleted) {
  //    items.remove(i1);
  //  }
  //}
  for (mover m : items) {
    m.show();
    m.update();
    //m.edges();
    for (mover m1 : items) {

      if (m!=m1) {

        m.attract(m1);
        //m.checkEat(m1);
        m.checkCollision(m1);
      }
    }
  }

  for (mover m : temp) {
    items.add(m);
    println("YES");
  }

  //m.attract(a);
  //m.show();
  //m.update();
  //a.attract(m);
  //a.show(); 

  //a.update();


  //cleanup
  for (int i=items.size()-1; i>=0; i--) {
    if (items.get(i).deleted) {
      items.remove(i);
    }
  }

  updateMap();
  //stroke(255);
  fill(255);
  text(items.size(), 5, height*.8 -20);
}

void updateMap() {

  stroke(255);
  fill(0);
  rect(0, height*.8, width*.2, height*.2);


  for (mover m : items) {

    float x, y;

    x=map(m.pos.x, 0, width, 0, width*.2)*magnif;
    y=map(m.pos.y, 0, height, 0, height*.2)*magnif;

    y+=height*.8;
    y+=mapOffy*(height)*magnif;
    x+=mapOffx*(width)*magnif;

    if (x>0 && x < (width*.2) && y > height*.8 && y < height) {
      stroke(m.c);
      point(x, y);
    }
  }
  noFill();
  stroke(255, 255, 0, 128); 

  rect(mapClickX, mapClickY, (width*magnif*.2)*zoom, (height*magnif*.2)*zoom);
}

void mapClick() {
  float xoffset=(width*magnif*.2)+ (width*magnif*.2)*zoom/2;
  float yoffset=(height*magnif*.2)+(height*magnif*.2)*zoom/2;
  //calculate new xoff and yoff positions.
  float x, y;
  x=mouseX-xoffset;
  y=mouseY-yoffset;

  //float xdiff, ydiff;

  //xdiff = xoff - x;
  //ydiff = yoff - y;
  //println("X" + x);
  //println("Y" + y);

  float x1 = map(x, 0, width *.2, 0, width)/magnif;
  float y1 = map(y, height*.8, height, 0, height)/magnif;
  //y1+=mapOffy/(height)*magnif;
  //x1+=mapOffx/(width)*magnif;
  //println("TEST" + mapOffy*(height)*magnif);
  println("X1 " + x1);
  println("Y1 " + y1);
  xoff=floor(-x1);
  yoff=floor(-y1);
  mapClickX=x;
  mapClickY=y;
}
class mover {
  color c;

  float mass = 0.0, r ;

  PVector vel, acc, pos;
  boolean deleted=false;
  mover( float m, float x, float y) {
    c=color(random(150, 255));
    mass=m;
    r = sqrt(mass)*200;
    vel=new PVector();
    pos=new PVector(x, y);
    acc=new PVector();
  }
  void edges() {
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.x>width) {
      pos.x = 0;
    }
    if (pos.y < 0) {
      pos.y = height;
    }
    if (pos.y>height) {
      pos.y = 0;
    }
  }

  void applyForce(PVector force) {

    PVector f= force.div(mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.set(0, 0);
  }
  void show() {
    if ((pos.x + xoff)/zoom > 0 && (pos.x + xoff)/zoom < width && (pos.y + yoff)/zoom > 0 && (pos.y + yoff)/zoom < height) {
      fill(c);
      noStroke();


      circle((pos.x+xoff)/zoom, (pos.y+yoff)/zoom, Math.max((((float)r*2)/zoom), 1.0));
    }
    //fill(255);
    //text(mass, pos.x+xoff, pos.y+yoff);
  }

  void attract(mover m) {
    PVector force = PVector.sub(pos, m.pos);
    float distsq = constrain(force.magSq(), 100, 1000000);
    float g=.05;
    float strength = g * (mass * m.mass) / distsq;
    force.setMag(strength);
    m.applyForce(force);
  }


  void checkEat(mover other) {

    // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.pos, pos);



    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = r + other.r;

    if (distanceVectMag < minDistance) {
      //println("mover.vel "+ other.vel.mag());
      //println("me.vel "+ vel.mag());
      if (other.vel.mag() + vel.mag() >= 6  ) {
        if (other.mass > mass) {
          float rat=other.mass/ ((other.r * other.r)*PI);

          other.mass += mass *1;
          other.r=other.mass/rat;
          other.r=sqrt(other.r/PI);
          deleted=true;
          //mover m = new mover(Math.max(mass*.1,.1),pos.x, pos.y);  
          //m.vel = other.vel.copy();
          //temp.add(m);
        } else {
          float rat=mass/((r*r) * PI);

          mass += other.mass *1;
          r=mass/rat;
          r=sqrt(r/PI);
          other.deleted=true;
          //mover m = new mover(Math.max(other.mass*.1,.1),pos.x, pos.y);   
          //m.vel = vel.copy();
          //temp.add(m);
        }
      }
    }
  }


  void checkCollision(mover other) {

    // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.pos, pos);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = r + other.r;

    if (distanceVectMag < minDistance) {
      //println("mover.vel "+ other.vel.mag());
      //println("me.vel "+ vel.mag());
      //if (other.vel.mag() + vel.mag() >= 6  ) {
      //  if (other.mass > mass) {
      //    float rat=other.mass/ ((other.r * other.r)*PI);

      //    other.mass += mass *.9;
      //    other.r=other.mass/rat;
      //    other.r=sqrt(other.r/PI);
      //    deleted=true;
      //  } else {
      //    float rat=mass/((r*r) * PI);

      //    mass += other.mass *.9;
      //    r=mass/rat;
      //    r=sqrt(r/PI);
      //    other.deleted=true;
      //  }
      //  //mover m= new mover(mass*.1, pos.x, pos.y);
      //  //items.add(m);
      //} else {
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.pos.add(correctionVector);
      pos.sub(correctionVector);

      // get angle of distanceVect
      float theta  = distanceVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this ball's position is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].position.x and bTemp[0].position.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * vel.x + sine * vel.y;
      vTemp[0].y  = cosine * vel.y - sine * vel.x;
      vTemp[1].x  = cosine * other.vel.x + sine * other.vel.y;
      vTemp[1].y  = cosine * other.vel.y - sine * other.vel.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated velocity for b[0]
      vFinal[0].x = ((mass - other.mass) * vTemp[0].x + 2 * other.mass * vTemp[1].x) / (mass + other.mass);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((other.mass - mass) * vTemp[1].x + 2 * mass * vTemp[0].x) / (mass + other.mass);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      //other.pos.x = pos.x + bFinal[1].x;
      //other.pos.y = pos.y + bFinal[1].y;

      pos.add(bFinal[0]);
      // update velocities
      vel.x = (cosine * vFinal[0].x - sine * vFinal[0].y) *.95;
      vel.y = (cosine * vFinal[0].y + sine * vFinal[0].x) *.95;
      other.vel.x = (cosine * vFinal[1].x - sine * vFinal[1].y)*.95;
      other.vel.y = (cosine * vFinal[1].y + sine * vFinal[1].x)*.95;

      //other.vel.limit(.01);
      //vel.limit(.01);
    }
    //}
  }
}

//class attractor {

//  float mass, r ;

//  PVector   pos;

//  attractor( float m, float x, float y) {
//    mass=m;
//    r = sqrt(mass)*10;

//    pos=new PVector(x, y);
//  }


//  void attract(mover m) {
//    PVector force = PVector.sub(pos, m.pos);
//    float distsq = force.magSq();
//    float g=10;
//    float strength = g* (mass * m.mass) / distsq;
//    force.setMag(strength);
//    m.applyForce(force);
//  }
//  void show() {
//    fill(255, 0, 0);
//    circle(pos.x, pos.y, r*2);
//  }
//}

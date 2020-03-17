class Pasto{
  float x,y;
  float ancho;
  float alto;
  Body b;
  
  Pasto( float x_, float y_, float ancho_, float alto_){
    ancho = ancho_;
    alto = alto_;
    x = x_;
    y = y_;
    
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnMundo = planeta.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnMundo);
    bd.type = BodyType.STATIC;
    
    b = planeta.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float ancho = planeta.scalarPixelsToWorld(ancho_);
    float alto = planeta.scalarPixelsToWorld(alto_);
    ps.setAsBox(ancho/2,alto/2);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    fd.restitution = 0.4;
    fd.density = 1;
    
    b.createFixture(fd);
  }
  
  void display(){    
    pushMatrix();
      translate(x,y);
      rectMode(CENTER);
      noStroke();
      fill(#0EC63A);
      rect(0,0,ancho,alto, 10, 10, 0, 0);
    popMatrix();
  }

}

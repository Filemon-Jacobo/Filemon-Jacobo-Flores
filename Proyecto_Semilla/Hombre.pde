class Hombre{
  float alto;
  float ancho;
  float x, y;
  Body hom;
  
  Hombre(float x_, float y_, float ancho_, float alto_){
    alto= alto_;
    ancho= ancho_;
    x= x_;
    y= y_;
    
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnMundo = planeta.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnMundo);
    bd.type = BodyType. DYNAMIC;
    
    hom = planeta.createBody(bd);
        
    PolygonShape ps = new PolygonShape();
    float ancho = planeta.scalarPixelsToWorld(ancho_);
    float alto = planeta.scalarPixelsToWorld(alto_);
    ps.setAsBox(ancho/2,alto/2);
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 2;
    fd.restitution = 1;
    fd.density = 1;
    
    hom.createFixture(fd);
  }
  
  void destruccion(){
    Vec2 posicion = planeta.getBodyPixelCoord(hom);
    float angulo = hom.getAngle();
    pushMatrix();
      translate(posicion.x,posicion.y);
      rotate(-angulo);
      rectMode(CENTER);
      noStroke();
      imageMode(CENTER);
      image(Hombre,0,0,ancho,alto);
    popMatrix();
  }

}

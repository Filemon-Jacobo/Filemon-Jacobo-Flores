class hoja{
  float alto;
  float ancho;
  float x, y;
  boolean humanos;
  Body b;
  
  hoja(float x_, float y_, float alto_, float ancho_, boolean humanos_){
    alto= alto_;
    ancho= ancho_;
    x= x_;
    y= y_;
    humanos = humanos_;
    
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_, y_);
    Vec2 posicionEnplaneta = planeta.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnplaneta);
   
    if (humanos){
    bd.type = BodyType.DYNAMIC;
    }
    else {
    bd.type = BodyType.STATIC;
    }
    
    b= planeta.createBody(bd);
    b.setLinearVelocity(new Vec2(random(-5,5),random(10)));
    b.setAngularVelocity(random(-5,5));
    PolygonShape ps = new PolygonShape();
    float ancho = planeta. scalarPixelsToWorld(ancho_);
    float alto = planeta. scalarPixelsToWorld(alto_);
    ps.setAsBox(ancho/2, alto/2);
 
    FixtureDef fd= new FixtureDef();
    fd.shape= ps;
    fd.friction= 1;
    fd. restitution= 0.5;
    fd.density= 1;
    
    b.createFixture(fd);
  }
    void display(){
 
    Vec2 posicion = planeta.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
      translate(posicion.x,posicion.y);
      rotate(-angulo);
      rectMode(CENTER);
      noStroke();
      imageMode(CENTER);
      image(Hoja,0,0,ancho,alto);
    popMatrix();
  }
}

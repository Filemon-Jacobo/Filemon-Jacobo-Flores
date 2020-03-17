/*Este proyecto se baso en elementos de los ejemplos de Box2D en processing, en particular box2D_exersice_solvied*/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing planeta;
  hoja una;
  Pasto superficie; 
  Tronco uno;
  Hombre dest;
 
  ArrayList <Tronco> Troncos;
  ArrayList <hoja> hojas;
  ArrayList <Hombre> Hombres;
  PImage Hoja;
  PImage Hombre;
  boolean human;
  int variable =0;
  
void setup(){
  size(500,500);
  human = false;
  planeta = new Box2DProcessing(this);
  planeta.createWorld();
  Troncos = new ArrayList<Tronco>();
  una = new hoja(200,30,20,10,human);
  hojas = new ArrayList<hoja>();
  superficie = new Pasto(250,450,500,110);
  Hoja = loadImage("Hoja2.png"); 
  Hombre = loadImage("Hombre.png"); 
  Hombres = new ArrayList<Hombre>();

}
void draw(){
  background(#90DBFF);
 
  planeta.step();
  if (keyPressed) {
    if (key == 'A'){
    Troncos.add(new Tronco (mouseX, 380,7,100));}
    }
  for(Tronco arbols: Troncos) {
    arbols.display();
  }
  if (mousePressed) {
    hoja h = new hoja(mouseX,random(280, 365), 10, 5, human);
    hojas.add(h); }
  for (hoja ho: hojas) {
    ho.display();
  }
  if (keyPressed) {
  if (key == 'B'){
  Hombres.add(new Hombre (mouseX, 150,15,20));
  Human();
  }
  }
  for (Hombre Men: Hombres) {
   Men.destruccion();}
  superficie.display();
  
  textSize(13);
  fill(0);
  text("Instrucciones", 200, 20);
  text("Presiona la tecla 'A' para crear el troco del arbol y mueve tu cursor para", 20, 40);
  text("posicionarlo, dando clic izqueirdo de tu mouse puedes poner hojas a tus  ", 20, 60);
  text("arboles y con la tecla 'B' aparecen a los humanos y presiona nuevamente ", 20, 80);
  text("el lado izquierdo de tu mouse para hacer caer las hojas. ", 20, 100);
 
}

void Human () {
  if (key == 'B'){
  human = true;
  fill(#90DBFF);
  ellipse (100,100,100,100);}
}



  

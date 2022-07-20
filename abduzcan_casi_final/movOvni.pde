int x, y;  //van a ser las variables de posicion de la nave
int tinte=255;  //variable que se va a utilizar para tintar a la nave
float y2;  //variable de largo del rayo abductor
float UFOX;  //variable x de la nave
float UFOY; //variable y de la nave
PImage ovniVolador;  //variable de la nave
int Control = 0;
class Personaje {

  Personaje() { 
    ovniVolador=loadImage("UFO1 Abduzcam.png");  // se carga la imagen de la nave
    UFOX=width/2; //se le da valor al ufo para que aparezaca en el medio
    UFOY=height/2; //se le da valor al ufo para que aparezaca en el medio
  }
  void movOvni() {
    if (Control % 2 == 0) { 
      if (up == true) UFOY = UFOY - 4;   //si el booleano correspondiente a la presion de la tecla W es verdad la variable de posicion de la nave se le suman 4 unidades
      if (down == true) UFOY = UFOY + 4;   //si el booleano correspondiente a la presion de la tecla S es verdad la variable de posicion de la nave se le suman 4 unidades
      if (right == true) UFOX = UFOX + 4;  //si el booleano correspondiente a la presion de la tecla D es verdad la variable de posicion de la nave se le suman 4 unidades
      if (left == true) UFOX = UFOX - 4;   //si el booleano correspondiente a la presion de la tecla A es verdad la variable de posicion de la nave se le suman 4 unidades
    } else { 
      if (up == true) UFOY = UFOY + 4;   //si el booleano correspondiente a la presion de la tecla W es verdad la variable de posicion de la nave se le suman 4 unidades
      if (down == true) UFOY = UFOY - 4;   //si el booleano correspondiente a la presion de la tecla S es verdad la variable de posicion de la nave se le suman 4 unidades
      if (right == true) UFOX = UFOX - 4;  //si el booleano correspondiente a la presion de la tecla D es verdad la variable de posicion de la nave se le suman 4 unidades
      if (left == true) UFOX = UFOX + 4;   //si el booleano correspondiente a la presion de la tecla A es verdad la variable de posicion de la nave se le suman 4 unidades
    }

    UFOX=constrain(UFOX, 144, width-144);  // limite de la nave en X
    UFOY=constrain(UFOY, 62, height-162);   // limite de la nave en Y
    rectMode(CORNER);
    noStroke();
    fill(0, 255, 0, 120);  //color del rayo, es verde pero con transparencia, a si se puede ver lo que uno abduce
    rect(UFOX-25, UFOY, 50, y2);  // se hace el rayo abductor de la nave
    imageMode(CENTER); //ponemos el imagemode en center para que quede el ovni en el medio del cursor
    tint(255, tinte, tinte, 255);
    image(ovniVolador, UFOX + 2, UFOY); //es el personaje principal en esta etapa del juego
    noTint();  //se le saca el tint a si no afecta al resto de las imagenes del codigo
  }
}


void keyPressed() {
  if (key == 'w'|| key == 'W') up = true; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key == 's'|| key == 'S') down = true; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key == 'a' || key == 'A') left = true; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key == 'd' || key == 'D') right = true; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key==' ') abz = true; // si se apreta la tecla seleccionada se activa el booleano de abduccion

  if (key == 'e'|| key == 'E') LDTexto = LDTexto + 1; // si se apreta la tecla seleccionada se suma 1 a la variable de texto
}
void keyReleased() {
  if (key == 'w'|| key == 'W') up = false; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key == 's'|| key == 'S') down = false; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key == 'a' || key == 'A') left = false; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key == 'd' || key == 'D') right = false; // si se apreta la tecla seleccionada se activa el booleano de movimiento
  if (key==' ') abz = false; // si se apreta la tecla seleccionada se activa el booleano de abduccion
}


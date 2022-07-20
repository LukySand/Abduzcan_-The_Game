int vidas=3;  // variable global para las vidas del ovni

class Contador {
  // para los puntos
  PFont puntosText;  //tipografia que se va a usar para las vidas,puntos,fps,etc.
  float puntos = 0;  //variable que va a usar los puntos
  // para las vidas
  int t=0;  //variable de tiempo que se va a usar para una funcion estetica en las vidas
  int k=0;  //variable de total de imagenes del array de la explosion
  int vloz;  //variable de velocidad de los pedazos de la nave
  float xx2R;  //variable de posicion x de la parte derecha de la nave
  float xx2L;  //variable de posicion x de la parte izquierda de la nave
  float explX;  //variable de la posicion x de la explosion
  float psk2;  //variable que almacena la psocicion que se le dio desde el inicio a las vidas
  PImage ovniVidaR;  //imagen de la parte derecha de la nave
  PImage ovniVidaL;  //imagen de la parte izquierda de la nave
  PImage[] explocao = new PImage[7];  //array de imagenes que contiene la explosion 

  Contador(float psk) {  //se trae un valor psk que es donde va a estar la posicion X de las vidas
    psk2=psk;   //se lo define como una variable local que se va a usar dentro de toda la class
    xx2L=psk2;  //se define la psocion x de la primera imagen de la mitad del ovni en la ubicacion de psk porque el imageMode esta en corner
    xx2R=xx2L+30;  //se pone la segunda imagen de la nave justo donde termina la otra
    explX=xx2L+7;  //se define la ubicacion en x de la explosión
    puntosText = loadFont("Copy of H2sa1M-250.vlw");  // se carga la tipografia que se va a usar
    //
    ovniVidaR=loadImage("spriteOvni Expl_0.png");  //se carga la imagen de la mitad del ovni parte derecha
    ovniVidaR.resize(30, 24);  //se le hace un rezise porque la imagen original es muy grande
    //
    ovniVidaL=loadImage("spriteOvni Expl_1.png");  //se carga la imagen de la mitad del ovni parte derecha
    ovniVidaL.resize(30, 24);  //se le hace un rezise porque la imagen original es muy grande
    //
    for (int v=0; v<explocao.length; v++) {  // For para definir el array de imagenes
      explocao[v]=loadImage("spriteExplosao_"+v+".png");  //se van cargando las imagenes del array 
      explocao[v].resize(44, 37);   //se les hace un rezise tambien
    }
  }
  void puntos() {
    textAlign(CORNER, CORNER); 
    // por alguna extraña razon suma el doble de puntos a si que solo le sumamos la mitad
    if (test2.abducido==true)  puntos=puntos+10;  //si el booleano de abducido(el cual indica si una persona fue abducida) es verdadero se suman 10 puntos
    if (Trap.abducido == true) {
      puntos = puntos + 50;
      Control = Control + 1;
    }
    if (Morocho.abducido==true)  puntos=puntos+10;  //si el booleano de abducido(el cual indica si una persona fue abducida) es verdadero se suman 10 puntos
    if (Neg.abducido==true)  puntos=puntos+10;  //si el booleano de abducido(el cual indica si una persona fue abducida) es verdadero se suman 10 puntos
    if (PeliR.abducido==true)  puntos=puntos-30;  //si el booleano de abducido(el cual indica si una persona fue abducida) es verdadero se restan 50 puntos
    if (Rubio.abducido==true)  puntos=puntos+10;   //si el booleano de abducido(el cual indica si una persona fue abducida) es verdadero se suman 10 puntos
    if (amongus.abbd==true)  puntos=puntos+500;   //si el booleano de abducido(el cual indica el amongus fue abducida) es verdadero se suman 500 puntos, este es un personaje especial, por lo que da mas puntos
    textSize(40); //se hace un resize del texto
    textFont(puntosText, 48);  // se usa el font cargado previemante
    fill(0, 255, 0, 230);  //se le da fill verde con un poquito de transparencia
    text("Puntos: "+int(puntos), 50, 50);  //se pone el texto de los puntos se casteo la variable por si a caso
    if (puntos>=1000  &&  Jefe==1) estado = 15;  //si los puntos son mayores a 1000 y la variable de que si ya se jugo con el jefe es is igual a 1 (que no se jugó) se pasa a el estado 15(jefe final)
  }
  void fps() {
    if (frameRate<30) fill(255, 0, 0);    // si los fps son menores a 30 se van a poner en rojo
    if ((frameRate<60) && (frameRate>30)) fill(255, 127, 0, 230);    // si los fps son mayores a 30 pero menos de 60 se ponen en naranja
    if (frameRate>60) fill(0, 255, 0, 230);    // si los fps son mayores a 60 se ponen en verde
    text("fps: "+int(frameRate), 1400, 50);  // se pone el texto de los fps casteados porque por alguna razon dan con coma qcy
  }
  void vidas(int MenosVida) {  // se trae el dato de a partir de cuantas vidas tiene que explotar el ovni
    if (vidas<=0) estado=19;  //si las vidas llegan a 0 se pasa a otro estado(pantalla final)
    fill(255, 0, 0, 100);   //se pone el color rojo para el color de las vidas y una transparencia menor porque se va a proyectar muchas veces y al haber mas de 1 se va agregando nitidez
    text("Vidas: ", 700, 50);  //se pone el texto de las vidas
    image(ovniVidaR, xx2R, 15);  //se pone la parte derecha de la imagen del ovni
    image(ovniVidaL, xx2L, 15);  //se pone la parte izquierda de la imagen del ovni
    if (vidas <= MenosVida) {  //si las vidas son menores o iguales a el parametro que se paso para que explote la nave se cumple esta condicion
      t=t+1;  //empieza a correr la variable de tiempo

      if (t>= 50) { //se pone un timer de si el tiempo es mayor a 50
        if (k<6) {  //y si las imagenes son menores a 6 a si solo se ve 1 vez el giff o array de imagenes
          if (t%10 == 0) k++;  //siempre que el tiempo sea divisible por 10 se le suma 1 valor a 'k' que va a pasar a la siguiente imagen del array
          image(explocao[k], explX, 9);  // se pone la imagen de explosión
        }
        xx2R=xx2R+vloz; //se separa la mitad derecha sumandole la variale de velocidad
        xx2L=xx2L-vloz; //se separa la mitad izquierda restandole la variale de velocidad
      } else { //si el tiempo no es mejor a 50 se separa el ufo es totalmente estetico esto
        xx2R=psk2+33;  //se separan los ufo por 6 pixeles
        xx2L=psk2-3;   //se separan los ufo por 6 pixeles
      }
      if (xx2L<-30 && xx2R > width) vloz=0;  //si ambas mitades de la nave pasaron el limite de la pantalla la velocidad es 0 a si no sigue cargando nada la compu.
      else vloz = 6;  // si la conndicion de arriba no paso la velocidad es 6
    } else {  // si la primera condicion de que las vidas bajaron no se cumple se redefinen las variables iniciales
      xx2L=psk2;  //se define la psocion x de la primera imagen de la mitad del ovni en la ubicacion de psk porque el imageMode esta en corner
      xx2R=xx2L+30;  //se pone la segunda imagen de la nave justo donde termina la otra
      explX=xx2L+7;  //se define la ubicacion en x de la explosión
      k=0;    //la posicion de imagen de array se pone en 0
    }
  }
}




class Fondo {
  int Pos_X_FondoC1 = 0;  // posicion que se va usar para mover el primer fondo
  int Pos_X_FondoC2 = -1600;  // posicion que se va a usar para mover el segundo fondo
  PImage fondoC1;   // se decalara la primera imagen
  PImage fondoC2;  // se decalara la segunda imagen

  Fondo(PImage imgCiudad) {
    imgCiudad.resize(1600, 900);  // se le hace un rezise a la imgaen del fondo para que entre bien en la pantalla
    fondoC1=imgCiudad;  //se declara el fondo1
    fondoC2=imgCiudad;  //se declara el fondo2
  }
  void moverFondo() {
    Music ++;
    if(Music >=36000) Sail.play();
    imageMode(CORNER);  //ponemos el imagemode en corner porque mas adelante se va a usar en center, pero viene predeterminado el corner
    Pos_X_FondoC1 = Pos_X_FondoC1 - 1; // funcion de movimiento del fondo1
    Pos_X_FondoC2 = Pos_X_FondoC2 - 1; // funcion de movimiento del fondo2
    image(fondoC1, Pos_X_FondoC1, 0);  //se grafica el primer fondo
    image(fondoC2, Pos_X_FondoC2, 0); // se grafica el segundo fondo
    if ( Pos_X_FondoC1 <= -1600) {  //en esta funcion se pregunta si la primera imagen ya paso por completo el borde, que vuelva para atras
      Pos_X_FondoC1 = 1600;
    }
    if ( Pos_X_FondoC2 <= -1600) {  //en esta funcion se pregunta si la segunda imagen ya paso por completo el borde, que vuelva para atras
      Pos_X_FondoC2 = 1600;  //se redirige la imagen a su posicion original
    }
    if (estado == 15 || estado == 16) {   //si el estado es 15 o 16
      Pos_X_FondoC1 = Pos_X_FondoC1 + 1;     //el fondo1 vuelve a moverse
      Pos_X_FondoC2 = Pos_X_FondoC2 + 1;     //el fondo2 vuelve a moverse
    }
  }
}

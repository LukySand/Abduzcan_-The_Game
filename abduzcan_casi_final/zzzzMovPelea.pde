
//---------------------------------------------------------CLASES PARA CADA ETAPA DE LA BATTALLA------------------------------------------//
class Huesos1 { //Primer ola de huesos que viene hacia el jugador
  //--------------------- Hicimos esto para facilitar las colisiones y tener un codigo mas chico----------------------//
  int[] posXHD = new int[Cantidad]; // Arrays para cada posicion de X de los huesos de arriba X - posicion x, H - hueso, D - Derecha (en este caso hace referencia a los de arriba)
  int[] posXHI = new int [Cantidad]; // Arrays para cada posicion de X de los huesos de Abajo X - posicion x, H - hueso, I - Izquierda (en este caso hace referencia a los de Abajo)
  int[] posYHD = new int[Cantidad]; // Arrays para cada posicion de Y de los huesos de Arriba Y - posicion y, H - hueso, D - Derecha (en este caso hace referencia a los de arriba)
  int[] posYHI = new int[Cantidad]; // Arrays para cada posicion de Y de los huesos de Abajo Y - posicion y, H - hueso, D - Izquierda (en este caso hace referencia a los de Abajo)
  int HVDx; // Int para todas las posiciones en x iniciales, usamos esto para que cada hueso tenga una diferencia de 200 pixeles del otro
  int HVIx; // Int para todas las posiciones en x iniciales, usamos esto para que cada hueso tenga una diferencia de 200 pixeles del otro
  int tiempo = 0; // Variable de tiempo para delay entre etapas

  Huesos1() {
    HVDx = 1020;
    HVIx  = 1120;   
    for (int i = 0; i<posXHD.length; i++) { // Definimos todas las posiciones de los arrays al comenzar la pelea
      posXHD[i] = HVDx;
      posXHI[i] = HVIx; 
      posYHD[i] = 475;
      posYHI[i] = 660;
      HVDx = HVDx + 200; // Suma que define la distancia de 200 pixeles entre cada hueso
      HVIx = HVIx + 200; // Suma que define la distancia de 200 pixeles entre cada hueso
    }
  }
  void HuesosVMov(int i) {  // Void del movimiento de los huesos 
    if ( estado == 9) {
      posXHD[i] = posXHD[i] - 3;      
      posXHI[i] = posXHI[i] - 3;
    }
  }
  void HuesosDib01(int j) { // Void que dibuja a los huesos de Arriba
    if ( estado == 9) {
      imageMode(CORNER);
      BoneV.resize(35, 180);
      image(BoneV, posXHD[j], posYHD[j] ); // Carga la imagen de los huesos
      fill(#ED0707);
      rectMode(CENTER);
      rect(width/2, 100, RVidas, 50);  // rectangulo que representa la vida dentro de la batalla
      for (int k = 0; k<posXHD.length; k++) { // For que recorre el array constantemente para detectar una colision de cualquiera de los huesos
        if (abs(posXHD[k]  - UFOX - 15) <= 2 && posYHD[k] + 180 >= UFOY - 12 && UFOY <= 655 ) { // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
          RVidas = RVidas - 3; // Resta al rectangulo qeu representa la vida del jugador
        }
      }
    }
  }
  void HuesosDib02(int j) { // Void que dibuja a los huesos de abajo
    if ( estado == 9) {
      BoneV.resize(35, 180);
      image(BoneV, posXHI[j], posYHI[j]);  // Carga la imagen de los huesos
      for (int a = 0; a<posXHI.length; a ++) { // For que recorre el array constantemente para detectar una colision de cualquiera de los huesos
        if (abs(posXHI[a] - UFOX - 15) <= 2 && posYHI[a] <= UFOY + 12) {  // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
          RVidas = RVidas - 3; // Resta al rectangulo qeu representa la vida del jugador
        }
      }
    }
    if (posXHD[7]<400) { // Condicion que mide el ultimo hueso del array para saber cuando ya paso al jugador y pasar a la siguiente etapa
      println(tiempo);
      tiempo ++; // Variable que creamos para hacer un delay entre etapas
      background(0);
      if (tiempo>150) {
        estado = 10;
      }
    }
  }
}
class Huesos2 { //Segunda ola de huesos que viene hacia el jugador
  int HHDy = 1000; // Int para definir la distancia entre los huesos y su posicion inicial
  int HHIy = -1700; // Int para definir la distancia entre los huesos y su posicion inicial
  int[] posYHI = new int[Cantidad]; // Array de la posicion en Y de todos los huesos, Y - la posicion, H - Huesos, I - Izquierda
  int[] posXHI = new int[Cantidad]; // Arrays para cada posicion de X de los huesos de Abajo X - posicion x, H - hueso, I - Izquierda 
  int[] posYHD = new int[Cantidad]; // Arrays para cada posicion de Y de los huesos de Arriba Y - posicion y, H - hueso, D - Derecha
  int[] posXHD = new int[Cantidad]; // Arrays para cada posicion de X de los huesos de arriba X - posicion x, H - hueso, D - Derecha
  int tiempo = 0; // Variable de tiempo para delay entre etapas
  Huesos2() {
    for (int i = 0; i<posXHD.length; i++) { // Definimos todas las posiciones de los arrays para la segunda etapa de la pelea
      posXHD[i] = 800;
      posXHI[i] = 540;
      posYHD[i] = HHDy;
      posYHI[i] = HHIy; 
      HHIy = HHIy + 250; // Suma que define la distancia de 250 pixeles entre cada hueso
      HHDy = HHDy + 270; // Suma que define la distancia de 270 pixeles entre cada hueso
    }
  }
  void HuesosVMov2(int i) {  // Void del movimiento de los huesos 
    if (estado == 10) {
      posYHD[i] = posYHD[i] -  3;
      posYHI[i] = posYHI[i] +  3;
      if (posYHD[7]< 200) { // Condicion que mide el ultimo hueso del array para saber cuando ya paso al jugador y pasar a la siguiente etapa
        background(0);
        tiempo ++; // Variable que creamos para hacer un delay entre etapas
        if (tiempo> 150) {
          estado = 11;
        }
      }
    }
  }
  void HuesosDib03(int j) {  // Void que dibuja a los huesos de la Derecha
    if ( estado == 10) {
      imageMode(CORNER);
      BoneH.resize(250, 30);
      image(BoneH, posXHD[j], posYHD[j]);  // Carga la imagen de los huesos
      fill(#ED0707);
      rectMode(CENTER);
      rect(width/2, 100, RVidas, 50);  // rectangulo que representa la vida dentro de la batalla
      for (int k = 0; k<posXHD.length; k++) { // For que recorre el array constantemente para detectar una colision de cualquiera de los huesos
        if (abs(posYHD[k] - UFOY - 12) <= 2 && posXHD[k]  <= UFOX + 30) { // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
          RVidas = RVidas - 3; // Resta al rectangulo qeu representa la vida del jugador
        }
      }
    }
  }
  void HuesosDib04(int j) {  // Void que dibuja a los huesos de la Izquierda
    image(BoneH, posXHI[j], posYHI[j]);  // Carga la imagen de los huesos
    for (int a = 0; a<posXHI.length; a ++) { // For que recorre el array constantemente para detectar una colision de cualquiera de los huesos
      if (abs(posYHI[a] + 30 - UFOY + 12) <= 2 && posXHI[a] + 250 >= UFOX - 30) { // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
        RVidas = RVidas - 3; // Resta al rectangulo qeu representa la vida del jugador
      }
    }
  }
}
class Huesos3 {  //Tercer ola de huesos que viene hacia el jugador
  int[] posXHD = new int[Cantidad]; // Arrays para cada posicion de X de los huesos de arriba X - posicion x, H - hueso, D - Derecha (en este caso hace referencia a los de arriba)
  int[] posYHD = new int[Cantidad]; // Arrays para cada posicion de Y de los huesos de Arriba Y - posicion y, H - hueso, D - Derecha
  int[] posXHI = new int[Cantidad]; // Arrays para cada posicion de X de los huesos de Abajo X - posicion x, H - hueso, I - Izquierda (en este caso hace referencia a los de Abajo)
  int[] posYHI = new int [Cantidad]; // Array de la posicion en Y de todos los huesos, Y - la posicion, H - Huesos, I - Izquierda
  int HVDx = 1020; // Int para definir la distancia entre los huesos y su posicion inicial
  int HVIx = 950; // Int para definir la distancia entre los huesos y su posicion inicial
  int timepo = 0; // Variable de tiempo para delay entre etapas
  Huesos3() {
    for (int i = 0; i<posXHD.length; i++) { // Definimos todas las posiciones de los arrays para la segunda etapa de la pelea
      posXHD[i] = HVDx;
      posXHI[i] = HVIx;
      posYHD[i] = 470;
      posYHI[i] = 670;
      HVDx = HVDx + 200; // Suma que define la distancia de 200 pixeles entre cada hueso
      HVIx = HVIx + 200; // Suma que define la distancia de 200 pixeles entre cada hueso
    }
  }
  void HuesosVMov3(int i) {  // Void del movimiento de los huesos 
    if (estado == 11) {
      posXHD[i] = posXHD[i] -  3;
      posXHI[i] = posXHI[i] - 3;
    }
    if (posXHD[7]< 200) { // Condicion que mide el ultimo hueso del array para saber cuando ya paso al jugador y pasar a la siguiente etapa
      background(0);
      tiempo ++; // Variable que creamos para hacer un delay entre etapas
      if (tiempo>150) { 

        estado = 12;
      }
    }
  }
  void HuesosDib05(int j) { // Void que dibuja a los huesos de la Derecha
    imageMode(CORNER);
    if (estado == 11) {
      BoneV.resize(30, 180);
      image(BoneV, posXHD[j], posYHD[j]);  // Carga la imagen de los huesos
      fill(#ED0707);
      rectMode(CENTER);
      rect(width/2, 100, RVidas, 50); // rectangulo que representa la vida dentro de la batalla
      for (int k = 0; k<posXHD.length; k++) { // For que recorre el array constantemente para detectar una colision de cualquiera de los huesos
        if (abs(posXHD[k] - UFOX - 10) <= 0 && posYHD[k] + 180 >= UFOY - 12 && UFOY <= 655 ) { // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
          RVidas = RVidas - 3; // Resta al rectangulo qeu representa la vida del jugador
        }
      }
    }
  }
  void HuesosDib06(int j) { // Void que dibuja a los huesos de la izquierda
    image(BoneV, posXHI[j], posYHI[j]);  // Carga la imagen de los huesos
    for (int a = 0; a<posXHI.length; a ++) { // For que recorre el array constantemente para detectar una colision de cualquiera de los huesos
      if (abs(posXHI[a] - UFOX - 15) <= 0 && posYHI[a] <= UFOY + 12) { // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
        RVidas = RVidas - 3; // Resta al rectangulo qeu representa la vida del jugador
      }
    }
  }
}
class Huesos4 { //Cuarta ola de huesos que viene hacia el jugador

  int[] posXHD = new int[Cantidad]; // Arrays para cada posicion de X de los huesos de arriba X - posicion x, H - hueso, D - Nos quedo la D de antes
  int[] posYHD = new int[Cantidad]; // Arrays para cada posicion de Y de los huesos de Arriba Y - posicion y, H - hueso, D - Igual que arriba
  int HHDx = 1300; // Int para definir la distancia entre los huesos y su posicion inicial
  int HHDy = 320; // Int para definir la distancia entre los huesos y su posicion inicial
  Huesos4() {
    for (int i =0; i<posXHD.length; i++) {
      posXHD[i] = HHDx;
      posYHD[i] = HHDy;
      HHDx = HHDx + 250; // Suma que define la distancia de 250 pixeles entre cada hueso
      HHDy = HHDy + 70; // Suma que define la distancia de 70 pixeles entre cada hueso
    }
  }

  void HuesosVMov4(int i) {  
    if (estado == 12) {
      posXHD[i] = posXHD[i] - 5;
    }
  }
  void HuesosDib4(int j) {
    if (estado == 12) {
      imageMode(CORNER);
      BoneH.resize(250, 50);
      image(BoneH, posXHD[j], posYHD[j]);  // Carga la imagen de los huesos
      fill(#ED0707);
      rectMode(CENTER);
      rect(width/2, 100, RVidas, 50);  // rectangulo que representa la vida dentro de la batalla
      for (int k = 0; k<posXHD.length; k++) {
        if (posYHD[k] + 50 >= UFOY + 15 && abs(posXHD[k] - UFOX + 30) <= 0) { // Colision de los huesos con el jugador, tomamos solo la parte del frente de los huesos por que sino era demasiado complicado
          RVidas = RVidas - 250; // Resta al rectangulo qeu representa la vida del jugador
        }
      }
    }
    if (posXHD[7] < 100) { // Condicion que mide el ultimo hueso del array para saber cuando ya paso al jugador y pasar a la siguiente etapa
      GP.pause(); // Pausa de la musica de la batalla
      estado = 22;
    }
  }
}

void MovPelea() {
  if (up == true) UFOY = UFOY - 4;   //si el booleano correspondiente a la presion de la tecla W es verdad la variable de posicion de la nave se le suman 4 unidades
  if (down == true) UFOY = UFOY + 4;   //si el booleano correspondiente a la presion de la tecla S es verdad la variable de posicion de la nave se le suman 4 unidades
  if (right == true) UFOX = UFOX + 4;  //si el booleano correspondiente a la presion de la tecla D es verdad la variable de posicion de la nave se le suman 4 unidades
  if (left == true) UFOX = UFOX - 4;  //si el booleano correspondiente a la presion de la tecla A es verdad la variable de posicion de la nave se le suman 4 unidades
  if (estado == 7 || estado == 8 || estado == 9 || estado == 10 || estado == 11) { // Constrain para que el UFO no pueda salir del cuadrado de batalla durante la pelea
    UFOY =  constrain(UFOY, 495, 825);
    UFOX =  constrain(UFOX, 580, 1020);
  }
  if (estado == 12) { // Contrain de la parte final de la batalla para poder mover los costados del cuadrado de batalla
    UFOX =  constrain(UFOX, 480, 1020);
    UFOY =  constrain(UFOY, 495, 870);


    if (PosIRX+10 - UFOX+30  >= 0) { // Collision para poder mover el el costado izquierdo del cuadrado de batalla

      PosIRX = PosIRX - 4;
    }
    if (10 + PosARY - UFOY -20 <= 0) { // Collision para poder mover el el costado bajo del cuadrado de batalla
      PosARY = PosARY + 4;
    }
  }
}
//-------------------------------------------Void de muerte dentro de la batalla de Sans-------------------------------------------//
void Muerte() { 

  if (RVidas <= 0) { // Condicion que mida si la vida llego a cero
    Jefe = 0;
    estado = 18;
    GP.pause(); // Pausa de la musica de la batalla de Sans
    //--------------------------------------Animacion de de muerte de UFO-------------------------------------//
    if (estado == 18) { 
      TimeX ++;    // Variable de tiempo para que se genere un delay en la animacion 
      println(TimeX);
      background(0);
      UFO2.resize(38, 24);
      UFO3.resize(38, 24);
      fill(255, 0, 0);
      rect(x1 + 5, UFOY, 18, 18); // Rectangulo que simboliza una explosion
      fill(#EA9E21);
      rect(x1 + 5, UFOY, 12, 12); // Rectangulo que simboliza una explosion
      image(UFO2, x1 - 23, UFOY); // Se carga la imagen del UFO roto (Parte Izquierda)
      image(UFO3, x2 + 23, UFOY + 1); // Se carga la imagen del UFO roto (Parte Derecha)
      if (TimeX >= 20) { // Condicion que mide el final del delay
        background(0); // para que desaparezca la explosion
        image(UFO2, x1 - 23, UFOY); // Se cargan la imagenes devuelta
        image(UFO3, x2 + 23, UFOY + 1); // Se cargan la imagenes devuelta
        x1 = x1 - 5; // Suma para que las partes de los UFO salgan volando para los costados
        x2 = x2 + 5; // Suma para que las partes de los UFO salgan volando para los costados
      }
      if (x1< - 100) { // Condicion para que una vez que ya salieron las partes de los UFO vuelva a la etapa 19
        estado = 19;
      }
    }
  }
}

void UFO() {
  imageMode(CENTER);
  UFO.resize(60, 24);
  image(UFO, UFOX, UFOY);
}


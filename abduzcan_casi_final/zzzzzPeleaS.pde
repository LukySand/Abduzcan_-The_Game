float PosSans = 300;
float VelSans = 0.15;
float EFECTO = 0.002;
//---------------------------------------------------------------VOID QUE INCLUYE TODA LA PELEA FINAL---------------------------------------------//
void SansS() {
  if (estado == 7) {  // Condicion para ver en que estado esta el juego
    CuadradoSeba(); // Se llama al void de cuadrado de batalla
    imageMode(CENTER);
    SansT.resize(250, 250);
    image(SansT, width/2, PosSans); // Se llama a la imagen de Sans hablando
    PosSans = PosSans + VelSans; // movimineto de Sans flotando
    VelSans = VelSans - EFECTO; // Resta para que cuando sans esta bajando baje cada vez mas lento
    rectMode(CORNER);
    Texto(); // Llamada el void de texto

      if (PosSans>330) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = (-0.30); // Se reversa el valor para que valla para arriba
    }
    if (PosSans<290) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = 0.30; // Se reversa el valor para que valla para abajo
    }
  }
  if (key == 'e' || key == 'E') { // Para saltear el dialogo una vez qeu lo leiste
    estado = 8;
  }
  if (estado == 8) { // Condicion para ver en que estado esta el juego
    tiempo ++;
    background(0);
    imageMode(CENTER);
    Seba2NO.resize(250, 250); // imagen de Sans sin ojos
    image(Seba2NO, width/2, PosSans);
    Texto(); // Se llama al void de texto de esta etapa

    if (PosSans>330) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = (-0.30); // Se reversa el valor para que valla para arriba
    }
    if (PosSans<90) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = 0.30; // Se reversa el valor para que valla para abajo
    }
    if (tiempo>150) { // delay donde Snas dice Muere

      estado = 9;
    }
  }
  if (estado == 9) {  // Condicion para ver en que estado esta el juego
    background(0);
    CuadradoSeba(); // Se llama al void de cuadrado de batalla
    SebaS.resize(250, 250);
    image(SebaS, width/2, PosSans); // se llama a la imagen de Sans normal
    PosSans = PosSans + VelSans; // movimineto de Sans flotando
    VelSans = VelSans - EFECTO;  // Resta para que cuando sans esta bajando baje cada vez mas lento


    for (int j=0; j<Setup.length; j++) myHuesos1.HuesosDib01(j); // Array que llama y dibuja a los huesos
    for (int j=0; j<Setup.length; j++) myHuesos1.HuesosDib02(j);  // Array que llama y dibuja a los huesos
    for (int i=0; i<Setup.length; i++) myHuesos1.HuesosVMov(i); // Array que llama al movimiento de los huesos





    if (PosSans>330) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = (-0.30); // Se reversa el valor para que valla para arriba
    }
    if (PosSans<290) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = 0.30;
    }
  }

  if (estado == 10) {  // Condicion para ver en que estado esta el juego
    background(0);
    CuadradoSeba(); // Se llama al void de cuadrado de batalla
    SebaS.resize(250, 250);
    image(SebaS, width/2, PosSans); // se llama a la imagen de Sans normal
    PosSans = PosSans + VelSans; // movimineto de Sans flotando
    VelSans = VelSans - EFECTO; // Resta para que cuando sans esta bajando baje cada vez mas lento


    for (int j=0; j<Setup.length; j++) myHuesos2.HuesosDib03(j);  // Array que llama y dibuja a los huesos
    for (int j=0; j<Setup.length; j++) myHuesos2.HuesosDib04(j);  // Array que llama y dibuja a los huesos
    for (int i=0; i<Setup.length; i++) myHuesos2.HuesosVMov2(i);  // Array que llama al movimiento de los huesos


    if (PosSans>330) { // Condicion para crear la ilusion de que sansa esta flotando
 
      VelSans = (-0.30); // Se reversa el valor para que valla para arriba
    }
    if (PosSans<290) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = 0.30; // Se reversa el valor para que valla para abajo
    }
  }
  if (estado == 11) {  // Condicion para ver en que estado esta el juego
    background(0);
    CuadradoSeba(); // Se llama al void de cuadrado de batalla
    SebaS.resize(250, 250);
    image(SebaS, width/2, PosSans); // se llama a la imagen de Sans normal
    PosSans = PosSans + VelSans; // movimineto de Sans flotando
    VelSans = VelSans - EFECTO; // Resta para que cuando sans esta bajando baje cada vez mas lento


    for (int j=0; j<Setup.length; j++) myHuesos3.HuesosDib05(j);  // Array que llama y dibuja a los huesos
    for (int j=0; j<Setup.length; j++) myHuesos3.HuesosDib06(j);  // Array que llama y dibuja a los huesos
    for (int i=0; i<Setup.length; i++) myHuesos3.HuesosVMov3(i);  // Array que llama al movimiento de los huesos


    if (PosSans>330) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = (-0.30); // Se reversa el valor para que valla para arriba
    }
    if (PosSans<290) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = 0.30; // Se reversa el valor para que valla para abajo
    }
  }
  if (estado == 12) {  // Condicion para ver en que estado esta el juego
    background(0);
    CuadradoSeba(); // Se llama al void de cuadrado de batalla
    SebaS.resize(250, 250);
    image(SebaS, width/2, PosSans); // se llama a la imagen de Sans normal
    PosSans = PosSans + VelSans; // movimineto de Sans flotando
    VelSans = VelSans - EFECTO; // Resta para que cuando sans esta bajando baje cada vez mas lento
    for (int j=0; j<Setup.length; j++) myHuesos4.HuesosDib4(j);  // Array que llama y dibuja a los huesos
    for (int i=0; i<Setup.length; i++) myHuesos4.HuesosVMov4(i); // Array que llama al movimiento de los huesos


    if (PosSans>330) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = (-0.30); // Se reversa el valor para que valla para arriba
    }
    if (PosSans<290) { // Condicion para crear la ilusion de que sansa esta flotando

      VelSans = 0.30; // Se reversa el valor para que valla para abajo
    }
  }
}


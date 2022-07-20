

class Pantalla {
  int Pos_X_FondoC1 = 0;  // posicion que se va usar para mover el primer fondo
  int Pos_X_FondoC2 = 1600;  // posicion que se va a usar para mover el segundo fondo
  int tiempo = 0;
  int Frames = 0;
  PImage fondoC1;   // se decalara la primera imagen
  PImage fondoC2;  // se decalara la segunda imagen
   PImage Fondo;  // se decalara la imagen de fondo del reportero
  PImage TV;  //imagen de la tele en la que esta el reportero
  PImage Tablet;  //imagen de la tablet
  PFont puntosText;  //se declara la tipografia
  PFont NewsF;  //se declara la tipografia del periodista
  PImage[] NewsStation = new PImage[2];  //array de imagenes  del periodista

  Pantalla () {
     puntosText = loadFont("Copy of H2sa1M-250.vlw");    //se carga la tipografia
    Fondo = loadImage("Fondo.png");    //se carga la imagen del fondo de las noticias
    TV = loadImage("TV.png");  //se carga la imagen de la tele del periodista
    Tablet = loadImage("Tablet.png");  //se carga la tablet de los controles
    NewsF = loadFont("FranklinGothic-DemiCond-250.vlw");  //se carga la tipografia del periodista
    for (int i = 0; i<NewsStation.length; i++) {     //for para cargar las imagenes en el array
      NewsStation[i] = loadImage("spriteNE_"+i+".png");  // a cada posicion del array se le pone una imagen y mientras suben las posiciones del array tambien las de la imagen
      NewsStation[i].resize(867, 600); //se le hace un rezise a la imagen para que quede al tamaño deseado
    }
  }

  void Pinicio(PImage imgCiudad) { //void de fondo de la ciudad, es casi el mismo que el del inicio
    cursor();   //se usa la funcion cursor porque mas adelante se sua nocursor y bueno sino te quedas sin mouse si queres volver al menu
    Mii.play(); //se pone play a la musica del inico(la de la wii)
    int Color = 0; //variable de transparencia, vale 0, despues va a ser modificada
    int ColorT = 255; //variable de color del texto, vale 0, despues va a ser modificada
     imgCiudad.resize(1600, 900);  // se le hace un rezise a la imgaen del fondo para que entre bien en la pantalla
    fondoC1=imgCiudad;  //se declara el fondo1
    fondoC2=imgCiudad;  //se declara el fondo2
    if (estado == 0) { //se pregunta si el estado es igual a 0


     imageMode(CORNER);  //ponemos el imagemode en corner porque mas adelante se va a usar en center, pero viene predeterminado el corner
      Pos_X_FondoC1 = Pos_X_FondoC1 - 1; // funcion de movimiento del fondo1
      Pos_X_FondoC2 = Pos_X_FondoC2 - 1; // funcion de movimiento del fondo2
      image(fondoC1, Pos_X_FondoC1, 0);  //se grafica el primer fondo
      image(fondoC2, Pos_X_FondoC2, 0); // se grafica el segundo fondo
      if ( Pos_X_FondoC1 <= -1600) {  //en esta funcion se pregunta si la primera imagen ya paso por completo el borde, que vuelva para atras
        Pos_X_FondoC1 = 1600; //se redirige la imagen a su posicion original
      }
      if ( Pos_X_FondoC2 <= -1600) {  //en esta funcion se pregunta si la segunda imagen ya paso por completo el borde, que vuelva para atras
        Pos_X_FondoC2 = 1600; //se redirige la imagen a su posicion original
      }


      //-----------------------TEXTOS DEL TITULO DEL JUEGO--------------------------//
      rectMode(CENTER);
      noStroke();
      textFont(puntosText, 48);

      textSize(130);
      fill(225, 255, 225, 150);
      textAlign(CENTER, CENTER);
      text("A b d u z c a n", width/2, height*1/9 + 38);
      text("T h e  G a m e", width/2, height*1/4 +272);
      fill(0, 250, 89);
      text("A b d u z c a n", width/2+5, height*1/9 + 30);
      text("T h e  G a m e", width/2+5, height*1/4 +270);
      stroke(255);
      fill(Color);
      if ((mouseX<=(width/2 +150) && mouseX>=(width/2 -150)) && (mouseY<=(height*2/3+ 175 ) && mouseY>=(height*2/3 + 23))) { // colision que detecta si el mouse esta sobre el boton PLAY y cambiar el color cuando esta el mouse encima
        Color = 255; // Convierte el valor del color del boton en blanco
        ColorT = 0;  // Convierte el valor del color del texto en negro
        if (mousePressed) {   // Condicion que mide si el boton "PLAY" esta siendo apretado y lleva al estado 1
          Mii.pause();
          Sail.play();
          estado=1;
          noCursor();
        }
      } else noFill(); 
      if (Color == 255) fill(Color);     
      textAlign(CORNER, CORNER);
      rect(width/2, height*2/3 + 100, 300, 150);
      rect(width/2, height*2/3 + 100, 280, 130);
      fill(ColorT);
      text("PLAY", width/2-100, height*2/3+170);
    }
  }
//-------------------------------------------------VOID QUE LLEVA A LA PANTALLA DE HISTORIA------------------------------------------//
  void Historia() {
    int Color = 0; // Variable para controlar el color de los botones
    int ColorT = 255; // Variable para controlar el color de los textos

    if (estado == 0) { // Condicion que mide si esta en el estado 0
      stroke(255);
      fill(Color);
      if ((mouseX <= (width/2 - 250) && mouseX >= (width/2 -550)) && (mouseY <= (height * 2/3 + 175) && mouseY >= (height * 2/3 + 25))) { // colision que detecta si el maosue esta sobreel boton de home y cambiar el color cuando esta el mouse encima
        Color = 255;  // Convierte el valor del color del boton en blanco
        ColorT = 0; // Convierte el valor del color del texto en negro
        if (mousePressed) estado = 2; // Condicion que mide si el boton "Story" esta siendo apretado y lleva al estado 2
      } else noFill();
      textSize(100);
      if (Color == 255) fill(Color);
      rect(width/2 - 400, height * 2/3 + 100, 300, 150);
      rect(width/2 - 400, height * 2/3 + 100, 280, 130);
      fill(ColorT);
      text("Story", width/2 - 500, height*2/3+150);
    }
    if ( estado == 2) { // Condicion que mide si esta en el estado 2
      textFont(puntosText, 48);
      imageMode(CENTER);
      image(Fondo, width/2, height/2);
      rectMode(CENTER);
      noStroke();
      textSize(68);
      fill(Color);
      if (mouseX >= 1400 && mouseX <=1600 && mouseY <= 900 && mouseY >=800) { // colision para apretar el boton de home y cambiar el color cuando esta el mouse encima
        Color = 255; // Convierte el valor del color del boton en blanco
        ColorT = 0; // Convierte el valor del color del texto en negro
        if (mousePressed) estado = 0; // Condicion que mide si el boton "Back" esta siendo apretado y lleva al estado 2
      }
      if (Color == 255) fill(Color);
      textAlign(CORNER, CORNER);
      rect(1500, 850, 200, 100);
      fill(ColorT); 
      text("Back", 1450, 890); 
      TV.resize(1300, 1100);
      image(TV, width/2, height/2 - 150);
      tiempo = tiempo + 1;
      image(NewsStation[Frames], width/2 - 152, height/2 + 10); // llamado de los frames del locutor moviendo la cabeza
      if (tiempo % 8 == 0) { // condicion que cambia de frame despues de cierto tiempo para que no se muevan tan rapido
        Frames = Frames + 1 ;
      }
      if (Frames == NewsStation.length) Frames = 0; // Condicion que reinicia el valor de los frames cuando el array llego al final
      textAlign(CENTER, CENTER);
      textSize(38);
      fill(255);
      //-------------------------------------------------------LINEAS DE TEXTO QUE DICE EL LOCUTOR--------------------------------//
      if (LDTexto == 0) { 
        Bla.play();
        text("Buenas tardes, mi nombre es Flavio Josefo, en las noticias de hoy:", width/2 - 150, 700);
        text("Un objeto volador no identificado, ha venido a nuesto paneta.", width/2 - 150, 730);
        textSize(20);
        text("Apretar 'E' para continuar", width/2 - 150, 783);
        
      } else Bla.pause();
      if (LDTexto == 1) {
        Bla1.play();
        text("El mismo exige que entreguemos el planeta como parte del Gran", width/2 - 150, 700);
        text("Imperio boliviano del planeta Kaleta", width/2 - 150, 730);
        
      }  else Bla1.pause();
      if (LDTexto == 2) {
        Bla2.play();
        text("El OVNI fue divisado por primera vez saliendo de La Pampa", width/2 - 150, 700);
        text("y desde entonces no a dejado de abducir gente.", width/2 - 150, 730);
         
      } else Bla2.pause();
      if (LDTexto == 3) {
        Bla3.play();
        text("¿Se apiadara el D1EG0 de nosotros?", width/2 - 150, 700);
         
      } else Bla3.pause();
      if (LDTexto == 4) {
        Bla4.play();
        text("¿Cual sera nuestro destino?", width/2 - 150, 700);
         
      } else Bla4.pause();
      if (LDTexto >=5) { // Condicion que vuleve al inicio al terminar la historia 
        estado = 0;
        LDTexto = 0;
      }
    }
  }
//-------------------------------------------------------------VOID DE LA PANTALLA DE CONTROLS Y PUNTAJE---------------------------------------------------//
  void Controls(PImage imgCiudad) {
    int Color = 0; // Variable para controlar el color de los botones
    int Color2 = 0; // Variable para controlar el color de los botones (usamos dos variables por que como esta dentro del mismo void aveces se bugeaba al usar la misma)
    int ColorT = 255; // Variable para controlar el color de las palabras
    int ColorT2 = 255; // Variable para controlar el color de las palabras (usamos dos variables por que como esta dentro del mismo void aveces se bugeaba al usar la misma)
    int ColorTRI = 0; // Variable que cambai el color del tru=iangulo cuando el mause esta encima
    
    if (estado == 0) { 
      fill(Color);      
      if ((mouseX >= (width/2 + 250) && mouseX <= (width/2 + 550)) && (mouseY <= (height * 2/3 + 175) && mouseY >= (height * 2/3 + 25))) {  // colision para apretar el boton de Info y cambiar el color cuando esta el mouse encima
        Color = 255; // Convierte el valor del color del boton en blanco
        ColorT = 0; // Convierte el valor del color del texto en negro
        if (mousePressed) estado = 3; // Condicion que mide si el usuario esta apretando el boton Info
      } else noFill();
      if (Color == 255) fill(Color);
      textSize(95);
      rect(width/2 + 400, height * 2/3 + 100, 300, 150);
      rect(width/2 + 400, height * 2/3 + 100, 280, 130);
      fill(ColorT);
      text("Info", width/2 + 340, height*2/3+150);
    }
    if ( estado == 3) {
      imgCiudad.resize(1600, 900);  // se le hace un rezise a la imgaen del fondo para que entre bien en la pantalla
      fondoC1=imgCiudad;  //se declara el fondo1
      fondoC2=imgCiudad;  //se declara el fondo2
      imageMode(CORNER);  //ponemos el imagemode en corner porque mas adelante se va a usar en center, pero viene predeterminado el corner
      Pos_X_FondoC1 = Pos_X_FondoC1 - 1; // funcion de movimiento del fondo1
      Pos_X_FondoC2 = Pos_X_FondoC2 - 1; // funcion de movimiento del fondo2
      image(fondoC1, Pos_X_FondoC1, 0);  //se grafica el primer fondo
      image(fondoC2, Pos_X_FondoC2, 0); // se grafica el segundo fondo
      if ( Pos_X_FondoC1 <= -1600) {  //en esta funcion se pregunta si la primera imagen ya paso por completo el borde, que vuelva para atras
        Pos_X_FondoC1 = 1600;
      }
      if ( Pos_X_FondoC2 <= -1600) {  //en esta funcion se pregunta si la segunda imagen ya paso por completo el borde, que vuelva para atras
        Pos_X_FondoC2 = 1600;
      }
      imageMode(CENTER);
      noStroke();
      image(Tablet, width/2, height/2);
      fill(Color);
      if (mouseX >= 1400 && mouseX <=1600 && mouseY <= 900 && mouseY >=800) { // Condicion que mide si el mouse esta sobre el boton Back
        Color = 255;
        ColorT = 0;
        if (mousePressed) estado = 0; // Condicion que mide si el boton Back esta siendo apretado y vuelve al estado 0
      }
      if (Color == 255) fill(Color);
      textAlign(CORNER, CORNER);
      rect(1500, 850, 200, 100);
      fill(ColorT); 
      text("Back", 1435, 890);
      textSize(68);
      fill(255);
      text("Controls:", 700, 250);
      text(" W - Mover UFO para arriba", 480, 310);
      text(" S - Mover UFO para abajo", 485, 390);
      text(" D - Mover UFO para la derecha", 475, 470);
      text(" S - Mover UFO para la izquierda", 455, 550);
      text(" ESPACIO - para rayo de abduccion", 425, 630);
      text(" E - para saltear dialogo", 495, 710);
      if (mouseX >= 1080 && mouseX <=1130 && mouseY <= 700 && mouseY >=640) { // condicion que detecta si el mouse esta sobre el el triangulo (no es tan exacto ya que es un triangulo
        ColorTRI = 255; // Cambia el color del truangulo cuando el mouse esta encima
        if (mousePressed) estado = 6; // Condicion que mide si se esta apretando el triangulo
      }
      fill(ColorTRI);
      triangle(1080, 640, 1130, 670, 1080, 700);
    }
    //----------------------------------------PANTALLA DONDE MUESTRA LOS VALORES DE LOS PUNTAJES-------------------------------------//
    if (estado == 6) {
      imgCiudad.resize(1600, 900);  // se le hace un rezise a la imgaen del fondo para que entre bien en la pantalla
      fondoC1=imgCiudad;  //se declara el fondo1
      fondoC2=imgCiudad;  //se declara el fondo2
      imageMode(CORNER);  //ponemos el imagemode en corner porque mas adelante se va a usar en center, pero viene predeterminado el corner
      Pos_X_FondoC1 = Pos_X_FondoC1 - 1; // funcion de movimiento del fondo1
      Pos_X_FondoC2 = Pos_X_FondoC2 - 1; // funcion de movimiento del fondo2
      image(fondoC1, Pos_X_FondoC1, 0);  //se grafica el primer fondo
      image(fondoC2, Pos_X_FondoC2, 0); // se grafica el segundo fondo
      if ( Pos_X_FondoC1 <= -1600) {  //en esta funcion se pregunta si la primera imagen ya paso por completo el borde, que vuelva para atras
        Pos_X_FondoC1 = 1600;
      }
      if ( Pos_X_FondoC2 <= -1600) {  //en esta funcion se pregunta si la segunda imagen ya paso por completo el borde, que vuelva para atras
        Pos_X_FondoC2 = 1600;
      }
      //----------------------------------------LLAMADO DE TODOS LOS PERSONAJES Y TEXTO DE PUNTAJE ALADO-----------------------------------------//
      imageMode(CENTER);
      image(Tablet, width/2, height/2);
      Morocho.Pderecha[0].resize(40, 80);
      image(Morocho.Pderecha[0], 500, 270);
      fill(255);
      text("Puntajes:", 700, 250);
      text(" + 10 puntos", 520, 320);
      PeliR.Pderecha[0].resize(40, 80);
      image(PeliR.Pderecha[0], 500, 360);
      text(" - 30 Puntos (Mufa) ", 520, 410);
      Rubio.Pderecha[0].resize(40, 80);
      image(Rubio.Pderecha[0], 500, 450);
      text(" + 10 Puntos", 520, 500);
      Neg.Pderecha[0].resize(40, 80);
      image(Neg.Pderecha[0], 500, 530);
      text(" + 10 Puntos", 520, 570);
      test2.Pderecha[0].resize(40, 80);
      image(test2.Pderecha[0], 500, 610);
      text(" + 10 Puntos", 520, 640);
      stroke(0);
      fill(255, 0, 0);
      text(" ? ", 485, 710); 
      fill(255);
      text("+ 500 ", 530, 710);     
      fill(Color2);
      if (mouseX >= 0 && mouseX <=200 && mouseY <= 900 && mouseY >=800) { // Condicion que mide si el mouse esta sobre el boton Back
       //Cambian los collores del rectangulo y del texto:
        Color2 = 255;
        ColorT2 = 0;
        if (mousePressed) estado = 3; // Condicion que mide si el boton Back esta siendo apretado y vuelve al estado 3
      } 
      if (Color2 == 255) fill(Color2);
      textAlign(CORNER, CORNER);
      rect(100, 850, 200, 100);
      fill(ColorT2); 
      text("Back", 35, 890);
    }
  }
}


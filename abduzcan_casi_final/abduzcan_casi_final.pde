// ABDUZCAN THE GAME
Pantalla inicio;  //clase de pantalla de inicio
Fondo ciudad;  //clase de el fondo del juego
Persona test2; //clase de la primera persona, quedo como test porque fue la primera
Persona Morocho; //clase de la persona Morocha
Persona Trap;
Persona Neg; //clase de la persona de Pelo Negro(mal pensados)
Persona PeliR; //clase de la persona Pelirroja
Persona Rubio; //clase de la persona Rubia
Personaje ovni;  //clase del ovni y personaje principal
Personajes_Especiales amongus;  //clase de un personaje especial en este caso un sus
Misiles Misil1;  //clase de misil
Misiles Misil2;  //clase de misil
Misiles Misil3;  //clase de misil
Contador contadores;  //clase de contadores, esta es de puntos y fps
Contador ovniVida1;  //clase de contadores, esta es de vidas   }
Contador ovniVida2;  //clase de contadores, esta es de vidas   }hay 3 clases porque de esta manera se utiliza menos codigo ._.
Contador ovniVida3;  //clase de contadores, esta es de vidas   }
//-----------------------Clases para todos los Huesos----------------------------//
Huesos1 myHuesos1; 
Huesos2 myHuesos2;
Huesos3 myHuesos3;
Huesos4 myHuesos4;
import ddf.minim.*; //importación de la librería de audio Minim
Minim minim; //creación de un objeto de clase Minim para manipular el audio
//-------------------------------------------------creación del objeto para interactuar con el audio de la pantalla principal--------------------------------------------------//
AudioPlayer Sadge;
AudioPlayer GP;
AudioPlayer Mii;
AudioPlayer AU;
AudioPlayer Sail;
AudioPlayer Bla;
AudioPlayer Bla1;
AudioPlayer Bla2;
AudioPlayer Bla3;
AudioPlayer Bla4;
AudioPlayer Celebrate;
//------------------------------Variables------------------------------//
PFont puntosText;  //variable de texto que vamos a usar
int LDTexto = 0; // Linea de texto que se muestra en la pantalla de histria.
PImage imgCiudad;  // primera imagen de fondo(ciduad)
boolean abz;  // booleano de la abduzzion
int estado = 0;  //variable de estados que se va a usar durante el juego
//------------------------------MEMES------------------------------//
PImage SadMario;
PImage SadC;
PImage SadB;
PImage RK;
//------------------------------MEMES------------------------------//

int Music = 0;
void setup() {
  size(1600, 900);//tamaño de pantalla que vamos a utilizar
  imgCiudad = loadImage("citities2.png");  //fondo de ciudad
  inicio = new Pantalla();  //Clase de la pantalla de inicio
  ciudad = new Fondo(imgCiudad);  // clase de fondos
  test2 = new Persona("sprite_");  // clase de personas que van a ser abducidas
  Trap = new Persona ("spriteT_"); // Clase de persna del trap
  Morocho = new Persona("spriteM_"); // clase de personas que van a ser abducidas
  Neg = new Persona("spriteN_"); // clase de personas que van a ser abducidas
  PeliR = new Persona("spriteP_"); // clase de personas que van a ser abducidas
  Rubio = new Persona("spriteR_"); // clase de personas que van a ser abducidas
  amongus = new Personajes_Especiales(); // clase de personajes que van a ser abducidas y tienen caracteristicas especiales
  ovni = new Personaje();  //clase del personaje principal, un ovni en este caso
  contadores = new Contador(0);  //contador de los puntos y fps
  ovniVida1 = new Contador(960);  //primera nave de vidas
  ovniVida2 = new Contador(880);  //segunda nave de vidas
  ovniVida3 = new Contador(800);  //tercera nave de vidas
  Misil1 = new Misiles(100, 0);  //primer misil
  Misil2 = new Misiles(50, 0);   //segundo misil
  Misil3 = new Misiles(1, 300);  //tercer misil
  //------------------------Creacion de Huesos----------------------------//
  myHuesos1 = new Huesos1();
  myHuesos2 = new Huesos2();
  myHuesos3 = new Huesos3();
  myHuesos4 = new Huesos4();
  minim = new Minim (this); //iniciación del objeto minim
  Sonidos(); // Void de todos los sondios
  frameRate(140); //cantidad de frames por segundo, si tu computadora no corre 140fps, se lo puede bajar a 30 para que corra mas fluido
  //======================Llamada de todas las imagenes de la batalla final y los fonts usados---------------------//
  SebaS = loadImage("Seba.png");
  UFO = loadImage("UFO1 Abduzcam.png");
  SansT = loadImage("SansT.png");
  Seba2NO = loadImage("Seba2NO.png");
  BoneV = loadImage("BoneV.png");
  BoneH = loadImage("BoneH.png");
  VidaText = loadFont("H2sa1M-48.vlw");
  Text = loadFont("Arial-BoldMT-48.vlw");
  UFO2 = loadImage("UFO2.png");
  UFO3 = loadImage("UFO3.png");
  RK = loadImage("RK.png");
  SadMario = loadImage("SadM.jpg");
  //--------------------------------------- ANIMACION DE SANS ENTRANDO LLAMADA-------------------------------//
  for (int v=1; v<CSans.length; v++) { 
    CSans[v]=loadImage("spriteSansMv_"+v+".png");
    CSans[v].resize(90, 130);
  }
  //-------------------DEFINICION DE IMAGENES DE MEMES-----------------------------------//
  FSans = loadImage("spriteSansMv_0.png");
  puntosText = loadFont("Copy of H2sa1M-250.vlw");
  SadC = loadImage("SadC.jpg");
  SadB = loadImage("SadB.jpg");
  ovniVolador=loadImage("UFO1 Abduzcam.png");  // se carga la imagen de la nave
}

void draw() {

  if (estado==0 || estado == 2 || estado == 3 || estado == 6) {

    inicio.Pinicio(imgCiudad);
    inicio.Historia();
    inicio.Controls(imgCiudad);
  } 
  if (estado == 1) {
    ciudad.moverFondo();  //void para que se puedan mover los fondos
    Trap.dibObst();
    Trap.abducc();
    test2.dibObst();  //void para que se puedan mover las personas
    test2.abducc();    // void de mecanica de la abducción
    Morocho.dibObst();  //void para que se puedan mover las personas
    Morocho.abducc();  // void de mecanica de la abducción
    Neg.dibObst();  //void para que se puedan mover las personas
    Neg.abducc();  // void de mecanica de la abducción
    PeliR.dibObst();  //void para que se puedan mover las personas
    PeliR.abducc();  // void de mecanica de la abducción
    Rubio.dibObst();  //void para que se puedan mover las personas
    Rubio.abducc();  // void de mecanica de la abducción
    amongus.dib();  //void para dibujar al amongus
    amongus.abducc();  //void de abduccion del amongus
    ovni.movOvni();   // void para que se pueda mover el ovni
    Misil1.Mov();  //void de movimiento del primer misil
    Misil1.Crash(); //void de coalision del primer misil
    if (temp>=1000) {  //si el tiempo es mayor a 1000 se activan 2 mislies
      Misil2.Mov();  //void de movimiento del segundo misil
    }
    Misil2.Crash(); //void de coalision del segundo misil
    if (temp>=2000) {  //si el tiempo es mayor a 2000 se activan los 3 misiles
      Misil3.Mov();  //void de movimiento del tercer misil
    }
    Misil3.Crash(); //void de coalision del tercer misil
    contadores.puntos(); //void de contardor de puntos
    contadores.fps();  //void de contador de puntos
    ovniVida1.vidas(2);  //void de tercera vida
    ovniVida2.vidas(1);  //void de segunda vida
    ovniVida3.vidas(0);  //void de primera vida
  }
  //-----------------------LLAMADO DE LOS VOIDS DE LA BATTALLA FINAL-----------------------//
  if (estado == 7 || estado == 8 || estado == 9 || estado == 10 || estado == 11 || estado == 12 || estado == 13) {

    SansS();
    UFO();
    MovPelea();
    Muerte();
  }
  if (estado == 18) Muerte();
  if (estado == 15 || estado == 16) {
    ciudad.moverFondo();  //void para que se puedan mover los fondos      
    Entrada();
  }
  if (estado == 19) PantallaMuerte(); // void de Pantalla si moris en el juego
  if (estado == 22) Final(); // Void si ganas la batalla final
}


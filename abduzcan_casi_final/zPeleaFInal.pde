int Cantidad = 8; // Cantidad de huesos por nivel
PImage SebaS; // imagen de Sans
PImage UFO; // imagen de UFO
PImage SansT; // imagen de Sans hablando
PImage Seba2NO; // Imagen de Sans sin ojos
PImage BoneV; // imagen de los huesos verticales
PImage BoneH; // imagen de husos horizontales
int[] Setup = new int[Cantidad]; // Array que llama a los arrays de las clases
boolean up, down, right, left; // Movimineto de los UFO
int RVidas = 250; // Rectangulo que desmuestra la vida
String s = "Hermoso dia no?"; // Primer frase que dice Sans cuando inicias la pelea
String d = "M U E R E"; // Segunda frase que dice sans antes de empezar la pelea
int tiempo = 0; // Variable de tiempo para medir ciertos aspectos como la pantalla de muerte
PFont VidaText; // Font del texto de Vidas
PFont Text; // Font del texto
PImage UFO2; // Imagen del UFO roto de la derecha
PImage UFO3; // Image del UFO roto de la izquierda
float x1 = UFOX; // Variable qeu mueve el UFO roto hacia la derecha
float x2 = UFOX; // Variable que mueve el UFO roto hacia la izquierda
int TimeX = 0; // Variable de timepo
int Jefe = 1; // Variable que mide si ya peleaste contra el Jefe, si te moris, Jefe sera = 0 y no podras pelear devuelta


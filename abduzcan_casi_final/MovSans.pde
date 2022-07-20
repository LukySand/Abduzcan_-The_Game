//---------------------------------ANIMACION DE SANS ENTRANDO--------------------------------//
PImage[] CSans = new PImage[4]; // Array de los sprites de sans caminando
PImage FSans; // Imagen de sans mirando al jugador
int Fr = 1; // FRames de sans
int MovS = - 750; // VAriable de la posicion de sans
int TIME = 0; // Variable para medir el timepo
void Entrada () {
 image(ovniVolador, UFOX + 2, UFOY); // Para que el UFO no desaparezca
  Sail.pause(); // Pausa de la musica del juego
    GP.play(); // Inicio de musica de sans
  if (estado == 15) { // Condicion para determinar si esta en el estado adecuado
    MovS = MovS + 1; // Movimiento de sans
    TIME ++; // Suma de la variable de tiempo para sabes cuando va a aparecer el texto

    image(CSans[Fr], MovS, 780); // Se cargan las imagenes del movimiento de sans
    if (TIME % 16 == 0) { // Funcion para que que los frames de la animacion vallan mas lento
      Fr = Fr + 1;
    }

    if (Fr == 4) Fr = 1; // condicion para que se reinicie el valor de frames una vez llegado al final de array
    if (MovS >= 150) estado = 16; // llamado al estado 16
  }
  if (estado == 16) { // se carga el estado 16 y se deja de mover a sans
    MovS = 150;
    FSans.resize(90, 130);
    image(FSans, MovS, 780); // imagen de sans mirando al jugador
    TIME ++;
  }
  if (TIME >= 1150) { // condicion para que aparezca el texto en el momento adecuado
    println(TIME);
    fill(0);
    stroke(255);
    rectMode(CENTER);
    rect(width/2, 130, 1100, 170);
    textFont(puntosText, 48);
    fill(255);
    textAlign(CENTER,CENTER);
    text("Podes creer que chile quedo 2 veces afuera del mundial?", width/2, 130);
    if(TIME > 1650) estado = 7; // Condicion para que entre a la batalla final
  }
}


float xx = 0; // Variable para aumentar la tranparencia de las imagenes
float xy = 0; // Variable para aumentar la tranparencia de las imagenes
float xr = 0; // Variable para aumentar la tranparencia de las imagenes
//----------------------------------------------------- Pantalla Muerte -------------------------------------------------------------//
void PantallaMuerte() {
  cursor(); // Para que aparezzca el mouse
  int Color = 0; // Variable para controlar el color de los botones
  int ColorT = 255; // Variable para controlar el color de las palabras
  int Color2 = 0;// Variable para controlar el color de los botones (usamos dos variables por que como esta dentro del mismo void aveces se bugeaba al usar la misma)
  int ColorT2 = 255; // Variable para controlar el color de las palabras
  if (estado == 19) {   // Condicion para saber si esta en el estado adecuado 
    xx = xx + 0.50; // Suma que aumenta la tranparencia de las imagenes
    xy = xy + 0.08; // Suma que aumenta la tranparencia de las imagenes
    xr = xr + 0.05; // Suma que aumenta la tranparencia de las imagenes
    Sail.pause(); // Pausa la cancion del Juego
    Sadge.play();  // Pone play a la cancion triste 
    fill(255);
    textFont(puntosText, 48); // Font que usamos
    background(0);  
    tint(255, 255, 255, xr); // Controla el color y la transparencia de las imagenes
    image(SadB, 900, 100);  
    tint(255, 255, 255, xy); 
    image(SadC, 200, 200);
    tint(255, 255, 255, xx); 
    image(SadMario, width/2, height/2); // imagenes de memes tristes
    textSize(150);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2 - 100);
    text(":(", width/2, height/2 + 50);
    textSize(70);
    text("No te podes dar por vencido aun...", width/2, height/2 + 200 );
    stroke(255);
    fill(Color);
    if ((mouseX <= (width/2 - 460) && mouseX >= (width/2 - 740)) && mouseY <= 865 && mouseY >= 735) { // colision para apretar el boton de home y cambiar el color cuando esta el mouse encima
      Color = 255; // Convierte el valor del color del boton en blanco
      ColorT = 0; // Convierte el valor del color del texto en negro
      if (mousePressed) { // mide si el mouse esta apretando el botton y reinicia las variables y vuelve al inicio
        Mii.play();
        Sadge.pause();
        vidas = 3;
        contadores.puntos = 0;
        xx = 0;
        xy = 0;
        xr = 0;
        estado = 0;
      }
    } 
    textSize(100);
    fill(Color); // llena el color del rectangulo de cierto color dependiendo donde esta el mouse 
    rectMode(CENTER);
    rect(width/2 - 600, 800, 280, 130);
    rect(width/2 - 600, 800, 260, 110);
    fill(ColorT); // llena el texto del color dependiendo donde esta el mouse
    text("Home", width/2 - 600, 805);
    stroke(255);
    fill(Color2);
    if ((mouseX >= (width/2 + 460) && mouseX <= (width/2 + 740)) && mouseY <= 865 && mouseY >= 735) { // colision para apretar el boton de home y cambiar el color cuando esta el mouse encima
      Color2 = 255; // Convierte el valor del color del boton en blanco
      ColorT2 = 0; // Convierte el valor del color del texto en negro 
      if (mousePressed) { // si el boton esta apretado reinicia todos los valores y vuelve al juego directamente
        RVidas = 200;
        Sail.play();
        Sadge.pause();  
        vidas = 3; 
        contadores.puntos = 0;
        xx = 0;
        xy = 0;
        xr = 0;
        estado = 1;
      }
    } 
    textSize(100);
    fill(Color2);
    rectMode(CENTER);
    rect(width/2 + 600, 800, 280, 130);
    rect(width/2 + 600, 800, 260, 110);
    fill(ColorT2);
    text("Retry", width/2 + 600, 805);
  }
}


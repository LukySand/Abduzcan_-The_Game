
//----------------------------------------VOID SI SOS UN GENIO Y PASASTE LA BATALLA FINAL----------------------------------//
void Final() {
  Celebrate.play();
  int Color = 0; // Variable para cambiar el color de los botones si esta el mouse encima
  int ColorT = 255; // Variable para cambiar el color de los textos si esta el mouse encima
  background(0);
  imageMode(CENTER);
  textFont(puntosText, 130);
  fill(255);
  text("You've Won! Here is your prize:", 170, 200);
  image(RK, width/2, height/2); // imagen de codigo QR
  stroke(255);
  fill(Color);
  if ((mouseX >= (width/2 - 140) && mouseX <= (width/2 + 140)) && mouseY <= 865 && mouseY >= 735) { // colision para apretar el boton de home y cambiar el color cuando esta el mouse encima
    Color = 255; // Convierte el valor del color del boton en blanco
    ColorT = 0; // Convierte el valor del color del texto en blanco
    if (mousePressed) { // si el boton esta apretado reinicia todos los valores y vuelve al inicio
      Mii.play();
      Sadge.pause();
      vidas = 3;
      contadores.puntos = 1000;
      Jefe = 0;
      GP.pause();
      Celebrate.pause();
      estado = 0;

    }
  }
  textSize(100);
  fill(Color);
  rectMode(CENTER);
  rect(width/2, 800, 280, 130);
  rect(width/2, 800, 260, 110);
  fill(ColorT);
  text("Home", width/2 - 90, 850);
}


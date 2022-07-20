//---------------------------------------VOID DE TEXTO DE LA PELEA---------------------------------------------------//

void Texto() {
  if (estado == 7) { // Primer texto de la pelea
    textFont(Text, 48);
    textAlign(CORNER, CORNER);
    fill(255);
    rect(890, 260, 150, 100, 10);
    fill(0);
    textSize(15);
    text(s, 900, 300);
  }
  if (estado == 8) { // Segundo texto de la batalla
    textFont(Text, 48);
    textAlign(CORNER, CORNER);
    fill(255);
    rect(890, 260, 150, 100, 10);
    fill(0);
    textSize(15);
    text(d, 900, 300);
  }
  if(estado == 9 || estado == 10 || estado == 11 || estado == 12) { // Texto de vidas en la batalla
  fill(255);
  textFont(VidaText, 48);
  textAlign(CENTER, CORNER);
  text("Vida:", width/2, 50);
  }
}

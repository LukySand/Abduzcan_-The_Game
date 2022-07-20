float PosARY = 845; // Variable que permite el movimiento de una de las lineas del cuadrado
float PosIRX = 540; // Variable que permite el movimiento de una de las lineas del cuadrado
int PosIRY = 480; // Variable que permite el movimiento de una de las lineas del cuadrado
//--------------------------------------------------------------VOID DEL LIMITE DE BATTALLA----------------------------------------------//
void CuadradoSeba() {
  noStroke(); 
  background(0);
  fill(255);
  rectMode(CENTER);  
  rect(width/2, PosARY, 510, 10);
  rect(width/2, 475, 520, 10);
  rectMode(CORNER);
  rect(PosIRX, PosIRY, 10, 370);
  rect(1050, 480, 10, 370);
}

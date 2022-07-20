int temp;    //variable de tiempo se utiliza para que se sumen las fotos del array del misil
class Misiles { 
  int kalk;  //variable de altura maxima de los misiles
  int dMisil;  //variable de cada cuanto se va a resetear el misil su nombre hace referencia a Distancia Misil
  int cf=0;  //variable de pasar imagenes del array
  int misX = width;  //variable X de los misiles
  int misY1;  //variable Y de los misiles tiene un '1' porque pintó
  PImage[] Misil = new PImage[7];  //array de imagenes de los misiles

  Misiles(int t3mp, int Calc) {  // se importan los datos que les daran los valores a las variables kalc y dMisil
    for (int v=0; v<Misil.length; v++) {  // for que se usa para darle valor a cada una de las posiciones del array
      Misil[v]=loadImage("spriteMis_"+v+".png");  // a cada posicion del array se le pone una imagen y mientras suben las posiciones del array tambien las de la imagen
      Misil[v].resize(175, 50);  //se le hace un rezise a la imagen ya que es muy grande la original
    }
    dMisil=t3mp; // esto es la cantiad de tiempo para que los misiles no pasen todos al mismo tiempo
    kalk=Calc;  // esto es hasta que altura van a pasar los misiles
    misY1 = int(random(kalk, 750)); // se define la funcion random de hasta donde van a pasar los misiles
  }
  void Mov() { //void de movimiento y dibujo de los misiles
    imageMode(CORNER); //se pone el imageMode en corner
    misX=misX-7;  // se le da velocidad a los misiles
    temp = temp+1;  // empieza a correr la variable de tiempo
    image(Misil[cf], misX, misY1);  // se hace display de la imagen de los misiles
    if (temp %5 == 0) {  //si el tiempo es divisible por 5 se le suma 1 a 'cf'
      cf=cf+1;
      if (cf==Misil.length)cf=0;  // si cf es igual a la cantidad de imagenes del array pasa a valer 0
    }
    if (temp %dMisil == 0) {   //si el tiempo dividio la variable que se paso es igual a 0
      if (misX<=-300) misX=width;  //si el misil paso los limites que vuelva al width para reaparecer
      if (misX>width-1) misY1 = int(random(kalk, 750));  // se le da una altura random cuando llegue al width -1
    }
  }
  void Crash() {  //void de coliosion de los misiles, dividimos el ufo en 2 cajas para que la coalision se mas presisa
    if (((misX+5<=UFOX+144)  && (misX+80>=UFOX-144)) && ((misY1+10<=UFOY+10+31)&&(misY1+10>=UFOY-31))) {  //coalision de la nave con el misil 1era caja
      misX=width; //se resetea el X del misil
      misY1 = int(random(kalk, 750)); //se le da otra altura
      vidas=vidas-1;  //se resta una vida
      tinte = 0;  //se tiñe la nave de rojo con este cambio de variable
    } 
    if (((misX+5<=UFOX+65)  && (misX+80>=UFOX-65)) && ((misY1+10<=UFOY+62)&&(misY1+20>=UFOY-62))) { //coalision de la nave con el misil 1era caja
      misX=width;  //se resetea el X del misil
      misY1 = int(random(kalk, 800));  //se le da otra altura
      vidas=vidas-1; //se resta una vida
      tinte=0;  //se tiñe la nave de rojo con este cambio de variable
    }   
    if (temp % 75 == 0) tinte = 255; //si el tiempo es divisible por 75 que se tiña a su color original la nave
  }
}


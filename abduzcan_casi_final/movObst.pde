
class Persona {
  int obY=height-40;  //variable y de las personas
  int moV=int(random(-5, 4));  //variable de velocidad de las personas
  int obX;  //variable x de las personas
  int tiempo=0;  //variable de tiempo para que se puedan pasar las imagenes de los giff
  int Frames=0;  //variable de cantidad de frames que hay para hacer el giff
  String pp; //string usado para pasar los nombres de imagenes
  PImage[] Pderecha = new PImage[6];  //array de personas que van hacia la derecha
  PImage[] Pizquierda = new PImage[6];  //array de personas que van hacia la izquierda
  boolean abducido = false;    //variable booleana de si el personaje fue abducido

  Persona(String Sujeto) {  //setup de la class sujeto, se pasa el nombre de la imagen que se va a usar
    pp = Sujeto; // la variable que se paso pasa a ser pp la cual tiene el nombre de laimagen que vamos a tener
    for (int d=0; d<Pderecha.length; d++) {    // for que se usa para darle valor a cada una de las posiciones del array
      Pderecha[d]=loadImage(pp+d+".png");  // a cada posicion del array se le pone una imagen y mientras suben las posiciones del array tambien las de la imagen
      Pderecha[d].resize(40, 80);  //se le hace un rezise a la imagen ya que es muy grande la original
      Pizquierda[d]=loadImage(pp+d+"c.png");  // a cada posicion del array se le pone una imagen y mientras suben las posiciones del array tambien las de la imagen
      Pizquierda[d].resize(40, 80);  //se le hace un rezise a la imagen ya que es muy grande la original
    }
    moV=int(random(-5, 4));  // se la da una velocidad random entre -5 y 4 SIN el 0
    if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
    if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
    if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
    if (moV<=4 && moV>0) obX=-50;    // si se mueve hacia la derecha que aparezaca en la izquierda y vice versa
    if (moV>=-5 && moV<0) obX=width+50; // si se mueve hacia la izquierda que aparezaca en la derecha y vice versa
    obY=height-80;  // se le da altura inical
  }

  void dibObst() {  //void de dibujar las personas
    if (moV<=4 && moV>0) { //se pregunta si el movimiento es positivo (que va hacia la derecha) 
      image(Pderecha[Frames], obX, obY);  //se usa el array de imagenes de la derecha
      if (tiempo %10 == 0) {  //si el tiempo dividio 10 es igual a 0
        Frames=Frames+1; //se le suma 1 a la variable de Frames y asi se pasa a la siguiente imagen del array
        if (Frames==Pderecha.length)Frames=0;  //si los frames son mayores a las imagenes que hay en el array se vuelve a la variable frames, haciendo un giff
      }
    }
    if (moV>=-5 && moV<0) {  //se pregunta si el movimiento es negativo (que va hacia la izquierda)
      image(Pizquierda[Frames], obX, obY);  //se usa el array de imagenes de la izquierda
      if (tiempo %10 == 0) {   //si el tiempo dividio 10 es igual a 0
        Frames=Frames+1;  //se le suma 1 a la variable de Frames y asi se pasa a la siguiente imagen del array
        if (Frames==Pizquierda.length)Frames=0;  //si los frames son mayores a las imagenes que hay en el array se vuelve a la variable frames, haciendo un giff
      }
    }
  }



  void abducc() {
    if (abz==true) {        // esta es la funcion de abduccion en general, se esta preguntando si se esta aprentando el spacebar 
      y2=y2+5;
      if (y2>=height-UFOY) {  // esta funcion compara el largo de el rayo con el fodo del plano, asi el rayo no se pasa de la pantalla y puede volver a tiempo.
        y2=height-UFOY;
      }
    }
    if (abz==false) {    // esta funcion retracta el rayo
      y2=y2-7;
      if (y2<=0) {   // esta funcion se esta preguntando si el rayo ya volvio a la nave que se quede estatico.
        y2=0;
      }
    }
    if (abs(obX+20-UFOX)<20 && abz==true && (obY-(UFOY+y2))<=0) {  // esta funcion es la colision entre el abducido y el rayo (se calcula primero si la distancia entre la posicion x de la nave y la posicion x del ostaculo(persona), si el valor absoluto de la resta de estos es mayor a 20(diamentro del rayo de abducc) y el rayo de abduccion se activa y se toca con la persona, la persona se empieza a elevar.
      obX=obX;  // cuando se empieza a elevar la persona se queda quieta
      obY=obY-3; // elevamiento para arriba de la persona
      tiempo=tiempo;
    } else {
      obX=obX+moV;   // si la condicion no se cumple la persona se sigue moviendo
      tiempo=tiempo+1;  // si la condicion no se cuple el tiempo sigue corriendo, asi se logra el efecto de que la persona queda dura mientras es abducida
    }

    if ((abs(obX+20-UFOX)>=20 || abz==false) && obY<height-80) {  // corregir que cuando la altura no es mayor a 820(height-80), y se desactiva el rayo o se saca a la persona del rayo, que la persona se caiga
      obY=obY+5;
    }
    if ((obX>1700) || (obX<-100)) {  // si la persona se pasa de los limites, tanto de ancho o de altura(si fue abducido) que tenga una posciion nueva en alguna de las 2 puntas
      moV=int(random(-5, 4));  // se la da una nueva velocidad random entre -5 y 4 SIN el 0
      if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
      if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
      if (moV<=4 && moV>0) obX=-50;    // si se mueve hacia la derecha que aparezaca en la izquierda y vice versa
      if (moV>=-5 && moV<0) obX=width+50; // si se mueve hacia la izquierda que aparezaca en la derecha y vice versa
      obY=height-80;  // al final se le resetea la altura a su nivel inical
    }
    if (obY<UFOY) {
      moV=int(random(-5, 4));  // se la da una nueva velocidad random entre -5 y 4 SIN el 0
      if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
      if (moV==0) moV=int(random(-5, 4));  // la velocidad no puede ser 0 entonces se pone otro random
      if (moV<=4 && moV>0) obX=-50;    // si se mueve hacia la derecha que aparezaca en la izquierda y vice versa
      if (moV>=-5 && moV<0) obX=width+50; // si se mueve hacia la izquierda que aparezaca en la derecha y vice versa
      obY=height-80;  // al final se le resetea la altura a su nivel inical
      abducido=true;  // si la persona fue abducida el booleano de abduccion se pone en verdadero
    } else abducido=false;  // si la condicion de abduccion no se cumple el booleano de abduccion se queda en false
  }
}


class Personajes_Especiales {
  int time;    //variable de tiempo se utiliza para que se sumen las fotos y aparezaca el amongus
  int amoX;    //variable de posicion X del amongus
  int amoY;    //variable de posicion X del amongus
  int f=0;     //variable de cantidad de frames para hacer el giff del amongus
  int appearance=int(random(6, 10));    //variable random para determinar cuando vaya a aparecer el amongus
  int movA=int(random(0, 2));   //variable de velocidad del peronaje.
  PImage[] susD = new PImage[4];  //array de imagenes derechas del personaje
  PImage[] susI = new PImage[4];  //array de imagenes izquierdas del personaje
  boolean abbd=false;

  Personajes_Especiales() {
    for (int i=0; i<susD.length; i++) {  //loop donde se definen los arrays de imagenes del personaje
      susD[i]=loadImage("spriteA_"+i+".png"); 
      susD[i].resize(55, 70);  // se hace un rezise de las imagenes a si el personaje queda mas chico
      susI[i]=loadImage("spriteA_"+i+"c.png");
      susI[i].resize(55, 70);  // se hace un rezise de las imagenes a si el personaje queda mas chico
    }
    if (movA==0) {
      movA=4;
      amoX=-55;    // si se mueve hacia la derecha que aparezaca en la izquierda y vice versa
    }
    if (movA==1) {
      movA=-4;
      amoX=width+55; // si se mueve hacia la izquierda que aparezaca en la derecha y vice versa
    }
    amoY=height-70;
    appearance=appearance*1000;   //el random de la aparicion del personaje se multiplica por 1000 para que pueda ser comparado con el tiempo que pasa
  }


  void dib() {
    if (appearance<=time) { 
      AU.play(); //si el tiempo es igual a la variable para que aparezca se empieza a ejecutar el amongus
      if (time %10 == 0) f=f+1;   // si el tiempo es divisile por 10 se pasa a la siguiente imagen del giff
      if (movA==4) image(susD[f], amoX, amoY);  //si la velocidad es positiva(el personaje iria para la derecha) se usa el array de imagenes que camina hacia la derecha
      if (movA==-4) image(susI[f], amoX, amoY);  //si la velocidad es negaiva(el personaje iria para la izquierda) se usa el array de imagenes que camina hacia la izquierda
      if (f==3)f=0;  // si ya se usaron todas las imagenes del array se vuelve a la primera creando asi un giff.
      if (amoX<-55 || amoX>width+55) {  // funcion para ver si el personaje se pasa de los limites de la pantalla 
        movA=int(random(0, 2));   // se vuelve a decidir una velocidad random
        if (movA==0) {
          movA=4;
          amoX=-55;    // si se mueve hacia la derecha que aparezaca en la izquierda y vice versa
        }
        if (movA==1) {
          movA=-4;
          amoX=width+55; // si se mueve hacia la izquierda que aparezaca en la derecha y vice versa
        }
        appearance=int(random(6, 10));   //se vuelve a decidir otro tiempo random para que aparezca el amongus
        appearance=appearance*1000+time;    // se lo multiplica por 1000 para que pueda ser comparado con el tiempo y se le suma el tiempo para que pueda aparecer de vuelta mas adelante
      }
    }
    println(appearance);
    println(time);
    println(amoX);
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
    if (abs(amoX+27-UFOX)<5 && abz==true && (amoY-(UFOY+y2))<=0) {  // esta funcion es la colision entre el abducido y el rayo (se calcula primero si la distancia entre la posicion x de la nave y la posicion x del ostaculo(persona), si el valor absoluto de la resta de estos es mayor a 20(diamentro del rayo de abducc) y el rayo de abduccion se activa y se toca con la persona, la persona se empieza a elevar.
      amoX=amoX;  // cuando se empieza a elevar la persona se queda quieta
      amoY=amoY-3; // elevamiento para arriba de la persona
      time=time;
    } else {
      time = time+1;  //funcion tiempo que empiece a correr
      if (appearance<=time) {
        amoX=amoX+movA;   // si la condicion no se cumple la persona se sigue moviendo mientras no exceda los limites de la pantalla
      }
    }

    if ((abs(amoX+27-UFOX)>=7 || abz==false) && amoY<height-70) {  // corregir que cuando la altura no es mayor a 830(height-70), y se desactiva el rayo o se saca a la persona del rayo, que la persona se caiga
      amoY=amoY+5;
    }

    if (amoY<UFOY) {
      movA=int(random(0, 2));   // se vuelve a decidir una velocidad random
      if (movA==0) {
        movA=4;
        amoX=-55;    // si se mueve hacia la derecha que aparezaca en la izquierda y vice versa
      }
      if (movA==1) {
        movA=-4;
        amoX=width+55; // si se mueve hacia la izquierda que aparezaca en la derecha y vice versa
      }
      amoY=height-70;
      appearance=int(random(6, 10));   //se vuelve a decidir otro tiempo random para que aparezca el amongus
      appearance=appearance*1000+time;    // se lo multiplica por 1000 para que pueda ser comparado con el tiempo y se le suma el tiempo para que pueda aparecer de vuelta mas adelante
      abbd=true;  // si la persona fue abducida el booleano de abduccion se pone en verdadero
    } else abbd=false;  // si la condicion de abduccion no se cumple el booleano de abduccion se queda en false
  }
}


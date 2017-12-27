PImage img1, img2, img3, img4, img5, img6, img7;
import processing.serial.*;
int num = 1;


Serial myPort;
void setup() {
  fullScreen();
  String portName = "/dev/ttyUSB0";
  myPort = new Serial(this, portName, 9600);
  img1 = loadImage("./imgs/imagem1.jpg");
  img2 = loadImage("./imgs/imagem2.jpg");
  img3 = loadImage("./imgs/imagem3.jpg");
  img4 = loadImage("./imgs/imagem4.jpg");
  img5 = loadImage("./imgs/imagem5.jpg");
  img6 = loadImage("./imgs/imagem6.jpg");
  img7 = loadImage("./imgs/imagem7.jpg");
}


void draw() {

  //INICIA AS VARIAVEIS LOCAIS PARA OS CALCULOS
  float fatorY;
  float fatorX;
  float x;
  float y;
  int xx;
  int yy;

  //CALCULO DOS FATORES DE DIVISAO BASEADOS NA RESOLUCAO DO MONITOR PARA CABER NA MATRIZ 240x240
  fatorY = (displayHeight / 240.0);
  fatorX = ((displayWidth - displayHeight) / 2);

  //CALCULO DA ESCALA DO MOUSE E IF PARA MANTER AS COORDENADAS DO MOUSE DENTRO DA MATRIZ 240x240
  y = ((mouseY / fatorY) + 0.5);
  if (y < 0.0) {
    y = 0.0;
  }
  if (y > 239.0) {
    y = 239.0;
  }
  x = (((mouseX - fatorX) / fatorY) + 0.5);
  if (x < 0.0) {
    x = 0.0;
  }
  if (x > 239.0) {
    x = 239.0;
  }

  xx = int(x);
  yy = int(y);

// IF QUE LE O NUMERO PRESSIONADO NO TECLADO E SETA A VARIAVEL DO SWITCH
if (keyPressed) {
    if (key == '1') {
      num = 1;
    }
        if (key == '2') {
      num = 2;
    }
    if (key == '3') {
      num = 3;
    }
    if (key == '4') {
      num = 4;
    }
    if (key == '5') {
      num = 5;
    }
    if (key == '6') {
      num = 6;
    }
    if (key == '7') {
      num = 7;
    }
  } 


  //SWITCH QUE DEFINE A IMAGEM A SER APRESENTADA E MAPEADA, TER SUA COR ANALISADA E PRINTADA NA SERIAL
  switch(num) {
    case 1:
    image(img1, fatorX, 0, displayHeight, displayHeight);
    color cor1 = img1.get(xx, yy);
    cor1 = cor1 & 0x00FF;
    myPort.write(cor1);
    break;
    case 2:
    image(img2, fatorX, 0, displayHeight, displayHeight);
    color cor2 = img2.get(xx, yy);
    cor2 = cor2 & 0x00FF;
    myPort.write(cor2);
    break;
    case 3:
    image(img3, fatorX, 0, displayHeight, displayHeight);
    color cor3 = img3.get(xx, yy);
    cor3 = cor3 & 0x00FF;
    myPort.write(cor3);
    break;
    case 4:
    image(img4, fatorX, 0, displayHeight, displayHeight);
    color cor4 = img4.get(xx, yy);
    cor4 = cor4 & 0x00FF;
    myPort.write(cor4);
    break;
    case 5:
    image(img5, fatorX, 0, displayHeight, displayHeight);
    color cor5 = img5.get(xx, yy);
    cor5 = cor5 & 0x00FF;
    myPort.write(cor5);
    break;
    case 6:
    image(img6, fatorX, 0, displayHeight, displayHeight);
    color cor6 = img6.get(xx, yy);
    cor6 = cor6 & 0x00FF;
    myPort.write(cor6);
    break;
    case 7:
    image(img7, fatorX, 0, displayHeight, displayHeight);
    color cor7 = img7.get(xx, yy);
    cor7 = cor7 & 0x00FF;
    myPort.write(cor7);
    break;
  }

  //PRINT DAS VARIAVEIS PARA DEBUG 
  println ("NORMAL: " + mouseX +", " + mouseY);
  println("ESCALADO: " + xx +", " + yy);
  println ("FATOR  X:  " + fatorX);
  println ("FATOR  Y:  " + fatorY);
  println ("RESOLUCAO: " + displayWidth + ", " + displayHeight);
 // println ("COR  : " + cor);

}
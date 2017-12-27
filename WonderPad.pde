PImage img;
import processing.serial.*;

Serial myPort;
void setup() {
  fullScreen();
  String portName = "/dev/ttyUSB0";
  myPort = new Serial(this, portName, 9600);
  img = loadImage("./imgs/estrela.bmp");
}


void draw() {

//INICIA AS VARIAVEIS LOCAIS PARA OS CALCULOS
 float fatorY;
 float fatorX;
 float x;
 float y;
 int xx;
 int yy;
 //int cor;
 int w;
 int h;
 w = 1;
 h = 1;
 
 
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
 color cor = img.get(xx, yy);
 cor = cor & 0x00FF; //PEGAR SOMENTE O PRIMEIRO BYTE DO RGB
   
   
//PRINT DA IMAGEM A SER TATEADA
 image(img, fatorX, 0, displayHeight, displayHeight);
 
//PRINT DAS VARIAVEIS PARA DEBUG 
 println ("NORMAL: " + mouseX +", " + mouseY);
 println("ESCALADO: " + xx +", " + yy);
 println ("FATOR  X:  " + fatorX);
 println ("FATOR  Y:  " + fatorY);
 println ("RESOLUCAO: " + displayWidth + ", " + displayHeight);
 println ("COR  : " + cor);
 
myPort.write(cor);
 
    
}
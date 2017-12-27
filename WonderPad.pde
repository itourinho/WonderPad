PImage img;
import processing.serial.*;

void setup() {
    fullScreen();
    //size(240, 240);

    //Serial porta1;
  
    //PATH DA IMAGEM
    img = loadImage("./imgs/troll-face.jpg");
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
    y = ((mouseY / fatorY) + 0.5); // SOMA 0.5 PARA APROXIMAR O VALOR QUANDO CONVERTIDO PARA INTEIRO
    if (y < 0.0) {
        y = 0.0;
   }
    if (y > 239.0) {
        y = 239.0;
   }
    x = (((mouseX - fatorX) / fatorY) + 0.5); // SOMA 0.5 PARA APROXIMAR O VALOR QUANDO CONVERTIDO PARA INTEIRO
    if (x < 0.0) {
        x = 0.0;
   }
    if (x > 239.0) {
        x = 239.0;
   }
   
// CONVERTENDO OS VALORES DE X E Y PARA INTEIROS 
    xx = int(x);
    yy = int(y);
   
//PRINT DA IMAGEM A SER TATEADA
    image(img, fatorX, 0, displayHeight, displayHeight);
 
//PRINT DAS VARIAVEIS PARA DEBUG 
    println ("NORMAL: " + mouseX +", " + mouseY);
    println("ESCALADO: " + xx +", " + yy);
    println ("FATOR  X:  " + fatorX);
    println ("FATOR  Y:  " + fatorY);
    println ("RESOLUCAO: " + displayWidth + ", " + displayHeight);
    
}
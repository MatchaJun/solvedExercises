void setup(){
  size(800,800);
  background(#134f5c);
  noStroke();
}

boolean part1 = true;
boolean part2 = false;
boolean part3 = false;
boolean part4 = false;
boolean part5 = false;


int count = 0;
int count2 = 0;

int cor = 255;

float x = 0;
float y = 0;

float x2 = 400;
float y2 = 400;

float xP = -100; //Valores Parabola
float yP = 400;

float xS = 0; //Valores Senoide
float yS = 0;

float R = 36;

float angulo2 = 0;

float trans = 200;

void circulo(float x2, float y2, float r, float num){
  
  float angulo = 0;
  translate(x2,y2); //Passa a coordena x,y para o centro
  
  while (angulo < 2*PI){
    float X = r * cos(angulo); //calcula o ponto X
    float Y = r * sin(angulo); //calcula o ponto Y 

    ellipse(X,Y,2,2);
    
    angulo = angulo + PI/num; //Calcula o numero de Pontos para formar a circuferência
  }

  translate(-x2,-y2);
}


void espiral(float x1, float y1, float num){
  count = count + 1;
  
  translate(x2,y2);
  
  x = R * cos(angulo2); //calcula o ponto X
  
  y = R * sin(angulo2); //calcula o ponto Y 
 
  R = R + 0.5;
  
  angulo2 = angulo2 + PI/num;
  
  if (count > 900){ //Passa para proxima Parte
  part2 = false;
  part3 = true;
  }
  
}


void boneco(float Xp, float Yp) {
  fill(247,218,234);
  ellipse(Xp,Yp,20,20); // corpo
  ellipse(Xp-10,Yp+2,5,5); // braço esq
  ellipse(Xp+10,Yp+2,5,5); // braço dir
  fill(255,0,0);
  ellipse(Xp-4,Yp+10, 7,4); // pé esq
  ellipse(Xp+4,Yp+10, 7,4); // pé dir
  fill(239,182,212);
  ellipse(Xp-4,Yp+1, 3,4); // blush esq
  ellipse(Xp+4,Yp+1, 3,4); // blush dir
  fill(0,0,0);
  ellipse(Xp-4,Yp-1, 3,6); // olho esq
  ellipse(Xp+4,Yp-1, 3,6); // olho dir
}

void parabola(float a, float b, float c){
  translate(400,400);
  xP++;
  
  yP =(a * pow(xP,2)) + (b * xP) + c; // utiliza os valores do usuário para calcular o valor de Y na fórmula 
  
  background(#134f5c);
  
  if (xP>100){ // Reinicia a animação
    xP = -100;
    part1 = false;
    part2 = true;
  }
  translate(-400,-400);
}

void senoidal(float amp, float b, float c, float d){
  translate(0, trans);
  xS = xS + 5; //Aumenta o X de 5 em 5
  
  yS = amp * sin(b*xS + c) + d; //Função senoidal
  
  fill(cor,0,0);
  
  
  if(xS > 800 && count2 == 0){ //Na primeira vez que completar um ciclo passa para o proximo
  part3 = false;
  part4 = true;
  xS = 0; 
  trans = 400;
  count2 = 1;
  }
  
  if(xS > 800 && count2 == 1){ //Na segunda vez que completar um ciclo passa para o proximo
  part4 = false; 
  part5 = true;
  xS = 0; 
  trans = 100;
  count2 = 2;
  }
  
  if(xS > 800 && count2 == 2){ //Reinicia toda animação e todos os dados 
  part5 = false;
  
  background(#134f5c);
  
  count = 0;
  count2 = 0;

  x = 0;
  y = 0;

  x2 = 400;
  y2 = 400;

  xP = -100;
  yP = 400;

  xS = 0;
  yS = 0;

  R = 36;

  angulo2 = 0;

  trans = 200;
  
  part1 = true;
  
  }
}


void draw(){
    if(part1){ //Primeira Parte faz uma parabola
    translate(400,400);
    parabola(0.05,0.05,0.01); //Calcula a posição X e Y na parabola, permitindo o usuário adicionar o valor de A, B e C  
    boneco(xP,-yP);
    }
  
  
    if(part2){  //Segunda parte faz uma espiral
       fill(255,0,0);
      espiral(400,400,100); //Calcula o ponto x e y no ponto da senodie
      circulo(x,y,5,5); //Desenha um circulo nos valores calculados
      
      translate(-400,-400);
      fill(0,0,255);
      espiral(400,400,100); 
      circulo(x,y,5,5);
    }
    
    if(part3){  //Terceira, Quarta e Quinta parte desenham uma Senoide
      cor = 255;
      senoidal(50,5,3,1); //Calcula o ponto x e y no ponto da senoide
      circulo(xS,yS,10,10); 
      translate(0, -trans);
    }
    if(part4){  
      cor = 155;
      senoidal(50,5,3,1); //Calcula o ponto x e y no ponto da senoide
      circulo(xS,yS,10,10); 
      translate(0, -trans);
    }
    if(part5){ 
      cor = 55;
      senoidal(50,5,3,1); //Calcula o ponto x e y no ponto da senoide
      circulo(xS,yS,10,10); 
      translate(0, -trans);
    }
    
}

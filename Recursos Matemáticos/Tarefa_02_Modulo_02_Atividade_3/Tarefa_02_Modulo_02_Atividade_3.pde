void setup(){
  size(400,400);
  background(#134f5c);
  noStroke();
  noFill();
}

float x = 0;
float y = 0;

float a = 50;

float cor1 = 255;
float cor2 = 0;
float cor3 = 0;

boolean button = false;

void circulo(float x, float y, float r, float num){
  
  float angulo = 0;
  translate(x,y); //Passa a coordena x,y para o centro
  
  while (angulo < 2*PI){
    float X = r * cos(angulo); //calcula o ponto X
    float Y = r * sin(angulo); //calcula o ponto Y 
    
    fill(cor1,cor2,cor3);
    ellipse(X,Y,2,2);
    
    angulo = angulo + PI/num; //Calcula o numero de Pontos para formar a circuferência
  }

  translate(-x,-y);
}


void senoidal(float amp, float b, float c, float d){
  translate(0, height/2); //Passa o centro para metade da altura
  
  x = x + 5; //Aumenta o X de 5 em 5
  
  y = amp * sin(b*x + c) + d; //Função senoidal
  
  fill(255,0,0);


}


void draw(){
  senoidal(a,5,3,1); //Calcula o ponto x e y no ponto da senodie
  circulo(x,y,10,10); //Desenha um circulo nos valores calculados
  fill(0,255,0);
  
  rect(100,50,200,100); //Cria um botão
  fill(255);
}

void mousePressed(){
  if(mouseX>100 && mouseX <300 && mouseY>250 && mouseY <350){
     x = 0;
     
     a = random(10,50); //Sorteia uma amplitude aleatoria
     
     cor1 = random(1,255); //Sorte um numero aleatório para todo o RGB
     cor2 = random(1,255);
     cor3 = random(1,255);
  }

}

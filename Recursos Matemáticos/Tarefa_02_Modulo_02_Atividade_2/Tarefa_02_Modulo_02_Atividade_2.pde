void setup(){
  size(400,400);
  background(#134f5c);
  noStroke();
}

float x = 0;
float y = 0;

void circulo(float x, float y, float r, float num){
  
  float angulo = 0;
  translate(x,y); //Passa a coordena x,y para o centro
  
  while (angulo < 2*PI){
    float X = r * cos(angulo); //calcula o ponto X
    float Y = r * sin(angulo); //calcula o ponto Y 
    
    fill(255,0,0);
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
  senoidal(50,5,3,1); //Calcula o ponto x e y no ponto da senodie
  circulo(x,y,10,10); //Desenha um circulo nos valores calculados
}

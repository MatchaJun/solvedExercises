void setup(){
  size(400,400);
  background(#134f5c);
  noStroke();
}

void circulo(float x, float y, float r, float num){
  
  float angulo = 0;
  translate(x,y); //Passa a coordena x,y para o centro
  
  while (angulo < 2*PI){
    float X = r * cos(angulo); //calcula o ponto X
    float Y = r * sin(angulo); //calcula o ponto Y 
    
    ellipse(X,Y,5,5);
    
    angulo = angulo + PI/num; //Calcula o numero de Pontos para formar a circuferência
  }

  translate(-x,-y);
}

void draw(){
  fill(255,0,0); //Vermelho
  circulo(200,200,100,36);
  fill(255,255,0); //Amarelo
  circulo(100,100,50,360);
  circulo(300,100,50,360);
}

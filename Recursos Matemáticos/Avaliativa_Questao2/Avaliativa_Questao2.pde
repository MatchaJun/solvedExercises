int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;
float xp = 320, yp = 180;

void setup() {
  size(640,360);
}

void desenha_grid(){
  stroke(50); //Desenha a Grid
  background(0);
  for(int i=0; i<height; i=i+50){
    line(0,i,width,i);
    line(i,0,i,height);
  }
}

void boneco(float Xp, float Yp) {
  fill(247,218,234);
  noStroke();
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

void draw() {
  senoidal(50,5,3,1); //Calcula o valor de Y baseado na fórmula da senoide
  background(0);
  desenha_grid();
  boneco(xp, yp); //Desenha o boneco na posiçãi caulada
  // um vetor que aponta para o boneco
  Vetor boneco = new Vetor(xp, height-yp);
  // um vetor que aponta para o centro da janela
  Vetor center = new Vetor(width/2,height/2);
  // subtraindo o vetor centro do vetor boneco
  boneco.SubtraiVetor(center);
  // desenhando o vetor resultante
  boneco.Display(width/2,height/2, amarelo); 
}

void senoidal(float amp, float b, float c, float d){
  translate(0, height/2); //Joga o centro de tela para o centro
  if(xp>660) {xp = - 20;}
  
  xp = xp + 5; //Aumenta o X de 5 em 5
  
  yp = amp * sin(b*xp + c) + d; //Função senoidal
  
  fill(255,0,0);
  
  translate(0, -height/2); //retorna o centro da tela para o (0,0)

}

Vetor Vetor1, Vetor2, Vetor1Angulo;
int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;

void setup(){
  size(700,700);
  background(0);
  Vetor1 = new Vetor(150,300); //Cria dois vetores e define sua posição X e Y
  Vetor2 = new Vetor(200,75); 
  Vetor1Angulo = new Vetor(150,300); //Vetor base para ser utilizado para o calulo do angulo
  noLoop(); //Evita o Loop para o draw acontecer somente uma vez
}

void desenha_grid(){
  stroke(50); //Faz o desenho da Grid
  background(0);
  for(int i=0; i<height; i=i+50){
    line(0,i,width,i);
    line(i,0,i,height);
  }
}

void draw(){
   
  desenha_grid();
  
  Vetor1.Display(200,0, branco); //Desenha os vetores 1 e 2
  Vetor2.Display(350,300, amarelo);
  
  Vetor1.SomaVetor(Vetor2); //Soma o vetor 1 com 2
  Vetor1.Display(200,0, vermelho); //Desenha o resultado dessa soma
  
  print(Vetor1Angulo.Angulo(Vetor1) + "\n"); //Prita o resultado do angulo e da magnitude
  print(Vetor1.Magnitude());
  
  Vetor1 = new Vetor(150,300);  //Cria novos valores para os Vetores 1 e 2
  Vetor2 = new Vetor(400,350);
  
  Vetor1.Display(20,300, branco); //Desenha os vetores 1 e 2
  Vetor2.Display(20,300, amarelo);
  Vetor1.SubtraiVetor(Vetor2); //Subtrai o vetor 1 com 2
  Vetor1.Display(420,650, vermelho); //Desenha o resultado dessa subtração
  
}

Vetor Vetor1, Vetor2, Vetor3, Vetor4, Vetor5, Vetor6, Vetor7, Vetor8;
int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;

void setup(){
  size(500,500);
  background(0);
  Vetor1 = new Vetor(150,300); //Cria um vários vetores e define sua posição X e Y
  Vetor2 = new Vetor(200,75); 
  Vetor3 = new Vetor(50,150); 
  Vetor4 = new Vetor(100,25); 
  Vetor5 = new Vetor(3000,2000); 
  Vetor6 = new Vetor(200,200); 
  Vetor7 = new Vetor(0, 200); 
  Vetor8 = new Vetor(-200,0); 
  noLoop();
}

void draw(){
  print(Vetor1.CondicaoDeOrtogonalidade(Vetor2) + "\n"); //Printa a condição resultante de Ortogonalidade entre o Vetor1 e 2
  print(Vetor1.ProdutoEscalar(Vetor2) + "\n"); //Printa o produto escalar resultante entre o Vetor1 e 2
  
  Vetor1.Display(100,100, azul);
  Vetor2.xcomp = Vetor2.xcomp * -1; //Muda o x e y do vetor 2 para negativo, para desenhá-lo no gráfico para a subtração
  Vetor2.ycomp = Vetor2.ycomp * -1;
  Vetor2.Display(250,400, vermelho); //Desenha ele no gráfico
  Vetor2.xcomp = Vetor2.xcomp * -1;  //Retorna os valores ao original
  Vetor2.ycomp = Vetor2.ycomp * -1;
  Vetor1.SubtraiVetor(Vetor2); //Subtrai os vetores
  Vetor1.Display(100,100, branco); //Desenha o resultado
  
  Vetor5.Normalizar();
  print(Vetor5.Magnitude()); //Normaliza, e logo após printa a Magnetude do Vetor5
  
  Vetor5.MultEscalar(100);
  Vetor5.Display(200,200, branco); //Multiplica o Vetor pelo escalar 100 e o desenha
  
  Vetor6.Display(200,0, branco); //Desnha os vetores 6,7 e 8
  Vetor7.Display(400,200, azul);
  Vetor8.Display(400,400, vermelho);
  Vetor6.SomaVetor(Vetor7); //Soma o vetor 6 com o 7 e 8 
  Vetor6.SomaVetor(Vetor8);
  Vetor6.Display(200,0, amarelo); //Desenha o resultado dessa soma
  
}

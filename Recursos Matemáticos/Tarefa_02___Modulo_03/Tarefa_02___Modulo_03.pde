Vetor Vetor1, Vetor2;
int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;

void setup(){
  size(500,500);
  background(0);
  Vetor1 = new Vetor(150,100); //Cria um vetor com X = 150 e y = 100
  Vetor2 = new Vetor(50,75); //Cria outro vetor com X = 50 e y = 75
  noLoop();
}

void draw(){
  Vetor1.Display(0,0, branco); 
  Vetor2.Display(150,100, vermelho); 
  Vetor1.SomaVetor(Vetor2);
  Vetor1.Display(0,0, azul);
  
  Vetor1.MultEscalar(2);
  Vetor1.Display(0,100, amarelo); 
}

///////////////////////////////////////////////////////// classe Vetor
class Vetor {
  float xcomp;
  float ycomp;
  
  Vetor(float txcomp, float tycomp){
    xcomp = txcomp;
    ycomp = tycomp;
  }
  
  void Display(float xpos, float ypos, color c){
    stroke(c);
    line(xpos,height-ypos, xpos+xcomp,height-(ypos+ycomp));
    ellipse(xpos+xcomp,height-(ypos+ycomp),5,5);
    fill(c);
    text("v(m"+Magnitude()+")", (2*xpos+xcomp)/2, height-(2*ypos+ycomp)/2);
  }
  
  float Magnitude(){
     return sqrt(xcomp*xcomp+ycomp*ycomp); // Calcula a magnitude do Vetor
  }
  
  void MultEscalar(float k){
    xcomp = k * xcomp;
    ycomp = k * ycomp;
  }
  
  void SomaVetor(Vetor tVetor){ //Soma os dois vetores, utilizando o vetor fornecido e o próprio vetor
     xcomp = xcomp + tVetor.xcomp;
     ycomp = ycomp + tVetor.ycomp;
  }
  
  void SubtraiVetor(Vetor tVetor){ //Subtrai os dois vetores, utilizando o vetor fornecido e o próprio vetor
     xcomp = xcomp - tVetor.xcomp;
     ycomp = ycomp - tVetor.ycomp;     
  }
  
  float ProdutoEscalar(Vetor tVetor){ //Calcula o produto escalar
    return xcomp * tVetor.xcomp + ycomp * tVetor.ycomp;
  }
  
  boolean CondicaoDeOrtogonalidade(Vetor tVetor) { //Verifica se o produto escalar do Vetor fornecido é nulo, para verificar a ortogonalidade do mesmo
    if (ProdutoEscalar(tVetor) == 0){
      return true;
    }
    else return false;
  }
  
  void Normalizar(){ 
     float mag = Magnitude();
     xcomp = xcomp / mag;
     ycomp = ycomp / mag;
  }
}


  
  
  

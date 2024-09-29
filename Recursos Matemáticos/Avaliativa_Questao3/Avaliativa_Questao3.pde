int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;
Vetor Vetor1;

float anguloAtual = 0;
float tamanho = 50;
float xp = 320, yp = 180;

void setup() {
  size(640,360);
  Vetor1 = new Vetor(100,0); //Cria um vetor que marca o Grau 0, para ser usado como base para o calculo de angulo
}

void draw() {
  background(0);
  
  Vetor1.Display(width/2, height/2, amarelo);
  Vetor mouseVetor = new Vetor(mouseX, height - mouseY);
  Vetor center = new Vetor(xp, yp);
  mouseVetor.SubtraiVetor(center);
  mouseVetor.Display(xp, yp, amarelo); 
  
  float angulo = Vetor1.Angulo(mouseVetor);
  
  anguloAtual = angulo;
  
  float x = width / 2; //Transforma o valor de x e y no centro da tela
  float y = height / 2;
  
  translate(x, y);
  
  float anguloMouse = Vetor1.Angulo(mouseVetor); //Calcula o angulo entre o Vetor1 e o Vetor do mouse

  if (mouseY > height / 2) { //Verifica se o mouse passou para baixo do eixo X, e caso sim ele subtrai o angulo de 360 para evitar que o quadrado gira no sentido errado
    anguloMouse = 360 - anguloMouse;
  }

  rotate(radians(-anguloMouse)); //Rotaciona o quadrado no angulo encontrado
  
  fill(255);
  noStroke();
  rect(-25, -25, tamanho, tamanho); //Cria dois quadrados no centro
  rect(-25, -12.5, tamanho + 25, tamanho -25);
  resetMatrix();
  
  fill(255);
  textSize(15);
  text("Ângulo: " + (anguloMouse), 0, 60); //Desenha o angulo na tela
}

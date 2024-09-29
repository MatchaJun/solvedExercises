Mover Bola;
float barraEsquerdaY;
float barraDireitaY;
float barraHeight;
float barraSpeed;
color barraEsquerdaColor;
color barraDireitaColor;

void setup() {
  size(640, 360);
  Bola = new Mover();
  barraEsquerdaY = height / 2; // Posição inicial da barra esquerda no centro vertical
  barraDireitaY = height / 2; // Posição inicial da barra direita no centro vertical
  barraHeight = 80; // Altura da barra
  barraSpeed = 2; // Velocidade de movimento das barras
  barraEsquerdaColor = color(0, 255, 0); // Cor inicial da barra esquerda (verde)
  barraDireitaColor = color(0, 255, 0);
}

void draw() {
  background(255);

  // Movimenta as barras verticalmente
  barraEsquerdaY += barraSpeed;
  barraDireitaY -= barraSpeed;
  
  // Verifica se as barras atingiram os limites de altura
  if (barraEsquerdaY + barraHeight > height || barraEsquerdaY < 0) {
    barraSpeed *= -1; // Inverte a direção do movimento
  }
  
  // Atualiza a posição e verifica colisão da bola com as barras
  Bola.update();
  Bola.checkEdges();
  Bola.checaColisao(barraEsquerdaY, barraHeight);
  Bola.checaColisao(barraDireitaY, barraHeight);
  Bola.display();
  
  // Desenha as barras
    fill(barraEsquerdaColor);
  rect(10, barraEsquerdaY, 10, barraHeight);
  
  fill(barraDireitaColor);
  rect(width - 20, barraDireitaY, 10, barraHeight);
}

void keyPressed() {
  if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
    Bola.update(); // Atualiza a bola quando uma tecla é pressionada
  }
}

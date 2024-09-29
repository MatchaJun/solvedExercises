class Mover {
 
  Vetor location;
  Vetor velocity;
  Vetor acceleration;
  float radius;
  color ballColor;
 
  Mover() {
    location = new Vetor(random(width), random(height)); //Cria vetores de velocidade e de posicao
    velocity = new Vetor(0, 0);
    acceleration = new Vetor(0, 0);
    radius = 16;
    ballColor = color(175);
  }
 
  void update() {
    float speed = 0.5;
    acceleration = new Vetor(0, 0);
    
    if (keyPressed) {
      if (keyCode == UP) { //Utiliza as setas para adicionar velocidade aos vetores
        acceleration.ycomp -= speed;
      } else if (keyCode == DOWN) {
        acceleration.ycomp += speed;
      } else if (keyCode == LEFT) {
        acceleration.xcomp -= speed;
      } else if (keyCode == RIGHT) {
        acceleration.xcomp += speed;
      }
      if (key == 's' || key == 'S') { //Verifica se a tecla S foi apertada, para zerar a velocidade
        velocity = new Vetor(0, 0);
      }
    }
    
    velocity.SomaVetor(acceleration);
    velocity.Limite(1.9);
    location.SomaVetor(velocity);
    
    if (location.xcomp + radius > width) { //Altera a velocidade da bola para negativo caso colida em algum canto
      location.xcomp = width - radius;
      velocity.xcomp *= -1;
    } else if (location.xcomp - radius < 0) {
      location.xcomp = radius;
      velocity.xcomp *= -1;
    }
    
    if (location.ycomp + radius > height) {
      location.ycomp = height - radius;
      velocity.ycomp *= -1;
    } else if (location.ycomp - radius < 0) {
      location.ycomp = radius;
      velocity.ycomp *= -1;
    }
  }
  
  void display() {
    stroke(0);
    fill(ballColor);
    ellipse(location.xcomp, location.ycomp, 16, 16);
  }
 
  void checkEdges() { //Verifica se a bola colidiu com alguma das paredes
    if (location.xcomp > width || location.xcomp < 0)  
      velocity.xcomp = velocity.xcomp * (-1);
    if (location.ycomp > height || location.ycomp < 0)  
      velocity.ycomp = velocity.ycomp * (-1);
  }
  
  void checaColisao(float barY, float barHeight) { //Verifica se a bola colidiu com alguma barra, alterando a sua cor
    if (location.xcomp - radius <= 20 && location.ycomp >= barY && location.ycomp <= barY + barHeight) {
      velocity.xcomp *= -1;
      ballColor = color(255, 0, 0); // Altera a cor da bola para vermelho
      barraEsquerdaColor = color(255, 0, 0); // Altera a cor da barra esquerda para vermelho
    } else if (location.xcomp + radius >= width - 20 && location.ycomp >= barY && location.ycomp <= barY + barHeight) {
      velocity.xcomp *= -1;
      ballColor = color(0, 0, 255); // Altera a cor da bola para azul
      barraDireitaColor = color(0, 0, 255); // Altera a cor da barra direita para azul
    }
  }
}

Mover Bola;
Matriz matriz;


color [][] matriz1; color [][] matriz2; color [][] matriz3; color [][] matriz4;

void setup() {
  Bola = new Mover();
  size(600,600);
  
  matriz = new Matriz(15, 15);
  matriz.inicializarMatriz();

  noStroke();
}

void draw() {
  background(255);
  matriz.desenhaMatriz(40);
  

  Bola.update(); //Atualiza a posição da bola na tela
  Bola.checkEdges();
  Bola.display();
  
  int celulaX = (int)Bola.location.xcomp / 40;
  int celulaY = (int)Bola.location.ycomp / 40;
  if (celulaX >= 0 && celulaX < matriz.getNumeroLinhas() && celulaY >= 0 && celulaY < matriz.getNumeroColunas()) { //Remove a cor da célula. caso a bola passe por ela
    matriz.removerCor(celulaX, celulaY);
  }
}

void keyPressed() {
  if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
    Bola.update(); // Atualiza a bola quando uma tecla é pressionada
  }
}

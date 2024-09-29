/* |CORES|
verde = #DAF7A6
rosa = #F8A6BD
azul escuro = #041E27
*/

// |MATRIZES| //
Matriz2D matrizObjeto, matrizObjetoTransformado, matrizObjetoTransformado2, matrizObjetoTransformado3, matrizObjetoTransformado4, matrizObjetoTransformadoObj;
int movementX, movementY, movementX2, movementY2, movementX3, movementY3, movementX4, movementY4;
float [][] objeto = {{ 0, 0, 1},
                      {100, 0, 1},
                      {100, 100, 1},                      
                      {0, 100, 1},
                      {0, 0, 1},
                      {30, 0, 1},
                      {30, 30, 1},
                      {0, 30, 1}};    
// |VARIÁVEIS| //

  String introdução = "Você possui quatro peças e precisa encaixá-las nos espaços cinzas. \nPara isso, você pode movimentar, rotacionar, aumentar ou diminuir as peças.";
  String seleção = "A peça selecionada terá a cor rosa";
  int gameScreen = 0;
  int vitorias;
  int topLeftX;
  int topLeftY;
  int topRightX; 
  int topRightY;
  int bottomLeftX;
  int bottomLeftY; 
  int bottomRightX; 
  int bottomRightY;
  int selecionado;
  boolean rotateAdd;
  float angle1, angle2, angle3, angle4, scale1, scale2, scale3, scale4, angleObj1, angleObj2, angleObj3, angleObj4, scaleObj1, scaleObj2, scaleObj3, scaleObj4;
  float posX1, posY1, posX2, posY2, posX3, posY3, posX4, posY4;
  float[] angleOpt = {0, 90, 180, 270};
  float[] scaleOpt = {0.5, 1, 1.5, 2};
  float[] posOpt = {0, 100, 200, 300, 400, 500};
  color cor1, cor2, cor3, cor4, corObj, corTransparente;
  
// |Desenha a Grid| //
void desenha_grid(){ //Faz uma grid para o fundo do jogo (Sophia)
  stroke(#243237);
  background(#041E27); //azul escuro
  for(int i=0; i<height; i=i+100){
    line(0,i,width,i);
    line(i,0,i,height);
  }
}

// |SETUP| //
void setup() {
  size(600, 600);
  matrizObjeto = new Matriz2D(objeto); //Cria a matriz Objeto com o desenho feito (Sophia)
  matrizTransf = new Matriz2D(3, 3);
  
  topLeftX = 0;
  topLeftY = 0;
  topRightX = width - 100; //Subtrai o tamanho do objeto (Fernando)
  topRightY = 0;
  bottomLeftX = 0;
  bottomLeftY = height - 100; //Subtrai o tamanho do objeto (Fernando)
  bottomRightX = width - 100; //Subtrai o tamanho do objeto (Fernando)
  bottomRightY = height - 100; //Subtrai o tamanho do objeto (Fernando)
  movementX = 0;
  movementY = 0;
  selecionado = 1;
  
  cor1 = #F8A6BD; cor2 = #DAF7A6; cor3 = #DAF7A6; cor4 = #DAF7A6; corObj = #808080; 
  scale1 = 1; scale2 = 1; scale3 = 1; scale4 = 1;
  angleObj1 = choose(angleOpt) * PI/180; angleObj2 = choose(angleOpt) * PI/180; angleObj3 = choose(angleOpt) * PI/180; angleObj4 = choose(angleOpt) * PI/180; 
  scaleObj1 = choose(scaleOpt); scaleObj2 = choose(scaleOpt); scaleObj3 = choose(scaleOpt); scaleObj4 = choose(scaleOpt);
  posX1 = choose(posOpt); posX2 = choose(posOpt); posX3 = choose(posOpt); posX4 = choose(posOpt); //Escolhe aleatoriamente um angulo escala e posição para cada um dos objetivos (Fernando)
  posY1 = choose(posOpt); posY2 = choose(posOpt); posY3 = choose(posOpt); posY4 = choose(posOpt);
  
  corTransparente = color(255, 0, 0, 0);
}

void draw(){
  if(gameScreen == 0){ //Caso a tela seja 0, o menu com as instruições é desenhado (Sophia)
      background(#041E27);
      tecla(300,160, "R", "Rotacionar");
      tecla(300,200, "A", "Aumentar");
      tecla(300,240, "S", "Diminuir");
      textSize(16);
      text(introdução, height/2, 50);
      textAlign(CENTER);
      text("Aperte para começar", height/2, 560);
      text("Setinhas para Movimentar", 385, 140);
      fill(#F8A6BD);
      text(seleção, 300, 395);
      quadrado_menu(50, 120);
      peça_menu(50, 380);
      teclas(185, 420);
  }
  if(gameScreen == 2){ //Caso a tela seja 2, a tela de vitória é desenhada (Sophia)
    winScreen();
  }
  if(gameScreen == 1){ //Caso a tela seja 1, o jogo é desenhado (Sophia)
   background(#581845); desenha_grid(); stroke(#DAF7A6);
    
    //Objetivo1
    pushMatrix(); //Desenha os quatros objetivos com valores aleatórios na tela (Fernando)
    Translate(posX1, posY1);
    matrizObjetoTransformadoObj = matrizObjeto.times(matrizTransf);
    
    translate(posX1 + 50, 550 - posY1); //Translata para o centro do objeto para a rotação ocorrer com o seu centro como eixo (Fernando)
    rotate(angleObj1); //Rotaciona e escala o objetivo (Fernando)
    scale(scaleObj1);
    translate(-(posX1 + 50),- (550 - posY1));
    
    matrizObjetoTransformadoObj.desenhaObjeto(color(corObj)); //Desenha o objetivo na tela (Fernando)
    popMatrix();
    
    //Objetivo2
    pushMatrix();
    Translate(posX2, posY2);
    matrizObjetoTransformadoObj = matrizObjeto.times(matrizTransf);
    
    translate(posX2 + 50, 550 - posY2);
    rotate(angleObj2);
    scale(scaleObj2);
    translate(-(posX2 + 50),- (550 - posY2));
    
    matrizObjetoTransformadoObj.desenhaObjeto(color(corObj));
    popMatrix();
    
    //Objetivo3
    pushMatrix();
    Translate(posX3, posY3);
    matrizObjetoTransformadoObj = matrizObjeto.times(matrizTransf);
    
    translate(posX3 + 50, 550 - posY3);
    rotate(angleObj3);
    scale(scaleObj3);
    translate(-(posX3 + 50),- (550 - posY3));
    
    matrizObjetoTransformadoObj.desenhaObjeto(color(corObj));
    popMatrix();
    
    //Objetivo4
    pushMatrix();
    Translate(posX4, posY4);
    matrizObjetoTransformadoObj = matrizObjeto.times(matrizTransf);
    
    translate(posX4 + 50, 550 - posY4);
    rotate(angleObj4);
    scale(scaleObj4);
    translate(-(posX4 + 50),- (550 - posY4));
    
    matrizObjetoTransformadoObj.desenhaObjeto(color(corObj));
    popMatrix();
    
    //Objeto1
    pushMatrix();
    Translate(topLeftX + movementX, topLeftY + movementY); //Desenha os objetos que o jogador controla na tela, o movimento acontece pela variavel Movement (FernandO)
    matrizObjetoTransformado = matrizObjeto.times(matrizTransf);
    
    translate((topLeftX + movementX) + 50,550 - (topLeftY + movementY)); //Translata para o centro para o centro da rotação ser o centro do objeto (Fernando)
    rotate(angle1);
    scale(scale1);
    translate(-((topLeftX + movementX) + 50),- (550 - (topLeftY + movementY)));
   
    matrizObjetoTransformado.desenhaObjeto(color(cor1));
    popMatrix();
    
    //Objeto2
    pushMatrix();
    Translate(topRightX + movementX2, topRightY + movementY2);
    matrizObjetoTransformado2 = matrizObjeto.times(matrizTransf);
    
    translate((topRightX + movementX2) + 50, 550 - (topRightY + movementY2));
    rotate(angle2);
    scale(scale2);
    translate(-((topRightX + movementX2) + 50), -(550 - (topRightY + movementY2)));
    
    matrizObjetoTransformado2.desenhaObjeto(color(cor2));
    popMatrix();
    
    //Objeto3
    pushMatrix();
    Translate(bottomLeftX + movementX3, bottomLeftY + movementY3);
    matrizObjetoTransformado3 = matrizObjeto.times(matrizTransf);
    
    translate((bottomLeftX + movementX3) + 50, 550 - (bottomLeftY + movementY3));
    rotate(angle3);
    scale(scale3);
    translate(- ((bottomLeftX + movementX3) + 50), -(550 - (bottomLeftY + movementY3)));
    
    matrizObjetoTransformado3.desenhaObjeto(color(cor3));
    popMatrix();
    
    //Objeto4
    pushMatrix();
    Translate(bottomRightX + movementX4, bottomRightY + movementY4);
    matrizObjetoTransformado4 = matrizObjeto.times(matrizTransf);
    
    translate((bottomRightX + movementX4) + 50, 550 -(bottomRightY + movementY4));
    rotate(angle4);
    scale(scale4);
    translate(-((bottomRightX + movementX4) + 50), -(550 -(bottomRightY + movementY4)));
    
    matrizObjetoTransformado4.desenhaObjeto(color(cor4));
    popMatrix();
    
    // Retorna a posição original
    Translate(-bottomRightX, -bottomRightY);
    verificaVitoria(); //Verifica se o jogador ganhou (Fernando)
  }
}

public void mousePressed() {
  if(gameScreen == 0){ //Verifica se o jogador interagiu com uma tela específica (Sophia)
    gameScreen = 1;
   }
  if(gameScreen == 2){
    gameScreen =1;
    }
}

void keyPressed() {
  int moveAmount = 100; //Quantidade de movimento
  if (keyCode == SHIFT) { //Caso shift seja pressionado, o objeto selecionado passa para o próximo (Fernando)
    selecionado = selecionado + 1;
    if (selecionado > 4){selecionado = 1;} //Caso o objeto selecionado seja o último, volta para o primeiro (Fernando)
  }
  
  if (selecionado == 1){ //Caso o objeto seja selcionado, tem sua cor alterada para rosa e verifica se uma seta foi pressionado (Fernando)
    cor1 = (#F8A6BD);
    cor4 = (#DAF7A6);
    if (keyCode == UP) {
      //Move para cima
      movementY = movementY + moveAmount;
    } else if (keyCode == DOWN) {
      //Move para baixo
      movementY = movementY - moveAmount;
    } else if (keyCode == LEFT) {
      //Move para a esquerda
      movementX = movementX - moveAmount;
    } else if (keyCode == RIGHT) {
      //Move para a direita
      movementX = movementX + moveAmount;
    } 
    if(topLeftX + movementX > 500){movementX = 500;} //Limita o movimento das peças para dentro do HUD (Fernando)
    if(topLeftX + movementX < 0){movementX = 0;}
    if(topLeftY + movementY > 599){movementY = 500;}
    if(topLeftY + movementY < 0){movementY = 0;}
  }
  
  if (selecionado == 2){
    cor2 = (#F8A6BD);
    cor1 = (#DAF7A6);
    if (keyCode == UP) {
      // Move para cima
      movementY2 = movementY2 + moveAmount;
    } else if (keyCode == DOWN) {
      // Move para baixo
      movementY2 = movementY2 - moveAmount;
    } else if (keyCode == LEFT) {
      // Move para a esquerda
      movementX2 = movementX2 - moveAmount;
    } else if (keyCode == RIGHT) {
      // Move para a direita
      movementX2 = movementX2 + moveAmount;
    } 
    if(topRightX + movementX2 > 500){movementX2 = 0;}
    if(topRightX + movementX2 < 0){movementX2 = -500;}
    if(topRightY + movementY2 > 500){movementY2 = 500;}
    if(topRightY + movementY2 < 0){movementY2 = 0;}
  }
  
  if (selecionado == 3){
    cor3 = (#F8A6BD);
    cor2 = (#DAF7A6);
    if (keyCode == UP) {
      //Move para cima
      movementY3 = movementY3 + moveAmount;
    } else if (keyCode == DOWN) {
      //Move para baixo
      movementY3 = movementY3 - moveAmount;
    } else if (keyCode == LEFT) {
      //Move para a esquerda
      movementX3 = movementX3 - moveAmount;
    } else if (keyCode == RIGHT) {
      //Move para a direita
      movementX3 = movementX3 + moveAmount;
    }
    if(bottomLeftX + movementX3 > 500){movementX3 = 500;}
    if(bottomLeftX + movementX3 < 0){movementX3 = 0;}
    if(bottomLeftY + movementY3 > 500){movementY3 = 0;}
    if(bottomLeftY + movementY3 < 0){movementY3 = -500;}
  }
  
  if (selecionado == 4){
    cor4 = (#F8A6BD);
    cor3 = (#DAF7A6);
    if (keyCode == UP) {
      // Move para cima
      movementY4 = movementY4 + moveAmount;
    } else if (keyCode == DOWN) {
      // Move para baixo
      movementY4 = movementY4 - moveAmount;
    } else if (keyCode == LEFT) {
      // Move para a esquerda
      movementX4 = movementX4 - moveAmount;
    } else if (keyCode == RIGHT) {
      // Move para a direita
      movementX4 = movementX4 + moveAmount;
    } 
    if(bottomRightX + movementX4 > 500){movementX4 = 00;}
    if(bottomRightX + movementX4 < 0){movementX4 = -500;}
    if(bottomRightY + movementY4 > 500){movementY4 = 0;}
    if(bottomRightY + movementY4 < 0){movementY4 = -500;}
  }
  if(key == 'r' || key == 'R'){ //Caso r seja pressionado, rotaciona o objeto selecionado em 90 graus (Sophia)
    if(selecionado == 1){
    angle1 = angle1 + (90  * PI/180); 
    if(degrees(angle1) >= 360){ //Caso chegue a 360, ele é transformado em 0 (Sophia)
      angle1 = 0;
      }
    } 
    if(selecionado == 2){
    angle2 = angle2 + (90  * PI/180);
    if(degrees(angle2) >= 360){
      angle2 = 0;
      }
    } 
    if(selecionado == 3){
    angle3 = angle3 + (90  * PI/180);
    if(degrees(angle3) >= 360){
      angle3 = 0;
      }
    } 
    if(selecionado == 4){
    angle4 = angle4 + (90  * PI/180);
    if(degrees(angle4) >= 360){
      angle4 = 0;
      }
    } 
  }
  if(key == 's' || key == 'S'){ //Caso s seja pressionado, aumenta a escala do objeto selecionado (Sophia)
    if(selecionado == 1){
    scale1 = scale1 + 0.5;
    if(scale1 >= 2){scale1 =  2;} //Limita a escala a 2x (Sophia)
    } 
    if(selecionado == 2){
    scale2 = scale2 + 0.5;
    if(scale2 >= 2){scale2 =  2;}
    } 
    if(selecionado == 3){
    scale3 = scale3 + 0.5;
    if(scale3 >= 2){scale3 =  2;}
    } 
    if(selecionado == 4){
    scale4 = scale4 + 0.5;
    if(scale4 >= 2){scale4 =  2;}
    } 
  }
  if(key == 'd' || key == 'D'){ //Caso d seja pressionado, diminui a escala do objeto selecionado (Sophia)
    if(selecionado == 1){
    scale1 = scale1 - 0.5;
    if(scale1 <= 0.5){scale1 =  0.5;} //Limita a escala a 0.5x (Sophia)
    } 
    if(selecionado == 2){
    scale2 = scale2 - 0.5;
    if(scale2 <= 0.5){scale2 =  0.5;}
    } 
    if(selecionado == 3){
    scale3 = scale3 - 0.5;
    if(scale3 <= 0.5){scale3 =  0.5;}
    } 
    if(selecionado == 4){
    scale4 = scale4 - 0.5;
    if(scale4 <= 0.5){scale4 =  0.5;}
    } 
  }
  redraw();
}

float choose(float[] opt) { //Escolhe aleatoriamente dentro de uma matriz (Fernando)
  int index = int(random(opt.length));
  return opt[index];
}



void verificaVitoria(){ //Verifica todas as possíveis condições de vitórias, considerando que qualquer quadrado pode estar em qualquer objetivo (Fernando)
  boolean quad1 = false, quad2 = false, quad3 = false, quad4 = false;
  if ((posX1 == topLeftX + movementX && posY1 == topLeftX + movementY) && (angle1 == angleObj1) && (scale1 == scaleObj1)){ //Se todas as condições verificarem, ele verifica esse objetivo como concluido
      quad1 = true;
  }
  else if ((posX1 == topRightX + movementX2 && posY1 == topRightY + movementY2) && (angle2 == angleObj1) && (scale2 == scaleObj1)){
      quad1 = true;
  }
  else if ((posX1 == bottomLeftX + movementX3 && posY1 == bottomLeftY + movementY3) && (angle3 == angleObj1) && (scale3 == scaleObj1)){
      quad1 = true;
  }
  else if ((posX1 == bottomRightX + movementX4 && posY1 == bottomRightY + movementY4) && (angle4 == angleObj1) && (scale4 == scaleObj1)){
      quad1 = true;
  }
  else{quad1 = false;}
  
  if ((posX2 == topLeftX + movementX && posY2 == topLeftX + movementY) && (angle1 == angleObj2) && (scale1 == scaleObj2)){
      quad2 = true;
  }
  else if ((posX2 == topRightX + movementX2 && posY2 == topRightY + movementY2) && (angle2 == angleObj2) && (scale2 == scaleObj2)){
      quad2 = true;
  }
  else if ((posX2 == bottomLeftX + movementX3 && posY2 == bottomLeftY + movementY3) && (angle3 == angleObj2) && (scale3 == scaleObj2)){
      quad2 = true;
  }
  else if ((posX2 == bottomRightX + movementX4 && posY2 == bottomRightY + movementY4) && (angle4 == angleObj2) && (scale4 == scaleObj2)){
      quad2 = true;
  }
  else{quad2 = false;}
  
  if ((posX3 == topLeftX + movementX && posY3 == topLeftX + movementY) && (angle1 == angleObj3) && (scale1 == scaleObj3)){
      quad3 = true;
  }
  else if ((posX3 == topRightX + movementX2 && posY3 == topRightY + movementY2) && (angle2 == angleObj3) && (scale2 == scaleObj3)){
      quad3 = true;
  }
  else if ((posX3 == bottomLeftX + movementX3 && posY3 == bottomLeftY + movementY3) && (angle3 == angleObj3) && (scale3 == scaleObj3)){
      quad3 = true;
  }
  else if ((posX3 == bottomRightX + movementX4 && posY3 == bottomRightY + movementY4) && (angle4 == angleObj3) && (scale4 == scaleObj3)){
      quad3 = true;
  }
  else{quad3 = false;}
 
  if ((posX4 == topLeftX + movementX && posY4 == topLeftX + movementY) && (angle1 == angleObj4) && (scale1 == scaleObj4)){
      quad4 = true;
  }
  else if ((posX4 == topRightX + movementX2 && posY4 == topRightY + movementY2) && (angle2 == angleObj4) && (scale2 == scaleObj4)){
      quad4 = true;
  }
  else if ((posX4 == bottomLeftX + movementX3 && posY4 == bottomLeftY + movementY3) && (angle3 == angleObj4) && (scale3 == scaleObj4)){
      quad4 = true;
  }
  else if ((posX4 == bottomRightX + movementX4 && posY4 == bottomRightY + movementY4) && (angle4 == angleObj4) && (scale4 == scaleObj4)){
      quad4 = true;
  }
  else{quad4 = false;}
  
  if(quad1 && quad2 && quad3 && quad4){ //Caso todos os quadrados estejam concluídos, reinicia todas as variavéis e leva para a tela de vitória (Sophia)
    gameScreen = 2; vitorias++;
    posX1 = choose(posOpt); posX2 = choose(posOpt); posX3 = choose(posOpt); posX4 = choose(posOpt);
    posY1 = choose(posOpt); posY2 = choose(posOpt); posY3 = choose(posOpt); posY4 = choose(posOpt);
    scale1 = 1; scale2 = 1; scale3 = 1; scale4 = 1;
    angleObj1 = choose(angleOpt) * PI/180; angleObj2 = choose(angleOpt) * PI/180; angleObj3 = choose(angleOpt) * PI/180; angleObj4 = choose(angleOpt) * PI/180;
    scaleObj1 = choose(scaleOpt); scaleObj2 = choose(scaleOpt); scaleObj3 = choose(scaleOpt); scaleObj4 = choose(scaleOpt);
        
    movementX = 0;
    movementY = 0;
    selecionado = 1;
    
    quad1 = false; quad2 = false; quad3 = false; quad4 = false;
    
  }
  
  if(key == 'p' || key == 'P'){ //Somente para testes (Fernando)
    print("quad1: " + quad1 + " ");
    print("quad2: " + quad2 + " ");
    print("quad3: " + quad3 + " ");
    print("quad4: " + quad4 + " ");
  }
}

void winScreen() { //Desenho da tela de vitória (Sophia)
  background(#041E27);
  fill(#DAF7A6);
  textSize(20);
  textAlign(CENTER);
  text("Você venceu!\nVocê tem " + vitorias + " vitória(s) até o momento! Aperte para jogar novamente." , height/2, width/2);
}

void quadrado_menu(float Xp, float Yp) {
//DESENHAR O QUEBRA CABEÇA MONTADO PARA COLOCAR NO MENU
stroke(#DAF7A6);
strokeWeight (3);
fill(#041E27);
rect(Xp, Yp, 200, 200, 5);
stroke(#DAF7A6);
rect(Xp+50, Yp+50, 50, 50, 2);
rect(Xp+100, Yp+50, 50, 50, 2);
rect(Xp+50, Yp+100, 50, 50, 2);
rect(Xp+100, Yp+100, 50, 50, 2);
}

void peça_menu(float Xp, float Yp) {
//DESENHAR O QUEBRA CABEÇA MONTADO PARA COLOCAR NO MENU
stroke(#F8A6BD);
strokeWeight (3);
rect(Xp, Yp, 100, 100, 5);
rect(Xp+50, Yp+50, 50, 50, 2);
}

void tecla(float Xt, float Yt, String tecla, String uso) {
stroke(#DAF7A6);
strokeWeight (2);
fill(#041E27);
rect(Xt, Yt, 28, 28, 2);
fill(#DAF7A6);
textSize(16);
text(tecla, Xt+14, Yt+20);
textSize(16);
text(uso, Xt+75, Yt+20);
}

void teclas(float Xt, float Yt) {
stroke(#F8A6BD);
strokeWeight (2);
fill(#041E27);
rect(Xt, Yt, 54, 28, 2);
fill(#F8A6BD);
textSize(16);
text("Shift", Xt+26, Yt+20);
textSize(16);
text("Selecionar Peça", Xt+120, Yt+20);
}

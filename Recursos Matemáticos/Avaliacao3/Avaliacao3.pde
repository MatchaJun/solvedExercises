// Sophia Assunção e Fernando Jun Okawa

int contX = 0; int contY = 0;

Matriz2D matrizObjeto, matrizObjetoTransformado;
float [][] objeto = {{ 0, 0, 1},
                      {0, 0, 1},
                      {0, 0, 1},
                      {0, 0, 1}};

float transX, transY, angle, scaleX, scaleY;  

void setup() {
  size(500,500);
  matrizTransf = new Matriz2D(3,3);
  transX = 1; transY = 1; angle = 1; scaleX = 1; scaleY = 1;
}

void draw(){
  atualizarTriangulos(); //Chama a função para atulizar o desenho o triângulo
}

void atualizarTriangulos(){
  background(0); //Desenha o Background para apagar o desenho anterior
  BufferedReader reader = createReader("triangulos.txt"); //Procura por um arquivo txt chamado triangulos
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ' ');
      objeto[0][0] = float(pieces[0]); //Define cada valor da matriz Objeto para as coordenadas dadas pelo txt
      objeto[0][1] = float(pieces[1]);
      objeto[1][0] = float(pieces[2]);
      objeto[1][1] = float(pieces[3]);
      objeto[2][0] = float(pieces[4]);
      objeto[2][1] = float(pieces[5]);
      objeto[3][0] = float(pieces[0]);
      objeto[3][1] = float(pieces[1]);
      int r = int(pieces[6]); //as últimas 3 colunas difinem a cor do triangulo (R,G,B)
      int g = int(pieces[7]);
      int b = int(pieces[8]);
      
      color corMatriz = color(r,g,b); //Cria uma cor com os valores recebidos
      matrizObjeto = new Matriz2D(objeto); //Da o objeto para ser desenhado pela matrizObjeto
      
      Translate(transX, transY); //Translata a matriz 
      matrizObjetoTransformado = matrizObjeto.times(matrizTransf);
      
      Rotate(angle); //Rotaciona a matriz
      matrizObjetoTransformado = matrizObjetoTransformado.times(matrizTransf);
      
      Scale(scaleX, scaleY); //Muda a escala da matriz
      matrizObjetoTransformado = matrizObjetoTransformado.times(matrizTransf);

      matrizObjetoTransformado.desenhaObjeto(color(corMatriz));
      
      contX++;
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
} 

void keyPressed() {
  int moveAmount = 10; //Quantidade de movimento
  if (keyCode == UP) { //Verifica se uma seta foi pressionada e altera o valor da movimentação
      transY = transY + moveAmount;
  } else if (keyCode == DOWN){
      transY = transY - moveAmount;
  } else if (keyCode == RIGHT){
      transX = transX + moveAmount;
  } else if (keyCode == LEFT){
      transX = transX - moveAmount;
  }
  if (key == 'r' || key == 'R'){ //Verifica se R ou T foi pressionado para alterar a rotação
    angle = angle + (45  * PI/180);
  } if (key == 't' || key == 'T'){
    angle = angle - (45  * PI/180);
  }
  if (key == 's' || key == 'S'){ //Verifica se S ou D foi pressionado para alterar a escala
    scaleX = scaleX + 0.5;
    scaleY = scaleY + 0.5;
  } if (key == 'd' || key == 'D'){
    scaleX = scaleX - 0.5;
    scaleY = scaleY - 0.5;
  } 
}

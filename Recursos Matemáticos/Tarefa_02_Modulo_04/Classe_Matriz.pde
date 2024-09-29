public class Matriz {
  private int[][] matriz;
  
  public Matriz(int linhas, int colunas) {
    matriz = new int[linhas][colunas];
  }
  
  public void inicializarMatriz() { //Da uma cor aleatória para cada célula da matriz (valores entre 128 e 256 para gerar somente cores pasteis)
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[0].length; j++) {
        matriz[i][j] = color((int)random(128,256), (int)random(128,256), (int)random(128,256));
      }
    }
  }
  
  public void desenhaMatriz(int tamanhoCelula) { //Desenha a matriz na tela
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[0].length; j++) {
        int x = i * tamanhoCelula;
        int y = j * tamanhoCelula;
        fill(matriz[i][j]);
        rect(x, y, tamanhoCelula, tamanhoCelula);
      }
    }
  }

  public void removerCor(int linha, int coluna) { //Remove a cor da célula dada
    matriz[linha][coluna] = color(255);
  }

  public int getNumeroLinhas() { //retorna o número de linhas da matriz
    return matriz.length;
  }

  public int getNumeroColunas() { //retorna o número de colunas da matriz
    return matriz[0].length;
  }
}

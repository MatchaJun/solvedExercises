void Translate(float tx, float ty){
  matrizTransf.data[0][0] = 1;
  matrizTransf.data[0][1] = 0;  
  matrizTransf.data[0][2] = 0;
  matrizTransf.data[1][0] = 0;
  matrizTransf.data[1][1] = 1;  
  matrizTransf.data[1][2] = 0;  
  matrizTransf.data[2][0] = tx;
  matrizTransf.data[2][1] = ty;  
  matrizTransf.data[2][2] = 1;    
}
Matriz2D  matrizTransf;

void Scale(float sx, float sy){
  matrizTransf.data[0][0] = sx;
  matrizTransf.data[0][1] = 0;  
  matrizTransf.data[0][2] = 0;
  matrizTransf.data[1][0] = 0;
  matrizTransf.data[1][1] = sy;  
  matrizTransf.data[1][2] = 0;  
  matrizTransf.data[2][0] = 0;
  matrizTransf.data[2][1] = 0;  
  matrizTransf.data[2][2] = 1;      
}

void Rotate(float angulo){ // em graus
  angulo = angulo * PI/180;    // converte para Radianos
  matrizTransf.data[0][0] = cos(angulo);
  matrizTransf.data[0][1] = sin(angulo);  
  matrizTransf.data[0][2] = 0;
  matrizTransf.data[1][0] = -sin(angulo);
  matrizTransf.data[1][1] = cos(angulo);  
  matrizTransf.data[1][2] = 0;  
  matrizTransf.data[2][0] = 0;
  matrizTransf.data[2][1] = 0;  
  matrizTransf.data[2][2] = 1;      
}  

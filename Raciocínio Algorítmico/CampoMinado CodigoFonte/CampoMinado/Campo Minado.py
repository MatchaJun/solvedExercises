from random import randint
from Ascii import *
import time

while True:
    print(campoMinado)
    print()

    tempoInicial = time.time()

    escolherDificuldade = int(input("Escolha uma dificuldade: [1] Fácil [2] Intermediário [3] Especialista [4] Customizar [5] Sair"))

    if escolherDificuldade == 1:
        bombasQnt = 10
        linhasQnt = 9
        colunasQnt = 9

    elif escolherDificuldade == 2:
        bombasQnt = 40
        linhasQnt = 16
        colunasQnt = 16

    elif escolherDificuldade == 3:
        bombasQnt = 99
        linhasQnt = 30
        colunasQnt = 16

    elif escolherDificuldade == 5:
        exit()

    else:
        bombasQnt = int(input("Escolha a quantidade de bombas: "))
        linhasQnt = int(input("Escolha a quantidade de linhas: "))
        colunasQnt = int(input("Escolha a quantidade de colunas: "))
        print()


    def tabelaColunas(num):
        x = 0
        print("   ", end="")
        while (num > 0):
           print(x, end=" ")
           x = x + 1
           num = num - 1


    def mostrar_matriz(tab):
        contador = 0
        contadorCol = 0
        for linha in range(linhasQnt):
            print(contador, end=" ")

            if contadorCol == 0 and contador < 10:
                print(" ", end="")
            for coluna in range(colunasQnt):
                if tab[linha][coluna] == -1 and contadorCol < 10:
                    print("*", end=" ")
                elif tab[linha][coluna] == -1:
                    print("*", end="  ")

                elif tab[linha][coluna] == 0 and contadorCol < 10:
                    print("_", end=" ")
                elif tab[linha][coluna] == 0:
                    print("_", end="  ")

                elif tab[linha][coluna] == -2 and contadorCol < 10:
                    print(" ", end=" ")
                elif tab[linha][coluna] == -2:
                    print(" ", end=" ")
                else:
                    print(tab[linha][coluna], end=" ")
                contadorCol = contadorCol + 1
            contador = contador + 1
            contadorCol = 0
            print()


    def criar_matriz():
        tab = [0] * linhasQnt
        for i in range(linhasQnt):
            tab[i] = [0] * colunasQnt
        return tab


    def sortear_matriz(tab):
        cb = 0
        while cb < bombasQnt:
            linha = randint(0, linhasQnt -1)
            coluna = randint(0, colunasQnt - 1)
            if tab[linha][coluna] == 0:
                tab[linha][coluna] = -1

                cb = cb + 1


    def calcular_dicas(tab):
        for linha in range(linhasQnt):
            for coluna in range(colunasQnt):
                cb = 0
                if tab[linha][coluna] != -1:
                    for l in range(linha - 1, linha + 2, 1):
                        for c in range(coluna - 1, coluna + 2, 1):
                            if 0 <= l <= linhasQnt -1 and 0 <= c <= colunasQnt - 1:
                                if tab[l][c] == -1:
                                    cb = cb + 1
                    tab[linha][coluna] = cb


    def testar_vitoria(tab, tela):
        ca = 0
        cc = 0
        for linha in range(linhasQnt):
            for coluna in range(colunasQnt):
                if tab[linha][coluna] == -1 and tela[linha][coluna] == -1:
                    ca = ca + 1
                elif tela[linha][coluna] == -1:
                    cc = cc + 1
        if ca == bombasQnt and cc == 0:
            return True
        return False


    def testar_vizinhos(linha, coluna, tab, tela):
        tela[linha][coluna] = -2
        for l in range(linha - 1, linha + 2, 1):
            for c in range(coluna - 1, coluna + 2, 1):
                if 0 <= l <= 8 and 0 <= c <= 8:
                    if tab[l][c] == 0 and tela[l][c] != -2:
                        testar_vizinhos(l, c, tab, tela)
                    elif tela[l][c] != -1 and 1 <= tab[l][c] <= 8:
                        tela[l][c] = tab[l][c]

    tab = criar_matriz()

    tela = criar_matriz()
    sortear_matriz(tab)
    calcular_dicas(tab)
    ganhou = False
    perdeu = False

    jogadas = 0

    while not ganhou and not perdeu:

        print(f"Tela: \n")

        tabelaColunas(colunasQnt)
        print()

        mostrar_matriz(tela)
        print()
        linha = int(input("Linha: "))
        coluna = int(input("Coluna: "))
        opcao = input("[A] Abrir ou [B] Bomba: ")
        if opcao[0].upper() == "B":
            tela[linha][coluna] = -1
            ganhou = testar_vitoria(tab, tela)
        elif opcao[0].upper() == "A":
            if tab[linha][coluna] == -1:
                jogadas = jogadas + 1
                tempoFinal = time.time()
                print(f"Você selecionou uma bomba e perdeu, tente novamente.Você jogou {jogadas} vezes em {int(tempoFinal - tempoInicial)} segundos.")
                perdeu = True
            elif 1 <= tab[linha][coluna] <= 8:
                tela[linha][coluna] = tab[linha][coluna]
            else:
                testar_vizinhos(linha, coluna, tab, tela)
            ganhou = testar_vitoria(tab, tela)

        jogadas = jogadas + 1
    if ganhou:
        jogadas = jogadas + 1
        tempoFinal = time.time()
        print(f"Parabens! Você ganhou após jogar {jogadas} vezes em {int(tempoFinal - tempoInicial)} segundos.")

    time.sleep(3)
    continue
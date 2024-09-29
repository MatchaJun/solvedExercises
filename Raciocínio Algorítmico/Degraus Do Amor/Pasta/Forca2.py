from random import randint
from valores import *
import time
print(degraus)
nome = str(input("Por qual nome devemos lhe chamar?"))
print(f"\nOlá {nome}! "
      f"\nO jogo que você está prestes a jogar chama-se Degraus do Amor e se passa em um mundo medieval! "
      f"\nNele, a história de Clarissa e Lucy será revelada "
      f"conforme seu avanço entre as fases.\n")

time.sleep(4)

print(c)
print()
time.sleep(5)
print(d)

while True:
    jogoStart = input("\nDeseja começar? "
                      "\n[1] Sim [2] Não")
    if jogoStart == "1":
        break
    else:
        continue

while True:
    def imprimeString(seg):
        for i in range(len(seg)):
            print(seg[i], end="  ")
        print()

    def testaVitoria(seg, tela):
        for i in range(len(seg)):
            if tela[i] == "_":
                return False
        return True

    letras_erradas = ""

    fase1 = ["Ansiedade", "Angústia", "Felicidade", "Alegria"]

    fase2 = ["Framboesa", "Pitanga", "Amora", "Carambola", "Graviola"]

    fase3 = ["Harpa", "Viela", "Flauta", "Rabeca"]

    acertos = [acerto1, acerto2, acerto3, acerto4, acerto5, acerto6, acerto7, acerto8, acerto9, acerto10]

    acerto = 0

    ganhou = False
    perdeu = False
    vidas = 8

    fase = 1

    print(castelo)

    # FASE1

    posicao = randint(0, len(fase1) - 1) #Sorteia uma palavra
    segredo = fase1[posicao]

    print()

    tela = ['_'] * len(segredo)

    time.sleep(3)

    while True:
        while not ganhou and not perdeu:
            printAcerto = acertos[acerto] #Desenha a escada baseada em quantos acertos tem
            if fase == 1: #Texto fase1
                print(a)
                print(parte1)
            if fase == 2: #Texto fase2
                print(a)
                print(parte3)
            if fase == 3: #Texto fase3
                print(a)
                print(parte5)
            print(printAcerto)
            print(f"Letras incorretas: {letras_erradas}") #Printa as letras erradas
            print()
            imprimeString(tela)

            letra = input(f"Digite uma letra (estâmina {vidas}): ") #Printa quantas vidas o jogador ainda tem
            letra = letra[0].upper()
            acertou = False
            for i in range(len(segredo)): #Testa se acertou
                if letra == segredo[i].upper():
                    tela[i] = segredo[i]
                    acertou = True
                    acerto = acerto + 1
            if not acertou: #Caso erre
                vidas -= 1
                if letra not in letras_erradas:
                    letras_erradas = letras_erradas + letra #Adiciona a letra a lista de letras erradas
            if vidas == 0: #Condição de derrota
                perdeu = True
                print(telaDerrota)
            ganhou = testaVitoria(segredo, tela)

        if perdeu:
            jogarNovamente = float(input())
            if jogarNovamente == 1: #Se for jogar novamente reinicia o ciclo
                vaiJogar = True
                break
            if jogarNovamente == 2: #Se não for jogar novamente encerra o código
                vaiJogar = False
                break

        if ganhou:

            if fase == 3:
                print(telaVitoria)
                time.sleep(8)

                jogarNovamente = float(input(("Deseja jogar novamente?"
                                         "\n[1] Sim ou [2] Não")))
                if jogarNovamente == 1:
                    vaiJogar = True
                    break
                if jogarNovamente == 2:
                    vaiJogar = False
                    break

            if fase == 1 and (posicao == 0 or posicao == 1): #Palavra sorteada te leva a uma continuação da história
                print(a)
                print(printAcerto)
                print()
                print(f"A {segredo} lhe consumia... Ao chegar ao pé da montanha, a imensidão dos degraus lhe causava arrepios. Será que agora era hora de desistir? Engolindo seco, Lucy... ")
            if fase == 1 and (posicao == 2 or posicao == 3): #Palavra sorteada te leva a uma continuação da história
                print(b)
                print(printAcerto)
                print()
                print(f"A {segredo} lhe consumia... Ao chegar ao pé da montanha, a imensidão dos degraus era hipnotizante.\nEles representavam a união entre Lucy e Clarissa, que logo estariam juntas. Com o coração na mão, Lucy...")
            if fase == 1:
                time.sleep(8)
                print(parte2)
                time.sleep(8)
                vidas = 7
                posicao = randint(0, len(fase2) - 1)
                segredo = fase2[posicao]


            if fase == 2:
                print(a)
                print(printAcerto)
                print()
                print(f"Lucy pega uma {segredo}, a sua fruta favorita! Ela devora como se não tivesse comido nada o dia todo!\nAgora cheia de energia Lucy continua sua jornada...")
            if fase == 2:
                time.sleep(8)
                print(parte4)
                time.sleep(8)
                vidas = 6
                posicao = randint(0, len(fase3) - 1)
                segredo = fase3[posicao]

            #reinicia os valores
            fase = fase + 1
            acerto = 0
            ganhou = False
            perdeu = False
            tela = ['_'] * len(segredo)
            letras_corretas = ""
            letras_erradas = ""

            continue

    if vaiJogar:
        continue
    elif not vaiJogar:
        break

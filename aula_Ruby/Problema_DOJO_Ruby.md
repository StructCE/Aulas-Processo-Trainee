# O problema

Existe um jogo bem legal para celular chamado Dungeon Cards. O objetivo desse jogo é o usuário obter a maior quantidade de pontos possíveis, e para isso o personagem deve sobreviver ao longo das rodadas e acumular os pontos.

A base de decorrência do jogo é uma tabuleiro 3x3, na qual o personagem inicialmente nasce no centro. As casinhas restantes(8) são preenchidas com objetos e inimigos do jogo. A cada rodada, o personagem pode movimentar uma casa na horizontal ou vertical, respeitando os limites da matriz. Se o personagem avançar sobre uma casa com arma um inimigo, temos as seguintes situações:

* Se o inimigo tiver HP maior ao atk, o personagem retira a quantidade de atk do inimigo, se mantém na mesma posição, e perde a arma.
* Caso contrário, o inimigo morre, o personagem ocupa a casa do inimigo, e é descontado do atk da arma a quantidade de vida do inimigo na rodada.

Se ele avançar sem arma, temos 2 outras situações:

* Se o inimigo tiver HP maior, o personagem morrerá; e acabará o jogo.
* Caso contrário, o personagem ocupará o lugar do inimigo, e terá seu HP decrementado.

O personagem também pode avançar para casas onde tem: armas, sendo descartada a atual e adquirida a correspondente da casa; moedas, que serão contabilizadas como pontos; e potions, que recuperam a hp do personagem(respeitando o seu limiar).

Quando é ocupada uma casa, a antiga ocupada pelo personagem é preenchida com o nascimento de algum objeto ou inimigo.

Existem as seguintes armas:

|Armas   | Valor  | Intervalo|
|--------|:-------|---------:|
|Sword   | 5 atk  | 0 a 14   |
|Axe     | 8 atk  | 15 a 24  |
|Shotgun | 12 atk | 24 a 29  |

Poções:

|Potions    | Valor  | Intervalo|
|-----------|:-------|---------:|
|Potion     | +1hp   | 30 a 38  |
|Hi-Potion  | +3hp   | 39 a 45  |
|X-potion   | +7hp   | 46 a 49  |

Inimigos:

|Inimigos  |  Valor  | Intervalo| 
|----------|:--------|---------:|
|Goblin    | 2 hp    | 50 a 57  |
|Spider    | 3 hp    | 58 a 64  |
|Flan      | 4 hp    | 65 a 70  |
|Ogre      | 5 hp    | 71 a 74  |
|Iron Giant| 10 hp   | 75 a 77  |
|Dragon    | 18 hp   | 78 a 79  |

E Moedas:

|Moedas  | Valor  | Intervalo|
|--------|:-------|---------:|
|Dime    | 1 gil  | 80 a 89  |
|Bag     | 5 gil  | 90 a 96  |
|Ruby    | 10 gil | 97 a 99  |

O último termo corresponde ao intervalo de nascimento. Nisso, será chamada uma função rand que selecionará aleatoriamente um número de 0 a 99. O objeto correspondente a esse intervalo nascerá na posição vaga(última ocupada pelo usuário).

Desse modo, o usuário deve ir sobrevivendo ao longo das rodadas, e o jogo acaba quando seu hp chegar em 0 ou menos.

Para fins de facilitação, é pedido que seja impresso no terminal o jogo da seguinte forma a cada rodada:

~$ ruby prog.rb

Rodada 1

Seu HP: 12hp    
Sua arma: sword
Sua atk: 5 atk

acima : Goblin    
abaixo: Potion    
esquerda: Dime    
direita:  Sword   

Lembre-se que tem casos que o personagem pode estar no limite horizontal ou vertical da matriz. No caso do personagem estar no limite direito, basta printar:

Rodada 1

Seu HP: 12hp    
Sua arma: axe
Sua atk: 8 atk

acima : Goblin    
abaixo: Potion    
esquerda: Dime    
direita:  --    
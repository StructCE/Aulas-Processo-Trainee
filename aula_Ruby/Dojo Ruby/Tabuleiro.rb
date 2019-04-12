require './Jogador'
require './Item'
class Tabuleiro
  def initialize
    @matriz = [[],[],[]]
    @pos_atual = [1,1]
    for linha in 0..2
      for coluna in 0..2
        if linha != pos_atual[0] and coluna != pos_atual[1]
          criar_item(linha, coluna)
        end
      end
    end
  end
end

def movimenta(pos_atual, linha, coluna)
  @matriz[pos_atual[0]][pos_atual[1]] = item.cria_item()
  @pos_atual = [linha, coluna]

end
def criar_item(linha,coluna)
  numero_aleatorio = rand(0...100)
  case numero_aleatorio
  when 0..14
    @matriz[linha][coluna] = Item.new('5', 'sword', 'arma')
  when 15..24
    @matriz[linha][coluna] = Item.new('8', 'axe', 'arma')
  when 25..29
    @matriz[linha][coluna] = Item.new('12', 'shotgun', 'arma')
  when 30..38
    @matriz[linha][coluna] = Item.new('1', 'potion', 'potions')
  when 39..45
    @matriz[linha][coluna] = Item.new('3', 'Hi-potion', 'potions')
  when 46..49
    @matriz[linha][coluna] = Item.new('7', 'X-potion', 'potions')
  when 50..57
    @matriz[linha][coluna] = Item.new('2', 'goblin', 'inimigo')
  when 58..64
    @matriz[linha][coluna] = Item.new('3', 'spider', 'inimigo')
  when 65..70
    @matriz[linha][coluna] = Item.new('4', 'flan', 'inimigo')
  when 71..74
    @matriz[linha][coluna] = Item.new('5', 'ogre', 'inimigo')
  when 75..77
    @matriz[linha][coluna] = Item.new('6', 'iron giant', 'inimigo')
  when 78..79
    @matriz[linha][coluna] = Item.new('18', 'dragon', 'inimigo')
  when 80..89
    @matriz[linha][coluna] = Item.new('1', 'dime', 'moedas')
  when 90..96
    @matriz[linha][coluna] = Item.new('5', 'bag', 'moedas')
  when 97..99
    @matriz[linha][coluna] = Item.new('10', 'ruby', 'moedas')
  end

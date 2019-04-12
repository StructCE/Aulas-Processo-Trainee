class Item
  def initialize(valor, nome, tipo)
   @valor = valor
   @nome = nome
   @tipo = tipo
  end
  
  def valor()
    return @valor
  end

  def nome()
    return @nome
  end

  def tipo()
    return @tipo
  end

  def interacao(jogador)
    case @tipo
    when 'inimigo'
      if jogador.ataque==0 #jogador ataca om hp
        @valor-=jogador.vida
        jogador.vida-=@valor+jogador.vida
      else #Jogador ataca com ataque
        @valor-=jogador.ataque
        jogador.ataque-=@valor+jogador.vida
      end
  end
end
class Jogador
  def initialize(vida, ataque, pontuacao)
    @vida = vida
    @ataque = ataque
    @pontuacao = pontuacao
    
  end

  def vida()
    return @vida
  end

  def ataque()
    return @ataque
  end

  def pontuacao()
    return @pontuacao
  end
end
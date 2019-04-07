CREATE TABLE IF NOT EXISTS TipoPagamento (
  idTipoPagamento INT NOT NULL,
  descTipoPagamento VARCHAR(45),
  PRIMARY KEY (idTipoPagamento));

-- -----------------------------------------------------
-- Table `mydb`.`TipoAssento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TipoAssento (
  idTipoAssento INT NOT NULL,
  descTipoAssento VARCHAR(45),
  PRIMARY KEY (idTipoAssento));

-- -----------------------------------------------------
-- Table `mydb`.`Piloto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Piloto (
  CPF INT NOT NULL,
  Nome VARCHAR(45),
  DNPiloto VARCHAR(45),
  Sexo VARCHAR(45),
  PRIMARY KEY (CPF));


-- -----------------------------------------------------
-- Table `mydb`.`Aviao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Aviao (
  Numero INT NOT NULL,
  modelo VARCHAR(45),
  cadeiras INT,
  Piloto_CPF INT,
  PRIMARY KEY (Numero),
  FOREIGN KEY (Piloto_CPF) REFERENCES Piloto (CPF));

-- -----------------------------------------------------
-- Table `mydb`.`Assento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Assento (
  idAssento INT NOT NULL,
  posicao VARCHAR(45),
  idTipoAssento INT,
  Aviao_Numero INT,
  PRIMARY KEY (idAssento),
  FOREIGN KEY (idTipoAssento) REFERENCES TipoAssento (idTipoAssento),
  FOREIGN KEY (Aviao_Numero) REFERENCES Aviao (Numero));


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pagamento (
  idPagamento INT NOT NULL,
  Valor VARCHAR(45),
  dataEmissao VARCHAR(45),
  dataValidade VARCHAR(45),
  idTipoPagamento INT,
  PRIMARY KEY (idPagamento),
  FOREIGN KEY (idTipoPagamento) REFERENCES TipoPagamento (idTipoPagamento)
);


-- -----------------------------------------------------
-- Table `mydb`.`Passageiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Passageiro (
  idPassageiro INT NOT NULL,
  nomePassageiro VARCHAR(45) NULL,
  DNPassageiro VARCHAR(45) NULL,
  Sexo VARCHAR(45) NULL,
  Email VARCHAR(45) NULL,
  Aviao_Numero INT,
  PRIMARY KEY (idPassageiro),
  FOREIGN KEY (Aviao_Numero) REFERENCES Aviao (Numero)
);


-- -----------------------------------------------------
-- Table `mydb`.`Aeroporto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Aeroporto (
  idAeroporto INT NOT NULL,
  nomeAeroporto VARCHAR(45) NULL,
  cidade VARCHAR(45) NULL,
  PRIMARY KEY (idAeroporto));

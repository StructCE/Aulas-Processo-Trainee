create database projeto_hollywood;

use projeto_hollywood;

CREATE TABLE IF NOT EXISTS Sexo (
    idSexo INT AUTO_INCREMENT,
    descSexo VARCHAR(45),
    PRIMARY KEY (idSexo)
);

CREATE TABLE IF NOT EXISTS TipoEndereco (
    idTipoEndereco INT AUTO_INCREMENT,
    descEndereco VARCHAR(45),
    PRIMARY KEY (idTipoEndereco)
);

CREATE TABLE IF NOT EXISTS EstadoCivil (
    idEstadoCivil INT AUTO_INCREMENT,
    descEstadoCivil VARCHAR(45),
    PRIMARY KEY (idEstadoCivil)
);

CREATE TABLE IF NOT EXISTS TipoTelefone (
    idTipoTelefone INT AUTO_INCREMENT,
    desctipoTelefone VARCHAR(45),
    PRIMARY KEY (idTipoTelefone)
);

CREATE TABLE IF NOT EXISTS Telefone (
    idTelefone INT AUTO_INCREMENT,
    idTipoTelefone INT,
    numero VARCHAR(45),
    PRIMARY KEY (idTelefone),
    FOREIGN KEY (idTipoTelefone)
        REFERENCES TipoTelefone (idTipoTelefone)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS Email (
    idEmail INT AUTO_INCREMENT,
    descEmail VARCHAR(45),
    PRIMARY KEY (idEmail)
);

CREATE TABLE IF NOT EXISTS Pais (
    idPais INT AUTO_INCREMENT,
    nomePais VARCHAR(45),
    DDI INT,
    PRIMARY KEY (idPais)
);

CREATE TABLE IF NOT EXISTS UF (
    idUF INT AUTO_INCREMENT,
    nomeUF VARCHAR(45),
    PRIMARY KEY (idUF)
);

CREATE TABLE IF NOT EXISTS Cidade (
    idCidade INT AUTO_INCREMENT,
    idUF INT,
    nomeCidade VARCHAR(45),
    DDD INT,
    PRIMARY KEY (idCidade),
    FOREIGN KEY (idUF)
        REFERENCES UF (idUF)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Bairro (
    idBairro INT AUTO_INCREMENT,
    idCidade INT,
    nomeBairro VARCHAR(45),
    PRIMARY KEY (idBairro),
    FOREIGN KEY (idCidade)
        REFERENCES Cidade (idCidade)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Endereco (
    idEndereco INT AUTO_INCREMENT,
    idBairro INT,
    idTipoEndereco INT,
    nomeEndereco VARCHAR(45),
    numeroEndereco INT,
    PRIMARY KEY (idEndereco),
    FOREIGN KEY (idBairro)
        REFERENCES Bairro (idBairro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idTipoEndereco)
        REFERENCES TipoEndereco (idTipoEndereco)
        ON DELETE CASCADE ON UPDATE CASCADE
);


/* Aparentemente o mysql já tem uma palavra "cache" padrão */
CREATE TABLE IF NOT EXISTS Cachee (
    idCachee INT AUTO_INCREMENT,
    valorCachee INT,
    descCachee VARCHAR(45),
    PRIMARY KEY (idCachee)
);

CREATE TABLE IF NOT EXISTS FaturamentoAnoAnterior (
    idFaturamentoAnoAnterior INT AUTO_INCREMENT,
    valor INT,
    PRIMARY KEY (idFaturamentoAnoAnterior)
);

CREATE TABLE IF NOT EXISTS Personagem (
    idPersonagem INT AUTO_INCREMENT,
    nomePersonagem VARCHAR(45),
    PRIMARY KEY (idPersonagem)
);

CREATE TABLE IF NOT EXISTS TipoFisico (
    idTipoFisico INT AUTO_INCREMENT,
    descTipoFisico VARCHAR(45),
    PRIMARY KEY (idTipoFisico)
);

CREATE TABLE IF NOT EXISTS Filiacao (
    idFiliacao INT AUTO_INCREMENT,
    nomePai VARCHAR(45),
    nomeMae VARCHAR(45),
    DN_pai DATE,
    DN_mae DATE,
    PRIMARY KEY (idFiliacao)
);

CREATE TABLE IF NOT EXISTS Escolaridade (
    idEscolaridade INT AUTO_INCREMENT,
    descEscolaridade VARCHAR(45),
    PRIMARY KEY (idEscolaridade)
);

CREATE TABLE IF NOT EXISTS Diretor (
    idDiretor INT AUTO_INCREMENT,
    idSexo INT,
    idPais INT,
    idFiliacao INT,
    idEscolaridade INT,
    idEstadoCivil INT,
    idTelefone INT,
    idEmail INT,
    idEndereco INT,
    idCidade INT,
    nomeDiretor VARCHAR(45),
    DNDiretor DATE,
    CPFDiretor VARCHAR(45),
    identidadeDiretor VARCHAR(45),
    PRIMARY KEY (idDiretor),
    FOREIGN KEY (idSexo)
        REFERENCES Sexo (idSexo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idPais)
        REFERENCES Pais (idPais),
    FOREIGN KEY (idFiliacao)
        REFERENCES Filiacao (idFiliacao)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEscolaridade)
        REFERENCES Escolaridade (idEscolaridade)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEstadoCivil)
        REFERENCES EstadoCivil (idEstadoCivil)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idTelefone)
        REFERENCES Telefone (idTelefone)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEmail)
        REFERENCES Email (idEmail)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idCidade)
        REFERENCES Cidade (idCidade)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Ator (
    idAtor INT AUTO_INCREMENT,
    idSexo INT,
    idPais INT,
    idFiliacao INT,
    idEscolaridade INT,
    idEstadoCivil INT,
    idTelefone INT,
    idEmail INT,
    idEndereco INT,
    idCidade INT,
    seguroSocialAtor VARCHAR(255),
    nomeAtor VARCHAR(255),
    DNAtor DATE,
    CPFAtor VARCHAR(45),
    identidadeAtor VARCHAR(45),
    PRIMARY KEY (idAtor),
    FOREIGN KEY (idSexo)
        REFERENCES Sexo (idSexo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEstadoCivil)
        REFERENCES EstadoCivil (idEstadoCivil)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idPais)
        REFERENCES Pais (idPais)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idFiliacao)
        REFERENCES Filiacao (idFiliacao)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEscolaridade)
        REFERENCES Escolaridade (idEscolaridade)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idTelefone)
        REFERENCES Telefone (idTelefone)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEmail)
        REFERENCES Email (idEmail)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idCidade)
        REFERENCES Cidade (idCidade)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS DonoEstudio (
    idDonoEstudio INT AUTO_INCREMENT,
    idSexo INT,
    idPais INT,
    idFiliacao INT,
    idEscolaridade INT,
    idEstadoCivil INT,
    idTelefone INT,
    idEmail INT,
    idEndereco INT,
    idCidade INT,
    nomeDono VARCHAR(45),
    DNDono DATE,
    CPFDono VARCHAR(45),
    identidadeDono VARCHAR(45),
    PRIMARY KEY (idDonoEstudio),
    FOREIGN KEY (idSexo)
        REFERENCES Sexo (idSexo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEstadoCivil)
        REFERENCES EstadoCivil (idEstadoCivil)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idPais)
        REFERENCES Pais (idPais)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idFiliacao)
        REFERENCES Filiacao (idFiliacao)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEscolaridade)
        REFERENCES Escolaridade (idEscolaridade)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idTelefone)
        REFERENCES Telefone (idTelefone)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEmail)
        REFERENCES Email (idEmail)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idCidade)
        REFERENCES Cidade (idCidade)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Estudio (
    idEstudio INT AUTO_INCREMENT,
    idDonoEstudio INT,
    nomeEstudio VARCHAR(45),
    dataFundacao DATE,
    PRIMARY KEY (idEstudio),
    FOREIGN KEY (idDonoEstudio)
        REFERENCES DonoEstudio (idDonoEstudio)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Filme (
    idFilme INT AUTO_INCREMENT,
    idEstudio INT,
    nomeFilme VARCHAR(45),
    mesesProducaoFilme INT,
    anoLancamentoFilme DATE,
    copyrightNumberFilme VARCHAR(45),
    custoFilme INT,
    PRIMARY KEY (IdFilme),
    FOREIGN KEY (idEstudio)
        REFERENCES Estudio (idEstudio)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/*----------------------- Tabelas associativas----------------*/
CREATE TABLE IF NOT EXISTS Atuar (
    idCachee INT,
    idPersonagem INT,
    idAtor INT,
    idFilme INT,
    FOREIGN KEY (idCachee)
        REFERENCES Cachee (idCachee)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idPersonagem)
        REFERENCES Personagem (idPersonagem)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idAtor)
        REFERENCES Ator (idAtor)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idFilme)
        REFERENCES Filme (idFilme)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Dirigir (
    idDiretor INT,
    idFilme INT,
    FOREIGN KEY (idDiretor)
        REFERENCES Diretor (idDiretor)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idFilme)
        REFERENCES Filme (idFilme)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Perfil (
    idTipoFisico INT,
    idAtor INT,
    FOREIGN KEY (idTipoFisico)
        REFERENCES TipoFisico (idTipoFisico)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idAtor)
        REFERENCES Ator (idAtor)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Estudio_has_FaturamentoAnoAnterior (
    idEstudio INT,
    idFaturamentoAnoAnterior INT,
    FOREIGN KEY (idEstudio)
        REFERENCES Estudio (idEstudio)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idFaturamentoAnoAnterior)
        REFERENCES FaturamentoAnoAnterior (idFaturamentoAnoAnterior)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/*----------------------- Preencher Dados ----------------*/
INSERT INTO Sexo
	(descSexo)
Value
('Masculino'),
/*01*/
('Feminino');
/*02*/

INSERT INTO Escolaridade
	(descEscolaridade)
Value
('Ensino Fundamental incompleto'),
/*01*/
('Ensino Fundamental completo'),
/*02*/
('Ensino Medio incompleto'),
/*03*/
('Ensino Medio completo'),
/*04*/
('Ensino Superior incompleto'),
/*05*/
('Ensino Superior completo'),
/*06*/
('Pós-Graduação');
/*07*/

INSERT INTO Pais
	(nomePais, DDI)
Value
('Anguila', 1),
/*1*/
('Antígua e Barbuda', 1),
/*2*/
('Bahamas', 1),
/*3*/
('Barbados', 1),
/*4*/
('Bermudas', 1),
/*5*/
('Canadá', 1),
/*6*/
('Dominica', 1),
/*7*/
('Estados Unidos', 1),
/*8*/
('Granada', 1),
/*9*/
('Ilhas Caimão', 1),
/*10*/
('Ilhas Marianas do Norte', 1),
/*11*/
('Ilhas Virgens Americanas', 1),
/*12*/
('Ilhas Virgens Britânicas', 1),
/*13*/
('Jamaica', 1),
/*14*/
('Montserrat', 1),
/*15*/
('Porto Rico', 1),
/*16*/
('República Dominicana', 1),
/*17*/
('Samoa Americana', 1),
/*18*/
('Santa Lúcia', 1),
/*19*/
('São Cristóvão e Neves', 1),
/*20*/
('São Vicente e Granadinas', 1),
/*21*/
('Trinidad e Tobago', 1),
/*22*/
('Turcas e Caicos', 1),
/*23*/
('Casaquistão', 7),
/*24*/
('Rússia', 7),
/*25*/
('Egito', 20),
/*26*/
('África do Sul', 27),
/*27*/
('Grécia', 30),
/*28*/
('Holanda', 31),
/*29*/
('Bélgica', 32),
/*30*/
('França', 33),
/*31*/
('Espanha', 34),
/*32*/
('Hungria', 36),
/*33*/
('Itália', 39),
/*34*/
('Romênia', 40),
/*35*/
('Suíça', 41),
/*36*/
('Áustria', 43),
/*37*/
('Reino Unido', 44),
/*38*/
('Dinamarca', 45),
/*39*/
('Suécia', 46),
/*40*/
('Noruega', 47),
/*41*/
('Polônia', 48),
/*42*/
('Alemanha', 49),
/*43*/
('Peru', 51),
/*44*/
('México', 52),
/*45*/
('Cuba', 53),
/*46*/
('Argentina', 54),
/*47*/
('Brasil', 55),
/*48*/
('Chile', 56),
/*49*/
('Colômbia', 57),
/*50*/
('Venezuela', 58),
/*51*/
('Malásia', 60),
/*52*/
('Austrália', 61),
/*53*/
('Indonésia', 62),
/*54*/
('Filipinas', 63),
/*55*/
('Nova Zelândia', 64),
/*56*/
('Cingapura', 65),
/*57*/
('Tailândia', 66),
/*58*/
('Japão', 81),
/*59*/
('Coréia do Sul', 82),
/*60*/
('Vietnã', 84),
/*61*/
('China', 86),
/*62*/
('Turquia', 90),
/*63*/
('Índia', 91),
/*64*/
('Paquistão', 92),
/*65*/
('Afeganistão', 93),
/*66*/
('Sri Lanka', 94),
/*67*/
('Myanmar', 95),
/*68*/
('Irã', 98),
/*69*/
('Marrocos', 212),
/*70*/
('Saara Ocidental', 212),
/*71*/
('Argélia', 213),
/*72*/
('Tunísia', 216),
/*73*/
('Líbia', 218),
/*74*/
('Gâmbia', 220),
/*75*/
('Senegal', 221),
/*76*/
('Mauritânia', 222),
/*77*/
('Mali', 223),
/*78*/
('Guiné', 224),
/*79*/
('Costa do Marfim', 225),
/*80*/
('Burkina Faso', 226),
/*81*/
('Níger', 227),
/*82*/
('Togo', 228),
/*83*/
('Benim', 229),
/*84*/
('Maurício', 230),
/*85*/
('Libéria', 231),
/*86*/
('Serra Leoa', 232),
/*87*/
('Gana', 233),
/*88*/
('Nigéria', 234),
/*89*/
('Chade', 235),
/*90*/
('República Centro-Africana', 236),
/*91*/
('Camarões', 237),
/*92*/
('Cabo Verde', 238),
/*93*/
('São Tomé e Príncipe', 239),
/*94*/
('Guiné Equatorial', 240),
/*95*/
('Gabão', 241),
/*96*/
('Congo-Brazzaville', 242),
/*97*/
('Congo-Kinshasa', 243),
/*98*/
('Angola', 244),
/*99*/
('Guiné-Bissau', 245),
/*100*/
('Território Britânico do Oceano Índico', 246),
/*101*/
('Ascensão', 247),
/*102*/
('Seicheles', 248),
/*103*/
('Sudão', 249),
/*104*/
('Ruanda', 250),
/*105*/
('Etiópia', 251),
/*106*/
('Somália', 252),
/*107*/
('Djibuti', 253),
/*108*/
('Quênia', 254),
/*109*/
('Tanzânia', 255),
/*110*/
('Uganda', 256),
/*111*/
('Burundi', 257),
/*112*/
('Moçambique', 258),
/*113*/
('Zâmbia', 260),
/*114*/
('Madagascar', 261),
/*115*/
('Reunião', 262),
/*116*/
('Zimbábue', 263),
/*117*/
('Namíbia', 264),
/*118*/
('Malawi', 265),
/*119*/
('Lesoto', 266),
/*120*/
('Botsuana', 267),
/*121*/
('Suazilândia', 268),
/*122*/
('Comores', 269),
/*123*/
('Mayotte', 269),
/*124*/
('Santa Helena', 290),
/*125*/
('Eritréia', 291),
/*126*/
('Aruba', 297),
/*127*/
('Ilhas Faroé', 298),
/*128*/
('Groenlândia', 299),
/*129*/
('Gibraltar', 350),
/*130*/
('Portugal', 351),
/*131*/
('Luxemburgo', 352),
/*132*/
('Irlanda', 353),
/*133*/
('Islândia', 354),
/*134*/
('Albânia', 355),
/*135*/
('Malta', 356),
/*136*/
('Chipre', 357),
/*137*/
('Finlândia', 358),
/*138*/
('Bulgária', 359),
/*139*/
('Lituânia', 370),
/*140*/
('Letônia', 371),
/*141*/
('Estônia', 372),
/*142*/
('Moldávia', 373),
/*143*/
('Armênia', 374),
/*144*/
('Bielorrússia', 375),
/*145*/
('Andorra', 376),
/*146*/
('Mônaco', 377),
/*147*/
('São Marinho', 378),
/*148*/
('Vaticano', 379),
/*149*/
('Ucrânia', 380),
/*150*/
('Sérvia e Montenegro', 381),
/*151*/
('Croácia', 385),
/*152*/
('Eslovénia', 386),
/*153*/
('Bósnia e Herzegovina', 387),
/*154*/
('Macedônia', 389),
/*155*/
('República Tcheca', 420),
/*156*/
('Eslováquia', 421),
/*157*/
('Liechtenstein', 423),
/*158*/
('Grenada', 473),
/*159*/
('Ilhas Malvinas', 500),
/*160*/
('Belize', 501),
/*161*/
('Guatemala', 502),
/*162*/
('El Salvador', 503),
/*163*/
('Honduras', 504),
/*164*/
('Nicarágua', 505),
/*165*/
('Costa Rica', 506),
/*166*/
('Panamá', 507),
/*167*/
('São Pedro e Miquelon', 508),
/*168*/
('Haiti', 509),
/*169*/
('Guadalupe', 590),
/*170*/
('Saint-Martin (French West Indies)', 590),
/*171*/
('Bolívia', 591),
/*172*/
('Guiana', 592),
/*173*/
('Equador', 593),
/*174*/
('Guiana Francesa', 594),
/*175*/
('Paraguai', 595),
/*176*/
('Martinica', 596),
/*177*/
('Suriname', 597),
/*178*/
('Uruguai', 598),
/*179*/
('Sint Maarten (Antilhas Holandesas)', 599),
/*180*/
('Timor-Leste', 670),
/*181*/
('Guam', 671),
/*182*/
('Territórios Externos Australianos', 672),
/*183*/
('Brunei', 673),
/*184*/
('Nauru', 674),
/*185*/
('Papua-Nova Guiné', 675),
/*186*/
('Tonga', 676),
/*187*/
('Ilhas Salomão', 677),
/*188*/
('Vanuatu', 678),
/*189*/
('Fiji', 679),
/*190*/
('Palau', 680),
/*191*/
('Wallis e Futuna', 681),
/*192*/
('Ilhas Cook', 682),
/*193*/
('Ilha Niue', 683),
/*194*/
('Samoa', 685),
/*195*/
('Kiribati', 686),
/*196*/
('Nova Caledônia', 687),
/*197*/
('Tuvalu', 688),
/*198*/
('Polinésia Francesa', 689),
/*199*/
('Tokelau', 690),
/*200*/
('Micronésia', 691),
/*201*/
('Ilhas Marshall', 692),
/*202*/
('Coréia do Norte', 850),
/*203*/
('Hong Kong', 852),
/*204*/
('Macau', 853),
/*205*/
('Camboja', 855),
/*206*/
('Laos', 856),
/*207*/
('Bangladesh', 880),
/*208*/
('Taiwan', 886),
/*209*/
('Ilhas Maldivas', 960),
/*210*/
('Líbano', 961),
/*211*/
('Jordânia', 962),
/*212*/
('Síria', 963),
/*213*/
('Iraque', 964),
/*214*/
('Kuwait', 965),
/*215*/
('Arábia Saudita', 966),
/*216*/
('Iêmen', 967),
/*217*/
('Omã', 968),
/*218*/
('Palestina', 970),
/*219*/
('Emirados Árabes Unidos', 971),
/*220*/
('Israel', 972),
/*221*/
('Bahrein', 973),
/*222*/
('Qatar', 974),
/*223*/
('Butão', 975),
/*224*/
('Mongólia', 976),
/*225*/
('Nepal', 977),
/*226*/
('Tadjiquistão', 992),
/*227*/
('Turquemenistão', 993),
/*228*/
('Azerbaijão', 994),
/*229*/
('Geórgia', 995),
/*230*/
('Quirguistão', 996),
/*231*/
('Uzbequistão', 998);
/*232*/

INSERT INTO UF
	(nomeUF)
Value
('Missouri'),
/*01*/
('Massachusetts'),
/*02*/
('Lisbon'),
/*03*/
('New York'),
/*04*/
('London');
/*05*/

INSERT INTO Cidade
	(nomeCidade, DDD)
Value
('Springfield', 417),
/*01*/
('Boston', 617),
/*02*/
('Lisbon', 21),
/*03*/
('Manhattan', 100),
/*04*/
('Hammersmith', 020);
/*05*/

INSERT INTO Bairro
	(idCidade, nomeBairro)
Value
(1, 'Cinnamon Square'),
/*01*/
(2, 'Dorchester'),
/*02*/
(3, 'Belem'),
/*03*/
(4, 'Yorkville'),
/*04*/
(5, 'Hammersmith Broadway');
/*05*/

INSERT INTO TipoEndereco
	(descEndereco)
Value
('Condominio'),
/*01*/
('Rua'),
/*02*/
('Avenida'),
/*03*/
('Praça'),
/*04*/
('Jardim'),
/*05*/
('Chacara');
/*06*/


INSERT INTO TipoTelefone
	(descTipoTelefone)
Value
('Celular'),
/*01*/
('Trabalho'),
/*02*/
('Comercial'),
/*03*/
('Residencial');
/*04*/

INSERT INTO Telefone
	(idTipoTelefone, numero)
Value
(1,
'9934-5984'
),
/*01*/
(2, '3454-3979'),
/*02*/
(3, '3498-5743'),
/*03*/
(4, '3248-9324'),
/*04*/
(3, '4365-4954');
/*05*/

INSERT INTO Email
	(descEmail)
Value
('pittbull@hotmail.com'),
/*01*/
('tarantino@hotmail.com'),
/*02*/
('chriswaltz@gmail.com'),
/*03*/
('danielpotter@yahoo.com'),
/*04*/
('dicaprio@gmail.com');
/*05*/

INSERT INTO Endereco
	(idBairro, idTipoEndereco, nomeEndereco, numeroEndereco)
Value
(1, 1, 'Condominio Cinnamon', 12),
/*01*/
(2, 2, 'Rua Metropolinata', 23),
/*02*/
(3, 2, 'Rua Barbados', 51),
/*03*/
(4, 1, 'Rua Manhattan', 11),
/*04*/
(5, 3, 'Avenida Hammersmith', 1);
/*05*/

INSERT INTO Cachee
	(valorCachee, descCachee)
Value
(500002, 'Protagonista'),
/*01*/
(250073, 'Ator Secundário'),
/*02*/
(579500, 'Ator Terciário'),
/*03*/
(10000, 'Figurante'),
/*04*/
(5323, 'Figurante Secundário');
/*05*/

INSERT INTO Filiacao
	(nomePai, nomeMae, DN_pai, DN_mae)
Value
('William Alvin Pitt',
		'Jane Etta Pitt',
		'1941-12-08',
		'1940-07-24'),	
/*01*/

('Johannes Waltz',
		'Elisabeth Urbancic',
		'1922-04-11',
		'1925-08-13'),
/*02*/

('Josef Fassbender',
		'Adele Fassbender',
		'1946-02-12',
		'1944-11-23'),
/*03*/

('Sheldon Roth',
		'Cora Roth',
		'1938-02-12',
		'1940-04-10'),
/*04*/

('Donald Furcillo',
		'June Frances Nicholson',
		'1909-06-08',
		'1918-02-15'),
/*05*/

('Robert Richardson Duvall',
		'Bobbie Ruth Crawford',
		'1900-06-15',
		'1907-12-28'),
/*06*/

('George Dicaprio',
		'Irmelin Indenbirken',
		'1943-11-30',
		'1943-02-14'),
/*07*/

('Chips Hardy',
		'Elizabeth Anne Hardy',
		'1954-02-13',
		'1950-01-23'),
/*08*/

('Edward Mower Norton Jr.',
		'Lydia Robinson norton',
		'1948-08-18',
		'1952-08-05'),
/*09*/

('Alan George Radcliffe',
		'Marcia Jeannine Gresham',
		'1948-08-18',
		'1952-08-05'),
/*10*/

('Jo Parsons',
		'Nigel Grint',
		'1967-03-23',
		'1963-11-15'),
/*11*/

('Chris Watson',
		'Jacqueline Luesby',
		'1947-06-12',
		'1952-08-05'),
/*12*/

('Tony Tarantino',
		'Connie Zastoupil',
		'1940-07-04',
		'1946-09-03'),
/*10*/

('Jacques Leonard Kubrick',
		'Gertrude Kubrick',
		'1902-05-21',
		'1903-10-28'),
/*11*/


('Brendan Nolan',
		'Christina Nolan',
		'1942-11-12',
		'1945-06-22'),
/*12*/

('Jack Fincher',
		'Claire Mae Fincher',
		'1930-12-06',
		'1938-05-23'),
/*13*/

('John Snider',
		'Marie julie Snider',
		'1940-12-03',
		'1945-01-28'),
/*14*/

('Martin Tsujihara',
		'Julie Tsuhihara',
		'1930-08-03',
		'1936-07-21'),
/*15*/

('Michael Yates',
		'Silvia Yates',
		'1932-05-12',
		'1934-08-17');
/*16*/


INSERT INTO EstadoCivil
	(descEstadoCivil)
Value
('Solteiro'),
/*01*/
('Casado'),
/*02*/
('Separado'),
/*03*/
('Divorciado'),
/*04*/
('Viuvo');
/*05*/

INSERT INTO TipoFisico
	(descTipoFisico)
Value
('avô, pai, galã com idades avançadas, idosos'),
/*01*/
('avó, mãe, avó vilã, mãe vilã'),
/*02*/
('Homem forte, esportista, galã'),
/*03*/
('Mulher, Jovem'),
/*04*/
('Homem, Jovem'),
/*05*/
('Mulher, esportista, forte');
/*06*/

INSERT INTO Personagem
	(nomePersonagem)
Value
('Tenente Aldo Raine'),
/*01*/
('Coronel Hans Landa'),
/*02*/
('Tenente Archie Hicox'),
/*03*/
('Sargento Donny "Urso Judeu" Donowitz'),
/*04*/
('Jack Torrance'),
/*05*/
('Wendy Torrance'),
/*06*/
('Dom Cobb'),
/*07*/
('Eames'),
/*08*/
('Narrador'),
/*09*/
('Harry James Potter'),
/*10*/
('Ronald Bílius Weasley'),
/*11*/
('Hermione Jean Granger'),
/*12*/
('Tyler Durden');
/*13*/



INSERT INTO Ator
	(idSexo,
	idPais,
	idFiliacao,
	idEscolaridade,
	idEstadoCivil,
	idTelefone,
	idEmail,
	idEndereco,
	idCidade,
	seguroSocialAtor,
	nomeAtor,
	DNAtor,
	CPFAtor,
	identidadeAtor)
Value
(1,
		8,
		1,
		5,
		4,
		null,
		1,
		1,
		2,
		'436-98-8973',
		'Brad Pitt',
		'1963-12-18',
		'398-412-843-32',
		'9.834.775'),
/*01*/

(1,
		37,
		2,
		6,
		2,
		null,
		3,
		null,
		1,
		'287-32-4287',
		'Christoph Waltz',
		'1956-10-04',
		'923-432-429-24',
		'8.452.429'),
/*02*/

(1,
		43,
		3,
		6,
		2,
		null,
		null,
		3,
		2,
		'532-48-3243',
		'Michael Fassbender',
		'1977-04-02',
		'219-458-237-23',
		'4.572.789'),
/*03*/

(1,
		8,
		4,
		6,
		3,
		1,
		null,
		null,
		3,
		'238-53-7943',
		'Eli Roth',
		'1972-04-18',
		'798-342-570-32',
		'2.340.987'),
/*04*/
/* Inglorius Basterds*/

(1,
		8,
		5,
		4,
		3,
		2,
		4,
		null,
		null,
		'733-13-9847',
		'Jack Nicholson',
		'1937-04-22',
		'398-741-238-74',
		'1.293.046'),
/*05*/


(2,
		8,
		6,
		4,
		3,
		3,
		null,
		null,
		5,
		'733-13-9847',
		'Shelley Duvall',
		'1949-07-07',
		'134-703-289-47',
		'2.374.146'),
/*06*/
/*The Shining*/

(1,
		8,
		7,
		4,
		1,
		null,
		5,
		null,
		null,
		'192-73-8463',
		'Leonardo DiCaprio',
		'1974-11-11',
		'274-192-380-74',
		'4.676.593'),
/*07*/

(1,
		38,
		8,
		2,
		1,
		null,
		null,
		5,
		null,
		'238-04-9725',
		'Tom Hardy',
		'1977-08-15',
		'328-049-744-35',
		'2.748.432'),
/*08*/
/* Inception */

(1,
		8,
		9,
		6,
		2,
		null,
		null,
		2,
		null,
		'573-24-9854',
		'Edward Norton',
		'1969-08-18',
		'280-560-874-34',
		'3.875.53'),
/*09*/
/* Fight Club */

(1,
		38,
		10,
		7,
		2,
		null,
		4,
		4,
		null,
		'573-24-1295',
		'Daniel Jacob Radcliffe',
		'1989-07-23',
		'281-270-894-38',
		'3.925.41'),
/*10*/

(1,
		38,
		11,
		7,
		1,
		4,
		null,
		null,
		null,
		'298-56-3594',
		'Rupert Alexander Lloyd Grint',
		'1988-08-24',
		'156-756-148-21',
		'7.149.501'),
/*11*/

(2,
		38,
		12,
		7,
		2,
		5,
		null,
		null,
		null,
		'342-53-1451',
		'Emma Charlotte Duerre Watson',
		'1990-04-15',
		'281-270-894-38',
		'4.684.19');
/*12*/
/* Harry Potter */

INSERT INTO Diretor
	(idSexo,
	idPais,
	idFiliacao,
	idEscolaridade,
	idEstadoCivil,
	idTelefone,
	idEmail,
	idEndereco,
	idCidade,
	nomeDiretor,
	DNDiretor,
	CPFDiretor,
	identidadeDiretor)
Value
(1,
		2,
		10,
		3,
		2,
		null,
		2,
		null,
		1,
		'Quentin Tarantino',
		'1963-03-27',
		'340-781-483-17',
		'8.834.97'),
/*1*/

(1,
		2,
		11,
		4,
		2,
		null,
		null,
		null,
		2,
		'Stanley Kubrick',
		'1928-07-26',
		'230-894-169-34',
		'7.804.34'),
/*2*/

(1,
		9,
		12,
		6,
		2,
		3,
		null,
		null,
		null,
		'Christopher Nolan',
		'1970-07-30',
		'301-948-739-56',
		'9.054.98'),
/*3*/

(1,
		2,
		13,
		4,
		2,
		null,
		null,
		null,
		4,
		'David Fincher',
		'1962-08-22',
		'323-089-741-35',
		'4.978.05'),
/*4*/

(1,
		9,
		16,
		6,
		2,
		null,
		null,
		null,
		5,
		'David Yates',
		'1963-10-08',
		'823-740-23',
		'3.328.497');
/*5*/

INSERT INTO FaturamentoAnoAnterior
	(valor)
Value
(234289743),
/*1*/
(102093281),
/*2*/
(343958304),
/*3*/
(379824033),
/*4*/
(283194724),
/*5*/
(458439795);
/*6*/

INSERT INTO DonoEstudio
	(idSexo,
	idPais,
	idFiliacao,
	idEscolaridade,
	idEstadoCivil,
	idTelefone,
	idEmail,
	idEndereco,
	idCidade,
	nomeDono,
	DNDono,
	CPFDono,
	identidadeDono)
Value
		(1,
		2,
		10,
		3,
		2,
		null,
		2,
		null,
		1,
		'Quentin Tarantino',
		'1963-03-207',
		'340-781-483-17',
		'8.834.97'),
/*1*/

		(1,
		2,
		11,
		4,
		2,
		null,
		null,
		null,
		2,
		'Stanley Kubrick',
		'1928-07-26',
		'230-894-169-34',
		'7.804.34'),
/*2*/

		(2,
		2,
		14,
		6,
		2,
		null,
		null,
		null,
		3,
		'Stacey Snider',
		'1961-04-29',
		'722-348-907-43',
		'9.784.632'),
/*3*/

		(1,
		2,
		15,
		6,
		2,
		null,
		null,
		null,
		4,
		'Kevin Tsujihara',
		'1964-10-25',
		'213-478-783-24',
		'9.784.163'),
/*4*/

		(1,
		2,
		17,
		6,
		2,
		null,
		null,
		null,
		5,
		'Thomas Tull',
		'1970-06-09',
		'031-894-732-18',
		'3.742.134');
/*5*/



INSERT INTO Estudio
	(nomeEstudio,
	dataFundacao)
Value
('A Band Apart',
		'1991-06-27'),
/*1*/

('Hawk Films',
		'1964-06-30'),
/*2*/

('20th Century Fox',
		'1935-05-31'),
/*3*/

('Warner Bros.',
		'1923-04-04'),
/*4*/

('Legendary Entertainment',
		'2000-07-12');
/*5*/

INSERT INTO Filme
	(idEstudio,
	nomeFilme,
	mesesProducaoFilme,
	anoLancamentoFilme,
	copyrightNumberFilme,
	custoFilme)
Value
		(1,
		'Inglourious Basterds',
		10,
		'2009-08-21',
		'VA 298-231',
		70000000),
/*1*/

		(2,
		'The Shining',
		12,
		'1980-05-02',
		'VA 139-847',
		19000000),
/*2*/

		(5,
		'Inception',
		11,
		'2010-07-16',
		'VA 238-743',
		160000000),
/*3*/

		(3,
		'Fight Club',
		10,
		'1999-10-15',
		'VA 328-974',
		63000000),
/*4*/

		(4,
		'Harry Potter and the Order of the Phoenix',
		10,
		'2007-07-11',
		'VA 298-167',
		150000000);
/*5*/

INSERT INTO Atuar
	(idCachee, idPersonagem, idAtor, idFilme)
VALUE
(1, 1, 1, 1),
(5, 2, 2, 1),
(4, 3, 3, 1),
(2, 4, 4, 1),
(4, 5, 5, 2),
(1, 6, 6, 2),
(3, 7, 7, 3),
(4, 8, 8, 3),
(5, 9, 9, 4),
(3, 10, 10, 5),
(4, 11, 11, 5),
(2, 12, 12, 4),
(5, 13, 1, 4);

INSERT INTO Dirigir
	(idDiretor, idFilme)
VALUE
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Perfil
	(idTipoFisico, idAtor)
VALUE
(3, 1),
(1, 2),
(5, 3),
(1, 4),
(5, 5),
(2, 6),
(1, 7),
(3, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12);

INSERT INTO Estudio_has_FaturamentoAnoAnterior
	(idEstudio, idFaturamentoAnoAnterior)
Value
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

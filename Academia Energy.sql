CREATE DATABASE dbacademia;
USE dbacademia;

-- 1. tbEndereco
CREATE TABLE tbEndereco (
    CEP DECIMAL(8,0) PRIMARY KEY,
    UF CHAR(2) NOT NULL,
    Cidade VARCHAR(200) NOT NULL
);

-- 2. tbTipoSanguineo
CREATE TABLE tbTipoSanguineo (
    IdSanguineo DECIMAL(8,0) PRIMARY KEY,
    TipoSanguineo CHAR(3) NOT NULL
);

-- 3. tbStatusReceb
CREATE TABLE tbStatusReceb (
    IdStatusReceb DECIMAL(3,0) PRIMARY KEY,
    Status VARCHAR(200) NOT NULL
);

-- 4. tbTipoRecebimento
CREATE TABLE tbTipoRecebimento (
    IdTReceb INT PRIMARY KEY,
    TipoReceb VARCHAR(100) NOT NULL
);

-- 5. tbStatusSessao
CREATE TABLE tbStatusSessao (
    IdStatusSessao DECIMAL(3,0) PRIMARY KEY,
    Status VARCHAR(20) NOT NULL
);

-- 6. tbCargo
CREATE TABLE tbCargo (
    IdCargo INT PRIMARY KEY,
    Cargo VARCHAR(100) NOT NULL,
    Salario DECIMAL(7,2) NOT NULL
);

-- 7. tbPlano
CREATE TABLE tbPlano (
    IdPlano INT PRIMARY KEY,
    ValorMensal DECIMAL(5,2) NOT NULL,
    NomePlano VARCHAR(100) NOT NULL,
    TipoPlano VARCHAR(200) NOT NULL,
    Validade DATE NOT NULL
);

-- 8. tbCliente
CREATE TABLE tbCliente (
    CPF DECIMAL(11,0) PRIMARY KEY,
    NomeCliente VARCHAR(200) NOT NULL,
    TelCelular DECIMAL(13,0) NOT NULL UNIQUE,
    DataNasc DATE NOT NULL,
    NumEndereco VARCHAR(10) NOT NULL,
    Logradouro VARCHAR(200) NOT NULL,
    MassaCorporal DECIMAL(6,3),
    Altura CHAR(3),
    IMC DECIMAL(4,2),
    SenhaAcesso DECIMAL(6,0),
    IdSanguineo DECIMAL(8,0) NOT NULL,
    CEP DECIMAL(8,0) NOT NULL,
    CONSTRAINT fk_cliente_tipo_sanguineo FOREIGN KEY (IdSanguineo) REFERENCES tbTipoSanguineo(IdSanguineo),
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (CEP) REFERENCES tbEndereco(CEP)
);

-- 9. tbFuncionario
CREATE TABLE tbFuncionario (
    IdFunc INT PRIMARY KEY,
    CPF DECIMAL(11,0) NOT NULL UNIQUE,
    TelCelular DECIMAL(13,0) NOT NULL UNIQUE,
    NomeFunc VARCHAR(150) NOT NULL,
    Logradouro VARCHAR(200) NOT NULL,
    NumEndereco VARCHAR(10) NOT NULL,
    DataAdmissao DATE NOT NULL,
    DataNasc DATE NOT NULL,
    CEP DECIMAL(8,0) NOT NULL,
    IdCargo INT NOT NULL,
    CONSTRAINT fk_funcionario_endereco FOREIGN KEY (CEP) REFERENCES tbEndereco(CEP),
    CONSTRAINT fk_funcionario_cargo FOREIGN KEY (IdCargo) REFERENCES tbCargo(IdCargo)
);

-- 10. tbRecebimentos
CREATE TABLE tbRecebimentos (
    IdReceb INT PRIMARY KEY,
    Valor DECIMAL(5,2) NOT NULL,
    IdPlano INT NOT NULL,
    IdTReceb INT NOT NULL,
    IdStatusReceb DECIMAL(3,0) NOT NULL,
    CPF DECIMAL(11,0) NOT NULL,
    CONSTRAINT fk_recebimentos_plano FOREIGN KEY (IdPlano) REFERENCES tbPlano(IdPlano),
    CONSTRAINT fk_recebimentos_tipo_recebimento FOREIGN KEY (IdTReceb) REFERENCES tbTipoRecebimento(IdTReceb),
    CONSTRAINT fk_recebimentos_status FOREIGN KEY (IdStatusReceb) REFERENCES tbStatusReceb(IdStatusReceb),
    CONSTRAINT fk_recebimentos_cliente FOREIGN KEY (CPF) REFERENCES tbCliente(CPF)
);

-- 11. tbControleAcesso
CREATE TABLE tbControleAcesso (
    IdAcesso INT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    CPF DECIMAL(11,0) NOT NULL,
    IdReceb INT NOT NULL,
    CONSTRAINT fk_controle_acesso_cliente FOREIGN KEY (CPF) REFERENCES tbCliente(CPF),
    CONSTRAINT fk_controle_acesso_recebimento FOREIGN KEY (IdReceb) REFERENCES tbRecebimentos(IdReceb)
);

-- 12. tbSessao
CREATE TABLE tbSessao (
    IdSessao INT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    Observacao VARCHAR(150),
    CPF DECIMAL(11,0) NOT NULL,
    IdStatusSessao DECIMAL(3,0) NOT NULL,
    IdFunc INT NOT NULL,
    CONSTRAINT fk_sessao_cliente FOREIGN KEY (CPF) REFERENCES tbCliente(CPF),
    CONSTRAINT fk_sessao_status FOREIGN KEY (IdStatusSessao) REFERENCES tbStatusSessao(IdStatusSessao),
    CONSTRAINT fk_sessao_funcionario FOREIGN KEY (IdFunc) REFERENCES tbFuncionario(IdFunc)
);
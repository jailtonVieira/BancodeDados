CREATE TABLE Postal (
    Cep numeric(4) primary key,
    Localidade varchar(50) not null,
);

CREATE TABLE Empregado (
    Matricula numeric(3) primary key,
    Nome varchar(20) not null,
    sobrenome varchar(20) not null,
    Sexo varchar(10) CHECK (Sexo IN "Masculino", "Femenino"),
    Salario numeric(7,2) not null,
    Telefone numeric(6) null,
    Cargo varchar(50) not null,
    Setor varchar(10) not null,
    Cep numeric(4),
    FOREIGN KEY (Cep) REFERENCES Postal(Cep)
);

CREATE TABLE Despesa (
    Codigo numeric(2) primary key,
    Descritivo varchar(20) not null
);

CREATE TABLE Comissao (
    Valor varchar(7,2) not null,
    Codigo numeric(2) not null,
    Matricula numeric(3) not null,
    FOREIGN KEY (Matricula) REFERENCES Empregado(Matricula),
    FOREIGN KEY (Codigo) REFERENCES Despesa(Codigo)
);

INSERT INTO Postal 
(Cep, Localidade)
VALUES
(1000 , "Lisboa"),
(1100 , "Lisboa"),
(1200 , "Lisboa"),
(1500 , "Lisboa"),
(2000 , "Santarem"),
(2300 , "Tomar"),
(3000 , "Coimbra"),
(4000 , "Porto"),
(9000 , "Funchal");

INSERT INTO Empregado 
(Matricula, Nome , sobrenome, Sexo , Salario, Telefone , Cargo , Setor , Cep)
VALUES 
(242, "Antonio Carlos" , "Dias" , "Masculino" , 43 , 7400.00 , 789654 , "Programador de Computador" , "TI" , 1500),
(205, "Celia" , "Morais" , "Feminino" , 26 , 17000.00 , 123456 , "Gerente de TI" , "Gerencia" , 1100),
(232, "Florinda" , "Simoes Santos" , "Feminino" , 35 , 14700.00 , NULL , "Gerente Financeiro" , "Gerencia" , 4000),
(237, "Isabel" , "dos santos Espada" , "Feminino" , 28 , 8600.00 , NULL , "Analista de Sistemas" , "TI" , 1100),
(249, "Jose Antonio" , "da Silva santos" , "Masculino" , 18 , 21000.00 , NULL , "Diretor de TI" , "Diretoria" , 1500),
(214 , "Nascimento Augusto", "Bezerra" , "Masculino" ,35 ,22000.00 ,  456123, "Diretor Financeiro", "Diretoria", 2300),
(225, "Paulo" , "Viegas", "Masculino" ,32, 9500.00 , NULL  , "Gerente Administrativo" , "Gerência" , 1500);

INSERT INTO Despesa 
(Codigo , Descritivo)
VALUES
(10 , "Comissão de Vendas"),
(20 ,"Fretes Individuais"),
(30 ,"Fretes Empresas"),
(40 ,"Vendas Extra"),
(50 ,"Deslocações"),
(60 ,"Refeições"),
(70 ,"Combustíveis"),
(80 ,"Transportes"),
(90 ,"Telefonemas");

INSERT INTO Comissão 
(Valor , Matricula , Codigo)
VALUES
(10500.00 , 214 ,10)
(3750.00 , 214 ,10)
(2600.00 , 214 ,60)
(400.00 , 214 ,70)
(2500.00 , 225 ,10)
(370.00 , 225 ,30)
(5500.00 , 237 ,10)
(14230.00, 237, 30)
(20.00  ,237 ,40)
(120.00 , 237 ,50)
(20.00 ,242 ,20)
(170.00 ,242 ,30)
(2300.00, 249,20)

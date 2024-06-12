-- CRIAÇÃO DO BANCO DE DADOS
drop database fungitech;
CREATE DATABASE fungitech;
USE fungitech;
-- DROP DATABASE fungitech;





-- CRIAÇÃO DAS TABELAS
CREATE TABLE Empresa(
cnpj char(14) primary key,
nomeFantasia varchar(100),
razaoSocial varchar(100),
cep char(9),
logradouro varchar(200)
);

CREATE TABLE Funcionario(
cpf char(11) primary key,
email varchar(320),
nomeFunc varchar(100),
senha varchar(50),
fkEmpresa char(14)
);

CREATE TABLE Estufa(
idEstufa int primary key auto_increment,
qtdToras int,
fkEmpresa char(14),
fKMetrica int
);


CREATE TABLE Sensor( 
idSensor int primary key auto_increment,
nomeSensor varchar(30),
fkEstufa int
);

CREATE TABLE Dados( 
idDado int auto_increment,	
fkSensor int,
primary key(idDado,fkSensor),
temperatura decimal(4 , 2),
umidade decimal(4 , 2),
dtHora datetime default current_timestamp
); 


CREATE TABLE Metrica(
idMetrica int primary key auto_increment,
tempMin decimal(4 , 2),
tempMax decimal(4 , 2),
umidMin decimal(4 , 2),
umidMax decimal(4 , 2)
);

CREATE TABLE Alerta(
idAlerta int auto_increment,
fkEstufa int,
primary key (idAlerta , fkEstufa),
descricao varchar(7),
dtAlerta datetime
);



select * from Funcionario;

-- INSERÇÃO DE VALORES NAS TABELAS
INSERT INTO Empresa VALUES
('14020670099123' , 'CoguMagic' , 'Cogumelos mágicos LTDA' , '00000-000' , 'Rua Pedro Motos'),
('52120774512567' , 'Hisoka Sushi' , 'Hisoka Peixes SA' , '00000-000', 'Rua Matheus Carros'),
('60203540571987' , 'Shiitake Industry' , 'Shiitake Industrial LTDA' , '00000-000' , 'Rua Luiza Aviões'),
('11807060034612' , 'DistribuidoraCogu' , 'Cogumelos Distribuidora' , '00000-000' , 'Rua Fernando Dias'),
('92105302450241' , 'Yamanaka Sushi' , 'Yamanaka SA' , '00000-000' , 'Rua Victor Navios');

INSERT INTO Funcionario VALUES
('50044758812' , 'marciobraz0101@gmail.com' , 'Marcio Braz' , 'Marquinhosmilgrau987' , '14020670099123'),
('42213426641' , 'laura.comandini@outlook.com' , 'Laura Comandini' , 'Meglinda123' , '52120774512567'),
('11122233344' , 'luiza@gmail.Com' , 'Luiza M.' , 'Luiza123' , '14020670099123'),
('14566828117' , 'fabiomaladarescorinthians@yahoo.com.br' , 'Fábio Maladares' , 'pIzzacommel.AmO' , '60203540571987'),
('11124742898' , 'carmadejesuscristo@outlook.com' , 'Carma de Jesus' , '#432432Abencoada' , '11807060034612'),
('10458256422' , 'matheusilva888@gmail.com' , 'Matheus Silva' , '@M#S456' , '92105302450241');

INSERT INTO Estufa VALUES
(default , 56 , '14020670099123' , 1),
(default , 28 , '52120774512567' , 1),
(default , 189 , '60203540571987' , 1);

select * from Estufa;

INSERT INTO Sensor VALUES
(default, 'Sensor 1' ,1),
(default, 'Sensor 2', 1),
(default, 'Sensor 3',  2,
(default, 'Sensor 4',  2),
(default, 'Sensor 5',  3),
(default, 'Sensor 6',  3);
select * from Sensor;

INSERT INTO Dados() VALUES
(default , 1 ,  null, null , default),
(default , 2 , null , null , default),
(default , 3 , null , null , default),
(default , 4 , null , null , default),
(default , 5 , null , null , default),
(default , 6 , null , null , default);
select * from Dados;

INSERT INTO Metrica VALUES
(default, 20 , 25 , 75 , 95);

INSERT INTO Alerta VALUES
(default , 1 , 'Frio' , default),
(default , 2 , 'Quente' , default),
(default , 3 , 'Estável' , default);
select * from Alerta;





-- CRIAÇÃO DAS CHAVES ESTRANGEIRAS
ALTER TABLE Funcionario
	ADD CONSTRAINT fkFuncionarioEmpresa foreign key (fkEmpresa)
		REFERENCES Empresa (cnpj);

ALTER TABLE Estufa
	ADD CONSTRAINT fkEstufaEmpresa foreign key (fkEmpresa)
		REFERENCES Empresa (cnpj);
        
ALTER TABLE Estufa
	ADD CONSTRAINT fkEstufaMetrica foreign key (fkMetrica)
		REFERENCES Metrica (idMetrica);
        
ALTER TABLE Sensor
	ADD CONSTRAINT fkSensorEstufa foreign key (fkEstufa)
		REFERENCES Estufa (idEstufa);
        
ALTER TABLE Dados
	ADD CONSTRAINT fkDadosSensor foreign key (fkSensor)
		REFERENCES Sensor (idSensor);
        
ALTER TABLE Alerta
	ADD CONSTRAINT fkAlertaEstufa foreign key (fkEstufa)
		REFERENCES Estufa (idEstufa);



-- CRIAÇÃO DE VIEWS
CREATE VIEW VerEmpresas as (SELECT cnpj as 'CNPJ',
logradouro as 'Logradouro',
cep as 'CEP',
nomeFantasia as 'Nome da empresa',
razaoSocial as 'Razão Social'
FROM Empresa);

CREATE VIEW VerFuncionarios as (SELECT cpf as 'CPF',
email as 'E-mail',
nomeFunc as 'Nome do Usuário',
senha as 'Senha'
FROM Funcionario
 );
 
 CREATE VIEW VerMetricas as (SELECT idMetrica as 'ID',
concat(tempMin, '°C') as 'Temperatura Mínima',
concat(tempMax, '°C') as 'Temperatura Máxima',
concat(UmidMin, '%') as 'Umidade Mínima',
concat(UmidMax, '%') as 'Umidade Máxima'
FROM Metrica);

CREATE VIEW Monitoramento as (SELECT nomeSensor as 'Sensor',
 (temperatura * fator) as 'Tempeatura',
 (umidade * fator) as 'Umidade',
 dtHora as 'Hora' 
 FROM Sensor, 
 Dados);

create view Estufa_Empresa 
as select Empresa.cnpj as 'CNPJ', 
Empresa.nomeFantasia as 'Nome Fantasia', 
Empresa.cep as 'CEP Empresa', 
Estufa.qtdToras as 'Quantidade de Toras por Empresa' from Empresa join Estufa on fkEmpresa = cnpj;

create view Empresa_Funcionario as select Funcionario.nomeFunc as 
'Nome Funcionario', Funcionario.email as 'Email do Funcionario',
Funcionario.cpf as 'CPF Funcionario', Empresa.nomeFantasia as 'Empresa do Funcionario', 
Empresa.cnpj as 'CNPJ da Empresa' from Funcionario join Empresa on fkEmpresa = cnpj;

select * from VerEmpresas;

select * from VerFuncionarios;

-- VISUALIZAÇÃO DE DADOS
-- DESCRIÇÃO DAS TABELAS PARA FACILITAR CRIAÇÃO DOS SCRIPT
DESC Empresa;
DESC Funcionario;
DESC Estufa;
DESC Sensor;
DESC Dados;
DESC Metrica;
DESC Alerta;

-- VISUALIZAÇÃO INDIVIDUAL DAS TABELAS
SELECT * FROM Empresa;
SELECT * FROM Funcionario;
SELECT * FROM Estufa;
SELECT * FROM Sensor;
SELECT * FROM Dados;
SELECT * FROM Metrica;
SELECT * FROM Alerta;

-- VISUALIZAÇÃO DAS VIEWS
SELECT * FROM VerEmpresas;
SELECT * FROM VerFuncionarios;
SELECT * FROM VerMetricas;
SELECT * FROM Monitoramento;

-- VISUALIZAÇÕES PERSONALIZADAS
-- VER FUNCIONARIOS E SUAS EMPRESAS
SELECT * FROM Funcionario 
	JOIN Empresa 
		ON fkEmpresa = cnpj;

-- VER DADOS DAS ESTUFAS (FORMATADOS)
SELECT idEstufa as 'ID da estufa',
qtdToras as 'Quantidade de toras de madeira'
FROM Estufa;

-- VER DADOS DAS ESTUFAS E DADOS DAS EMPRESAS DONAS
SELECT * FROM Estufa
	JOIN Empresa 
		ON fkEmpresa = cnpj;

-- VER DADOS DOS SENSORES E DADOS DE SUAS RESPECTIVAS ESTUFAS
SELECT * FROM Sensor
	JOIN Estufa 
		ON idEstufa = fkEstufa;

-- VER DADOS DOS SENSORES (FORMATADOS)
SELECT idDado as 'ID',
concat(temperatura, '°C') as 'Temperatura',
concat(umidade, '%') as 'Umidade',
dtHora as 'Horário'
FROM Dados;

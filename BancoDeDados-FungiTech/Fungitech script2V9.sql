-- CRIAÇÃO DO BANCO DE DADOS
drop database if exists fungitech;
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
	ADD CONSTRAINT fkDadosSensor FOREIGN KEY (fkSensor)
    REFERENCES Sensor(idSensor);
    
ALTER TABLE Alerta
	ADD CONSTRAINT fkAlertaEstufa foreign key (fkEstufa)
		REFERENCES Estufa (idEstufa);

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

INSERT INTO Metrica VALUES
(default, 20 , 25 , 75 , 95);

INSERT INTO Estufa VALUES
(default , 56 , '14020670099123' , 1),
(default , 28 , '52120774512567' , 1),
(default , 189 , '60203540571987' , 1);

INSERT INTO Sensor VALUES
(default, 'Sensor 1', 1),
(default, 'Sensor 2', 2),
(default, 'Sensor 3', 3);


select * from Sensor;

INSERT INTO Alerta VALUES
(default , 1 , 'Frio' , default),
(default , 2 , 'Quente' , default),
(default , 3 , 'Estável' , default);
select * from Alerta;

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
 (temperatura) as 'Tempeatura',
 (umidade) as 'Umidade',
 dtHora as 'Hora' 
 FROM Sensor, 
 Dados);

create view Estufa_Empresa 
as select Empresa.cnpj as 'CNPJ', 
Empresa.nomeFantasia as 'Nome Fantasia', 
Empresa.cep as 'CEP Empresa', 
Estufa.qtdToras as 'Quantidade de Toras por Empresa' from Empresa join Estufa on fkEmpresa = cnpj;

create view Empresa_Funcionario as 
select Funcionario.nomeFunc as 
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

select * from Estufa;
select * from Sensor;
select * from Dados;

INSERT INTO Sensor VALUES
(default, 'Sensor 4', 1);

INSERT INTO Funcionario VALUES
('44159198807' , 'fernando@gmail.com' , 'F' , '020312' , '14020670099123');

SELECT idEstufa as Estufa,  
truncate(avg(temperatura),2) as Temperatura,
truncate(avg(umidade),2) as Umidade
FROM Dados
JOIN Sensor ON fkSensor = idSensor 
join Estufa on fkEstufa = idEstufa 
JOIN Empresa on fkEmpresa = cnpj
 where cnpj = 14020670099123
 group by idEstufa;
 
 select * from Empresa;
 select * from Sensor;
 select * from Dados;
 
SELECT Dados.temperatura, Dados.umidade, Sensor.nomeSensor FROM Dados 
 Inner JOIN Sensor ON idSensor = fkSensor 
inner JOIN Estufa on idEstufa = fkEstufa inner join Empresa on cnpj = fkEmpresa where cnpj like '14020670099123';

  select Estufa.idEstufa as Estufa, count(Alerta.fkEstufa) as qtdAlerta
    from Alerta join Estufa on fkEstufa = idEstufa
    join Empresa on fkEmpresa = cnpj
    where Empresa.cnpj = 14020670099123
    group by Estufa.idEstufa
    order by qtdAlerta DESC;

SELECT idEstufa as Estufa , count(Alerta.fkEstufa) as qtdAlerta FROM  Empresa
       JOIN Estufa
			ON Estufa.fkEmpresa = cnpj
        LEFT JOIN Sensor
                ON fkEstufa = idEstufa
        LEFT JOIN Alerta
			ON Alerta.fkEstufa = idEstufa
		WHERE cnpj = 14020670099123
        GROUP BY idEstufa
        ORDER BY count(distinct(Alerta.fkEstufa)) DESC;
        
        select * from Dados;
        
	SELECT fkSensor as sensor, umidade, date_format(dtHora, '%H:%i:%s') as hora from Dados 
		WHERE fkSensor = 4 or fkSensor = 1;
        
	select * from Dados;
    
    select * from Sensor;
    use fungitech;
    
    select count(temperatura) as 'Alerta da temperatura', count(umidade) as 'Alerta Umidade' from Dados where temperatura > 25 OR umidade < 75 or umidade > 95 
    or temperatura < 20 AND fkSensor = 4;
    
    select count(temperatura) as 'Alerta da Temperatura' from Dados
    join Sensor on fkSensor = idSensor join Estufa on idEstufa = fkEstufa join Empresa on fkEmpresa = cnpj where temperatura > 25 or temperatura < 20 and cnpj = 14020670099123 ;
    
    select count(umidade) as 'Alerta da umidade' from Dados join Sensor on fkSensor = idSensor 
    join Estufa on idEstufa = fkEstufa join Empresa on fkEmpresa = cnpj where umidade > 95 or umidade < 75 and cnpj = 14020670099123;

   select * from Dados;
   select * from Sensor;
SELECT 
    truncate(avg(temperatura),2) as Temperatura,
    truncate(avg(umidade),2) as Umidade, 
    date_format(dtHora, '%H:%i:%s')
    FROM Dados
    JOIN Sensor ON fkSensor = idSensor 
    join Estufa on fkEstufa = idEstufa 
    JOIN Empresa on Estufa.fkEmpresa = cnpj
    JOIN Funcionario on Funcionario.fkEmpresa = cnpj
     where cpf = '44159198807'
     group by  Estufa and dtHora;
     
     SELECT 
    truncate(avg(temperatura),2) as Temperatura,
    truncate(avg(umidade),2) as Umidade, 
     date_format(dtHora, '%H:%i:%s') as hora,
    dtHora
    FROM Dados
    JOIN Sensor ON fkSensor = idSensor 
    join Estufa on fkEstufa = idEstufa 
    JOIN Empresa on Estufa.fkEmpresa = cnpj
    JOIN Funcionario on Funcionario.fkEmpresa = cnpj
     where cpf = '44159198807'
     group by  dtHora;
     truncate table Dados;
     select * from Dados;
     
     delete from Dados where idDado = 7;
     
     INSERT INTO Estufa VALUES
(default , 40 , '14020670099123' , 1),
(default , 47 , '14020670099123' , 1);

INSERT INTO Alerta VALUES
(default , 5 , 'Frio' , default);
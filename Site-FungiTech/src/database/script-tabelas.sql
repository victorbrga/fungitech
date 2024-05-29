create database fungitech;
use fungitech;
drop database fungitech;

create table empresa(
cnpj char(14) primary key,
nomeFantasia varchar(45),
razaoSocial varchar(45),
cep char(9),
logradouro varchar(45)
);

INSERT INTO empresa values
('14020670099123', 'CoguMagic', 'Cogumelos mágicos LTDA', '00000-000','Rua Pedro Motos'),
('52120774512567', 'Hisoka Sushi', 'Hisoka Peixes SA', '00000-000','Rua Matheus Carros'),
('60203540571987', 'Shiitake Industry', 'Shiitake Industrial LTDA', '00000-000','Rua Luiza Aviões'),
('11807060034612', 'DistribuidoraCogu', 'Cogumelos Distribuidora', '00000-000','Rua Fernando Dias'),
('92105302450241', 'Yamanaka Sushi', 'Yamanaka SA', '00000-000','Rua Victor Navios');

create view Empresa as (select cnpj as 'ID',
logradouro as 'Logradouro',
cep,
nomeFantasia as 'Nome da empresa',
razaoSocial as 'Razão Social'
from empresa)
;
select * from Empresa;

--

create table funcionario(
cpf char(11) primary key,
email varchar(45),
nomeUsuario varchar(45),
senha varchar(45),
fkCnpj char(14),
constraint fkEmpresaFuncionario foreign key (fkCnpj) references empresa(cnpj)
);

INSERT INTO funcionario(cpf, email, nomeUsuario, senha, fkCnpj) values
('50044758812', 'marciobraz0101@gmail.com', 'Marcio Braz', 'marquinhosmilgrau987', '14020670099123'),
('42213426641', 'laura.comandini@outlook.com', 'Laura Comandini', 'meglinda123', '52120774512567'),
('14566828117', 'fabiomaladarescorinthians@yahoo.com.br', 'Fábio Maladares', 'pizzacommel.AmO', '60203540571987'),
('11124742898', 'carmadejesuscristo@outlook.com', 'Carma de Jesus', '#432432Abencoada', '11807060034612'),
('10458256422', 'matheusilva888@gmail.com', 'Matheus Silva', '@m#S456', '92105302450241');

create view funcionario as (select cpf as 'CPF',
email as 'E-mail',
nomeUsuario as 'Nome do Usuário',
senha as 'Senha'
from funcionario
 );
select * from funcionario;
select * from funcionario join empresa on cnpj = fkCnpj;


create table metrica(
idMetrica int primary key auto_increment,
tempMin decimal(4, 2),
tempMax decimal(4, 2),
umidMin decimal(4, 2),
umidMax decimal(4, 2)
);

INSERT INTO metrica values
(null, 20, 25, 75, 95);

SELECT * FROM metrica;

create view MetricaFormatada as(select idMetrica as 'ID',
concat(tempMin, '°C') as 'Temperatura Mínima',
concat(tempMax, '°C') as 'Temperatura Máxima',
concat(umidMin, '%') as 'Umidade Mínima',
concat(umidMax, '%') as 'Umidade Máxima'
from metrica);


create table estufa(
idEstufa int primary key auto_increment,
qtdToras int,
fkCpf char(11),
fkMetrica int,
constraint fkFuncionarioEstufa foreign key (fkCpf) references funcionario(cpf),
constraint fkMetricasEstufa foreign key (fkMetrica) references metrica(idMetrica)
);

INSERT INTO estufa(idEstufa, qtdToras, fkCpf, fkMetrica) values
(null, 56, '50044758812', 1),
(null, 28, '42213426641', 1),
(null, 189, '14566828117', 1),
(null, 12, '11124742898', 1),
(null, 98, '10458256422', 1);

select idEstufa as 'ID da estufa',
qtdToras as 'Quantidade de toras de madeira'
from estufa;

SELECT * FROM estufa
JOIN usuario on fkcpf = cpf;




create table sensor( 
idSensor int primary key auto_increment,
nomeSensor varchar(9),
fator decimal(4,2),
fkEstufa int,
constraint fkEstufasSensor foreign key (fkEstufa) references estufa(idEstufa)
);

SELECT * FROM estufa;
INSERT INTO sensor values
(null, 'Sensor1', 1.0, 1),
(null, 'Sensor2', 1.4, 2),
(null, 'Sensor3', 0.5, 3);

SELECT idSensor as 'ID do sensor'
from sensor;

SELECT * FROM sensor
JOIN estufa ON idEstufa = fkEstufa;


create table dadosSensor( 
idDado int primary key auto_increment,
dht11_temperatura decimal(4, 2),
dht11_umidade decimal(4, 2),
dtHora datetime default current_timestamp
); 

INSERT INTO dadosSensor values
(null, 25.22, 75.87, default),
(null, 20.75, 65.11, default),
(null, 21.00, 95.10, default);

create view Monitoramento as(select s.nomeSensor as 'Nome do Sensor',
 (dht11_temperatura * s.fator) as 'Temperatura',
 (dht11_umidade * s.fator) as 'Umidade',
 d.dtHora as 'Hora' 
 from sensor as s, 
 dadosSensor as d);
 
 select * from Monitoramento;

select idDado as 'ID',
concat(dht11_temperatura, '°C') as 'Temperatura',
concat(dht11_umidade, '%') as 'Umidade',
dtHora as 'Horário'
from dadosSensor;

CREATE TABLE alerta(
idAlerta INT PRIMARY KEY auto_increment,
qtdAlerta INT,
dtAlerta datetime,
fkSensor int
);

INSERT INTO alerta VALUES
(null, 2, '2024-02-21 21:45:29',1),
(null, 10, '2024-03-01 19:20:59',2),
(null, 9, '2024-01-29 10:19:24',3),
(null, 12, '2024-04-06 09:10:02',1);

select * from alerta;

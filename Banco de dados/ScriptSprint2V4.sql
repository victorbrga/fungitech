create database sprint2;
use sprint2;
drop database sprint2;

create table Empresa(
idEmpresa int primary key auto_increment,
CNPJ char(11),
nomeEmpresa varchar(45),
CEP char(9)
);

INSERT INTO Empresa values
(null, 14020670099, 'CoguMagic', 00000-000),
(null, 52120774512, 'Hisoka Sushi', 00000-000),
(null, 60203540571, 'Shiitake Industry LTDA', 00000-000),
(null, 11807060034, 'DistribuidoraCogu', 00000-000),
(null, 92105302450, 'Yamanaka Sushi', 00000-000);

select idEmpresa as 'ID',
CNPJ, CEP,
nomeEmpresa as 'Nome da empresa'
from Empresa;

--


create table Usuario(
idUsuario int primary key auto_increment,
email varchar(45),
usuario varchar(45),
senha varchar(45),
cargo varchar(13),
cpf char(11),
fkEmpresa int,
constraint chkCargo check (cargo IN('Administrador', 'Funcionário')),
constraint fkEmpresaUsuario foreign key (fkEmpresa) references Empresa(idEmpresa)
);

INSERT INTO Usuario(idUsuario, email, usuario, senha, cargo, cpf,fkEmpresa) values
(null, 'marciobraz0101@gmail.com', 'Marcio Braz', 'marquinhosmilgrau987', 'Funcionário', 50044758812,1),
(null, 'laura.comandini@outlook.com', 'Laura Comandini', 'meglinda123', 'Funcionário', 42213426641,2),
(null, 'fabiomaladarescorinthians@yahoo.com.br', 'Fábio Maladares', 'pizzacommel.AmO', 'Administrador', 14566828117,3),
(null, 'carmadejesuscristo@outlook.com', 'Carma de Jesus', '#432432Abencoada', 'Funcionário', 11124742898,4),
(null, 'matheusilva888@gmail.com', 'Matheus Silva', '@m#S456', 'Administrador', 10458256422,5);

select idUsuario as 'ID do Usuário',
usuario as 'Nome do Usuário',
senha as 'Senha',
cargo as 'Cargo/Função',
cpf as 'CPF'
from Usuario;




select * from Usuario join Empresa on idEmpresa = fkEmpresa;


create table Metrica(
idMetrica int primary key auto_increment,
tempMin decimal(4,2),
tempMax decimal(4,2),
umidMin decimal(4,2),
umidMax decimal(4,2)
);

INSERT INTO Metrica values
(null, 20, 25, 75, 95);

SELECT * FROM Metrica;

select idMetrica as 'ID',
concat(tempMin, '°C') as 'Temperatura Mínima',
concat(tempMax, '°C') as 'Temperatura Máxima',
concat(umidMin, '%') as 'Umidade Mínima',
concat(umidMax, '%') as 'Umidade Máxima'
from Metrica;


create table Estufa(
idEstufa int primary key auto_increment,
qtdToras int,
fkUsuario int,
fkMetricas int,
constraint fkUsuarioEstufa foreign key(fkUsuario) references Usuario(idUsuario),
constraint fkMetricasEstufa foreign key (fkMetrica) references Metrica(idMetrica)
);

INSERT INTO Estufa(idEstufa, qtdTora,fkUsuario,fkMetrica) values
(null, 56,1,1),
(null, 28,2,1),
(null, 189,3,1),
(null, 12,4,1),
(null, 98,5,1);

select idEstufa as 'ID da estufa',
qtdTora as 'Quantidade de toras de madeira'
from Estufa;

SELECT * FROM Estufa
JOIN Usuario on fkUsuario = idUsuario;





create table Sensor( 
idSensor int primary key auto_increment,
fkEstufa int,
constraint fkEstufasSensor foreign key (fkEstufa) references Estufa(idEstufa)
);

INSERT INTO Sensor(idSensor,fkEstufa) values
(null,1),
(null,2),
(null,3),
(null,4),
(null,5);

SELECT idSensor as 'ID do sensor'
from Sensor;

SELECT * FROM Sensor
JOIN Estufa ON idEstufa = fkEstufa;


create table dadosSensor( 
idDado int primary key auto_increment,
temp decimal(4, 2),
umidade decimal(4, 2),
dtHora datetime default current_timestamp,
fkSensor int,
constraint	fkSensordadosSensor foreign key (fkSensor) references Sensor (idSensor)
);


INSERT INTO dadosSensor(idDado, temp, umidade, dtHora,fkSensor) values
(null,null, null, null,1),
(null,null, null, null,2),
(null,null, null, null,3),
(null, null,null, null,4),
(null, null, null, null,5);

select idDado as 'ID',
concat(temp, '°C') as 'Temperatura',
concat(umidade, '%') as 'Umidade',
dtHora as 'Horário'
from DadosSensor;

SELECT * FROM dadosSensor
JOIN Sensor on fkSensor = idSensor;




























select * from dadosSensor join Sensor on idSensor = fkSensor join Estufas on idEstufa = fkEstufas join Metricas on idMetrica = fkMetricas join Usuario on idUsuario = fkUsuario join Empresa on idEmpresa = fkEmpresa; 

select * from Usuario join Estufas on idEstufa = fkEstufas;






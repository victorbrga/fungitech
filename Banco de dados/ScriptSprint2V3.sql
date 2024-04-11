create database sprint2;
use sprint2;

create table Empresa(
idEmpresa int primary key auto_increment,
CNPJ char(11),
nomeEmpresa varchar(45),
CEP char(9)
);

INSERT INTO empresa values
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

INSERT INTO Usuario(idUsuario, email, usuario, senha, cargo, cpf) values
(null, 'marciobraz0101@gmail.com', 'Marcio Braz', 'marquinhosmilgrau987', 'Funcionário', 50044758812),
(null, 'laura.comandini@outlook.com', 'Laura Comandini', 'meglinda123', 'Funcionário', 42213426641),
(null, 'fabiomaladarescorinthians@yahoo.com.br', 'Fábio Maladares', 'pizzacommel.AmO', 'Administrador', 14566828117),
(null, 'carmadejesuscristo@outlook.com', 'Carma de Jesus', '#432432Abencoada', 'Funcionário', 11124742898),
(null, 'matheusilva888@gmail.com', 'Matheus Silva', '@m#S456', 'Administrador', 10458256422);

select idUsuario as 'ID do Usuário',
usuario as 'Nome do Usuário',
senha as 'Senha',
cargo as 'Cargo/Função',
cpf as 'CPF'
from Usuario;


create table Estufas(
idEstufa int primary key auto_increment,
qtdCogumelo int,
fkUsuario int,
constraint fkUsuarioEstufas foreign key(fkUsuario) references Usuario(idUsuario),
constraint fkMetricasEstufa foreign key (fkMetricas) references Metricas(idMetrica)
);

INSERT INTO Estufas(idEstufa, qtdCogumelo) values
(null, 56),
(null, 28),
(null, 189),
(null, 12),
(null, 98);

select idEstufa as 'ID da estufa',
qtdCogumelo as 'Quantidade de cogumelos'
from Estufas;

create table Sensor( 
idSensor int primary key auto_increment,
fkEstufas int,
fkMetricas int,
constraint fkEstufasSensor foreign key (fkEstufas) references Estufas(idEstufa)
);

INSERT INTO Sensor(idSensor) values
(null),
(null),
(null),
(null),
(null);

SELECT idSensor as 'ID do sensor'
from Sensor;


create table dadosSensor( 
idDado int primary key auto_increment,
temp decimal(4, 2),
umidade decimal(4, 2),
dtHora datetime,
fkSensor int,
constraint	fkSensordadosSensor foreign key (fkSensor) references Sensor (idSensor)
);

INSERT INTO dadosSensor(idDado, temp, umidade, dtHora) values
(null, 19.52, 50.15, '2024-01-03 07:25:19'),
(null, 27.80, 48.07, '2023-12-04 09:31:24'),
(null, 21.55, 42.56, '2024-01-06 13:49:36'),
(null, 27.33, 51.22, '2022-07-09 22:02:17'),
(null, 24.00, 45.77, '2024-02-19 10:22:19');

select idDado as 'ID',
concat(temp, '°C') as 'Temperatura',
concat(umidade, '%') as 'Umidade',
dtHora as 'Horário'
from DadosSensor;


create table Metricas(
idMetrica int primary key auto_increment,
tempMin decimal(4,2),
tempMax decimal(4,2),
umidMin decimal(4,2),
umidMax decimal(4,2)
);

INSERT INTO Metricas values
(null, 20.05, 27.85, 45.65, 56.98);

SELECT * FROM Metricas;

select idMetrica as 'ID',
concat(tempMin, '°C') as 'Temperatura Mínima',
concat(tempMax, '°C') as 'Temperatura Máxima',
concat(umidMin, '%') as 'Umidade Mínima',
concat(umidMax, '%') as 'Umidade Máxima'
from Metricas;



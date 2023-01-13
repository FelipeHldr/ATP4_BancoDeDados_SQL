drop database if exists Lanchonete;
create database Lanchonete;
use Lanchonete;
create table CEP(
	CEP int primary key,
    Logradouro varchar(45) not null,
    Numero varchar(5) not null,
    UF varchar(45) not null,
    Cidade varchar(45) not null,
    Bairro varchar(45) not null
);

create table Cliente(
	idCliente int primary key,
    PrimeiroNome varchar(45) not null,
    Sobrenome varchar(60) not null,
    Telefone varchar(25) not null,
    CEP int not null,
    foreign key(CEP) references CEP(CEP)
);

create table Sanduiche(
	idSanduiche int primary key,
    Nome varchar(20) not null,
    Preco varchar(6) not null
);

create table ClienteSanduiche(
	idCliente int not null,
    idSanduiche int not null,
    primary key(idCliente, idSanduiche),
    foreign key(idCliente) references Cliente(idCliente),
    foreign key(idSanduiche) references Sanduiche(idSanduiche)
);

create table Entregador(
	idEntregador int primary key,
    PrimeiroNome varchar(40) not null,
    Sobrenome varchar(60) not null,
    NumeroCelular varchar(25) not null
);

create table Pedido(
	idPedido int primary key,
    Quantidade tinyint not null,
    ValorTotal varchar(6) not null,
    DataEmissao varchar(10) not null,
    Status1EmPreparo varchar(20),
    Status2EmEntrega varchar(20),
    Status3Entregue varchar(20),
    idCliente int not null,
    idEntregador int not null,
    foreign key(idCliente) references Cliente(idCliente),
    foreign key(idEntregador) references Entregador(idEntregador)
);


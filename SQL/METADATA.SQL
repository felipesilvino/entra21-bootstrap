/* drop table usuario */;

create table usuario (
    id int(10) unsigned not null auto_increment,
    nome varchar(60) not null,
    login varchar(60)	not null,
    senha varchar(60) not null,
    primary key (id),
    unique key uk_nome (nome)
);

grant select, insert, update, delete on `bootstrap`.* to 'delphi'@'localhost' with grant option;

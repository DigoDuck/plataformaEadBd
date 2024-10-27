create table cursos(
    id int primary key auto_increment,
    nome varchar(255) not null,
    carga_horaria int not null
);

create table alunos(
    id int primary key auto_increment,
    id_curso int,
    nome varchar(255) not null,
    matricula int unique not null,
    data_matricula timestamp default current_timestamp,
    data_nascimento date not null,
    foreign key (id_curso) references cursos (id)
);

create table avaliacoes(
    id int primary key auto_increment,
    id_aluno int,
    id_curso int,
    disciplina varchar(255) not null,
    data_avaliacao date not null,
    foreign key (id_aluno) references alunos (id),
    foreign key (id_curso) references cursos (id)
);

create table notas(
    id int primary key auto_increment,
    id_avaliacao int,
    nota decimal (3,2),
    foreign key (id_avaliacao) references avaliacoes (id)
);

create table topicos (
    id int primary key auto_increment,
    id_aluno int,
    titulo varchar(30) not null,
    conteudo varchar(80) not null,
    data_criacao timestamp default current_timestamp,
    foreign key (id_aluno) references alunos (id)
);

create table comentarios (
    id int primary key auto_increment, 
    id_aluno int,
    id_topico int, 
    conteudo varchar(80) not null,
    data_criacao timestamp default current_timestamp,
    foreign key (id_aluno) references alunos (id),
    foreign key (id_topico) references topicos (id)
);

insert into cursos(nome, carga_horaria) values
('ADS', 200),
('Ciências da Computação', 200),
('Engenharia de Software', 200);

insert into alunos(id_curso, nome, data_nascimento, matricula) values
(1, 'Rodrigo', '1999-12-07', 72564269),
(2, 'Caio', '2004-06-13', 13165465),
(3, 'Pérola', '2011-07-07', 63515486),
(1, 'Victoria', '2013-11-01', 52158487),
(2, 'Matheus', '1989-05-25', 69517886);

INSERT INTO avaliacoes (id_aluno, id_curso, disciplina, data_avaliacao) VALUES
(1, 1, 'Matématica', '2024-10-20'),
(2, 2, 'Banco de Dados', '2024-10-19'),
(3, 3, 'Algoritmo', '2024-10-18');

INSERT INTO notas (id_avaliacao, nota) VALUES
(1, 9.0),
(2, 8.5), 
(3, 9.5);

INSERT INTO topicos (id_aluno, titulo, conteudo) VALUES
(1, "Dicas de banco de dados", "Comando básicos de SQL");

INSERT INTO comentarios (id_aluno, id_topico, conteudo) VALUES
(1, 1, "Comando básicos de SQL");

select * from alunos;
select * from cursos;
select * from avaliacoes;
select * from notas;
select * from topicos;
select * from comentarios;
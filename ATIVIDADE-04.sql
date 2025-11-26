-- ADBD-ATIVIDADE-04
-- Jean Henrique Resende Paiva: 4251925073

CREATE TABLE posicao (
    idPosicao INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

INSERT INTO posicao(idPosicao, nome)
VALUES 
    (1, 'Goleiro'),
    (2, 'Zagueiro'),
    (3, 'Meio-campo'),
    (4, 'Atacante');

CREATE TABLE time (
    idTime INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    estado TEXT
);

INSERT INTO time(idTime, nome, estado)
VALUES
    (1, 'Atlético', 'MG'),
    (2, 'Cruzeiro', 'MG'),
    (3, 'Flamengo', 'RJ');

CREATE TABLE jogador (
    idJogador INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    salario NUMERIC,
    dataNascimento TEXT,
    idPosicao INTEGER NOT NULL,
    idTime INTEGER,
    FOREIGN KEY(idPosicao) REFERENCES posicao(idPosicao),
    FOREIGN KEY(idTime) REFERENCES time(idTime)
);

INSERT INTO jogador(idJogador, nome, salario, dataNascimento, idPosicao, idTime)
VALUES
    (1, 'Everson',        150000, '1995-10-01', 1, 1),
    (2, 'Incrível Hulk',  850000, '1990-10-12', 4, 1),
    (3, 'Fábio',          100000, '1982-04-11', 1, 2),
    (4, 'Edu',            150000, '1983-09-10', 4, 2),
    (5, 'Diego Tardeli',  NULL,   '1991-05-03', 4, NULL);
    
    
-- Exercicio 1
select *
from posicao;

-- Exercicio 2
select nome,
       estado as "Estado do Time"
from time;

-- Exercicio 3
select nome,
       salario,
       dataNascimento
from jogador
order by dataNascimento desc;

-- Exercicio 4
select nome,
       salario,
       dataNascimento
from jogador
order by salario;

-- Exercicio 5
select *
from jogador
where idTime = 2;

-- Exercicio 6
select nome,
       salario
from jogador
where idTime = 1;

-- Exercicio 7
select distinct idPosicao
from jogador;


-- Exercicio 8
select nome,
       salario
from jogador
where salario <= 200000
order by salario desc;

-- Exercicio 9
select nome,
       salario
from jogador
where nome like 'I%';

-- Exercicio 10
select nome,
       dataNascimento
from jogador
where nome like 'F%o';

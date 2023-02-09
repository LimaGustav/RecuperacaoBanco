--DDL

CREATE DATABASE RPG
GO

USE RPG
GO

CREATE TABLE Usuarios(
	idUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Classes(
	idClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(250)
)
GO

CREATE TABLE Habilidades(
	idHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50)
)
GO

CREATE TABLE Personagens(
	idPersonagem INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) UNIQUE NOT NULL, 
	idUsuario INT FOREIGN KEY REFERENCES Usuarios(idUsuario),
	idClasse INT FOREIGN KEY REFERENCES Classes(idClasse),
)
GO

CREATE TABLE ClassesHabilidades(
	idClasseHabilidade INT PRIMARY KEY IDENTITY,
	idHabilidade INT FOREIGN KEY REFERENCES Habilidades(idHabilidade),
	idClasse INT FOREIGN KEY REFERENCES Classes(idClasse)
)
GO

--DML - MANIPULAÇÃO DE DADOS

INSERT INTO Classes VALUES
('Mago','Lança Feitiços'),
('Barbaro','Ataque forte'),
('Monge','Curandeiro')
GO

INSERT INTO Habilidades VALUES
('Lança mortal'),
('Recuperar vida'),
('Bola de fogo'),
('Escudo supremo'),
('Corrida rapida')
GO

INSERT INTO Usuarios VALUES
('aphonso@email.com','123123'),
('dano@email.com','321321')
GO

INSERT INTO ClassesHabilidades VALUES
-- MAGO - BOLA DE FOGO
(3,1), (4,1),
-- BARBARO
(1,2),(4,2),(5,2),
-- MONGE
(2,3),(4,3),(5,3)
GO

INSERT INTO Personagens VALUES
('DeuBug',1,2),
('BitBug',2,3)
GO


INSERT INTO Usuarios VALUES
('deletar@email.com','123123')

DELETE FROM Usuarios WHERE idUsuario = 3 

UPDATE Usuarios SET Email = 'aphonso@email.com.br' WHERE idUsuario = 1


--DQL CONSULTAS
select * from Usuarios
select * from Classes
select * from Personagens
select * from Habilidades

SELECT p.Nome, u.Email FROM Personagens P
INNER JOIN Usuarios U
ON P.idUsuario = U.idUsuario

SELECT p.Nome, c.Nome, H.Nome FROM Personagens P
INNER JOIN Classes C
ON P.idClasse = C.idClasse
INNER JOIN ClassesHabilidades CH
ON C.idClasse = CH.idClasse
INNER JOIN Habilidades H
ON CH.idHabilidade = H.idHabilidade
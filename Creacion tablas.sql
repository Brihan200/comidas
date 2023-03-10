CREATE DATABASE comidas;

USE comidas;

# TABLA DE VEGETABLES
CREATE TABLE IF NOT EXISTS c_vegetables(
	Id_vegetal INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(100),
    Categoria VARCHAR(50),
    Tipo VARCHAR(50),
    PRIMARY KEY(Id_vegetal)
);

SELECT *
FROM c_vegetables
;

INSERT INTO c_vegetables(Nombre, Categoria, Tipo)
VALUES ('Cebolla', 'Allium fistulosum', 'Larga')
;
INSERT INTO c_vegetables(Nombre, Categoria, Tipo)
VALUES ('Cebolla', 'Allium cepa', 'Cabezona Normal')
;
INSERT INTO c_vegetables(Nombre, Categoria, Tipo)
VALUES ('Tomate', 'Solanum lycopersicum', 'Maduro')
;
INSERT INTO c_vegetables(Nombre, Categoria, Tipo)
VALUES ('Papa', 'Solanum tuberosum', 'Pastusa')
;

# TABLA CARNES
CREATE TABLE IF NOT EXISTS c_carnes(
	Id_carne INT AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50),
    Animal VARCHAR(50),
    PRIMARY KEY(Id_carne)
);

SELECT *
FROM c_carnes
;

INSERT INTO c_carnes(Nombre, Tipo, Animal)
VALUES('Cadera', 'Suave', 'Res')
;


# TABLA FRUTAS
CREATE TABLE IF NOT EXISTS c_frutas(
	Id_fruta INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(100),
    Categoria VARCHAR(100),
    Tipo VARCHAR(100),
    PRIMARY KEY(Id_fruta)
);

SELECT *
FROM c_frutas;

INSERT INTO c_frutas(Nombre, Categoria, Tipo)
VALUES ('Manzana', 'Malus domestica', 'Roja')
;
INSERT INTO c_frutas(Nombre, Categoria, Tipo)
VALUES ('Banano', 'Musa', 'Cavendish')
;

DELETE 
FROM c_frutas
WHERE Id_fruta = 2
;

UPDATE c_frutas
SET Id_fruta = 2
WHERE Id_fruta = 3
;


# TABLA GENERAL
CREATE TABLE IF NOT EXISTS recetas(
	Id_receta INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(200) NOT NULL,
    Descripcion VARCHAR(1000) NOT NULL,
    Tiempo_Promedio_Min TIME NOT NULL,
    PRIMARY KEY(Id_receta)
);

DROP TABLE recetas;

ALTER TABLE recetas MODIFY Id_fruta INT;

SELECT *
FROM c_vegetables
;

SELECT *
FROM recetas
;

INSERT INTO recetas(Id_receta, Nombre, Descripcion, Tiempo_Promedio_Min)
VALUES(1, 'Sudado de carne', 'Sudado de cadera con tomate, cebolla y papa pastusa', '00:45:00')
;

INSERT INTO recetas(Id_receta, Nombre, Descripcion, Tiempo_Promedio_Min, Id_vegetable, Id_carne)
VALUES(1, 'Sudado de carne', 'Sudado de cadera con tomate, cebolla y papa pastusa', '00:45:00', 1, 1)
;


# TABLA GENERAL
CREATE TABLE IF NOT EXISTS c_ingredientes(
	Id_ingredientes INT AUTO_INCREMENT NOT NULL,
    Id_receta INT,
    Id_vegetal INT,
    Id_fruta INT,
    Id_carne INT,
    PRIMARY KEY(Id_ingredientes),
    FOREIGN KEY(Id_receta) REFERENCES recetas(Id_receta),
    FOREIGN KEY(Id_vegetal) REFERENCES c_vegetables(Id_vegetal),
    FOREIGN KEY(Id_fruta) REFERENCES c_frutas(Id_fruta),
    FOREIGN KEY(Id_carne) REFERENCES c_carnes(Id_carnes)
);

SELECT *
FROM c_ingredientes
;

INSERT INTO c_ingredientes(Id_receta, Id_vegetal, Id_carne)
VALUES (1, 1, 1)
;

INSERT INTO c_ingredientes(Id_receta, Id_vegetal)
VALUES (1, 3)
;

INSERT INTO c_ingredientes(Id_receta, Id_vegetal)
VALUES (1, 4)
;

SELECT I.Nombre, I.Tipo, I.Tipo_Comida , I.Receta
FROM C_ingredientes_VW I
LEFT JOIN c_vegetables AS V ON I.Id_ingrediente = V.Id_vegetal
LEFT JOIN c_carnes AS C ON I.Id_ingrediente = C.Id_carne
WHERE I.Receta = 'Sudado de carne'
;


CREATE VIEW C_ingredientes_VW AS (
SELECT V.Id_vegetal AS Id_ingrediente , V.Nombre, V.Tipo, 'V' as Tipo_Comida, R.Nombre as Receta
FROM c_vegetables V
LEFT JOIN c_ingredientes AS I ON V.Id_vegetal = I.Id_vegetal
LEFT JOIN recetas AS R ON I.Id_receta = R.Id_receta
UNION ALL
SELECT C.Id_carne, C.Nombre AS Id_ingrediente, C.Tipo, 'C' as Tipo_Comida, R.Nombre as Receta
FROM c_carnes C
LEFT JOIN c_ingredientes AS I ON C.Id_carne = I.Id_carne
LEFT JOIN recetas AS R ON I.Id_receta = R.Id_receta
UNION ALL
SELECT F.Id_fruta, F.Nombre AS Id_ingrediente , F.Tipo, 'F' as Tipo_Comida, R.Nombre as Receta
FROM c_frutas F
LEFT JOIN c_ingredientes AS I ON F.Id_fruta = I.Id_fruta
LEFT JOIN recetas AS R ON I.Id_receta = R.Id_receta
)
;

SELECT *
FROM c_ingredientes_VW
;

DROP VIEW C_ingredientes_VW;
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
    Id_vegetable INT NOT NULL,
    Id_carne INT NOT NULL,
    Id_fruta INT NOT NULL,
    PRIMARY KEY(Id_receta),
    FOREIGN KEY(Id_vegetable) REFERENCES c_vegetables(Id_vegetal),
    FOREIGN KEY(Id_carne) REFERENCES c_carnes(Id_carne),
    FOREIGN KEY(Id_fruta) REFERENCES c_frutas(Id_fruta)
);


SELECT *
FROM recetas
;
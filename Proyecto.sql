CREATE DATABASE Proyecto;

CREATE TABLE Articulo (
    IdArticulo INT AUTO_INCREMENT NOT NULL,
    Descripcion VARCHAR(15) NULL,
    Costo INT NULL,
    UnidadVenta INT NULL,
    UnidadCompra INT NULL,
    PRIMARY KEY(IdArticulo)
);
INSERT INTO Proyecto.Articulo
(IdArticulo, Descripcion, Costo, UnidadVenta, UnidadCompra)
VALUES(NULL,'Llave metalica','130','1','1'),
      (NULL,'Varilla','133','1','4'),
      (NULL,'Arena','50','2','4'),
      (NULL,'Lavadero','445','1','1'),
      (NULL,'Grava','45','2','1');

CREATE TABLE UnidadVenta (
    IdUnidadVenta INT AUTO_INCREMENT NOT NULL,
    Descripcion VARCHAR(15) NULL,
    PRIMARY KEY(IdUnidadVenta)
);
INSERT INTO Proyecto.UnidadVenta
(IdUnidadVenta, Descripcion)
VALUES(NULL,'Pza'),
      (NULL,'Kg'),
      (NULL,'Lt'),
      (NULL,'Ton');

CREATE TABLE Venta (
    IdVenta INT AUTO_INCREMENT NOT NULL,
    FechaVenta VARCHAR(15) NULL,
    UsuarioVenta INT NULL,
    IdArticulo INT NOT NULL,
    Cantidad INT,
    PRIMARY KEY(IdVenta)
);
INSERT INTO Proyecto.Venta
(IdVenta, FechaVenta, UsuarioVenta, IdArticulo, Cantidad)
VALUES(NULL,'01/09/2024','3','1','4'),
      (NULL,'01/09/2024','4','1','6'),
      (NULL,'01/09/2024','4','5','67'),
      (NULL,'03/09/2024','3','4','6'),
      (NULL,'03/09/2024','3','3','9'),
      (NULL,'04/09/2024','4','5','3'),
      (NULL,'05/09/2024','7','1','5'),
      (NULL,'06/09/2024','6','4','6'),
      (NULL,'08/09/2024','5','3','7'),
      (NULL,'08/09/2024','5','4','3'); 

CREATE TABLE Usuario (
    IdUsuario INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(15) NULL,
    Apellido VARCHAR(15) NULL,
    Telefono INT NULL,
    PRIMARY KEY(IdUsuario)
);
INSERT INTO Proyecto.Usuario
(IdUsuario, Nombre, Apellido, Telefono)
VALUES(NULL,'Antonio','Sanchez','5566778800'),
      (NULL,'Cassandra','Ramírez','5566884499'),
      (NULL,'Ramiro','Jimenez','5574843487'),
      (NULL,'José','Perez','5573894246'),
      (NULL,'Renato','Bernabe','5568434788'),
      (NULL,'Iván','Bernardino','5522399863'),
      (NULL,'Mario','Manriquez','5576732356');

ALTER TABLE Proyecto.Venta ADD FOREIGN KEY (IdArticulo) REFERENCES Articulo (IdArticulo);

ALTER TABLE Proyecto.Venta ADD FOREIGN KEY (UsuarioVenta) REFERENCES Usuario (IdUsuario);

ALTER TABLE Proyecto.Articulo ADD FOREIGN KEY (UnidadVenta) REFERENCES UnidadVenta (IdUnidadVenta);

SELECT SUM((Articulo.Costo)*Cantidad) FROM Venta 
        INNER JOIN Articulo ON Articulo.IdArticulo = Venta.IdArticulo;

SELECT Usuario.Nombre, Usuario.Apellido, SUM((Articulo.Costo)*Cantidad)
    FROM Venta
        INNER JOIN Articulo ON Articulo.IdArticulo = Venta.IdArticulo
        INNER JOIN Usuario ON Usuario.IdUsuario = Venta.UsuarioVenta
        GROUP BY Usuario.Nombre;
        
SELECT Articulo.Descripcion, SUM(Cantidad) FROM Venta
        INNER JOIN Articulo ON Articulo.IdArticulo = Venta.IdArticulo
        GROUP BY Articulo.Descripcion;
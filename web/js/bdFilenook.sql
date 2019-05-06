DROP TABLE ClasificacionCategorias;
DROP TABLE ValoracionComentario;
DROP TABLE Comentario;
DROP TABLE ValoracionesNook;
DROP TABLE ValoracionAutor;
DROP TABLE Documento;
DROP TABLE Nook;
DROP TABLE Mensaje;
DROP TABLE Usuario;

CREATE TABLE Usuario(
	nombre	CHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	nombreUsuario VARCHAR(10),
	clave VARCHAR(15) NOT NULL,
	correo VARCHAR(80) NOT NULL,
	PRIMARY KEY (nombreUsuario)
);


CREATE TABLE Mensaje(
	idMensaje INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 0, INCREMENT BY 1),
	texto VARCHAR(180) NOT NULL,
	fecha DATE,
	leido INTEGER CHECK (leido IN (0,1)),
	tipo VARCHAR(10) CHECK (tipo IN ('Enviado', 'Recibido')),
	autor VARCHAR(10) NOT NULL,
	destinatario VARCHAR(10) NOT NULL,
	PRIMARY KEY (idMensaje),
	CONSTRAINT FK_MENSAJE FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario),
	CONSTRAINT FK_MENSAJE2 FOREIGN KEY (destinatario)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE Nook(
	idNook INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 0, INCREMENT BY 1),
	nombre VARCHAR(50),
	resumen VARCHAR(180),
	autor VARCHAR(10),
	fechaCreacion DATE,
	fechaModificacion DATE,
	descargas INTEGER,
	PRIMARY KEY (idNook),
	CONSTRAINT FK_NOOK FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE Documento(
	nook INTEGER,
	nombre VARCHAR(50),
	resumen VARCHAR(180),
	fechaCreacion DATE,
	fechaModificacion DATE,
	PRIMARY KEY (nook, nombre),
	CONSTRAINT FK_DOCUMENTO FOREIGN KEY (nook)
		REFERENCES Nook (idNook)
);


CREATE TABLE ValoracionAutor(
	autor VARCHAR(10),
	puntuacion DOUBLE,
	PRIMARY KEY (autor, puntuacion),
	CONSTRAINT FK_VALAUTOR FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE ValoracionesNook(
	nook INTEGER,
	usuario VARCHAR(10),
	puntuacion INTEGER,
	fecha DATE,
	PRIMARY KEY (nook, usuario),
	CONSTRAINT FK_VALNOOK FOREIGN KEY (nook)
		REFERENCES Nook (idNook),
	CONSTRAINT FK_VALNOOK2 FOREIGN KEY (usuario)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE Comentario(
	idComentario INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 0, INCREMENT BY 1),
	fecha DATE,
	autor VARCHAR(10),
	texto VARCHAR(180),
	PRIMARY KEY (idComentario),
	CONSTRAINT FK_COMENTARIO FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE ValoracionComentario(
	comentario INTEGER,
	puntuacion INTEGER,
	fecha DATE,
	usuario VARCHAR(10),
	PRIMARY KEY (comentario, usuario),
	CONSTRAINT FK_VALCOMENTARIO FOREIGN KEY (comentario)
		REFERENCES Comentario (idComentario),
	CONSTRAINT FK_VALCOMENTARIO2 FOREIGN KEY (usuario)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE ClasificacionCategorias(
	idNook INTEGER,
	categoria VARCHAR(30),
	PRIMARY KEY (idNook, categoria),
	CONSTRAINT FK_CLASCATEGORIAS FOREIGN KEY (idNook)
		REFERENCES Nook (idNook)
);


INSERT INTO Usuario VALUES ('Helio','Fernandez Abad','admin','adminfilenook','admin@alumnos.uva.es');

INSERT INTO Usuario VALUES ('Andrés','Cabero Mata','andcabe','1122','andres.cabero@alumnos.uva.es');
INSERT INTO Usuario VALUES ('Rafael','Higelmo San Millán','rafhige','3344','andres.cabero@alumnos.uva.es');
INSERT INTO Usuario VALUES ('Patricia','Aguado Labrador','patagua','5566','andres.cabero@alumnos.uva.es');
INSERT INTO Usuario VALUES ('Santiago','Blasco Arnaiz','sanblas','7788','andres.cabero@alumnos.uva.es');

INSERT INTO Mensaje (texto,fecha,leido,tipo,autor,destinatario) VALUES ('Me gustaria que me explicase la función de la lía 127 de su código, gracias.','2019-04-09',1,'Enviado','patagua','rafhige');
INSERT INTO Mensaje (texto,fecha,leido,tipo,autor,destinatario) VALUES ('Me gustaria que me explicase la función de la lía 127 de su código, gracias.','2019-04-09',0,'Recibido','rafhige','patagua');

INSERT INTO Nook (nombre,resumen,autor,fechaCreacion,fechaModificacion,descargas) VALUES ('MIPS','Prácticas en lenguaje ensamblador de primero de carrera de Ingeniería Informática','rafhige','2016-06-20','2016-06-21',0);
INSERT INTO Nook (nombre,resumen,autor,fechaCreacion,fechaModificacion,descargas) VALUES ('Códigos Reed-Solomon','Ejercicios de la asignatura de Criptografía','patagua','2018-12-20','2018-12-20',0);

INSERT INTO Documento VALUES (0,'Sumador.s','Programa MIPS para suamr número en hexadecimal y que muestre el resultado en binario complemento a dos.','2016-06-20','2016-06-20');
INSERT INTO Documento VALUES (0,'Shunting.s','Algoritmo shunting yard implementado en MIPS mediante el uso de notación polaca inversa que devuelve resultados en decimal o hexadecimal como su entrada.','2016-06-20','2016-06-20');
INSERT INTO Documento VALUES (0,'Conversor.s','Algoritmo shunting yard implementado en MIPS mediante el uso de notación polaca inversa que devuelve resultados en decimal o hexadecimal como.','2016-06-21','2016-06-21');
INSERT INTO Documento VALUES (1,'Ejercicios Resueltos.pdf','Ejercicios de codificación y decodificación de códigos Reed-Solomon.','2018-12-20','2018-12-20');

INSERT INTO ValoracionAutor VALUES ('rafhige',9.3333);

INSERT INTO ValoracionesNook VALUES (0,'patagua',5,'2016-11-12');
INSERT INTO ValoracionesNook VALUES (0,'sanblas',3,'2017-08-06');
INSERT INTO ValoracionesNook VALUES (0,'andcabe',4,'2018-05-15');

INSERT INTO Comentario (fecha,autor,texto) VALUES ('2017-08-06','sanblas','Buen nook!!');
INSERT INTO Comentario (fecha,autor,texto) VALUES ('2016-11-13','andcabe','Tengo una duda con el archivo Sumador.s te mando un correo.');

INSERT INTO ValoracionComentario VALUES (0,4,'2017-09-16','rafhige');

INSERT INTO ClasificacionCategorias VALUES (0,'MIPS');
INSERT INTO ClasificacionCategorias VALUES (0,'IngenieríaInformática');
INSERT INTO ClasificacionCategorias VALUES (1,'IngenieríaInformática');
INSERT INTO ClasificacionCategorias VALUES (0,'PrimerCurso');
INSERT INTO ClasificacionCategorias VALUES (1,'Códigos');
INSERT INTO ClasificacionCategorias VALUES (1,'Criptografía');
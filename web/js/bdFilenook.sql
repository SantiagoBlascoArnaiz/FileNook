DROP TABLE ClasificacionCategorias;
DROP TABLE ValoracionesComentario;
DROP TABLE Comentario;
DROP TABLE ValoracionesNook;
DROP TABLE ValoracionesAutor;
DROP TABLE Documento;
DROP TABLE Nook;
DROP TABLE Mensaje;
DROP TABLE Usuario;



CREATE TABLE Usuario(
	nombre	VARCHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	nombreUsuario VARCHAR(10) NOT NULL,
	clave VARCHAR(15) NOT NULL,
	correo VARCHAR(80) NOT NULL,
        valoracionMedia DOUBLE,
        imagenPerfil VARCHAR(50),
	PRIMARY KEY (nombreUsuario)
);


CREATE TABLE Mensaje(
	idMensaje INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 0, INCREMENT BY 1),
        asunto VARCHAR(100) NOT NULL,
	texto VARCHAR(180),
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
	nombre VARCHAR(50) NOT NULL,
	resumen VARCHAR(180),
	autor VARCHAR(10) NOT NULL,
	fechaCreacion DATE,
	fechaModificacion DATE,
	descargas INTEGER,
        valoracionMedia DOUBLE,
	PRIMARY KEY (idNook),
	CONSTRAINT FK_NOOK FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE Documento(
	nook INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	resumen VARCHAR(180),
	fechaCreacion DATE,
	fechaModificacion DATE,
	PRIMARY KEY (nook, nombre),
	CONSTRAINT FK_DOCUMENTO FOREIGN KEY (nook)
		REFERENCES Nook (idNook)
);


CREATE TABLE ValoracionesAutor(
	autor VARCHAR(10) NOT NULL,
        usuario VARCHAR(10) NOT NULL,
	puntuacion DOUBLE NOT NULL,
	PRIMARY KEY (autor, usuario),
	CONSTRAINT FK_VALAUTOR FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario),
        CONSTRAINT FK_VALAUTOR2 FOREIGN KEY (usuario)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE ValoracionesNook(
	nook INTEGER NOT NULL,
	usuario VARCHAR(10) NOT NULL,
	puntuacion INTEGER NOT NULL,
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
	autor VARCHAR(10) NOT NULL,
	texto VARCHAR(180) NOT NULL,
        valoracionMedia DOUBLE,
	PRIMARY KEY (idComentario),
	CONSTRAINT FK_COMENTARIO FOREIGN KEY (autor)
		REFERENCES Usuario (nombreUsuario)
);


CREATE TABLE ValoracionesComentario(
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
	idNook INTEGER NOT NULL,
	categoria VARCHAR(30) NOT NULL,
	PRIMARY KEY (idNook, categoria),
	CONSTRAINT FK_CLASCATEGORIAS FOREIGN KEY (idNook)
		REFERENCES Nook (idNook)
);


INSERT INTO Usuario VALUES ('Helio','Fernandez Abad','admin','adminfilenook','admin@alumnos.uva.es',0.0,'Helio');

INSERT INTO Usuario VALUES ('Andrés','Cabero Mata','andcabe','1122','andres.cabero@alumnos.uva.es',0.0,'Andres');
INSERT INTO Usuario VALUES ('Rafael','Higelmo San Millán','rafhige','3344','rafael.higelmo@alumnos.uva.es',3.0,'Rafa');
INSERT INTO Usuario VALUES ('Patricia','Aguado Labrador','patagua','5566','patricia.aguado@alumnos.uva.es',0.0,'Patri');
INSERT INTO Usuario VALUES ('Santiago','Blasco Arnaiz','sanblas','7788','santiago.blasco@alumnos.uva.es',0.0,'Santi');

INSERT INTO Mensaje (asunto,texto,fecha,leido,tipo,autor,destinatario) VALUES ('duda','Me gustaria que me explicase la función de la lía 127 de su código, gracias.','2019-04-09',1,'Enviado','patagua','rafhige');
INSERT INTO Mensaje (asunto,texto,fecha,leido,tipo,autor,destinatario) VALUES ('duda','Me gustaria que me explicase la función de la lía 127 de su código, gracias.','2019-04-09',0,'Recibido','rafhige','patagua');

INSERT INTO Nook (nombre,resumen,autor,fechaCreacion,fechaModificacion,descargas,valoracionMedia) VALUES ('MIPS','Prácticas en lenguaje ensamblador de primero de carrera de Ingeniería Informática','rafhige','2016-06-20','2016-06-21',0,4.0);
INSERT INTO Nook (nombre,resumen,autor,fechaCreacion,fechaModificacion,descargas,valoracionMedia) VALUES ('Códigos Reed-Solomon','Ejercicios de la asignatura de Criptografía','patagua','2018-12-20','2018-12-20',0,0.0);

INSERT INTO Documento VALUES (0,'Sumador.s','Programa MIPS para suamr número en hexadecimal y que muestre el resultado en binario complemento a dos.','2016-06-20','2016-06-20');
INSERT INTO Documento VALUES (0,'Shunting.s','Algoritmo shunting yard implementado en MIPS mediante el uso de notación polaca inversa que devuelve resultados en decimal o hexadecimal como su entrada.','2016-06-20','2016-06-20');
INSERT INTO Documento VALUES (0,'Conversor.s','Algoritmo que pasa de hexadecimal a binario.','2016-06-21','2016-06-21');
INSERT INTO Documento VALUES (1,'Ejercicios Resueltos.pdf','Ejercicios de codificación y decodificación de códigos Reed-Solomon.','2018-12-20','2018-12-20');

INSERT INTO ValoracionesAutor VALUES ('rafhige','patagua',2);
INSERT INTO ValoracionesAutor VALUES ('rafhige','sanblas',4);


INSERT INTO ValoracionesNook VALUES (0,'patagua',5,'2016-11-12');
INSERT INTO ValoracionesNook VALUES (0,'sanblas',3,'2017-08-06');
INSERT INTO ValoracionesNook VALUES (0,'andcabe',4,'2018-05-15');

INSERT INTO Comentario (fecha,autor,texto,valoracionMedia) VALUES ('2017-08-06','sanblas','Buen nook!!',4.0);
INSERT INTO Comentario (fecha,autor,texto,valoracionMedia) VALUES ('2016-11-13','andcabe','Tengo una duda con el archivo Sumador.s te mando un correo.',0.0);

INSERT INTO ValoracionesComentario VALUES (0,4,'2017-09-16','rafhige');

INSERT INTO ClasificacionCategorias VALUES (0,'MIPS');
INSERT INTO ClasificacionCategorias VALUES (0,'IngenieríaInformática');
INSERT INTO ClasificacionCategorias VALUES (1,'IngenieríaInformática');
INSERT INTO ClasificacionCategorias VALUES (0,'PrimerCurso');
INSERT INTO ClasificacionCategorias VALUES (1,'Códigos');
INSERT INTO ClasificacionCategorias VALUES (1,'Criptografía');

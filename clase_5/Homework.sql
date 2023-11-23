CREATE DATABASE	henry_homework;
USE henry_homework;

CREATE TABLE Carrera (
	IdCarrera INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY (IdCarrera)
);

CREATE TABLE Instructor (
IdInstructor INT NOT NULL AUTO_INCREMENT,
CedulaDeIdentidad INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(20) NOT NULL,
FechaDeNacimiento DATE NOT NULL,
FechaDeIncorporacion DATE,
PRIMARY KEY (IdInstructor)
);

CREATE TABLE Cohorte (
	IdCohorte INT NOT NULL AUTO_INCREMENT,
    Codigo INT NOT NULL,
    IdCarrera INT NOT NULL,
	IdInstructor INT NOT NULL,
    FechaDeInicio DATE,
    FechaDeFinalizacion DATE,
    PRIMARY KEY (IdCohorte),
    FOREIGN KEY (IdCarrera) REFERENCES Carrera(IdCarrera),
	FOREIGN KEY (IdInstructor) REFERENCES Instructor(IdInstructor)
);


CREATE TABLE Alumno (
IdAlumno INT NOT NULL AUTO_INCREMENT,
CedulaDeIdentidad INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(20) NOT NULL,
FechaDeNacimiento DATE NOT NULL,
FechaDeIngreso DATE NOT NULL,
IdCohorte INT NOT NULL,
PRIMARY KEY (IdAlumno),
FOREIGN KEY (IdCohorte) REFERENCES Cohorte(IdCohorte)
);
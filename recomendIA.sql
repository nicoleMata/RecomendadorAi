CREATE DATABASE RecomendAI;

USE RECOMENDAI;

CREATE TABLE PERSONA(
codPer int auto_increment primary key,
nombre varchar(30));

CREATE TABLE PERFIL(
codPer int,
email varchar(30),
contraseña varchar(30),
feche_nac date,
residencia varchar(30),
primary key (codPer,email,contraseña),
foreign key(codPer) references Persona(codPer));

CREATE TABLE PARTICIPE(
codPer int,
foreign key(codPer) references Persona(codPer));

CREATE TABLE ROL(
id int auto_increment primary key,
descripcion varchar(30));

CREATE TABLE ORIGEN(
cod_origen int auto_increment primary key,
detalle varchar(30));

CREATE TABLE IDIOMA(
id_idioma int auto_increment primary key,
descripcion varchar(30));

CREATE TABLE OPINION(
cod int auto_increment primary key,
puntuacion int,
comentario varchar(50));

CREATE TABLE FORMATO(
id int auto_increment primary key,
descripcion varchar(30));

CREATE TABLE CONTENIDO(
cod int auto_increment primary key,
titulo varchar(30),
año_publicacion year,
duracion time,
cod_origen int,
foreign key(cod_origen) references origen(cod_origen));
select*
from perfil;

CREATE TABLE CONVERSACION(
fecha date,
hora time,
primary key(fecha, hora),
email_perfil varchar(30),
contraseña_perfil varchar(30),
FOREIGN KEY (email_perfil, contraseña_perfil) REFERENCES Perfil(email, contraseña));

CREATE TABLE GENERO(
ID_GEN int auto_increment primary key,
descripcion varchar(30),
fecha_con date,
hora_con time,
FOREIGN KEY (fecha_con, hora_con) REFERENCES conversacion(fecha, hora));

CREATE TABLE TEMATICA (
cod int auto_increment primary key,
descripcion varchar(30),
fecha_con date,
hora_con time,
FOREIGN KEY (fecha_con, hora_con) REFERENCES conversacion(fecha, hora));

CREATE TABLE EMOCION(
id int auto_increment primary key,
descripcion varchar(30));

CREATE TABLE CARACTERISTICA(
id int auto_increment primary key,
detalle varchar(30),
puntaje int,
fecha_con date,
hora_con time,
FOREIGN KEY (fecha_con, hora_con) REFERENCES conversacion(fecha, hora));

alter table participe  add primary key (codper);

CREATE TABLE INTEGRA(
cod_cont int,
id_rol int,
cod_Par int,
primary key(cod_cont, cod_par),
foreign key (cod_cont) references contenido(cod),
foreign key(id_rol)references rol(id),
foreign key(cod_par)references participe(codper));





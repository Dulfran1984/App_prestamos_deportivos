create database dbs_prestamos_deportivos
go
use dbs_prestamos_deportivos
go
create table tbl_personas
(
	PKId varchar(10) primary key,
	P_nombre varchar(40) not null,
	S_nombre varchar(40),
	P_apellido varchar(40) not null,
	S_apellido varchar(40),
	Contacto varchar(10) not null,
	Correo varchar(80) not null,
	Direccion varchar(100) not null,
	FKId_tbl_sexo char
)
create table tbl_sexo
(
	PKId char primary key,
	Nombre varchar(50) not null,
	Nomenclatura varchar(5) not null
)
create table tbl_usuarios
(
	PKUsuario varchar(100) primary key,
	Contraseña varchar(10) not null,
	FKId_tbl_personas varchar(10) not null,
	Fecha date,
	FKCodigo_tbl_estado char,
	FKCodigo_tbl_rol char
)
create table tbl_estado
(
	PKCodigo char primary key,
	Nombre varchar(50) not null,
	Nomenclatura varchar(5) not null
)
create table tbl_rol
(
	PKCodigo char primary key,
	Nombre varchar(50) not null,
	Nomenclatura varchar(5) not null
)
create table tbl_implementos
(
	PKCodigo varchar(10) primary key,
	Nombre varchar(80) not null,
	Especificaciones varchar(5000) not null,
	Cantidad int not null,
	Valor float not null,
	Fecha date
)
create table tbl_prestamos
(
	PKNumero bigint primary key identity(1,1),
	FKId_tbl_personas varchar(10) not null,
	FKUsuario_tbl_usuarios varchar(100) not null,
	Fecha_registro date,
	Hora_registro time,
)
create table tbl_det_prestamos
(
	PKItem bigint identity(1,1) primary key,
	FKNumero_tbl_prestamos bigint not null,
	FKCodigo_tbl_implementos varchar(10) not null,
	Cantidad int not null,
	Fecha_devolucion date,
	Hora_devolucion time,
	Observaciones varchar(5000)
)
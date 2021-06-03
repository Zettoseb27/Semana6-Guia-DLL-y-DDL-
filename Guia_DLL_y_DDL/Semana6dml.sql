
create schema semana6

-------------------------------------------
--Tabla 1--
create table semana6.authority(
	nombre varchar(50) not null,
	primary key (nombre)
);
insert into semana6.authority(nombre) values ('Claudia Mogollon')
select * from semana6.authority;
-------------------------------------------

-------------------------------------------
--Tabla 2--
create table semana6.sistema_usuario(
	login varchar(50) not null,
	constraseña varchar(60) not null,
	email varchar(254) not null,
	activated int4 null,
	lang_key varchar(6) not null,
	imagen_url varchar(256) null,
	activation_key varchar(20) null,
	reset_key varchar(20) null,
	reset_date timestamp null,
	unique (login,email),
	primary key (login)
);

insert into semana6.sistema_usuario (email) values ('zettoseb27@gmial.com')
select * from semana6.sistema_usuario;
-------------------------------------------

--------------------------------------------------------------------------------------------------------------------
--Tabla 3--
create table semana6.user_authority(
	nombre varchar(50) not null,
	id_sistema_usuario int4 not null,
	sistema_usuario_login varchar(50) not null,
	primary key (nombre,id_sistema_usuario,sistema_usuario_login),
	constraint uk_aut_usera foreign key (nombre) references semana6.authority (nombre),
	constraint uk_sisu_usera foreign key (sistema_usuario_login) references semana6.sistema_usuario (login)
);

select * from semana6.user_authority;
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/*Tabla 4*/
create table semana6.entidad_cliente(
	sigla varchar(10) not null,
	nombre_documento varchar(100) not null,
	estado varchar(40) not null,
	primary key (sigla)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/*Tabla 5*/
create table semana6.admin(
	numero_documento varchar(50) not null,
	sigla varchar(10) not null,
	codigo_mesero int4 not null,
	primer_nombre varchar(50) not null,
	segundo_nombre varchar(50) null,
	primer_apellido varchar(50) not null,
	segundo_apellido varchar(50) null,
	login varchar (50) not null,
	primary key (numero_documento,sigla,codigo_mesero),
	foreign key (sigla) references semana6.entidad_cliente(sigla),
	foreign key (login) references semana6.sistema_usuario (login)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/* Tabla 6*/
create table semana6.admin_inventario(
	inventario int4 not null,
	sigla varchar(10) not null,
	admin_numero_documento varchar(50) not null,
	nombre_producto varchar(20) not null,
	estado_producto varchar(20) not null,
	unique (nombre_producto),
	primary key (inventario,sigla,admin_numero_documento)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/* Tabla 7*/
create table semana6.clasificacion(
	nombre_producto varchar(20) not null,
	cantidad int4 not null,
	fecha_vencimineto int4 not null,
	foreign key (nombre_producto) references semana6.admin_inventario (nombre_producto)
);
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
/*Tabla 8*/
create table semana6.estado_producto(
	nombre_producto varchar(20) not null,
	estado varchar(20) not null,
	unique (nombre_producto),
	foreign key (nombre_producto) references semana6.admin_inventario(nombre_producto)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/* Tabla 9*/
create table semana6.cliente(
	sigla varchar(10) not null,
	nombre_documento varchar(100) not null,
	estado varchar(40) not null,
	primary key (sigla),
	unique (nombre_documento)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/* tabla 10*/
create table semana6.ciente_usuarios(
	numero_documento varchar(50) not null,
	sigla_cliente varchar(10)not null,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	primary key (numero_documento,sigla_cliente),
	foreign key (sigla_cliente) references semana6.cliente(sigla)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/*Tabla 11*/
create table semana6.mesero(
	codigo_mesero int4 not null,
	hora_inicio int4 not null,
	hora_final int4 not null,
	primer_nombre varchar(50) not null,
	segundo_nombre varchar(50) null,
	primer_apellido varchar(50) not null,
	segundo_apellido varchar(50) not null,
	primary key (codigo_mesero),
	unique (codigo_mesero)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/*Tabla 12*/
create table semana6.pedidos(
	nombre_producto varchar(50) not null,
	cantidad_producto int4,
	unique (cantidad_producto)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/* Tabla 13 */
create table semana6.platos(
	precio int4 not null,
	codigo_mesero int4 not null,
	primary key (precio,codigo_mesero),
	foreign key (codigo_mesero) references semana6.mesero(codigo_mesero)
);
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
/* Tabla 14*/
create table semana6.ventas(
	ventas int4 not null,
	codigo_mesero int4 not null,
	nombre_mesero varchar(50) not null,
	nombre_producto varchar(50) not null,
	cantidad_producto int4 not null,
	unique (codigo_mesero),
	primary key (ventas,nombre_mesero,cantidad_producto),
	foreign key (codigo_mesero) references semana6.mesero(codigo_mesero)
);
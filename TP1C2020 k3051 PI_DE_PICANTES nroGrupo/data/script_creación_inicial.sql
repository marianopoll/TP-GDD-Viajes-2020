USE [GD1C2020]
GO

CREATE SCHEMA PI_DE_PICANTES
GO


-- Creación de tablas
CREATE TABLE PI_DE_PICANTES.SUCURSAL(
	sucursal_dir nvarchar(255) not null primary key,
	sucursal_mail nvarchar(255),
	sucursal_telefono decimal(18,0)
);


CREATE TABLE PI_DE_PICANTES.COMPRA(
	compra_nro decimal(18, 0) not null primary key,
	compra_fecha datetime2(3)
);


CREATE TABLE PI_DE_PICANTES.HOTEL(
	hotel_calle nvarchar(50) not null ,
	hotel_nro_calle decimal(18, 0) not null,
	hotel_cant_estrellas decimal(18, 0),
	primary key(hotel_calle,hotel_nro_calle)
);


CREATE TABLE PI_DE_PICANTES.CLIENTE(
	cliente_apellido nvarchar(255),
	cliente_nombre nvarchar(255),
	cliente_dni decimal(18, 0) not null primary key,
	cliente_fecha_nac datetime2(3),
	cliente_mail nvarchar(255),
	cliente_telefono int
);



CREATE TABLE PI_DE_PICANTES.FACTURA(
	factura_numero decimal(18, 0) not null primary key,
	factura_fecha datetime2(3),
	factura_nro_compra decimal(18, 0),
	fact_cliente decimal(18, 0) not null references PI_DE_PICANTES.CLIENTE(cliente_dni),
	fact_sucursal nvarchar(255) not null references PI_DE_PICANTES.SUCURSAL(sucursal_dir)
);

CREATE TABLE PI_DE_PICANTES.EMPRESA(
	empresa_razon_social nvarchar(255) not null primary key
);


CREATE TABLE PI_DE_PICANTES.ESTADIA(
	estadia_codigo decimal(18,0) primary key,
	estadia_fecha_ini datetime2(3),
	estadia_compra_nro decimal(18, 0) not null references PI_DE_PICANTES.COMPRA(compra_nro),
	estadia_hotel_calle nvarchar(50)not null ,
	estadia_hotel_nro decimal(18, 0)not null ,
	estadia_factura decimal(18, 0) not null references PI_DE_PICANTES.FACTURA(factura_numero),
	pasaje_emp_raz_social nvarchar(255) not null references PI_DE_PICANTES.EMPRESA(empresa_razon_social),
);



ALTER TABLE PI_DE_PICANTES.ESTADIA
ADD CONSTRAINT FK_HOTEL_CALLE FOREIGN KEY(estadia_hotel_calle) REFERENCES PI_DE_PICANTES.HOTEL(hotel_calle);

ALTER TABLE PI_DE_PICANTES.ESTADIA
ADD CONSTRAINT FK_HOTEL_NUMERO FOREIGN KEY(estadia_hotel_nro) REFERENCES PI_DE_PICANTES.HOTEL(hotel_nro);

CREATE TABLE PI_DE_PICANTES.TIPO_HABITACION(
	tipo_habitacion_codigo decimal(18, 0) not null primary key,
	tipo_habitacion_desc nvarchar(50),
	habitacion_costo decimal(18, 2),
	habitacion_precio decimal(18, 2)
);


CREATE TABLE PI_DE_PICANTES.HABITACION(
	habitacion_numero decimal(18, 0) not null primary key,
	habitacion_piso decimal(18, 0),
	habitacion_frente nvarchar(50),
	habitacion_tipo_hab decimal(18, 0) not null references PI_DE_PICANTES.TIPO_HABITACION(tipo_habitacion_codigo)
);


CREATE TABLE PI_DE_PICANTES.HABITACION_POR_ESTADIA(
	habitacion_est_id decimal(18, 0) not null primary key ,
	habitacion_est_codigo decimal(18, 0)not null references PI_DE_PICANTES.ESTADIA(estadia_codigo) ,
	habitacion_est_numero decimal(18, 0) not null references PI_DE_PICANTES.HABITACION(habitacion_numero)
);

CREATE TABLE PI_DE_PICANTES.CIUDAD(
	ciudad_detalle nvarchar(255) not null primary key
);



CREATE TABLE PI_DE_PICANTES.RUTA(
	ruta_aerea_codigo decimal(18, 0) not null primary key,
	ruta_aerea_ciu_origen nvarchar(255) not null references PI_DE_PICANTES.CIUDAD(ciudad_detalle),
	ruta_aerea_ciu_destino nvarchar(255) not null references PI_DE_PICANTES.CIUDAD(ciudad_detalle)
);



CREATE TABLE PI_DE_PICANTES.AVION(
	avion_modelo nvarchar(50) ,
	avion_identificador nvarchar(50) not null primary key
);


CREATE TABLE PI_DE_PICANTES.VUELO(
	vuelo_codigo decimal(19, 0) not null primary key,
	vuelo_fecha_salida datetime2(3),
	vuelo_fecha_llegada datetime2(3),
	vuelo_avion_id nvarchar(50) not null references PI_DE_PICANTES.AVION(avion_identificador),
	vuelo_ruta_aerea_cod decimal(18, 0) not null references PI_DE_PICANTES.RUTA(ruta_aerea_codigo)
); 


CREATE TABLE PI_DE_PICANTES.TIPO_BUTACA(
	tipo_butaca_desc nvarchar(50) not null primary key
);



CREATE TABLE PI_DE_PICANTES.BUTACA(
	butaca_numero decimal(18, 0) not null primary key,
	butaca_tipo nvarchar(50) not null references PI_DE_PICANTES.TIPO_BUTACA(tipo_butaca_desc)
);


CREATE TABLE PI_DE_PICANTES.BUTACA_POR_AVION(
	butaca_avion_id decimal(18, 0) not null primary key,
	butaca_avion_modelo nvarchar(50) not null references PI_DE_PICANTES.AVION(avion_identificador),
	butaca_avion_numero decimal(18, 0) not null references  PI_DE_PICANTES.BUTACA(butaca_numero)
);


CREATE TABLE PI_DE_PICANTES.PASAJE(
	pasaje_id decimal(18, 0) not null primary key,
	pasaje_codigo decimal(18, 0),
	pasaje_costo decimal(18, 2),
	pasaje_precio decimal(18, 2),
	pasaje_compra decimal(18, 0) not null references PI_DE_PICANTES.COMPRA(compra_nro),
	pasaje_emp_raz_social nvarchar(255)not null references PI_DE_PICANTES.EMPRESA(empresa_razon_social),
	pasaje_cod_vuelo decimal(19, 0) not null references PI_DE_PICANTES.VUELO(vuelo_codigo),
	pasaje_nro_butaca decimal(18, 0)not null references  PI_DE_PICANTES.BUTACA(butaca_numero),
	pasaje_factura decimal(18, 0) not null references PI_DE_PICANTES.FACTURA(factura_numero)
);



-- VER PK PORQUE PARECE QUE HAY DNI REPETIDOS


--DROP SCHEMA PI_DE_PICANTES



USE [GD1C2020]
GO

CREATE SCHEMA PI_DE_PICANTES
GO


-- Creación de tablas
CREATE TABLE PI_DE_PICANTES.SUCURSAL(
	sucursal_dir nvarchar(255),
	sucursal_mail nvarchar(255),
	sucursal_telefono decimal(18,0)
);
ALTER TABLE PI_DE_PICANTES.SUCURSAL
ADD CONSTRAINT PK_SUCURSAL PRIMARY KEY(sucursal_dir);

CREATE TABLE PI_DE_PICANTES.ESTADIA(
	estadia_codigo decimal(18,0),
	estadia_fecha_ini datetime2(3),
	estadia_compra_nro decimal(18, 0),
	estadia_hotel_calle nvarchar(50),
	estadia_hotel_nro decimal(18, 0),
	estadia_factura decimal(18, 0),
	pasaje_emp_raz_social nvarchar(255)
);
ALTER TABLE PI_DE_PICANTES.ESTADIA
ADD CONSTRAINT PK_ESTADIA PRIMARY KEY(estadia_codigo);

CREATE TABLE PI_DE_PICANTES.HOTEL(
	hotel_calle nvarchar(50),
	hotel_nro_calle decimal(18, 0),
	hotel_cant_estrellas decimal(18, 0)
);
ALTER TABLE PI_DE_PICANTES.HOTEL
ADD CONSTRAINT PK_HOTEL PRIMARY KEY(hotel_calle, hotel_nro_calle;

CREATE TABLE PI_DE_PICANTES.HABITACION_POR_ESTADIA(
	habitacion_est_id decimal(18, 0),
	habitacion_est_codigo decimal(18, 0),
	habitacion_est_numero decimal(18, 0)
);
ALTER TABLE PI_DE_PICANTES.HABITACION_POR_ESTADIA
ADD CONSTRAINT PK_HABITACION_POR_ESTADIA PRIMARY KEY(habitacion_est_id);

CREATE TABLE PI_DE_PICANTES.HABITACION(
	habitacion_numero decimal(18, 0),
	habitacion_piso decimal(18, 0),
	habitacion_frente nvarchar(50),
	habitacion_tipo_hab decimal(18, 0)
);
ALTER TABLE PI_DE_PICANTES.HABITACION
ADD CONSTRAINT PK_HABITACION PRIMARY KEY(habitacion_numero);

CREATE TABLE PI_DE_PICANTES.TIPO_HABITACION(
	tipo_habitacion_codigo decimal(18, 0),
	tipo_habitacion_desc nvarchar(50),
	habitacion_costo decimal(18, 2),
	habitacion_precio decimal(18, 2)
);
ALTER TABLE PI_DE_PICANTES.TIPO_HABITACION
ADD CONSTRAINT PK_TIPO_HABITACION PRIMARY KEY(tipo_habitacion_codigo);

CREATE TABLE PI_DE_PICANTES.FACTURA(
	factura_numero decimal(18, 0),
	factura_fecha datetime2(3),
	factura_nro_compra decimal(18, 0),
	fact_cliente decimal(18, 0),
	fact_sucursal nvarchar(255)
);
ALTER TABLE PI_DE_PICANTES.FACTURA
ADD CONSTRAINT PK_FACTURA PRIMARY KEY(factura_numero);

CREATE TABLE PI_DE_PICANTES.COMPRA(
	compra_nro decimal(18, 0),
	compra_fecha datetime2(3)
);
ALTER TABLE PI_DE_PICANTES.COMPRA
ADD CONSTRAINT PK_COMPRA PRIMARY KEY(compra_nro);

CREATE TABLE PI_DE_PICANTES.PASAJE(
	pasaje_id decimal(18, 0),
	pasaje_codigo decimal(18, 0),
	pasaje_costo decimal(18, 2),
	pasaje_precio decimal(18, 2),
	pasaje_compra decimal(18, 0),
	pasaje_emp_raz_social nvarchar(255),
	pasaje_cod_vuelo decimal(19, 0),
	pasaje_nro_butaca decimal(18, 0),
	pasaje_factura decimal(18, 0)
);
ALTER TABLE PI_DE_PICANTES.PASAJE
ADD CONSTRAINT PK_PASAJE PRIMARY KEY(pasaje_id);

CREATE TABLE PI_DE_PICANTES.RUTA(
	ruta_aerea_codigo decimal(18, 0),
	ruta_aerea_ciu_origen nvarchar(255),
	ruta_aerea_ciu_destino nvarchar(255)
);
ALTER TABLE PI_DE_PICANTES.RUTA
ADD CONSTRAINT PK_RUTA PRIMARY KEY(ruta_aerea_codigo);


CREATE TABLE PI_DE_PICANTES.CIUDAD(
	ciudad_detalle nvarchar(255)
);
ALTER TABLE PI_DE_PICANTES.CIUDAD
ADD CONSTRAINT PK_CIUDAD PRIMARY KEY(ciudad_detalle);

CREATE TABLE PI_DE_PICANTES.CLIENTE(
	cliente_apellido nvarchar(255),
	cliente_nombre nvarchar(255),
	cliente_dni decimal(18, 0),
	cliente_fecha_nac datetime2(3),
	cliente_mail nvarchar(255),
	cliente_telefono int
);
ALTER TABLE PI_DE_PICANTES.CLIENTE
ADD CONSTRAINT PK_CLIENTE PRIMARY KEY(cliente_dni);
-- VER PK PORQUE PARECE QUE HAY DNI REPETIDOS

CREATE TABLE PI_DE_PICANTES.EMPRESA(
	empresa_razon_social nvarchar(255)
);
ALTER TABLE PI_DE_PICANTES.EMPRESA
ADD CONSTRAINT PK_EMPRESA PRIMARY KEY(empresa_razon_social);

CREATE TABLE PI_DE_PICANTES.VUELO(
	vuelo_codigo decimal(19, 0),
	vuelo_fecha_salida datetime2(3),
	vuelo_fecha_llegada datetime2(3),
	vuelo_avion_id nvarchar(50),
	vuelo_ruta_aerea_cod decimal(18, 0)
); 
ALTER TABLE PI_DE_PICANTES.VUELO
ADD CONSTRAINT PK_VUELO PRIMARY KEY(vuelo_codigo);

CREATE TABLE PI_DE_PICANTES.AVION(
	avion_modelo nvarchar(50),
	avion_identificador nvarchar(50)
);
ALTER TABLE PI_DE_PICANTES.AVION
ADD CONSTRAINT PK_AVION PRIMARY KEY(avion_identificador);

CREATE TABLE PI_DE_PICANTES.BUTACA_POR_AVION(
	butaca_avion_id decimal(18, 0),
	butaca_avion_modelo decimal(18, 0),
	butaca_avion_numero decimal(18, 0)
);
ALTER TABLE PI_DE_PICANTES.BUTACA_POR_AVION
ADD CONSTRAINT PK_BUTACA_POR_AVION PRIMARY KEY(butaca_avion_id);

CREATE TABLE PI_DE_PICANTES.BUTACA(
	butaca_numero decimal(18, 0),
	butaca_tipo nvarchar(255)
);
ALTER TABLE PI_DE_PICANTES.BUTACA
ADD CONSTRAINT PK_BUTACA PRIMARY KEY(butaca_numero);

CREATE TABLE PI_DE_PICANTES.TIPO_BUTACA(
	tipo_butaca_desc nvarchar(50)
);
ALTER TABLE PI_DE_PICANTES.TIPO_BUTACA
ADD CONSTRAINT PK_TIPO_BUTACA PRIMARY KEY(tipo_butaca_desc);


--DROP SCHEMA PI_DE_PICANTES



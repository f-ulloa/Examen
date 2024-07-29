CREATE TABLE "Gimnasio" (
  "id" integer PRIMARY KEY,
  "nombre" varchar(255),
  "direccion" varchar(255),
  "telefono" varchar(255),
  "correo" varchar(255),
  "rut" varchar(255),
  "hora_apertura" timestamp,
  "hora_cierre" timestamp,
  "capacidad_personas" int
);

CREATE TABLE "Usuario" (
  "id" integer PRIMARY KEY,
  "nombre" varchar(255),
  "rut" varchar(255),
  "telefono" varchar(255),
  "correo" varchar(255),
  "nombre_usuario" varchar(255),
  "contraseña" varchar(255)
);

CREATE TABLE "Cliente" (
  "id" integer PRIMARY KEY,
  "id_usuario" integer,
  "membresia" varchar(255),
  "puntos_membresia" float
);

CREATE TABLE "PlanEntrenamiento" (
  "id" integer PRIMARY KEY,
  "id_entrenador" integer,
  "id_cliente" integer,
  "descripcion_dieta" varchar(255),
  "fecha_inicio" timestamp,
  "fecha_termino" timestamp
);

CREATE TABLE "Empleado" (
  "id" integer PRIMARY KEY,
  "id_usuario" integer,
  "sueldo" float,
  "jornada" varchar(255),
  "fecha_contratacion" timestamp,
  "afp" varchar(255),
  "isapre" varchar(255)
);

CREATE TABLE "Entrenador" (
  "id" integer PRIMARY KEY,
  "id_empleado" integer,
  "especialidad" varchar(255),
  "certificaciones" varchar(255)
);

CREATE TABLE "Limpiador" (
  "id" integer PRIMARY KEY,
  "id_empleado" integer,
  "zona_responable" varchar(255)
);

CREATE TABLE "Servicio" (
  "id" integer PRIMARY KEY,
  "nombre" varchar(255),
  "descripcion" varchar(255),
  "precio" float,
  "fecha_hora_inicio" timestamp,
  "fecha_hora_termino" timestamp
);

CREATE TABLE "Bodega" (
  "id" integer PRIMARY KEY,
  "altura_maxima" float,
  "ancho_maxima" float,
  "profundidad_maxima" float,
  "porcentaje_disponible" float
);

CREATE TABLE "Maquina" (
  "id" integer PRIMARY KEY,
  "nombre" varchar(255),
  "marca" varchar(255),
  "descripcion" varchar(255),
  "grupo_muscular" varchar(255)
);

CREATE TABLE "MaquinaDetalle" (
  "id" integer PRIMARY KEY,
  "id_maquina" integer,
  "estado" varchar(255),
  "stock" int,
  "fecha_ultima_revision" timestamp
);

CREATE TABLE "Producto" (
  "id" integer PRIMARY KEY,
  "nombre" varchar(255),
  "marca" varchar(255),
  "descripcion" varchar(255),
  "precio" float,
  "stock" int
);

CREATE TABLE "Suplemento" (
  "id" integer PRIMARY KEY,
  "id_producto" integer,
  "gramos" float,
  "sabor" varchar(255)
);

CREATE TABLE "Ropa" (
  "id" integer PRIMARY KEY,
  "id_producto" integer,
  "talla" varchar(255),
  "material" varchar(255)
);

CREATE TABLE "Accesorio" (
  "id" integer PRIMARY KEY,
  "id_producto" integer,
  "categoria_uso" varchar(255)
);

CREATE TABLE "Venta" (
  "id" integer PRIMARY KEY,
  "monto_total" float,
  "desc_puntos_membresia" float,
  "fecha_hora_compra" timestamp,
  "metodo_pago" varchar(255)
);

CREATE TABLE "GimnasioUsuario" (
  "id_gimnasio" integer,
  "id_usuario" integer
);

CREATE TABLE "GimnasioServicio" (
  "id_gimnasio" integer,
  "id_servicio" integer
);

CREATE TABLE "GimnasioVenta" ("id_gimnasio" integer, "id_venta" integer);

CREATE TABLE "GimnasioBodega" ("id_gimnasio" integer, "id_bodega" integer);

CREATE TABLE "ServicioEntenador" (
  "id_servicio" integer,
  "id_entrenador" integer
);

CREATE TABLE "ServicioCliente" (
  "id_servicio" integer,
  "id_cliente" integer
);

CREATE TABLE "ServicioMaquina" (
  "id_servicio" integer,
  "id_maquina" integer
);

CREATE TABLE "BodegaProducto" ("id_bodega" integer, "id_producto" integer);

CREATE TABLE "BodegaMaquina" ("id_bodega" integer, "id_maquina" integer);

CREATE TABLE "VentaCliente" ("id_venta" integer, "id_cliente" integer);

CREATE TABLE "PlanMaquina" (
  "id_plan" integer,
  "id_maquina" integer,
  "series" int,
  "repeticiones" int
);

ALTER TABLE
  "Cliente"
ADD
  FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE
  "PlanEntrenamiento"
ADD
  FOREIGN KEY ("id_entrenador") REFERENCES "Entrenador" ("id");

ALTER TABLE
  "PlanEntrenamiento"
ADD
  FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id");

ALTER TABLE
  "Empleado"
ADD
  FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE
  "Entrenador"
ADD
  FOREIGN KEY ("id_empleado") REFERENCES "Empleado" ("id");

ALTER TABLE
  "Limpiador"
ADD
  FOREIGN KEY ("id_empleado") REFERENCES "Empleado" ("id");

ALTER TABLE
  "MaquinaDetalle"
ADD
  FOREIGN KEY ("id_maquina") REFERENCES "Maquina" ("id");

ALTER TABLE
  "Suplemento"
ADD
  FOREIGN KEY ("id_producto") REFERENCES "Producto" ("id");

ALTER TABLE
  "Ropa"
ADD
  FOREIGN KEY ("id_producto") REFERENCES "Producto" ("id");

ALTER TABLE
  "Accesorio"
ADD
  FOREIGN KEY ("id_producto") REFERENCES "Producto" ("id");

ALTER TABLE
  "GimnasioUsuario"
ADD
  FOREIGN KEY ("id_gimnasio") REFERENCES "Gimnasio" ("id");

ALTER TABLE
  "GimnasioUsuario"
ADD
  FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE
  "GimnasioServicio"
ADD
  FOREIGN KEY ("id_gimnasio") REFERENCES "Gimnasio" ("id");

ALTER TABLE
  "GimnasioServicio"
ADD
  FOREIGN KEY ("id_servicio") REFERENCES "Servicio" ("id");

ALTER TABLE
  "GimnasioVenta"
ADD
  FOREIGN KEY ("id_gimnasio") REFERENCES "Gimnasio" ("id");

ALTER TABLE
  "GimnasioVenta"
ADD
  FOREIGN KEY ("id_venta") REFERENCES "Venta" ("id");

ALTER TABLE
  "GimnasioBodega"
ADD
  FOREIGN KEY ("id_gimnasio") REFERENCES "Gimnasio" ("id");

ALTER TABLE
  "GimnasioBodega"
ADD
  FOREIGN KEY ("id_bodega") REFERENCES "Bodega" ("id");

ALTER TABLE
  "ServicioEntenador"
ADD
  FOREIGN KEY ("id_servicio") REFERENCES "Servicio" ("id");

ALTER TABLE
  "ServicioEntenador"
ADD
  FOREIGN KEY ("id_entrenador") REFERENCES "Entrenador" ("id");

ALTER TABLE
  "ServicioCliente"
ADD
  FOREIGN KEY ("id_servicio") REFERENCES "Servicio" ("id");

ALTER TABLE
  "ServicioCliente"
ADD
  FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id");

ALTER TABLE
  "ServicioMaquina"
ADD
  FOREIGN KEY ("id_servicio") REFERENCES "Servicio" ("id");

ALTER TABLE
  "ServicioMaquina"
ADD
  FOREIGN KEY ("id_maquina") REFERENCES "Maquina" ("id");

ALTER TABLE
  "BodegaProducto"
ADD
  FOREIGN KEY ("id_bodega") REFERENCES "Bodega" ("id");

ALTER TABLE
  "BodegaProducto"
ADD
  FOREIGN KEY ("id_producto") REFERENCES "Producto" ("id");

ALTER TABLE
  "BodegaMaquina"
ADD
  FOREIGN KEY ("id_bodega") REFERENCES "Bodega" ("id");

ALTER TABLE
  "BodegaMaquina"
ADD
  FOREIGN KEY ("id_maquina") REFERENCES "Maquina" ("id");

ALTER TABLE
  "VentaCliente"
ADD
  FOREIGN KEY ("id_venta") REFERENCES "Venta" ("id");

ALTER TABLE
  "VentaCliente"
ADD
  FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id");

ALTER TABLE
  "PlanMaquina"
ADD
  FOREIGN KEY ("id_plan") REFERENCES "PlanEntrenamiento" ("id");

ALTER TABLE
  "PlanMaquina"
ADD
  FOREIGN KEY ("id_maquina") REFERENCES "Maquina" ("id");

-- Datos de prueba para la tabla Gimnasio
INSERT INTO
  "Gimnasio" (
    id,
    nombre,
    direccion,
    telefono,
    correo,
    rut,
    hora_apertura,
    hora_cierre,
    capacidad_personas
  )
VALUES
  (
    1,
    'Gimnasio A',
    'Dirección A',
    '123456789',
    'correoA@example.com',
    '12345678-9',
    '2023-07-12 06:00:00',
    '2023-07-12 22:00:00',
    100
  ),
  (
    2,
    'Gimnasio B',
    'Dirección B',
    '987654321',
    'correoB@example.com',
    '98765432-1',
    '2023-07-12 06:00:00',
    '2023-07-12 22:00:00',
    150
  );

-- Datos de prueba para la tabla Usuario
INSERT INTO
  "Usuario" (
    id,
    nombre,
    rut,
    telefono,
    correo,
    nombre_usuario,
    contraseña
  )
VALUES
  (
    1,
    'Usuario 1',
    '11111111-1',
    '111111111',
    'usuario1@example.com',
    'usuario1',
    'password1'
  ),
  (
    2,
    'Usuario 2',
    '22222222-2',
    '222222222',
    'usuario2@example.com',
    'usuario2',
    'password2'
  );

-- Datos de prueba para la tabla Cliente
INSERT INTO
  "Cliente" (id, id_usuario, membresia, puntos_membresia)
VALUES
  (1, 1, 'Gold', 100.0),
  (2, 2, 'Silver', 50.0);

-- Datos de prueba para la tabla Empleado
INSERT INTO
  "Empleado" (
    id,
    id_usuario,
    sueldo,
    jornada,
    fecha_contratacion,
    afp,
    isapre
  )
VALUES
  (
    1,
    1,
    1000.0,
    'Completa',
    '2022-01-01 00:00:00',
    'AFP 1',
    'Isapre 1'
  ),
  (
    2,
    2,
    1200.0,
    'Media',
    '2022-01-01 00:00:00',
    'AFP 2',
    'Isapre 2'
  );

-- Datos de prueba para la tabla Entrenador
INSERT INTO
  "Entrenador" (id, id_empleado, especialidad, certificaciones)
VALUES
  (1, 1, 'Musculación', 'Certificación A'),
  (2, 2, 'Cardio', 'Certificación B');

-- Datos de prueba para la tabla PlanEntrenamiento
INSERT INTO
  "PlanEntrenamiento" (
    id,
    id_entrenador,
    id_cliente,
    descripcion_dieta,
    fecha_inicio,
    fecha_termino
  )
VALUES
  (
    1,
    1,
    1,
    'Dieta A',
    '2023-07-01 00:00:00',
    '2023-07-31 23:59:59'
  ),
  (
    2,
    1,
    2,
    'Dieta B',
    '2023-07-01 00:00:00',
    '2023-07-31 23:59:59'
  );

-- Datos de prueba para la tabla Limpiador
INSERT INTO
  "Limpiador" (id, id_empleado, zona_responable)
VALUES
  (1, 1, 'Zona A'),
  (2, 2, 'Zona B');

-- Datos de prueba para la tabla Servicio
INSERT INTO
  "Servicio" (
    id,
    nombre,
    descripcion,
    precio,
    fecha_hora_inicio,
    fecha_hora_termino
  )
VALUES
  (
    1,
    'Servicio A',
    'Descripción A',
    100.0,
    '2023-07-01 10:00:00',
    '2023-07-01 12:00:00'
  ),
  (
    2,
    'Servicio B',
    'Descripción B',
    150.0,
    '2023-07-02 10:00:00',
    '2023-07-02 12:00:00'
  );

-- Datos de prueba para la tabla Bodega
INSERT INTO
  "Bodega" (
    id,
    altura_maxima,
    ancho_maxima,
    profundidad_maxima,
    porcentaje_disponible
  )
VALUES
  (1, 10.0, 5.0, 20.0, 75.0),
  (2, 8.0, 4.0, 15.0, 60.0);

-- Datos de prueba para la tabla Maquina
INSERT INTO
  "Maquina" (id, nombre, marca, descripcion, grupo_muscular)
VALUES
  (
    1,
    'Máquina A',
    'Marca A',
    'Descripción A',
    'Grupo A'
  ),
  (
    2,
    'Máquina B',
    'Marca B',
    'Descripción B',
    'Grupo B'
  );

-- Datos de prueba para la tabla MaquinaDetalle
INSERT INTO
  "MaquinaDetalle" (
    id,
    id_maquina,
    estado,
    stock,
    fecha_ultima_revision
  )
VALUES
  (1, 1, 'Buena', 10, '2023-07-01 00:00:00'),
  (2, 2, 'Mantenimiento', 5, '2023-07-02 00:00:00');

-- Datos de prueba para la tabla Producto
INSERT INTO
  "Producto" (id, nombre, marca, descripcion, precio, stock)
VALUES
  (
    1,
    'Producto A',
    'Marca A',
    'Descripción A',
    50.0,
    20
  ),
  (
    2,
    'Producto B',
    'Marca B',
    'Descripción B',
    70.0,
    15
  );

-- Datos de prueba para la tabla Suplemento
INSERT INTO
  "Suplemento" (id, id_producto, gramos, sabor)
VALUES
  (1, 1, 500.0, 'Chocolate'),
  (2, 2, 1000.0, 'Vainilla');

-- Datos de prueba para la tabla Ropa
INSERT INTO
  "Ropa" (id, id_producto, talla, material)
VALUES
  (1, 1, 'M', 'Algodón'),
  (2, 2, 'L', 'Poliéster');

-- Datos de prueba para la tabla Accesorio
INSERT INTO
  "Accesorio" (id, id_producto, categoria_uso)
VALUES
  (1, 1, 'Fitness'),
  (2, 2, 'Yoga');

-- Datos de prueba para la tabla Venta
INSERT INTO
  "Venta" (
    id,
    monto_total,
    desc_puntos_membresia,
    fecha_hora_compra,
    metodo_pago
  )
VALUES
  (1, 150.0, 10.0, '2023-07-01 12:00:00', 'Tarjeta'),
  (
    2,
    200.0,
    20.0,
    '2023-07-02 12:00:00',
    'Efectivo'
  );

-- Datos de prueba para la tabla GimnasioUsuario
INSERT INTO
  "GimnasioUsuario" (id_gimnasio, id_usuario)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla GimnasioServicio
INSERT INTO
  "GimnasioServicio" (id_gimnasio, id_servicio)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla GimnasioVenta
INSERT INTO
  "GimnasioVenta" (id_gimnasio, id_venta)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla GimnasioBodega
INSERT INTO
  "GimnasioBodega" (id_gimnasio, id_bodega)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla ServicioEntenador
INSERT INTO
  "ServicioEntenador" (id_servicio, id_entrenador)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla ServicioCliente
INSERT INTO
  "ServicioCliente" (id_servicio, id_cliente)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla ServicioMaquina
INSERT INTO
  "ServicioMaquina" (id_servicio, id_maquina)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla BodegaProducto
INSERT INTO
  "BodegaProducto" (id_bodega, id_producto)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla BodegaMaquina
INSERT INTO
  "BodegaMaquina" (id_bodega, id_maquina)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla VentaCliente
INSERT INTO
  "VentaCliente" (id_venta, id_cliente)
VALUES
  (1, 1),
  (2, 2);

-- Datos de prueba para la tabla PlanMaquina
INSERT INTO
  "PlanMaquina" (id_plan, id_maquina, series, repeticiones)
VALUES
  (1, 1, 3, 10),
  (2, 2, 4, 12);

/*
 
 https://dbdiagram.io/d/diagrma-BD-GYM-v2-66908ae79939893daeb81c7b
 
 
 Table Gimnasio{
 id integer [primary key]
 nombre varchar(255)
 direccion varchar(255)
 telefono varchar(255)
 correo varchar(255) 
 rut varchar(255)
 hora_apertura timestamp
 hora_cierre timestamp
 capacidad_personas int
 }
 
 Table Usuario{
 id integer [primary key]
 nombre varchar(255)
 rut varchar(255)
 telefono varchar(255)
 correo varchar(255)
 nombre_usuario varchar(255)
 contraseña varchar(255)
 }
 
 
 Table Cliente{
 id integer [primary key]
 id_usuario integer [ref: - Usuario.id]
 membresia varchar(255)
 puntos_membresia float
 }
 
 Table PlanEntrenamiento{
 id integer [primary key]
 id_entrenador integer [ref: > Entrenador.id]
 id_cliente integer [ref: > Cliente.id]
 descripcion_dieta varchar(255)
 fecha_inicio timestamp
 fecha_termino timestamp
 }
 
 Table Empleado{
 id integer [primary key]
 id_usuario integer [ref: - Usuario.id]
 sueldo float
 jornada varchar(255)
 fecha_contratacion timestamp
 afp varchar(255)
 isapre varchar(255)
 }
 
 Table Entrenador{
 id integer [primary key]
 id_empleado integer [ref: - Empleado.id]
 especialidad varchar(255)
 certificaciones varchar(255)
 }
 
 Table Limpiador{
 id integer [primary key]
 id_empleado integer [ref: - Empleado.id]
 zona_responable varchar(255)
 }
 
 
 Table Servicio{
 id integer [primary key]
 nombre varchar(255)
 descripcion varchar(255)
 precio float
 fecha_hora_inicio timestamp
 fecha_hora_termino timestamp
 }
 
 Table Bodega{
 id integer [primary key]
 altura_maxima float
 ancho_maxima float
 profundidad_maxima float
 porcentaje_disponible float
 }
 
 Table Maquina{
 id integer [primary key]
 nombre varchar(255)
 marca varchar(255)
 descripcion varchar(255)
 grupo_muscular varchar(255)
 }
 
 Table MaquinaDetalle{
 id integer [primary key]
 id_maquina integer [ref:>Maquina.id]
 estado varchar(255)
 stock int
 fecha_ultima_revision timestamp
 }
 
 Table Producto{
 id integer [primary key]
 nombre varchar(255)
 marca varchar(255)
 descripcion varchar(255)
 precio float
 stock int
 }
 
 Table Suplemento{
 id integer [primary key]
 id_producto integer [ref: > Producto.id]
 gramos float
 sabor varchar(255)
 }
 
 Table Ropa{
 id integer [primary key]
 id_producto integer [ref: > Producto.id]
 talla varchar(255)
 material varchar(255)
 }
 
 Table Accesorio{
 id integer [primary key]
 id_producto integer [ref: > Producto.id]
 categoria_uso varchar(255)
 }
 
 Table Venta{
 id integer [primary key]
 monto_total float
 desc_puntos_membresia float
 fecha_hora_compra timestamp
 metodo_pago varchar(255)
 }
 
 
 //Relaciones M N
 
 Table GimnasioUsuario{
 id_gimnasio integer [ref: > Gimnasio.id]
 id_usuario integer [ref: > Usuario.id]
 }
 
 Table GimnasioServicio{
 id_gimnasio integer [ref: > Gimnasio.id]
 id_servicio integer [ref: > Servicio.id]
 }
 
 Table GimnasioVenta{
 id_gimnasio integer [ref: > Gimnasio.id]
 id_venta integer [ref: > Venta.id]
 }
 
 Table GimnasioBodega{
 id_gimnasio integer [ref: > Gimnasio.id]
 id_bodega integer [ref: > Bodega.id]
 }
 
 Table ServicioEntenador{
 id_servicio integer [ref: > Servicio.id]
 id_entrenador integer [ref: > Entrenador.id]
 }
 
 Table ServicioCliente{
 id_servicio integer [ref: > Servicio.id]
 id_cliente integer [ref: > Cliente.id]
 }
 
 Table ServicioMaquina{
 id_servicio integer [ref: > Servicio.id]
 id_maquina integer [ref: > Maquina.id]
 }
 
 Table BodegaProducto {
 id_bodega integer [ref: > Bodega.id]
 id_producto integer [ref: > Producto.id]
 }
 
 Table BodegaMaquina {
 id_bodega integer [ref: > Bodega.id]
 id_maquina integer [ref: > Maquina.id]
 }
 
 Table VentaCliente {
 id_venta integer [ref: > Venta.id]
 id_cliente integer [ref: > Cliente.id]
 }
 
 Table PlanMaquina{
 id_plan integer [ref: > PlanEntrenamiento.id]
 id_maquina integer [ref: > Maquina.id]
 series int
 repeticiones int
 }
 -------------------Class Diagram------------------------------
 @startuml
 Class Gimnasio{
 nombre
 direccion
 telefono
 correo
 rut
 hora_apertura
 hora_cierre
 capacidad_personas
 }
 
 Class Usuario{
 nombre
 rut
 telefono
 correo
 nombre_usuario
 contraseña
 }
 
 Class Empleado{
 sueldo
 jornada
 fecha_contratacion
 afp
 isapre
 }
 
 Class Entrenador{
 especialidad
 certificaciones
 }
 
 Class Limpiador{
 zona_responable
 }
 
 Class Cliente{
 membresia
 puntos_membresia
 }
 
 Class Servicio{
 nombre
 descripcion
 precio
 fecha_hora_inicio
 fecha_hora_termino
 }
 
 Class Bodega{
 altura_maxima
 ancho_maxima
 profundidad_maxima
 porcentaje_disponible
 }
 
 Class Maquina{
 nombre
 descripcion
 grupo_muscular
 estado
 stock
 fecha_ultima_revision
 }
 
 Class Producto{
 nombre
 marca
 descripcion
 precio
 stock
 }
 
 Class Suplemento{
 gramos
 sabor
 }
 
 Class Ropa{
 talla
 material
 }
 
 Class Accesorio{
 categoria_uso
 }
 
 Class Venta{
 monto_total
 fecha_hora_compra
 metodo_pago
 }
 
 
 Gimnasio --* Usuario
 Gimnasio --* Servicio
 Gimnasio --* Bodega
 Gimnasio --* Venta
 
 Empleado --|> Usuario
 Cliente --|> Usuario
 
 Entrenador --|> Empleado
 Limpiador --|> Empleado
 
 Servicio --* Cliente
 Servicio --* Entrenador
 Servicio --* Maquina
 
 Bodega --* Maquina
 Bodega --* Producto
 
 Venta --* Cliente
 Venta --* Producto
 
 Suplemento --|> Producto
 Ropa --|> Producto
 Accesorio --|> Producto
 @enduml
 */
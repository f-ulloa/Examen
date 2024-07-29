/*
Sobre su modelo de BD, exprese las siguientes consultas en SQL: (6 ptos: 2 ptos c/u)
a. Nombre del plato que más dinero genera (suponga para esta consulta que solo se toma en cuenta 
el valor de venta).
*/
SELECT p.nombre, sum(p.valor) FROM "Plato" p
INNER JOIN "PedidoPlato" pp ON p.id = pp.id_plato
GROUP BY p.id
ORDER BY sum(p.valor) DESC
LIMIT 1;


-- b. Ranking de los clientes más frecuentes (de mayor a menor) en que se despliega el nombre 
--y teléfono de ellos.
SELECT u.nombre, u.telefono FROM "Usuario" u
INNER JOIN "Cliente" c ON c.id_usuario = u.id
INNER JOIN "Pedido" p ON p.id_cliente = c.id
GROUP BY u.nombre, u.telefono, u.id
ORDER BY count(*) DESC;
--c. Tiempo promedio de espera de los clientes por platos en el restaurante.
SELECT pp.plato, AVG(pp.tiempo_prep) FROM "PedidoPlato"
GROUP BY pp.id_plato;

/*
@startuml
class Restaurante {
  - nombre
  - direccion
  - rut
  - url_pagina
  - hora_apertura
  - hora_cierre
- cap_cocineros
  - correo
  - telefono
  + abrir()
  + cerrar()
}

class Pedido {
  - monto
  - fecha_hora_creacion
  - estado
  - medio_pago
  + cambiarEstado()
}

class Cocinero {
  - certificaciones
  - especialidad
  - cargo
  + cocinar()
}

class Garzon {
  - calificacion
  + tomarPedido()
  + llevarPedido()
  + retirarPedido()
  + asignarMesaReserva()
}

class Administrador {
+ contratar()
+ inventariar()
+ despedir()
}

class Mesa {
  - capacidad_personas
  - esta_reservado
  + entregarCapacidad()
}

class Bodega {
  - capacidad
  + guardarIngrediente()
  + botarIngrediente()
}

class Plato {
  - nombre
  - descripcion
  - valor
  - tiempo_prep
}

class Ingrediente {
  - nombre
  - stock
  - fecha_compra
  - fecha_vencimiento
  + vencer()
}

class Empleado {
  - fecha_contratacion
  - sueldo
  - afp
  - isapre
  - horario
  + renunciar()
  + solicitarVacaciones()
  + entregarLicenciaMedica()
}

class Cliente {
  - puntos_cliente
  + pedir()
  + reservar()
}

class Usuario {
  - nombre
  - correo
  - telefono
  - nombre_usuario
  - contrasena
  + cambiarContrasena()
}


Class Reserva {
- fecha_hora_pedido
- fecha_hora_cuando
- cantidad_pesonas
- comentarios
}

Restaurante --* Pedido
Restaurante --* Mesa
Restaurante --* Bodega
Restaurante --* Plato
Restaurante --* Reserva
Restaurante --* Usuario

Bodega  --* Ingrediente
Plato  --* Ingrediente
Pedido --* Cliente
Pedido --* Garzon
Pedido --* Mesa
Pedido --* Plato

Empleado <|-- Cocinero
Empleado <|-- Garzon
Empleado <|-- Administrador
Usuario <|-- Empleado
Usuario <|-- Cliente





@enduml
*/


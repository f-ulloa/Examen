/*
 @startuml
 
 Class Tienda {
 - nombre: String
 - rut: String
 - telefono: String
 - correo: String
 - direccion: String
 - hora_apertura: Time
 - hora_cierre: Time
 + agregarProducto(Producto): void
 + eliminarProducto(Producto): void
 + actualizarProducto(Producto): void
 }
 
 Class Usuario {
 - nombre: String
 - telefono: String
 - correo: String
 - nombre_usuario: String
 - contraseña: String
 + registrarse(): void
 + iniciarSesion(): void
 + cerrarSesion(): void
 }
 
 Class Bodega {
 - altura: Double
 - longitud: Double
 - profundidad: Double
 - m2_disponible: Double
 - m2_efectiva: Double
 + agregarProducto(Producto): void
 + eliminarProducto(Producto): void
 + actualizarStock(Producto, cantidad: Int): void
 }
 
 Class Venta {
 - monto: Double
 - descuento: Double
 - total: Double
 - fecha_compra: DateTime
 - metodo_pago: String
 - metodo_envio: String
 + calcularTotal(): Double
 + aplicarDescuento(Promocion): void
 + finalizarVenta(): void
 }
 
 Class Producto {
 - nombre: String
 - marca: String
 - descripcion: String
 - precio: Double
 - imagen: String
 - stock: Int
 + actualizarStock(cantidad: Int): void
 }
 
 Class Shipper {
 - nombre: String
 - rut: String
 - numCuenta: String
 - banco: String
 - direccion_distribucion: String
 - tarifa_km: Double
 - tarifa_m2: Double
 + calcularTarifa(distancia: Double, volumen: Double): Double
 }
 
 Class Proveedor {
 - nombre: String
 - rut: String
 - numCuenta: String
 - pais: String
 - direccion: String
 - contacto: String
 + suministrarProducto(Producto): void
 }
 
 Class Promocion {
 - tipo_promocion: String
 - cantidad_prod_activacion: Int
 - codigo_promocion: String
 - fecha_hora_inicio: DateTime
 - fecha_hora_termino: DateTime
 - cantidad_uso: Int
 - uso_por_cliente: Int
 + aplicarPromocion(Venta): void
 }
 
 Class Empleado {
 - sueldo_base: Double
 - fecha_contratacion: Date
 - afp: String
 - isapre: String
 - contacto_emergencia: String
 - tipo_horario: String
 + asignarTarea(tarea: String): void
 }
 
 Class Cliente {
 - loyalty_points: Int
 - es_miembro: Boolean
 + agregarAlCarrito(Producto): void
 + realizarPedido(): void
 + dejarResena(Producto, resena: String): void
 }
 
 Class Administrador {
 - permisos_asignados: String
 + gestionarUsuarios(): void
 + generarReporteVentas(): void
 }
 
 Class Vendedor {
 - codigo_vendedor: String
 - comision_venta: Double
 + procesarVenta(Venta): void
 }
 
 Class Guardia {
 - certificaciones: String
 + monitorearSeguridad(): void
 }
 
 Class Carrito {
 - fecha_hora_creacion: DateTime
 - fecha_hora_ultima_mod: DateTime
 + agregarProducto(Producto): void
 + eliminarProducto(Producto): void
 + vaciarCarrito(): void
 }
 
 Class Telefono {
 - certificaciones: String
 - procesador: String
 - tam_pantalla: Double
 - pix_camara: Int
 - capacidad_carga_ina: Int
 - capacidad_carga: Int
 - peso: Double
 }
 
 Class Laptop {
 - tam_pantalla: Double
 - peso: Double
 - procesador: String
 - grafica: String
 - memoria_ram: Int
 - almacenamiento: Int
 }
 
 Class Accesorio {
 - casos_de_uso: String
 - productos_a_acoplar: String
 }
 
 Class Electrodomestico {
 - capacidad_kw: Double
 - certificaciones_electricas: String
 }
 
 Tienda --* Usuario
 Tienda --* Empleado
 Tienda --* Venta
 Tienda --* Bodega
 
 Empleado --|> Usuario
 Cliente --|> Usuario
 Administrador --|> Usuario
 
 Vendedor --|> Empleado
 Guardia --|> Empleado
 
 Telefono --|> Producto
 Laptop --|> Producto
 Accesorio --|> Producto
 Electrodomestico --|> Producto
 
 Venta --* Carrito
 Venta --* Shipper
 Venta --* Vendedor
 Venta --* Cliente
 Venta --* Promocion
 
 Bodega --* Producto
 
 Producto --* Proveedor
 
 Carrito --* Producto
 Carrito --* Cliente
 
 @enduml
 
 */
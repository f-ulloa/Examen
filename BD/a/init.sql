-- Creación de tablas
CREATE TABLE Torneo (
    ID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    Fecha_Inicio DATE,
    Fecha_Termino DATE,
    Lugar VARCHAR(255)
);

CREATE TABLE Equipo (
    ID SERIAL PRIMARY KEY,
    Nombre_Equipo VARCHAR(255),
    Fecha_Fundacion DATE,
    Telefono VARCHAR(20)
);

CREATE TABLE Partida (
    ID SERIAL PRIMARY KEY,
    ID_Torneo INT REFERENCES Torneo(ID),
    ID_Equipo_1 INT REFERENCES Equipo(ID),
    ID_Equipo_2 INT REFERENCES Equipo(ID),
    Fecha_Hora_Inicio TIMESTAMP,
    Resultado VARCHAR(255),
    Ronda INT,
    Duracion INTERVAL
);


CREATE TABLE Persona (
    ID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    Celular VARCHAR(20),
    Correo VARCHAR(255),
    Fecha_Nacimiento DATE
);

CREATE TABLE Rol (
    ID SERIAL PRIMARY KEY,
    Nombre_Rol VARCHAR(255)
);

CREATE TABLE Persona_Rol (
    ID_Rol INT REFERENCES Rol(ID),
    ID_Persona INT REFERENCES Persona(ID),
    PRIMARY KEY (ID_Rol, ID_Persona)
);

CREATE TABLE Pertenece (
    ID_Persona INT REFERENCES Persona(ID),
    ID_Equipo INT REFERENCES Equipo(ID),
    PRIMARY KEY (ID_Persona, ID_Equipo)
);

CREATE TABLE Sancion (
    ID SERIAL PRIMARY KEY,
    ID_Arbitro INT REFERENCES Persona(ID),
    ID_Sancionado INT REFERENCES Persona(ID),
    ID_Torneo INT REFERENCES Torneo(ID),
    Descripcion TEXT,
    Fecha DATE
);

CREATE TABLE Participa (
    ID_Partida INT REFERENCES Partida(ID),
    ID_Persona INT REFERENCES Persona(ID),
    PRIMARY KEY (ID_Partida, ID_Persona)
);

CREATE TABLE Gestiona (
    ID_Torneo INT REFERENCES Torneo(ID),
    ID_Persona INT REFERENCES Persona(ID)
);



-- Inserción de datos en Torneo
INSERT INTO Torneo (Nombre, Fecha_Inicio, Fecha_Termino, Lugar)
VALUES 
    ('Torneo Invierno', '2024-06-01', '2024-06-10', 'Santiago'),
    ('Torneo Verano', '2024-12-01', '2024-12-10', 'Valparaíso'),
    ('Torneo Primavera', '2024-09-01', '2024-09-10', 'Concepción'),
    ('Torneo Otoño', '2024-03-01', '2024-03-10', 'La Serena'),
    ('Torneo Especial', '2024-07-01', '2024-07-10', 'Antofagasta');

-- Inserción de datos en Equipo
INSERT INTO Equipo (Nombre_Equipo, Fecha_Fundacion, Telefono)
VALUES 
    ('Equipo Alpha', '2020-01-15', '123456789'),
    ('Equipo Beta', '2019-03-22', '987654321'),
    ('Equipo Gamma', '2018-05-10', '555555555'),
    ('Equipo Delta', '2021-07-30', '444444444'),
    ('Equipo Epsilon', '2022-11-25', '666666666');

-- Inserción de datos en Persona
INSERT INTO Persona (Nombre, Celular, Correo, Fecha_Nacimiento)
VALUES 
    ('Juan Perez', '111111111', 'juan.perez@example.com', '1990-05-14'),
    ('Maria Gomez', '222222222', 'maria.gomez@example.com', '1985-07-19'),
    ('Pedro Sanchez', '333333333', 'pedro.sanchez@example.com', '1992-11-23'),
    ('Ana Martinez', '444444444', 'ana.martinez@example.com', '1988-02-01'),
    ('Luis Fernandez', '555555555', 'luis.fernandez@example.com', '1995-06-10'),
    ('Carla Lopez', '666666666', 'carla.lopez@example.com', '1993-04-12'),
    ('Diego Ramirez', '777777777', 'diego.ramirez@example.com', '1987-08-25'),
    ('Elena Torres', '888888888', 'elena.torres@example.com', '1991-03-14'),
    ('Fernando Ruiz', '999999999', 'fernando.ruiz@example.com', '1994-12-22'),
    ('Gabriela Silva', '101010101', 'gabriela.silva@example.com', '1989-09-30');


-- Inserción de datos en Rol
INSERT INTO Rol (Nombre_Rol)
VALUES 
    ('OT'),
    ('Arbitro'),
    ('PS'),
    ('Comentarista'),
    ('Jugador'),
    ('Jugador Reserva'),
    ('Capitan Equipo'),
    ('Espectador');


-- Asignación de Roles a Personas
INSERT INTO Persona_Rol (ID_Rol, ID_Persona)
VALUES 
    (1, 1),  -- Juan Perez - OT
    (1, 5),  -- Luis Fernandez - OT
    (2, 2),  -- Maria Gomez - Arbitro
    (2, 3),  -- Pedro Sanchez - Arbitro
    (2, 4),  -- Ana Martinez - Arbitro
    (3, 6),  -- Carla Lopez - PS
    (4, 7),  -- Diego Ramirez - Comentarista
    (5, 8),  -- Elena Torres - Jugador
    (6, 9),  -- Fernando Ruiz - Jugador Reserva
    (7, 10), -- Gabriela Silva - Capitan Equipo
    (8, 1),  -- Juan Perez - Espectador
    (4, 6),  -- Carla Lopez - Comentarista
    (5, 7),  -- Diego Ramirez - Jugador
    (6, 8),  -- Elena Torres - Jugador Reserva
    (7, 9),  -- Fernando Ruiz - Capitan Equipo
    (8, 10), -- Gabriela Silva - Espectador
    (3, 5);  -- Luis Fernandez - PS


-- Inserción de datos en Partida
INSERT INTO Partida (ID_Torneo, ID_Equipo_1, ID_Equipo_2, Fecha_Hora_Inicio, Resultado, Ronda, Duracion)
VALUES 
    (1, 1, 2, '2024-05-17 10:00:00', 'Equipo Alpha Gana', 1, '00:30:00'),
    (1, 3, 4, '2024-05-17 11:00:00', 'Equipo Gamma Gana', 1, '00:35:00'),
    (2, 2, 5, '2024-05-17 12:00:00', 'Equipo Beta Gana', 1, '00:25:00'),
    (2, 1, 3, '2024-05-17 13:00:00', 'Equipo Alpha Gana', 2, '00:40:00'),
    (3, 4, 5, '2024-05-17 14:00:00', 'Equipo Delta Gana', 1, '00:20:00');

-- Inserción de participaciones en partidas
INSERT INTO Participa (ID_Partida, ID_Persona)
VALUES 
    (1, 2), (1, 3), (1, 4),
    (2, 3), (2, 4), (2, 5),
    --(3, 2), (3, 5), (3, 1),
    (4, 1), (4, 3), (4, 2),
    (5, 4), (5, 5), (5, 3);

-- Inserción de gestiones de Torneo
INSERT INTO Gestiona (ID_Torneo, ID_Persona)
VALUES 
    (1, 2), -- Arbitro
    (1, 3), -- Arbitro
    (1, 4), -- Arbitro
    (1, 5), -- PS
    (2, 6); -- PS

-- Inserción de pertenencias a equipos (Pertenece)
INSERT INTO Pertenece (ID_Persona, ID_Equipo)
VALUES 
    (2, 1), (3, 1), (4, 2), (5, 3), (1, 4);

-- Inserción de sanciones (Sancion)
INSERT INTO Sancion (ID_Arbitro, ID_Sancionado, ID_Torneo, Descripcion, Fecha)
VALUES 
    (1, 2, 1, 'Conducta Antideportiva', '2024-06-02'),
    (5, 3, 2, 'Retraso en la partida', '2024-06-03'),
    (1, 4, 3, 'Uso de lenguaje inapropiado', '2024-06-04'),
    (5, 5, 4, 'Comportamiento antideportivo', '2024-06-05'),
    (1, 2, 5, 'Falta de puntualidad', '2024-06-06');

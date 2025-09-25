CREATE DATABASE IF NOT EXISTS parking_db;
USE parking_db;

CREATE TABLE IF NOT EXISTS torres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS apartamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    torre_id INT,
    FOREIGN KEY (torre_id) REFERENCES torres(id)
);

CREATE TABLE IF NOT EXISTS parqueaderos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20),
    numero VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS asignaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    apartamento_id INT,
    parqueadero_id INT,
    FOREIGN KEY (apartamento_id) REFERENCES apartamentos(id),
    FOREIGN KEY (parqueadero_id) REFERENCES parqueaderos(id)
);

INSERT INTO torres (nombre) VALUES ('Torre A'), ('Torre B');

INSERT INTO apartamentos (numero, torre_id) VALUES
('101', 1),
('102', 1),
('201', 2),
('202', 2);

INSERT INTO parqueaderos (tipo, numero) VALUES
('individual', 'P1'),
('individual', 'P2'),
('doble', 'D1');

INSERT INTO asignaciones (apartamento_id, parqueadero_id) VALUES
(1, 1),
(2, 2),
(3, 3);
CREATE TABLE IF NOT EXISTS torres (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS apartamentos (
    id INTEGER PRIMARY KEY,
    numero TEXT NOT NULL,
    torre_id INTEGER,
    FOREIGN KEY (torre_id) REFERENCES torres(id)
);

CREATE TABLE IF NOT EXISTS parqueaderos (
    id INTEGER PRIMARY KEY,
    tipo TEXT,
    numero TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS asignaciones (
    id INTEGER PRIMARY KEY,
    apartamento_id INTEGER,
    parqueadero_id INTEGER,
    FOREIGN KEY (apartamento_id) REFERENCES apartamentos(id),
    FOREIGN KEY (parqueadero_id) REFERENCES parqueaderos(id)
);

INSERT INTO torres (nombre) VALUES
('Torre A'),
('Torre B');

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
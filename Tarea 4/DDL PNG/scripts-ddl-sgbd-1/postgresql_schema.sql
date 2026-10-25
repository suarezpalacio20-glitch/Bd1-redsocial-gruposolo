-- ============================================================
-- INSTITUCIÓN UNIVERSITARIA PASCUAL BRAVO
-- Asignatura: Bases de Datos - Tarea 4
-- Proyecto: Red Social Estudiantil Pascualina
-- AUTOR: Harold Stevent Suárez Palacio
-- SGBD: PostgreSQL
-- ============================================================

CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    codigo_estudiantil VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    carrera VARCHAR(100) NOT NULL,
    perfil_json JSONB,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE conexiones (
    id_seguidor INT NOT NULL,
    id_seguido INT NOT NULL,
    tipo_relacion VARCHAR(20) CHECK (tipo_relacion IN ('seguidor', 'mentoria')),
    fecha_conexion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_seguidor, id_seguido),
    FOREIGN KEY (id_seguidor) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE,
    FOREIGN KEY (id_seguido) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
);

CREATE TABLE publicaciones (
    id_publicacion SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    contenido TEXT NOT NULL,
    tipo_publicacion VARCHAR(20) CHECK (tipo_publicacion IN ('pregunta', 'recurso', 'noticia', 'meme')),
    metadatos_json JSONB,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
);

CREATE TABLE grupos (
    id_grupo SERIAL PRIMARY KEY,
    nombre_grupo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(50) NOT NULL,
    creador_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (creador_id) REFERENCES estudiantes(id_estudiante) ON DELETE SET NULL
);

CREATE TABLE miembros_grupo (
    id_grupo INT NOT NULL,
    id_estudiante INT NOT NULL,
    rol VARCHAR(20) DEFAULT 'miembro',
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_grupo, id_estudiante),
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
);

CREATE TABLE eventos (
    id_evento SERIAL PRIMARY KEY,
    id_grupo INT NOT NULL,
    nombre_evento VARCHAR(150) NOT NULL,
    fecha_inicio TIMESTAMP NOT NULL,
    lugar VARCHAR(150),
    coordenadas_iot_json JSONB,
    creado_el TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE
);

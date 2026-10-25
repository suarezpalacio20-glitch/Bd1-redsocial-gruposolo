-- ============================================================
-- INSTITUCIÓN UNIVERSITARIA PASCUAL BRAVO
-- Asignatura: Bases de Datos - Tarea 4
-- Proyecto: Red Social Estudiantil Pascualina
-- AUTOR: Harold Stevent Suárez Palacio
-- SGBD: MySQL
-- ============================================================

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    codigo_estudiantil VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    carrera VARCHAR(100) NOT NULL,
    perfil_json JSON,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE conexiones (
    id_seguidor INT NOT NULL,
    id_seguido INT NOT NULL,
    tipo_relacion ENUM('seguidor', 'mentoria') DEFAULT 'seguidor',
    fecha_conexion DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_seguidor, id_seguido),
    CONSTRAINT fk_conexiones_seguidor FOREIGN KEY (id_seguidor) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE,
    CONSTRAINT fk_conexiones_seguido FOREIGN KEY (id_seguido) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE publicaciones (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    contenido TEXT NOT NULL,
    tipo_publicacion ENUM('pregunta', 'recurso', 'noticia', 'meme') NOT NULL,
    metadatos_json JSON,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_publicaciones_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE grupos (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_grupo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(50) NOT NULL,
    creador_id INT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_grupos_creador FOREIGN KEY (creador_id) REFERENCES estudiantes(id_estudiante) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE miembros_grupo (
    id_grupo INT NOT NULL,
    id_estudiante INT NOT NULL,
    rol VARCHAR(20) DEFAULT 'miembro',
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_grupo, id_estudiante),
    CONSTRAINT fk_miembros_grupo FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE,
    CONSTRAINT fk_miembros_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_grupo INT NOT NULL,
    nombre_evento VARCHAR(150) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    lugar VARCHAR(150),
    coordenadas_iot_json JSON,
    creado_el DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_eventos_grupo FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE
) ENGINE=InnoDB;

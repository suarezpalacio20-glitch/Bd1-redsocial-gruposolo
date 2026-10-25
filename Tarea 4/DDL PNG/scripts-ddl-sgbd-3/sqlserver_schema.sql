-- ============================================================
-- INSTITUCIÓN UNIVERSITARIA PASCUAL BRAVO
-- Asignatura: Bases de Datos - Tarea 4
-- Proyecto: Red Social Estudiantil Pascualina
-- AUTOR: Harold Stevent Suárez Palacio
-- SGBD: SQL Server
-- ============================================================

CREATE TABLE estudiantes (
    id_estudiante INT IDENTITY(1,1) PRIMARY KEY,
    codigo_estudiantil VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    carrera VARCHAR(100) NOT NULL,
    perfil_json NVARCHAR(MAX) CHECK (ISJSON(perfil_json) > 0),
    fecha_registro DATETIME DEFAULT GETDATE()
);

CREATE TABLE conexiones (
    id_seguidor INT NOT NULL,
    id_seguido INT NOT NULL,
    tipo_relacion VARCHAR(20) CHECK (tipo_relacion IN ('seguidor', 'mentoria')),
    fecha_conexion DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_conexiones PRIMARY KEY (id_seguidor, id_seguido),
    CONSTRAINT FK_conexiones_seguidor FOREIGN KEY (id_seguidor) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE,
    CONSTRAINT FK_conexiones_seguido FOREIGN KEY (id_seguido) REFERENCES estudiantes(id_estudiante) ON DELETE NO ACTION
);

CREATE TABLE publicaciones (
    id_publicacion INT IDENTITY(1,1) PRIMARY KEY,
    id_estudiante INT NOT NULL,
    contenido NVARCHAR(MAX) NOT NULL,
    tipo_publicacion VARCHAR(20) CHECK (tipo_publicacion IN ('pregunta', 'recurso', 'noticia', 'meme')),
    metadatos_json NVARCHAR(MAX) CHECK (ISJSON(metadatos_json) > 0),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_publicaciones_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
);

CREATE TABLE grupos (
    id_grupo INT IDENTITY(1,1) PRIMARY KEY,
    nombre_grupo VARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    categoria VARCHAR(50) NOT NULL,
    creador_id INT,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_grupos_creador FOREIGN KEY (creador_id) REFERENCES estudiantes(id_estudiante) ON DELETE SET NULL
);

CREATE TABLE miembros_grupo (
    id_grupo INT NOT NULL,
    id_estudiante INT NOT NULL,
    rol VARCHAR(20) DEFAULT 'miembro',
    fecha_ingreso DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_miembros_grupo PRIMARY KEY (id_grupo, id_estudiante),
    CONSTRAINT FK_miembros_grupo FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE,
    CONSTRAINT FK_miembros_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
);

CREATE TABLE eventos (
    id_evento INT IDENTITY(1,1) PRIMARY KEY,
    id_grupo INT NOT NULL,
    nombre_evento VARCHAR(150) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    lugar VARCHAR(150),
    coordenadas_iot_json NVARCHAR(MAX) CHECK (ISJSON(coordenadas_iot_json) > 0),
    creado_el DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_eventos_grupo FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE
);

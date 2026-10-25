# Diccionario de Datos Físico (SQL Server 2016+)
**Proyecto:** Red Social Estudiantil Pascualina  
**Estudiante:** Harold Stevent Suárez Palacio  
**SGBD:** Microsoft SQL Server  

---

## Tabla: estudiantes
| Campo Físico | Tipo SQL Server | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_estudiante` | `INT IDENTITY(1,1)` | 4 bytes | NO | PRIMARY KEY |
| `codigo_estudiantil` | `VARCHAR(20)` | 20 | NO | UNIQUE |
| `nombre` | `VARCHAR(100)` | 100 | NO | - |
| `email` | `VARCHAR(100)` | 100 | NO | UNIQUE |
| `carrera` | `VARCHAR(100)` | 100 | NO | - |
| `perfil_json` | `NVARCHAR(MAX)` | Variable | SI | CHECK (ISJSON(perfil_json) > 0) |
| `fecha_registro` | `DATETIME` | 8 bytes | NO | DEFAULT GETDATE() |

---

## Tabla: conexiones
| Campo Físico | Tipo SQL Server | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_seguidor` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `id_seguido` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE NO ACTION |
| `tipo_relacion` | `VARCHAR(20)` | 20 | SI | CHECK (tipo_relacion IN ('seguidor', 'mentoria')) |
| `fecha_conexion` | `DATETIME` | 8 bytes | NO | DEFAULT GETDATE() |

---

## Tabla: publicaciones
| Campo Físico | Tipo SQL Server | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_publicacion` | `INT IDENTITY(1,1)` | 4 bytes | NO | PRIMARY KEY |
| `id_estudiante` | `INT` | 4 bytes | NO | FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `contenido` | `NVARCHAR(MAX)` | Variable | NO | - |
| `tipo_publicacion` | `VARCHAR(20)` | 20 | SI | CHECK (tipo_publicacion IN ('pregunta', 'recurso', 'noticia', 'meme')) |
| `metadatos_json` | `NVARCHAR(MAX)` | Variable | SI | CHECK (ISJSON(metadatos_json) > 0) (Big Data) |
| `fecha_creacion` | `DATETIME` | 8 bytes | NO | DEFAULT GETDATE() |

---

## Tabla: grupos
| Campo Físico | Tipo SQL Server | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | `INT IDENTITY(1,1)` | 4 bytes | NO | PRIMARY KEY |
| `nombre_grupo` | `VARCHAR(100)` | 100 | NO | - |
| `descripcion` | `NVARCHAR(MAX)` | Variable | SI | - |
| `categoria` | `VARCHAR(50)` | 50 | NO | - |
| `creador_id` | `INT` | 4 bytes | SI | FK -> estudiantes(id_estudiante) ON DELETE SET NULL |
| `fecha_creacion` | `DATETIME` | 8 bytes | NO | DEFAULT GETDATE() |

---

## Tabla: miembros_grupo
| Campo Físico | Tipo SQL Server | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | `INT` | 4 bytes | NO | PK, FK -> grupos(id_grupo) ON DELETE CASCADE |
| `id_estudiante` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `rol` | `VARCHAR(20)` | 20 | SI | DEFAULT 'miembro' |
| `fecha_ingreso` | `DATETIME` | 8 bytes | NO | DEFAULT GETDATE() |

---

## Tabla: eventos
| Campo Físico | Tipo SQL Server | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_evento` | `INT IDENTITY(1,1)` | 4 bytes | NO | PRIMARY KEY |
| `id_grupo` | `INT` | 4 bytes | NO | FK -> grupos(id_grupo) ON DELETE CASCADE |
| `nombre_evento` | `VARCHAR(150)` | 150 | NO | - |
| `fecha_inicio` | `DATETIME` | 8 bytes | NO | - |
| `lugar` | `VARCHAR(150)` | 150 | SI | - |
| `coordenadas_iot_json` | `NVARCHAR(MAX)` | Variable | SI | CHECK (ISJSON(coordenadas_iot_json) > 0) (IoT) |
| `creado_el` | `DATETIME` | 8 bytes | NO | DEFAULT GETDATE() |
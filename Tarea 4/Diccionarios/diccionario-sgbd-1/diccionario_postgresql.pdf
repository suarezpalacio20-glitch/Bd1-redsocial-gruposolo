# Diccionario de Datos Físico (PostgreSQL 14+)
**Proyecto:** Red Social Estudiantil Pascualina  
**Estudiante:** Harold Stevent Suárez Palacio  
**SGBD:** PostgreSQL  

---

## Tabla: estudiantes
| Campo Físico | Tipo PostgreSQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_estudiante` | `SERIAL` | 4 bytes | NO | PRIMARY KEY |
| `codigo_estudiantil` | `VARCHAR(20)` | 20 | NO | UNIQUE |
| `nombre` | `VARCHAR(100)` | 100 | NO | - |
| `email` | `VARCHAR(100)` | 100 | NO | UNIQUE |
| `carrera` | `VARCHAR(100)` | 100 | NO | - |
| `perfil_json` | `JSONB` | Variable | SI | Columna semiestructurada (Atributos dinámicos) |
| `fecha_registro` | `TIMESTAMP` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: conexiones
| Campo Físico | Tipo PostgreSQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_seguidor` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `id_seguido` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `tipo_relacion` | `VARCHAR(20)` | 20 | SI | CHECK (tipo_relacion IN ('seguidor', 'mentoria')) |
| `fecha_conexion` | `TIMESTAMP` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: publicaciones
| Campo Físico | Tipo PostgreSQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_publicacion` | `SERIAL` | 4 bytes | NO | PRIMARY KEY |
| `id_estudiante` | `INT` | 4 bytes | NO | FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `contenido` | `TEXT` | Variable | NO | - |
| `tipo_publicacion` | `VARCHAR(20)` | 20 | SI | CHECK (tipo_publicacion IN ('pregunta', 'recurso', 'noticia', 'meme')) |
| `metadatos_json` | `JSONB` | Variable | SI | Registro de métricas Big Data |
| `fecha_creacion` | `TIMESTAMP` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: grupos
| Campo Físico | Tipo PostgreSQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | `SERIAL` | 4 bytes | NO | PRIMARY KEY |
| `nombre_grupo` | `VARCHAR(100)` | 100 | NO | - |
| `descripcion` | `TEXT` | Variable | SI | - |
| `categoria` | `VARCHAR(50)` | 50 | NO | - |
| `creador_id` | `INT` | 4 bytes | SI | FK -> estudiantes(id_estudiante) ON DELETE SET NULL |
| `fecha_creacion` | `TIMESTAMP` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: miembros_grupo
| Campo Físico | Tipo PostgreSQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | `INT` | 4 bytes | NO | PK, FK -> grupos(id_grupo) ON DELETE CASCADE |
| `id_estudiante` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `rol` | `VARCHAR(20)` | 20 | SI | DEFAULT 'miembro' |
| `fecha_ingreso` | `TIMESTAMP` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: eventos
| Campo Físico | Tipo PostgreSQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_evento` | `SERIAL` | 4 bytes | NO | PRIMARY KEY |
| `id_grupo` | `INT` | 4 bytes | NO | FK -> grupos(id_grupo) ON DELETE CASCADE |
| `nombre_evento` | `VARCHAR(150)` | 150 | NO | - |
| `fecha_inicio` | `TIMESTAMP` | 8 bytes | NO | - |
| `lugar` | `VARCHAR(150)` | 150 | SI | - |
| `coordenadas_iot_json` | `JSONB` | Variable | SI | Sensores y geolocalización de campus IoT |
| `creado_el` | `TIMESTAMP` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |
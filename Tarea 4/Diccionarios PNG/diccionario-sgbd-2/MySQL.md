# Diccionario de Datos Físico (MySQL 8.0+)
**Proyecto:** Red Social Estudiantil Pascualina  
**Estudiante:** Harold Stevent Suárez Palacio  
**SGBD:** MySQL  

---

## Tabla: estudiantes
| Campo Físico | Tipo MySQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_estudiante` | `INT AUTO_INCREMENT` | 4 bytes | NO | PRIMARY KEY |
| `codigo_estudiantil` | `VARCHAR(20)` | 20 | NO | UNIQUE |
| `nombre` | `VARCHAR(100)` | 100 | NO | - |
| `email` | `VARCHAR(100)` | 100 | NO | UNIQUE |
| `carrera` | `VARCHAR(100)` | 100 | NO | - |
| `perfil_json` | `JSON` | Variable | SI | Tipo nativo JSON MySQL |
| `fecha_registro` | `DATETIME` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: conexiones
| Campo Físico | Tipo MySQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_seguidor` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `id_seguido` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `tipo_relacion` | `ENUM('seguidor', 'mentoria')` | 1 byte | SI | DEFAULT 'seguidor' |
| `fecha_conexion` | `DATETIME` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: publicaciones
| Campo Físico | Tipo MySQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_publicacion` | `INT AUTO_INCREMENT` | 4 bytes | NO | PRIMARY KEY |
| `id_estudiante` | `INT` | 4 bytes | NO | FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `contenido` | `TEXT` | Variable | NO | - |
| `tipo_publicacion` | `ENUM('pregunta', 'recurso', 'noticia', 'meme')` | 1 byte | NO | - |
| `metadatos_json` | `JSON` | Variable | SI | Métricas de Big Data |
| `fecha_creacion` | `DATETIME` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: grupos
| Campo Físico | Tipo MySQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | `INT AUTO_INCREMENT` | 4 bytes | NO | PRIMARY KEY |
| `nombre_grupo` | `VARCHAR(100)` | 100 | NO | - |
| `descripcion` | `TEXT` | Variable | SI | - |
| `categoria` | `VARCHAR(50)` | 50 | NO | - |
| `creador_id` | `INT` | 4 bytes | SI | FK -> estudiantes(id_estudiante) ON DELETE SET NULL |
| `fecha_creacion` | `DATETIME` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: miembros_grupo
| Campo Físico | Tipo MySQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | `INT` | 4 bytes | NO | PK, FK -> grupos(id_grupo) ON DELETE CASCADE |
| `id_estudiante` | `INT` | 4 bytes | NO | PK, FK -> estudiantes(id_estudiante) ON DELETE CASCADE |
| `rol` | `VARCHAR(20)` | 20 | SI | DEFAULT 'miembro' |
| `fecha_ingreso` | `DATETIME` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |

---

## Tabla: eventos
| Campo Físico | Tipo MySQL | Tamaño | Nullable | Claves / Restricciones |
| :--- | :--- | :--- | :--- | :--- |
| `id_evento` | `INT AUTO_INCREMENT` | 4 bytes | NO | PRIMARY KEY |
| `id_grupo` | `INT` | 4 bytes | NO | FK -> grupos(id_grupo) ON DELETE CASCADE |
| `nombre_evento` | `VARCHAR(150)` | 150 | NO | - |
| `fecha_inicio` | `DATETIME` | 8 bytes | NO | - |
| `lugar` | `VARCHAR(150)` | 150 | SI | - |
| `coordenadas_iot_json` | `JSON` | Variable | SI | Sensores y geolocalización IoT |
| `creado_el` | `DATETIME` | 8 bytes | NO | DEFAULT CURRENT_TIMESTAMP |
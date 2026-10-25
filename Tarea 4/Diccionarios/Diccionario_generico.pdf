# Diccionario de Datos Genérico (Modelo Lógico Abstracto)
**Proyecto:** Red Social Estudiantil Pascualina  
**Estudiante:** Harold Stevent Suárez Palacio  
**Asignatura:** Bases de Datos - Tarea 4  

---

## Tabla: estudiantes
| Atributo | Tipo Lógico | Requerido | Clave | Descripción / Dominio |
| :--- | :--- | :--- | :--- | :--- |
| `id_estudiante` | Entero Autoincremental | Sí | PK | Identificador único del estudiante. |
| `codigo_estudiantil` | Cadena Texto (20) | Sí | Único | Código institucional. |
| `nombre` | Cadena Texto (100) | Sí | No | Nombre completo. |
| `email` | Cadena Texto (100) | Sí | Único | Correo institucional. |
| `carrera` | Cadena Texto (100) | Sí | No | Programa académico. |
| `perfil_json` | Objeto Estructurado | No | No | Habilidades e intereses en formato dinámico (Big Data). |
| `fecha_registro` | Fecha y Hora | Sí | No | Fecha de creación de la cuenta. |

---

## Tabla: conexiones
| Atributo | Tipo Lógico | Requerido | Clave | Descripción / Dominio |
| :--- | :--- | :--- | :--- | :--- |
| `id_seguidor` | Entero | Sí | PK, FK | Referencia a `estudiantes(id_estudiante)`. |
| `id_seguido` | Entero | Sí | PK, FK | Referencia a `estudiantes(id_estudiante)`. |
| `tipo_relacion` | Texto / Opciones | Sí | No | Dominio: 'seguidor', 'mentoria'. |
| `fecha_conexion` | Fecha y Hora | Sí | No | Momento en que se estableció la relación. |

---

## Tabla: publicaciones
| Atributo | Tipo Lógico | Requerido | Clave | Descripción / Dominio |
| :--- | :--- | :--- | :--- | :--- |
| `id_publicacion` | Entero Autoincremental | Sí | PK | Identificador de la publicación. |
| `id_estudiante` | Entero | Sí | FK | Referencia al autor `estudiantes(id_estudiante)`. |
| `contenido` | Texto Largo | Sí | No | Texto del post o pregunta. |
| `tipo_publicacion` | Texto / Opciones | Sí | No | Dominio: 'pregunta', 'recurso', 'noticia', 'meme'. |
| `metadatos_json` | Objeto Estructurado | No | No | Registros de Big Data (dispositivo, interacciones). |
| `fecha_creacion` | Fecha y Hora | Sí | No | Timestamp de publicación. |

---

## Tabla: grupos
| Atributo | Tipo Lógico | Requerido | Clave | Descripción / Dominio |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | Entero Autoincremental | Sí | PK | Identificador único del grupo. |
| `nombre_grupo` | Cadena Texto (100) | Sí | No | Nombre del club o grupo de estudio. |
| `descripcion` | Texto Largo | No | No | Detalles del grupo. |
| `categoria` | Cadena Texto (50) | Sí | No | Área temática (ej. Hackathon, Videojuegos). |
| `creador_id` | Entero | No | FK | Referencia al creador `estudiantes(id_estudiante)`. |
| `fecha_creacion` | Fecha y Hora | Sí | No | Timestamp de creación. |

---

## Tabla: miembros_grupo
| Atributo | Tipo Lógico | Requerido | Clave | Descripción / Dominio |
| :--- | :--- | :--- | :--- | :--- |
| `id_grupo` | Entero | Sí | PK, FK | Referencia a `grupos(id_grupo)`. |
| `id_estudiante` | Entero | Sí | PK, FK | Referencia a `estudiantes(id_estudiante)`. |
| `rol` | Cadena Texto (20) | Sí | No | Rol del usuario ('lider', 'miembro'). |
| `fecha_ingreso` | Fecha y Hora | Sí | No | Fecha de unirse al grupo. |

---

## Tabla: eventos
| Atributo | Tipo Lógico | Requerido | Clave | Descripción / Dominio |
| :--- | :--- | :--- | :--- | :--- |
| `id_evento` | Entero Autoincremental | Sí | PK | Identificador del evento. |
| `id_grupo` | Entero | Sí | FK | Referencia al grupo organizador. |
| `nombre_evento` | Cadena Texto (150) | Sí | No | Título de la actividad o taller. |
| `fecha_inicio` | Fecha y Hora | Sí | No | Fecha y hora programada. |
| `lugar` | Cadena Texto (150) | No | No | Aula, espacio físico o virtual. |
| `coordenadas_iot_json` | Objeto Estructurado | No | No | Datos de sensores / GPS (Lat, Long, Aforo IoT). |
| `creado_el` | Fecha y Hora | Sí | No | Timestamp de creación. |
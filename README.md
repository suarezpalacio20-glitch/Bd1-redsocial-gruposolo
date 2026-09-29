# Red Social Pascualina — Modelo de Base de Datos

## Nombre del proyecto
**bd1e** — Diseño conceptual y lógico de base de datos para la red social estudiantil "Pascualina".

## Integrante
- Harold Stevent Suarez Palacio

## Descripción del caso
Red Social Pascualina nace para mejorar la comunicación e interacción entre estudiantes, complementando a las plataformas institucionales formales, que suelen ser demasiado rígidas para la conexión casual entre pares. La plataforma permite a los usuarios:

- **Crear perfiles**, compartiendo su área de estudio, intereses y habilidades (disciplinas académicas o deportes).
- **Conectar con compañeros**, siguiendo a otros estudiantes con intereses similares o a alumnos avanzados que puedan ofrecer mentoría.
- **Publicar actualizaciones**: preguntas sobre tareas, recursos útiles, noticias de tecnología o memes universitarios.
- **Crear y unirse a grupos**: grupos de estudio, equipos de hackatón o clubes de interés.
- **Programar eventos**: reuniones de estudio, talleres o actividades sociales.

Este repositorio documenta el proceso de análisis y diseño mediante el Modelo Entidad-Relación (MER), como parte de la Tarea 1 del curso.

## Estructura del repositorio
```
Tarea1/
├── Informe/     -> Memoria justificativa y diagrama MER
└── Video/       -> Video de presentación del equipo
```


# 🌐 Bd1-redsocial-gruposolo

Este repositorio contiene el desarrollo del proyecto de Red Social para la asignatura de **Bases de Datos 1**. Aquí se irán subiendo todas las entregas, tareas y scripts correspondientes al diseño e implementación del sistema.

## 📁 Estructura del Proyecto

* **`/Tarea1`:** Contiene los archivos, diagramas o scripts correspondientes a la primera entrega del curso.
* **`README.md`:** Este archivo con las instrucciones y documentación general.

## 🛠️ Tecnologías y Herramientas

* **Base de Datos:** MySQL / PostgreSQL / Oracle
* **Modelado:** Diagramas Entidad-Relación (DER)
* **Lenguaje de programación:** Python / Java / PHP (si aplica)

## 🚀 Cómo ejecutar o revisar las tareas

1. Revisa el contenido de la carpeta de la tarea correspondiente (por ejemplo, `Tarea1`).
2. Sigue las instrucciones específicas del archivo de la tarea o ejecuta los scripts SQL adjuntos en tu gestor de base de datos.

## ✒️ Autor

* **Harold Stevent Suarez Palacio** - [Mi GitHub](https://github.com)
* **Curso:** Bases de Datos 1
* **Centro educativo:** Instituto Universitario Pascual Bravo

## 📖 Diccionario de Datos (Red Social Estudiantil)

A continuación se detallan las tablas principales del sistema con sus respectivos campos, tipos de datos y restricciones:

### 1. Tabla: `Usuario`
Almacena la información de los estudiantes registrados en la plataforma.

| Campo | Tipo de Datos | Restricciones | Descripción |
| :--- | :--- | :--- | :--- |
| `id_usuario` | ENTERO | PK, Autoincremental | Identificador único del estudiante. |
| `nombre` | TEXTO (100) | No Nulo | Nombre completo del usuario. |
| `correo` | TEXTO (100) | No Nulo, Único | Correo institucional del estudiante. |
| `fecha_registro`| FECHA | No Nulo | Día en que se creó la cuenta. |

### 2. Tabla: `Publicacion`
Almacena las actualizaciones y recursos compartidos por los usuarios.

| Campo | Tipo de Datos | Restricciones | Descripción |
| :--- | :--- | :--- | :--- |
| `id_publicacion`| ENTERO | PK, Autoincremental | Identificador único del post. |
| `contenido` | TEXTO (M text) | No Nulo | Mensaje o recurso compartido. |
| `fecha_creacion`| FECHA / HORA | No Nulo | Momento exacto de la publicación. |
| `id_usuario` | ENTERO | FK (Usuario) | Relación con el estudiante que publicó. |

### 3. Tabla: `Grupo`
Almacena los grupos de estudio o eventos informales creados en la red.

| Campo | Tipo de Datos | Restricciones | Descripción |
| :--- | :--- | :--- | :--- |
| `id_grupo` | ENTERO | PK, Autoincremental | Identificador único del grupo. |
| `nombre_grupo` | TEXTO (100) | No Nulo | Nombre de la materia o tema del grupo. |
| `descripcion` | TEXTO (255) | Opcional | Propósito del grupo de estudio. |



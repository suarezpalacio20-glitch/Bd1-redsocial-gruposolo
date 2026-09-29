# 📊 Tarea 2: Modelo Lógico, Normalización y Diccionario de Datos

Este documento contiene el desarrollo completo del diseño lógico para la Red Social Estudiantil Pascualina, aplicando los conceptos de análisis de sistemas y normalización de bases de datos.

---

## 1. 🔍 Análisis de Necesidades y Lluvia de Ideas

Tras revisar las necesidades declaradas para la plataforma, el equipo identificó las siguientes acciones clave que debe lograr el usuario y que la base de datos debe soportar:
* **Gestión de Identidad:** El usuario debe poder registrarse con su correo institucional, contraseña y especificar su área de estudio/intereses para configurar su perfil.
* **Interacción Social:** Capacidad de seguir a otros estudiantes y establecer conexiones de mentoría o tutoría académica.
* **Contenido Educativo y Recreativo:** Espacio para publicar actualizaciones de texto, compartir recursos digitales (guías, enlaces) y contenido informal (memes universitarios).
* **Organización Grupal:** Creación de comunidades específicas por materias o afinidades (ej. semilleros, hackatones, videojuegos).
* **Gestión de Eventos:** Programación y coordinación de talleres, salas de estudio y actividades sociales con fecha y hora específicas.

---

## 2. 🗺️ Mapa de Conceptos (Entidades y Relaciones)

A partir de la lluvia de ideas, se definieron las siguientes entidades iniciales antes del proceso de normalización:
* **USUARIO:** Atributos de registro, perfil e intereses.
* **PUBLICACIÓN:** Mensajes, recursos compartidos y autoría.
* **GRUPO:** Datos del grupo de estudio o club.
* **EVENTO:** Fechas, descripciones y coordinadores.

---

## 📐 3. Proceso de Normalización (1FN, 2FN y 3FN)

Para garantizar la integridad de los datos y eliminar la redundancia (datos repetidos), se aplicó el proceso de normalización partiendo de una lista general de datos sin estructura:

### Primera Forma Normal (1FN)
* **Regla:** Eliminar grupos repetidos y asegurar que cada campo contenga solo valores atómicos (un solo dato por celda).
* **Acción:** Se eliminaron campos multivalor como "intereses_usuario" o "miembros_grupo" de la tabla principal, separando las relaciones en registros individuales.

### Segunda Forma Normal (2FN)
* **Regla:** Estar en 1FN y asegurar que todos los atributos que no forman parte de la clave primaria tengan dependencia funcional completa de toda la clave primaria.
* **Acción:** Se separaron los datos específicos del usuario de los datos de las publicaciones. Una publicación depende de su propio código identificador, no de los datos personales del estudiante que la creó. Se crearon tablas independientes unidas por Claves Foráneas (FK).

### Tercera Forma Normal (3FN)
* **Regla:** Estar en 2FN y eliminar las dependencias transitivas (atributos que dependen de otros atributos que no son la clave primaria).
* **Acción:** En la gestión de eventos y grupos, los detalles de la materia o carrera se independizaron para evitar que el cambio de nombre de una carrera obligara a modificar miles de registros de perfiles de estudiantes.

---

## 📖 4. Diccionario de Datos Oficial

A continuación se detalla el modelo lógico final normalizado con sus tipos de datos, restricciones y propósitos:

### Tabla 1: `Usuario`
Almacena la información de los estudiantes del Pascual Bravo.
* **`id_usuario`**: ENTERO | PK (Llave Primaria) Autoincremental. Identificador único.
* **`nombre`**: TEXTO (100) | No Nulo. Nombre completo del estudiante.
* **`correo`**: TEXTO (100) | No Nulo, Único. Correo institucional.
* **`contrasena`**: TEXTO (255) | No Nulo. Clave de acceso encriptada.
* **`area_estudio`**: TEXTO (100) | Opcional. Carrera o facultad a la que pertenece.

### Tabla 2: `Publicacion`
Almacena las actualizaciones y recursos compartidos.
* **`id_publicacion`**: ENTERO | PK Autoincremental. Código de la publicación.
* **`contenido`**: TEXTO (Largo) | No Nulo. Mensaje, duda o enlace de recurso.
* **`fecha_creacion`**: FECHA/HORA | No Nulo. Momento exacto del post.
* **`id_usuario`**: ENTERO | FK (Llave Foránea) vinculada a `Usuario(id_usuario)`. Define el autor.

### Tabla 3: `Grupo`
Gestiona los equipos de estudio, hackatones o clubes informales.
* **`id_grupo`**: ENTERO | PK Autoincremental. Código único del grupo.
* **`nombre_grupo`**: TEXTO (100) | No Nulo. Nombre de la materia o interés.
* **`descripcion`**: TEXTO (255) | Opcional. Propósito del grupo de estudio.

### Tabla 4: `Evento`
Coordina los talleres, reuniones académicas o actividades sociales.
* **`id_evento`**: ENTERO | PK Autoincremental. Identificador del evento.
* **`titulo_evento`**: TEXTO (150) | No Nulo. Nombre del taller o actividad.
* **`fecha_hora`**: FECHA/HORA | No Nulo. Cuándo se realizará la reunión.
* **`id_grupo`**: ENTERO | FK vinculada a `Grupo(id_grupo)`. Indica qué grupo organiza.

---

## ✒️ Memoria Justificativa Corta
El modelo propuesto resuelve eficientemente el reto de la Red Social Pascualina. Al separar el diseño en las tablas `Usuario`, `Publicacion`, `Grupo` y `Evento`, la base de datos permite un crecimiento modular (escalabilidad) sin corromper los datos ni generar duplicidad. Las relaciones mediante Claves Foráneas (FK) garantizan la integridad referencial, asegurando que ninguna publicación o evento quede huérfano si un estudiante se da de baja del sistema.


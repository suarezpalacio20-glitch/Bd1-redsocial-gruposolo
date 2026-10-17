# Tarea 3 - Red Social Estudiantil Pascualina (Modelo físico / DDL)

**SGBD:** PostgreSQL 15+ (verificado en 16) · **Herramienta gráfica:** pgAdmin 4

## Autor
- Harold Stevent Suarez Palacio

**Curso:** Bases de Datos I · **Docente:** Oralia Cortés Grajales · **Institución:** Instituto Universitario Pascual Bravo

## Estructura de la carpeta
```
Tarea3/
├── README.md
├── red_social_pascualina_ddl.sql   # Modelo físico (12 tablas, 18 FK, 14 índices)
├── pruebas_ddl.sql                 # Pruebas de restricciones (se revierten con ROLLBACK)
├── Informe/
│   └── Informe_Tarea3_Red_Social_Pascualina.pdf
└── Video/
    └── enlace-video.txt            # Enlace a YouTube (5-10 min)
```

## Cómo ejecutar
```bash
createdb pascualina
psql -d pascualina -v ON_ERROR_STOP=1 -f red_social_pascualina_ddl.sql
psql -d pascualina -f pruebas_ddl.sql     # opcional
```
En pgAdmin 4: clic derecho sobre la base de datos → *Query Tool* → abrir el `.sql` → ejecutar (F5).

## Tablas
`programa_academico`, `interes`, `usuario`, `usuario_interes`, `seguimiento`, `grupo`,
`miembro_grupo`, `publicacion`, `comentario`, `reaccion`, `evento`, `asistencia_evento`.

## Nomenclatura
snake_case en minúsculas, tablas en singular, PK `id_<tabla>`, restricciones `pk_ fk_ uq_ ck_`, índices `ix_`.
Todo el modelo vive en el esquema `red_social`.

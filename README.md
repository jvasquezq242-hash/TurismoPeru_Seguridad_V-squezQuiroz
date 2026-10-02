# TurismoPeru_Seguridad_VásquezQuiroz

**Estudiante:** Vásquez Quiroz  
**Curso:** Base de Datos II - Grupo B  
**Institución:** Universidad Nacional de Cajamarca  

---

## 📌 Descripción del Proyecto
Implementación del mecanismo básico de administración, seguridad, importación de datos y análisis para el sistema de información de la empresa **TurismoPeru_JDVQ**.

---

## 🔐 Principio de Mínimo Privilegio (Justificación)
**¿Por qué no es adecuado asignar `db_owner` al vendedor o al analista?**
Asignar el rol `db_owner` otorga control total sobre el esquema y los datos de la base de datos (incluyendo eliminación de tablas, modificación de permisos, truncado de registros y gestión de backups). 
* **Vendedor:** Únicamente requiere permisos operativos de consulta e inserción de clientes y reservas. Otorgarle `db_owner` le permitiría eliminar información crítica o modificar la estructura del sistema.
* **Analista:** Solo requiere permisos de lectura (`SELECT`) para la generación de reportes. Asignarle un rol con privilegios elevados rompería el principio de mínimo privilegio y expondría la integridad de la base de datos a modificaciones no autorizadas.

---

## 📁 Estructura del Repositorio
```text
TurismoPeru_Seguridad_VásquezQuiroz/
├── README.md
├── .gitignore
├── 01_usuarios_roles/
│   ├── 01_logins.sql
│   ├── 02_users.sql
│   ├── 03_roles.sql
│   └── 04_permisos.sql
├── 02_importacion_exportacion/
│   └── importacion.sql
├── 03_backups/
│   └── backup_full.sql
├── 04_seguridad/
│   └── pruebas_permisos.sql
├── 05_reportes/
│   └── consultas_reportes.sql
└── evidencias/
    ├── login.png
    ├── permisos.png
    ├── backup.png
    └── reporte.png
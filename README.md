# Examen Práctico: Seguridad y Administración en SQL Server - TurismoPerú

**Universidad Nacional de Cajamarca**  
**Facultad de Ingeniería**  
**Escuela Académico Profesional de Ingeniería de Sistemas**  

---

## 📌 Datos de la Evaluación
* **Proyecto:** `TurismoPeru_Seguridad_VásquezQuiroz`
* **Base de Datos:** `TURISMOPERU_JDVQ`
* **Autor:** Vásquez Quiroz, J. D.
* **Repositorio GitHub:** [https://github.com/jvasquezq242-hash/TurismoPeru_Seguridad_V-squezQuiroz](https://github.com/jvasquezq242-hash/TurismoPeru_Seguridad_V-squezQuiroz)

---

## 📂 Estructura del Repositorio

```text
TurismoPeru_Seguridad_VásquezQuiroz/
│
├── 01_usuarios_roles/
│   ├── 01_logins.sql           # Creación de Inicios de Sesión (Logins) a nivel de servidor
│   ├── 02_users.sql            # Mapeo de Usuarios en la BD TURISMOPERU_JDVQ
│   ├── 03_roles.sql            # Definición de Roles personalizados de base de datos
│   └── 04_permisos.sql         # Asignación de permisos GRANT / DENY / REVOKE
│
├── 02_importacion_exportacion/
│   └── importacion.sql         # Carga masiva e importación de datos iniciales
│
├── 03_backups/
│   └── backup_full.sql         # Script para la generación de respaldos completos (.bak / .bacpac)
│
├── 04_seguridad/
│   └── pruebas_permisos.sql    # Pruebas y validaciones del Principio de Mínimo Privilegio
│
├── 05_reportes/
│   └── consultas_reportes.sql # Consultas T-SQL analíticas (KPIs y agregaciones)
│
├── 06_powerbi/
│   └── dashboard.pbix          # Informe y Dashboard interactivo en Power BI Desktop
│
├── evidencias/
│   ├── backup.png              # Captura de respaldo exitoso
│   ├── github.png              # Captura del repositorio sincronizado
│   ├── login.png               # Captura de autenticación exitosa en SQL Server
│   ├── permisos.png            # Captura de denegación de permisos (INSERT denegado)
│   └── reporte.png             # Captura de resultados de las consultas de reporte
│
├── .gitignore                  # Exclusión de archivos temporales
└── README.md                   # Documentación general del proyecto# Examen Práctico: Seguridad y Administración en SQL Server - TurismoPerú

**Universidad Nacional de Cajamarca**  
**Facultad de Ingeniería**  
**Escuela Académico Profesional de Ingeniería de Sistemas**  

---

## 📌 Datos de la Evaluación
* **Proyecto:** `TurismoPeru_Seguridad_VásquezQuiroz`
* **Base de Datos:** `TURISMOPERU_JDVQ`
* **Autor:** Vásquez Quiroz, J. D.
* **Repositorio GitHub:** [https://github.com/jvasquezq242-hash/TurismoPeru_Seguridad_V-squezQuiroz](https://github.com/jvasquezq242-hash/TurismoPeru_Seguridad_V-squezQuiroz)

---

## 📂 Estructura del Repositorio

```text
TurismoPeru_Seguridad_VásquezQuiroz/
│
├── 01_usuarios_roles/
│   ├── 01_logins.sql           # Creación de Inicios de Sesión (Logins) a nivel de servidor
│   ├── 02_users.sql            # Mapeo de Usuarios en la BD TURISMOPERU_JDVQ
│   ├── 03_roles.sql            # Definición de Roles personalizados de base de datos
│   └── 04_permisos.sql         # Asignación de permisos GRANT / DENY / REVOKE
│
├── 02_importacion_exportacion/
│   └── importacion.sql         # Carga masiva e importación de datos iniciales
│
├── 03_backups/
│   └── backup_full.sql         # Script para la generación de respaldos completos (.bak / .bacpac)
│
├── 04_seguridad/
│   └── pruebas_permisos.sql    # Pruebas y validaciones del Principio de Mínimo Privilegio
│
├── 05_reportes/
│   └── consultas_reportes.sql # Consultas T-SQL analíticas (KPIs y agregaciones)
│
├── 06_powerbi/
│   └── dashboard.pbix          # Informe y Dashboard interactivo en Power BI Desktop
│
├── evidencias/
│   ├── backup.png              # Captura de respaldo exitoso
│   ├── github.png              # Captura del repositorio sincronizado
│   ├── login.png               # Captura de autenticación exitosa en SQL Server
│   ├── permisos.png            # Captura de denegación de permisos (INSERT denegado)
│   └── reporte.png             # Captura de resultados de las consultas de reporte
│
├── .gitignore                  # Exclusión de archivos temporales
└── README.md                   # Documentación general del proyecto
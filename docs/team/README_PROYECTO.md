# 🏗️ Proyecto: Generación Automática de Diccionario de Datos SQL

## 📋 Descripción General

Este proyecto automatiza la extracción de definiciones de tablas desde documentos Word de especificaciones técnicas y genera automáticamente:

- **Scripts SQL CREATE TABLE** con comentarios descriptivos completos
- **Diccionario de datos** en formatos Excel y JSON  
- **Documentación técnica** estructurada y organizada

---

## 🎯 Objetivos del Proyecto

### ✅ Objetivos Principales
- ✅ **Automatizar** la generación de scripts SQL desde documentos Word
- ✅ **Estandarizar** el proceso de creación de diccionarios de datos
- ✅ **Reducir errores** humanos en la interpretación de especificaciones
- ✅ **Mejorar la productividad** del equipo de datos
- ✅ **Crear documentación** comprensible para todo el equipo

### 🎯 Beneficios Esperados
- **90% reducción** en tiempo de generación de scripts SQL
- **100% consistencia** en nomenclatura y tipos de datos
- **Documentación automática** para auditorías y compliance
- **Trazabilidad completa** de cambios y versiones

---

## 📁 Estructura del Proyecto

```
KDC/
├── 📄 020IN SAT Interfaces v7.5- vol I - Batch_NUEK (1).docx  # Documento fuente
├── 📂 docs/
│   ├── 📂 team/           # Documentación para el equipo
│   ├── 📂 technical/      # Documentación técnica
│   └── 📂 guides/         # Guías y manuales
├── 📂 scripts/
│   ├── 📂 versions/       # Versiones históricas de scripts
│   └── 📂 utils/          # Utilidades y herramientas
├── 📂 sql/
│   ├── 📂 final/          # Scripts SQL finales
│   └── 📂 versions/       # Versiones históricas de SQL
├── 📂 data-dictionary/    # Diccionarios de datos generados
├── 📂 reports/            # Reportes y análisis
└── 📂 assets/            # Recursos adicionales
```

---

## 🚀 Cómo Usar el Sistema

### 1️⃣ **Preparación**
```bash
# Instalar dependencias
python3 -m venv venv
source venv/bin/activate
pip install python-docx pandas openpyxl
```

### 2️⃣ **Ejecutar Procesamiento**
```bash
# Generar diccionario completo
python scripts/generar_diccionario_datos.py
```

### 3️⃣ **Revisar Resultados**
- **SQL**: `sql/final/scripts_sql_con_descripciones.sql`
- **Excel**: `data-dictionary/diccionario_datos.xlsx`
- **JSON**: `data-dictionary/diccionario_datos.json`

---

## 📊 Resultados Esperados

| Métrica | Valor Esperado |
|---------|----------------|
| **Tablas Procesadas** | ~550 tablas |
| **Campos Totales** | ~3,000 campos |
| **Tiempo de Procesamiento** | < 5 minutos |
| **Precisión** | > 95% |
| **Áreas de Negocio** | ~8 categorías |

---

## 👥 Roles del Equipo

### 🏗️ **Data Engineer**
- Ejecutar scripts de generación
- Validar tipos de datos
- Optimizar performance

### 📊 **Data Analyst**
- Revisar diccionario de datos
- Validar nomenclatura de campos
- Crear reportes de calidad

### 🧪 **QA Tester**
- Validar scripts SQL generados
- Verificar integridad de datos
- Documentar issues encontrados

### 👨‍💼 **Project Manager**
- Coordinar entregas
- Gestionar versionado
- Comunicar avances

---

## 📈 Control de Calidad

### ✅ **Criterios de Aceptación**
- [ ] SQL ejecuta sin errores
- [ ] Todos los campos tienen descripción
- [ ] Tipos de datos son correctos
- [ ] Nomenclatura sigue estándares
- [ ] Documentación está completa

### 🔍 **Checklist de Revisión**
- [ ] Nombres de tablas sin espacios
- [ ] Tipos de datos optimizados
- [ ] Comentarios descriptivos presentes
- [ ] JSON válido generado
- [ ] Excel formateado correctamente

---

## 🔄 Proceso de Mejora Continua

### 📝 **Registro de Cambios**
- Todas las mejoras se documentan en `docs/technical/changelog.md`
- Versiones se mantienen en carpetas específicas
- Issues se registran en `reports/issues_log.md`

### 🎯 **Próximas Mejoras**
1. **Validación automática** de tipos de datos
2. **Integración con Git** para control de versiones
3. **Dashboard web** para visualización
4. **Tests automatizados** de validación
5. **Integración con Confluence** para documentación

---

## 📞 Contacto y Soporte

### 🆘 **En Caso de Problemas**
1. Revisar `docs/guides/troubleshooting.md`
2. Consultar `reports/issues_log.md`
3. Contactar al Data Engineer responsable

### 📧 **Canales de Comunicación**
- **Slack**: #data-engineering-kdc
- **Email**: data-team@kdc.com
- **Documentación**: Confluence KDC

---

## 📚 Documentación Adicional

| Documento | Ubicación | Descripción |
|-----------|-----------|-------------|
| **Manual Técnico** | `docs/technical/manual_tecnico.md` | Detalles de implementación |
| **Guía de Usuario** | `docs/guides/guia_usuario.md` | Instrucciones paso a paso |
| **Troubleshooting** | `docs/guides/troubleshooting.md` | Solución de problemas |
| **Changelog** | `docs/technical/changelog.md` | Registro de cambios |
| **Issues Log** | `reports/issues_log.md` | Registro de problemas |

---

> **📌 Nota**: Este es un documento vivo que se actualiza con cada versión del proyecto. Última actualización: 2024
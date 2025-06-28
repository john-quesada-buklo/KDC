# 👥 Guía de Usuario - Generador de Diccionario de Datos

## 🎯 Introducción

Esta guía te ayudará a usar el sistema de generación automática de diccionarios de datos desde documentos Word de manera sencilla y efectiva.

---

## 📋 Requisitos Previos

### ✅ **Lo que necesitas:**
- 🖥️ **Computadora** con Python 3.8 o superior
- 📄 **Documento Word** con las especificaciones de tablas
- 🌐 **Conexión a internet** (para instalar dependencias)
- ⏱️ **5-10 minutos** de tiempo disponible

### ⚠️ **Antes de empezar:**
- [ ] Verificar que el documento Word esté en formato `.docx`
- [ ] Confirmar que tienes permisos de escritura en el directorio
- [ ] Cerrar el documento Word si está abierto

---

## 🚀 Pasos para Usar el Sistema

### 1️⃣ **Preparación del Entorno**

#### **Opción A: Primera vez (Instalación completa)**
```bash
# 1. Crear entorno virtual
python3 -m venv venv

# 2. Activar entorno virtual
# En Linux/Mac:
source venv/bin/activate
# En Windows:
venv\Scripts\activate

# 3. Instalar dependencias
pip install python-docx pandas openpyxl
```

#### **Opción B: Si ya tienes el entorno**
```bash
# Solo activar entorno virtual
source venv/bin/activate  # Linux/Mac
# o
venv\Scripts\activate     # Windows
```

### 2️⃣ **Colocar el Archivo Word**

1. **Ubicar tu archivo Word** en la carpeta raíz del proyecto
2. **Renombrar si es necesario** o ajustar el nombre en el script
3. **Verificar que el archivo esté accesible**

```bash
# Verificar que el archivo existe
ls -la *.docx
```

### 3️⃣ **Ejecutar el Procesamiento**

```bash
# Ejecutar el script principal
python scripts/generar_diccionario_datos.py
```

**⏱️ Tiempo esperado:** 3-5 minutos dependiendo del tamaño del documento

### 4️⃣ **Revisar los Resultados**

Después de la ejecución, encontrarás:

| Archivo | Ubicación | Descripción |
|---------|-----------|-------------|
| **SQL Scripts** | `sql/final/scripts_sql_con_descripciones.sql` | Scripts CREATE TABLE listos |
| **Diccionario Excel** | `data-dictionary/diccionario_datos.xlsx` | Diccionario navegable |
| **Diccionario JSON** | `data-dictionary/diccionario_datos.json` | Datos estructurados |

---

## 📊 Interpretando los Resultados

### 📄 **Archivo SQL**
- **Propósito**: Scripts CREATE TABLE para SQL Server
- **Contenido**: Tablas con comentarios descriptivos
- **Uso**: Ejecutar directamente en tu base de datos

```sql
-- Ejemplo de salida SQL
CREATE TABLE [dbo].[CU_extractos] (
    [numero_tarjeta] NVARCHAR(20) NOT NULL,
    [fecha_vencimiento] DATE NULL,
    [tipo_cuenta] NVARCHAR(10) NOT NULL
);
GO

-- Comentarios descriptivos automáticos
EXEC sys.sp_addextendedproperty @name=N'MS_Description', 
     @value=N'Tabla de extractos de tarjetas de crédito'...
```

### 📊 **Archivo Excel**
- **Hoja 1 - Diccionario_Datos**: Listado completo de campos
- **Hoja 2 - Resumen**: Estadísticas del procesamiento

| Columna | Descripción |
|---------|-------------|
| **Tabla** | Nombre de la tabla |
| **Campo** | Nombre del campo |
| **Tipo_SQL** | Tipo de dato SQL generado |
| **Descripción_Campo** | Descripción extraída del documento |

### 🔗 **Archivo JSON**
- **Estructura jerárquica** navegable
- **API-friendly** para integraciones
- **Metadatos completos** incluidos

---

## 🎛️ Opciones Avanzadas

### 🔧 **Personalizar Archivos de Salida**

Si necesitas cambiar las rutas de salida, edita estas líneas en el script:

```python
# En scripts/generar_diccionario_datos.py
sql_output = "mi_carpeta/mi_script.sql"
excel_output = "mi_carpeta/mi_diccionario.xlsx"
json_output = "mi_carpeta/mi_diccionario.json"
```

### 📝 **Procesar Múltiples Documentos**

Para procesar varios documentos:

```bash
# Crear un loop simple
for archivo in *.docx; do
    echo "Procesando: $archivo"
    python scripts/generar_diccionario_datos.py "$archivo"
done
```

### 🔍 **Validar Resultados**

```bash
# Verificar archivos generados
ls -la sql/final/
ls -la data-dictionary/

# Contar tablas procesadas
grep -c "CREATE TABLE" sql/final/scripts_sql_con_descripciones.sql
```

---

## 📈 Casos de Uso Comunes

### 🏗️ **Para Data Engineers**
1. **Ejecutar el script** completo
2. **Revisar tipos de datos** en el Excel
3. **Ajustar si es necesario** mapeos especiales
4. **Aplicar SQL** en el ambiente de desarrollo
5. **Documentar cambios** en el changelog

### 📊 **Para Data Analysts**
1. **Abrir el Excel** generado
2. **Filtrar por área de negocio** de interés
3. **Revisar descripciones** de campos
4. **Crear documentación** adicional si es necesario

### 🧪 **Para QA Testers**
1. **Ejecutar scripts SQL** en ambiente de pruebas
2. **Verificar que todas las tablas** se crean correctamente
3. **Validar tipos de datos** contra especificaciones
4. **Reportar inconsistencias** encontradas

---

## ⚠️ Qué Hacer si Algo Sale Mal

### 🚨 **Errores Comunes y Soluciones**

#### ❌ **"No se encuentra el archivo"**
```bash
# Verificar que el archivo existe
ls -la *.docx
# Verificar el nombre exacto en el script
grep "INPUT_FILE" scripts/generar_diccionario_datos.py
```

#### ❌ **"ImportError: No module named docx"**
```bash
# Instalar dependencias faltantes
pip install python-docx pandas openpyxl
```

#### ❌ **"Permiso denegado"**
```bash
# Verificar permisos de escritura
chmod 755 sql/ data-dictionary/
```

#### ❌ **"El script se cuelga"**
```bash
# Verificar memoria disponible
free -h
# Cerrar aplicaciones innecesarias
# Reiniciar si es necesario
```

### 🆘 **Obtener Ayuda**

1. **Consultar troubleshooting**: `docs/guides/troubleshooting.md`
2. **Revisar logs**: Buscar archivos `.log` en `reports/`
3. **Contactar soporte**: data-team@kdc.com
4. **Slack**: #data-engineering-kdc

---

## 📋 Checklist de Verificación

### ✅ **Antes de Ejecutar**
- [ ] Entorno virtual activado
- [ ] Dependencias instaladas
- [ ] Archivo Word en lugar correcto
- [ ] Permisos de escritura verificados

### ✅ **Después de Ejecutar**
- [ ] SQL generado sin errores
- [ ] Excel se abre correctamente
- [ ] JSON es válido
- [ ] Número de tablas es correcto
- [ ] Descripciones están presentes

### ✅ **Para Producción**
- [ ] SQL probado en desarrollo
- [ ] Tipos de datos validados
- [ ] Nomenclatura revisada
- [ ] Documentación actualizada

---

## 💡 Tips y Mejores Prácticas

### 🎯 **Para Mejores Resultados**
- **Mantén el documento Word bien estructurado** con títulos claros
- **Revisa siempre el Excel** antes de aplicar el SQL
- **Haz respaldos** de versiones anteriores
- **Documenta cualquier ajuste manual** que hagas

### ⚡ **Para Mayor Eficiencia**
- **Usa la misma nomenclatura** en documentos Word
- **Estandariza descripciones** de campos similares
- **Mantén el entorno virtual activo** durante sesiones de trabajo

### 🔧 **Para Mantenimiento**
- **Actualiza dependencias** periódicamente
- **Limpia archivos temporales** ocasionalmente
- **Versiona cambios importantes** en el script

---

## 📞 Contacto y Soporte

### 🆘 **¿Necesitas Ayuda?**
- **Documentación**: Revisa `docs/` para más detalles
- **Email**: data-team@kdc.com
- **Slack**: #data-engineering-kdc
- **Issues**: Reporta problemas en `reports/issues_log.md`

### 📚 **Documentación Relacionada**
- [Manual Técnico](../technical/manual_tecnico.md)
- [Troubleshooting](troubleshooting.md)
- [Changelog](../technical/changelog.md)

---

> **💡 Tip**: ¡Guarda esta guía como favorito! La consultarás frecuentemente durante tus primeros usos del sistema.
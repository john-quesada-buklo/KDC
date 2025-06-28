# 🔧 Troubleshooting - Solución de Problemas

## 🚨 Problemas Comunes y Soluciones

### ❌ **Error: "No se encuentra el archivo"**

**Síntomas:**
```
FileNotFoundError: [Errno 2] No such file or directory: '020IN SAT Interfaces...'
```

**Causas posibles:**
- Archivo Word no está en la ubicación correcta
- Nombre del archivo no coincide
- Permisos de lectura insuficientes

**Soluciones:**
```bash
# 1. Verificar archivos Word disponibles
ls -la *.docx

# 2. Verificar la ruta exacta en el script
grep -n "INPUT_FILE" scripts/generar_diccionario_datos.py

# 3. Copiar archivo a la ubicación correcta
cp "ruta/origen/archivo.docx" ./

# 4. Verificar permisos
chmod 644 *.docx
```

---

### ❌ **Error: "ImportError: No module named docx"**

**Síntomas:**
```
ImportError: No module named 'docx'
ModuleNotFoundError: No module named 'pandas'
```

**Causas posibles:**
- Dependencias no instaladas
- Entorno virtual no activado
- Version de Python incompatible

**Soluciones:**
```bash
# 1. Activar entorno virtual
source venv/bin/activate  # Linux/Mac
# o
venv\Scripts\activate     # Windows

# 2. Instalar dependencias
pip install python-docx pandas openpyxl

# 3. Verificar instalación
pip list | grep -E "(docx|pandas|openpyxl)"

# 4. Si persiste el error, reinstalar
pip uninstall python-docx pandas openpyxl
pip install python-docx pandas openpyxl
```

---

### ❌ **Error: "PermissionError: [Errno 13] Permission denied"**

**Síntomas:**
```
PermissionError: [Errno 13] Permission denied: 'sql/final/scripts_sql_con_descripciones.sql'
```

**Causas posibles:**
- Archivo abierto en otra aplicación
- Permisos de escritura insuficientes
- Carpetas no existen

**Soluciones:**
```bash
# 1. Crear carpetas necesarias
mkdir -p sql/final data-dictionary reports

# 2. Ajustar permisos
chmod 755 sql/ data-dictionary/ reports/
chmod 644 sql/final/* data-dictionary/* reports/*

# 3. Cerrar aplicaciones que puedan tener archivos abiertos
# (Excel, SQL Server Management Studio, etc.)

# 4. Verificar procesos usando archivos
lsof sql/final/scripts_sql_con_descripciones.sql
```

---

### ❌ **Error: "UnicodeDecodeError" o caracteres extraños**

**Síntomas:**
```
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 0
```

**Causas posibles:**
- Caracteres especiales en el documento Word
- Encoding incorrecto
- Archivo Word corrupto

**Soluciones:**
```python
# 1. Modificar el script para manejar encoding
import locale
locale.setlocale(locale.LC_ALL, 'es_ES.UTF-8')

# 2. En las funciones de escritura, usar encoding explícito
with open(output_file, 'w', encoding='utf-8', errors='ignore') as f:
    f.write(content)

# 3. Verificar el documento Word
# - Abrir en Word y guardar nuevamente
# - Remover caracteres especiales manualmente
# - Exportar como nuevo .docx
```

---

### ❌ **Error: "MemoryError" o el script se cuelga**

**Síntomas:**
```
MemoryError
El script no responde por largos períodos
```

**Causas posibles:**
- Documento Word muy grande
- Memoria RAM insuficiente
- Demasiadas tablas para procesar

**Soluciones:**
```bash
# 1. Verificar memoria disponible
free -h
top -p $(pgrep python)

# 2. Cerrar aplicaciones innecesarias
killall chrome firefox

# 3. Procesar por lotes (modificar script)
# Dividir el documento en secciones más pequeñas

# 4. Aumentar memoria virtual si es posible
sudo swapon --show
```

---

### ❌ **Error: "openpyxl" o problemas con Excel**

**Síntomas:**
```
ImportError: Missing optional dependency 'openpyxl'
Excel no se abre correctamente
```

**Causas posibles:**
- openpyxl no instalado o versión incorrecta
- Excel corrupto
- Permisos en archivo Excel

**Soluciones:**
```bash
# 1. Reinstalar openpyxl
pip uninstall openpyxl
pip install openpyxl

# 2. Verificar versión
python -c "import openpyxl; print(openpyxl.__version__)"

# 3. Probar creación manual de Excel
python -c "
import pandas as pd
df = pd.DataFrame({'test': [1,2,3]})
df.to_excel('test.xlsx', index=False)
print('Excel test exitoso')
"

# 4. Verificar permisos
chmod 644 data-dictionary/*.xlsx
```

---

### ❌ **Resultados incorrectos o tipos de datos extraños**

**Síntomas:**
- Todos los campos aparecen como VARCHAR(255)
- Nombres de tablas son "Tabla_0", "Tabla_1"
- Descripciones vacías

**Causas posibles:**
- Estructura del documento Word no estándar
- Patrones de extracción no coinciden
- Tablas sin contenido válido

**Soluciones:**
```python
# 1. Activar modo debug en el script
import logging
logging.basicConfig(level=logging.DEBUG)

# 2. Verificar estructura del documento Word manualmente
# - Abrir el documento
# - Verificar que tiene tablas con estructura estándar
# - Confirmar títulos y patrones de texto

# 3. Ajustar patrones de extracción
TITLE_PATTERNS = [
    r"tu_patron_personalizado_aqui",
    # Agregar más patrones según el documento
]

# 4. Validar datos de entrada
for i, table in enumerate(doc.tables):
    print(f"Tabla {i}: {len(table.rows)} filas")
    if len(table.rows) > 0:
        print(f"Primera fila: {[cell.text for cell in table.rows[0].cells]}")
```

---

## 🛠️ Herramientas de Diagnóstico

### 📊 **Script de Diagnóstico**

```bash
# Crear script de diagnóstico
cat > diagnostico.py << 'EOF'
#!/usr/bin/env python3
import sys
import os
import platform

print("=== DIAGNÓSTICO DEL SISTEMA ===")
print(f"Python version: {sys.version}")
print(f"Sistema: {platform.system()} {platform.release()}")
print(f"Directorio actual: {os.getcwd()}")
print(f"Archivos Word disponibles:")
for f in os.listdir('.'):
    if f.endswith('.docx'):
        print(f"  - {f} ({os.path.getsize(f)/1024/1024:.1f} MB)")

try:
    import docx
    print(f"✅ python-docx instalado: {docx.__version__}")
except ImportError:
    print("❌ python-docx NO instalado")

try:
    import pandas as pd
    print(f"✅ pandas instalado: {pd.__version__}")
except ImportError:
    print("❌ pandas NO instalado")

try:
    import openpyxl
    print(f"✅ openpyxl instalado: {openpyxl.__version__}")
except ImportError:
    print("❌ openpyxl NO instalado")

print("\n=== PERMISOS ===")
dirs_to_check = ['sql/final', 'data-dictionary', 'reports']
for dir_path in dirs_to_check:
    if os.path.exists(dir_path):
        print(f"✅ {dir_path} existe y es escribible: {os.access(dir_path, os.W_OK)}")
    else:
        print(f"❌ {dir_path} NO existe")
EOF

python diagnostico.py
```

### 🔍 **Validación de Documento Word**

```bash
# Script para verificar estructura del documento
cat > validar_word.py << 'EOF'
#!/usr/bin/env python3
from docx import Document
import sys

if len(sys.argv) != 2:
    print("Uso: python validar_word.py archivo.docx")
    sys.exit(1)

doc_path = sys.argv[1]
doc = Document(doc_path)

print(f"=== ANÁLISIS DE {doc_path} ===")
print(f"Total de tablas: {len(doc.tables)}")
print(f"Total de párrafos: {len(doc.paragraphs)}")

# Analizar primeras 5 tablas
for i, table in enumerate(doc.tables[:5]):
    print(f"\nTabla {i}:")
    print(f"  Filas: {len(table.rows)}")
    print(f"  Columnas: {len(table.columns) if table.rows else 0}")
    if table.rows:
        first_row = [cell.text.strip() for cell in table.rows[0].cells]
        print(f"  Primera fila: {first_row}")

# Buscar patrones de títulos
print(f"\n=== PATRONES ENCONTRADOS ===")
title_patterns = [
    "Detalle de campos",
    "Tipo de registro",
    "Estructura del tipo"
]

for para in doc.paragraphs:
    text = para.text.strip()
    for pattern in title_patterns:
        if pattern.lower() in text.lower():
            print(f"✅ Encontrado: {text}")
            break
EOF

python validar_word.py "020IN SAT Interfaces  v7.5- vol I - Batch_NUEK (1).docx"
```

---

## 📊 Logs y Monitoreo

### 📝 **Configurar Logging Detallado**

```python
# Agregar al inicio del script principal
import logging
import os

# Crear directorio de logs si no existe
os.makedirs('reports', exist_ok=True)

# Configurar logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(funcName)s:%(lineno)d - %(message)s',
    handlers=[
        logging.FileHandler('reports/processing_debug.log'),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)
```

### 📊 **Monitorear Performance**

```python
# Agregar monitoreo de performance
import time
import psutil
import os

def monitor_performance(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        start_memory = psutil.Process(os.getpid()).memory_info().rss / 1024 / 1024
        
        result = func(*args, **kwargs)
        
        end_time = time.time()
        end_memory = psutil.Process(os.getpid()).memory_info().rss / 1024 / 1024
        
        print(f"⏱️ {func.__name__}: {end_time - start_time:.2f} segundos")
        print(f"💾 Memoria: {end_memory - start_memory:.1f} MB incremento")
        
        return result
    return wrapper

# Usar como decorador
@monitor_performance
def process_table(table):
    # ... código de procesamiento
    pass
```

---

## 🆘 Escalamiento de Problemas

### 📞 **Cuándo Contactar Soporte**

- **Nivel 1**: Revisar esta guía de troubleshooting
- **Nivel 2**: Consultar con compañeros del equipo
- **Nivel 3**: Contactar a Data Engineering Lead
- **Nivel 4**: Escalamiento a IT Support

### 📋 **Información para Reportar**

Cuando reportes un problema, incluye:

```bash
# 1. Información del sistema
python diagnostico.py > problema_info.txt

# 2. Logs del error
tail -n 50 reports/processing_debug.log >> problema_info.txt

# 3. Estructura del archivo Word
python validar_word.py archivo.docx >> problema_info.txt

# 4. Enviar problema_info.txt junto con:
# - Descripción del problema
# - Pasos para reproducir
# - Resultado esperado vs actual
```

---

## 🔧 Herramientas de Recuperación

### 💾 **Recuperar de Backup**

```bash
# Si existe backup anterior
cp sql/versions/scripts_sql_*.sql sql/final/
cp data-dictionary/backup/*.xlsx data-dictionary/

# Verificar integridad
python -c "
import json
with open('data-dictionary/diccionario_datos.json', 'r') as f:
    data = json.load(f)
    print(f'JSON válido: {len(data["tables"])} tablas')
"
```

### 🔄 **Reinicio Limpio**

```bash
# Limpiar y empezar de nuevo
rm -rf sql/final/* data-dictionary/* reports/*
python scripts/generar_diccionario_datos.py
```

---

> **📌 Nota**: Si después de seguir esta guía el problema persiste, documenta todos los pasos intentados y contacta al equipo de soporte técnico.
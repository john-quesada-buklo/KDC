# 🧠 Instrucciones para Cursor – Generación de Scripts SQL desde Documento Word

## 🎯 Objetivo

Analizar el contenido de un documento Word (`.docx`) que contiene una o más tablas con la definición de estructuras SQL y generar automáticamente el script `CREATE TABLE` correspondiente para cada una de ellas.

---

## 📥 Entrada esperada

Un archivo Word estructurado con tablas que siguen el siguiente formato de columnas:

| NOMBRE   | DESCRIPCIÓN                         | TIPO         | LONG. | DEC. |
|----------|-------------------------------------|--------------|-------|------|
| CODENT   | CÓDIGO DE ENTIDAD                   | Alfanumérico | 4     |      |
| CENTALTA | CENTRO DE ALTA CUENTA DE TARJETA    | Alfanumérico | 4     |      |
| CUENTA   | CUENTA DE TARJETA                   | Alfanumérico | 12    |      |
| TIPOREG  | TIPO DE REGISTRO (CU, LI, FI, etc.) | Alfanumérico | 2     |      |

---

## 🛠️ Instrucciones de procesamiento

1. **Leer cada tabla del documento Word**:
   - Cada tabla representa la definición de una tabla SQL.
   - Si existe un título antes de la tabla, úsalo como nombre de la tabla. Si no, asigna un nombre genérico (`Tabla1`, `Tabla2`, etc.).

2. **Interpretar cada fila como una columna**:
   - **NOMBRE**: nombre del campo.
   - **TIPO**:
     - `"Alfanumérico"` → `VARCHAR(LONG.)`
     - `"Numérico"`:
       - Si `DEC.` está presente → `DECIMAL(LONG., DEC.)`
       - Si `DEC.` está vacío → `INT` o `NUMERIC(LONG.)`
   - Si `LONG.` está vacío, asumir `VARCHAR(MAX)` para alfanuméricos o lanzar advertencia.
   - Si `TIPO` no está mapeado, marcar como `UNKNOWN`.

3. **Generar el script SQL `CREATE TABLE`**:
   - Formato estándar de SQL Server (u otro motor si se especifica).
   - Incluir comentarios `--` con la descripción de cada campo (columna `DESCRIPCIÓN`).

4. **Agregar validaciones si existen valores predefinidos**:
   - Si el campo tiene valores fijos como `TIPOREG` (CU, LI, FI...), se puede generar un `CHECK CONSTRAINT` o dejarlo como comentario.

---

## 🧾 Ejemplo de salida esperada

### Entrada desde Word:

| NOMBRE   | DESCRIPCIÓN                         | TIPO         | LONG. | DEC. |
|----------|-------------------------------------|--------------|-------|------|
| CODENT   | CÓDIGO DE ENTIDAD                   | Alfanumérico | 4     |      |
| CENTALTA | CENTRO DE ALTA CUENTA DE TARJETA    | Alfanumérico | 4     |      |
| CUENTA   | CUENTA DE TARJETA                   | Alfanumérico | 12    |      |
| TIPOREG  | TIPO DE REGISTRO (CU, LI, FI, etc.) | Alfanumérico | 2     |      |

### Script SQL generado:

```sql
CREATE TABLE ATEXTCU1 (
    CODENT    VARCHAR(4),  -- CÓDIGO DE ENTIDAD
    CENTALTA  VARCHAR(4),  -- CENTRO DE ALTA CUENTA DE TARJETA
    CUENTA    VARCHAR(12), -- CUENTA DE TARJETA
    TIPOREG   VARCHAR(2)   -- TIPO DE REGISTRO: CU, LI, FI, CE, CC
);

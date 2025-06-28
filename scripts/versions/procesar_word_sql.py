#!/usr/bin/env python3
"""
Script para generar scripts SQL desde documento Word
Basado en las instrucciones del archivo instrucciones.md
"""

import os
import re
from docx import Document
from docx.table import Table
import pandas as pd

def map_data_type(tipo, longitud, decimales):
    """
    Mapea los tipos de datos del documento a tipos SQL
    
    Args:
        tipo (str): Tipo de dato ("Alfanumérico", "Numérico", etc.)
        longitud (str): Longitud del campo
        decimales (str): Decimales (solo para numéricos)
    
    Returns:
        str: Tipo de dato SQL
    """
    tipo = str(tipo).strip().lower() if tipo else ""
    longitud = str(longitud).strip() if longitud else ""
    decimales = str(decimales).strip() if decimales else ""
    
    if "alfanumérico" in tipo or "alfanumerico" in tipo:
        if longitud and longitud.isdigit():
            return f"VARCHAR({longitud})"
        else:
            return "VARCHAR(MAX)"
    
    elif "numérico" in tipo or "numerico" in tipo:
        if decimales and decimales.isdigit() and int(decimales) > 0:
            if longitud and longitud.isdigit():
                return f"DECIMAL({longitud}, {decimales})"
            else:
                return f"DECIMAL(18, {decimales})"
        else:
            if longitud and longitud.isdigit():
                longitud_int = int(longitud)
                if longitud_int <= 10:
                    return "INT"
                else:
                    return f"NUMERIC({longitud})"
            else:
                return "INT"
    
    else:
        return "UNKNOWN"

def clean_text(text):
    """Limpia el texto eliminando caracteres especiales y espacios extra"""
    if not text:
        return ""
    return re.sub(r'\s+', ' ', str(text).strip())

def extract_tables_from_docx(file_path):
    """
    Extrae todas las tablas del documento Word
    
    Args:
        file_path (str): Ruta al archivo .docx
    
    Returns:
        list: Lista de tablas procesadas
    """
    try:
        doc = Document(file_path)
        tables_data = []
        
        # Buscar tablas en el documento
        table_counter = 1
        
        for element in doc.element.body:
            if element.tag.endswith('tbl'):
                # Es una tabla
                table = Table(element, doc)
                
                # Buscar título antes de la tabla (buscar en párrafos anteriores)
                table_title = f"Tabla{table_counter}"
                
                # Procesar la tabla
                table_data = []
                headers = []
                
                # Extraer headers de la primera fila
                if len(table.rows) > 0:
                    first_row = table.rows[0]
                    headers = [clean_text(cell.text) for cell in first_row.cells]
                    
                    # Procesar el resto de las filas
                    for row_idx, row in enumerate(table.rows[1:], 1):
                        row_data = []
                        for cell in row.cells:
                            row_data.append(clean_text(cell.text))
                        table_data.append(row_data)
                
                if headers and table_data:
                    tables_data.append({
                        'title': table_title,
                        'headers': headers,
                        'data': table_data
                    })
                    table_counter += 1
        
        return tables_data
    
    except Exception as e:
        print(f"Error al procesar el archivo Word: {e}")
        return []

def generate_sql_from_table(table_info):
    """
    Genera script SQL CREATE TABLE desde los datos de una tabla
    
    Args:
        table_info (dict): Información de la tabla con headers y data
    
    Returns:
        str: Script SQL CREATE TABLE
    """
    title = table_info['title']
    headers = table_info['headers']
    data = table_info['data']
    
    # Identificar las columnas esperadas
    col_indices = {}
    for i, header in enumerate(headers):
        header_lower = header.lower()
        if 'nombre' in header_lower:
            col_indices['nombre'] = i
        elif 'descripción' in header_lower or 'descripcion' in header_lower:
            col_indices['descripcion'] = i
        elif 'tipo' in header_lower:
            col_indices['tipo'] = i
        elif 'long' in header_lower:
            col_indices['longitud'] = i
        elif 'dec' in header_lower:
            col_indices['decimales'] = i
    
    # Verificar que tenemos las columnas mínimas necesarias
    if 'nombre' not in col_indices or 'tipo' not in col_indices:
        print(f"Advertencia: No se encontraron las columnas necesarias en {title}")
        return f"-- ERROR: No se pudieron procesar las columnas de {title}\n"
    
    # Generar el script SQL
    sql_lines = []
    sql_lines.append(f"CREATE TABLE {title} (")
    
    column_definitions = []
    
    for row in data:
        if len(row) <= max(col_indices.values()):
            continue
            
        nombre = row[col_indices['nombre']] if 'nombre' in col_indices else ""
        descripcion = row[col_indices['descripcion']] if 'descripcion' in col_indices else ""
        tipo = row[col_indices['tipo']] if 'tipo' in col_indices else ""
        longitud = row[col_indices['longitud']] if 'longitud' in col_indices else ""
        decimales = row[col_indices['decimales']] if 'decimales' in col_indices else ""
        
        if not nombre.strip():
            continue
            
        # Mapear el tipo de dato
        sql_type = map_data_type(tipo, longitud, decimales)
        
        # Construir la definición de columna
        column_def = f"    {nombre.ljust(12)} {sql_type}"
        
        # Agregar comentario con la descripción
        if descripcion.strip():
            column_def += f"  -- {descripcion}"
        
        column_definitions.append(column_def)
    
    # Unir todas las definiciones de columnas
    if column_definitions:
        sql_lines.append(",\n".join(column_definitions))
    else:
        sql_lines.append("    -- No se encontraron columnas válidas")
    
    sql_lines.append(");")
    sql_lines.append("")  # Línea en blanco al final
    
    return "\n".join(sql_lines)

def main():
    """Función principal"""
    docx_file = "020IN SAT Interfaces  v7.5- vol I - Batch_NUEK (1).docx"
    
    if not os.path.exists(docx_file):
        print(f"Error: No se encontró el archivo {docx_file}")
        return
    
    print(f"Procesando archivo: {docx_file}")
    print("=" * 60)
    
    # Extraer tablas del documento
    tables = extract_tables_from_docx(docx_file)
    
    if not tables:
        print("No se encontraron tablas en el documento")
        return
    
    print(f"Se encontraron {len(tables)} tabla(s)")
    print("=" * 60)
    
    # Generar scripts SQL
    all_sql = []
    all_sql.append("-- Scripts SQL generados automáticamente desde documento Word")
    all_sql.append("-- Basado en las instrucciones de: instrucciones.md")
    all_sql.append("-- " + "=" * 58)
    all_sql.append("")
    
    for i, table in enumerate(tables, 1):
        print(f"Procesando {table['title']}...")
        
        # Mostrar información de la tabla encontrada
        print(f"  - Headers: {table['headers']}")
        print(f"  - Filas de datos: {len(table['data'])}")
        
        sql_script = generate_sql_from_table(table)
        all_sql.append(f"-- {table['title']}")
        all_sql.append(sql_script)
        
        print(f"  ✓ Script SQL generado para {table['title']}")
        print()
    
    # Guardar todos los scripts en un archivo
    output_file = "scripts_sql_generados.sql"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("\n".join(all_sql))
    
    print(f"Scripts SQL guardados en: {output_file}")
    print("=" * 60)
    
    # Mostrar el contenido generado
    print("CONTENIDO GENERADO:")
    print("=" * 60)
    print("\n".join(all_sql))

if __name__ == "__main__":
    main()
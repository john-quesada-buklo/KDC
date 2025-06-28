#!/usr/bin/env python3
"""
Script final optimizado para generar scripts SQL desde documento Word
Extrae nombres reales de tablas y descripciones con patrones mejorados
Basado en las instrucciones del archivo instrucciones.md
"""

import os
import re
from docx import Document
from docx.table import Table
from docx.text.paragraph import Paragraph
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

def extract_table_name_from_text(text):
    """
    Extrae el nombre de la tabla del texto que contiene "Tipo de registro"
    
    Args:
        text (str): Texto a analizar
    
    Returns:
        str: Nombre de la tabla encontrado o None
    """
    if not text:
        return None
    
    # Buscar patrones mejorados para "Tipo de registro"
    patterns = [
        r"[Tt]ipo\s+de\s+registro\s+['\"]([^'\"]+)['\"]",
        r"[Tt]ipo\s+de\s+registro\s+'([^']+)'",
        r"[Tt]ipo\s+de\s+registro\s+\"([^\"]+)\"",
        r"[Tt]ipo\s+de\s+registro\s+([A-Z]{1,3})\s*:",
        r"[Tt]ipo\s+de\s+registro\s+([A-Z]{1,3})\b",
        r"[Rr]egistro\s+['\"]([^'\"]+)['\"]",
        r"[Rr]egistro\s+'([^']+)'",
        r"[Rr]egistro\s+\"([^\"]+)\"",
        r"[Rr]egistro\s+([A-Z]{1,3})\s*:",
        r"[Rr]egistro\s+([A-Z]{1,3})\b"
    ]
    
    for pattern in patterns:
        match = re.search(pattern, text)
        if match:
            table_name = match.group(1).strip()
            # Limpiar caracteres especiales del nombre
            table_name = re.sub(r'[^A-Za-z0-9_]', '_', table_name)
            if table_name and len(table_name) <= 10:  # Nombres de tabla razonables
                return table_name
    
    return None

def extract_table_description_and_name(paragraphs_before_table, max_paragraphs=15):
    """
    Extrae la descripción de la tabla y su nombre de los párrafos que la preceden
    
    Args:
        paragraphs_before_table (list): Lista de párrafos anteriores a la tabla
        max_paragraphs (int): Número máximo de párrafos a considerar
    
    Returns:
        tuple: (descripción, nombre_tabla)
    """
    description_parts = []
    table_name = None
    
    # Analizar los párrafos antes de la tabla
    relevant_paragraphs = paragraphs_before_table[-max_paragraphs:] if len(paragraphs_before_table) > max_paragraphs else paragraphs_before_table
    
    # Buscar en orden inverso (más recientes primero)
    for para in reversed(relevant_paragraphs):
        text = clean_text(para.text)
        if not text or len(text) < 5:
            continue
        
        # Buscar nombre de tabla primero
        if not table_name:
            table_name = extract_table_name_from_text(text)
        
        # Buscar descripciones útiles
        if (len(text) > 20 and 
            ('estructura' in text.lower() or 
             'detalle' in text.lower() or 
             'registro' in text.lower() or 
             'campos' in text.lower() or
             'datos' in text.lower() or
             'tipo de' in text.lower())):
            
            # Evitar títulos de sección muy largos
            if len(text) < 200:
                description_parts.insert(0, text)  # Insertar al principio para mantener orden
                
                # Si encontramos el nombre en la misma línea de descripción, extraerlo
                if not table_name:
                    table_name = extract_table_name_from_text(text)
    
    # Combinar las partes de descripción más relevantes
    description = ' '.join(description_parts[:2]) if description_parts else ""  # Usar las 2 más relevantes
    
    return description, table_name

def extract_tables_from_docx_final(file_path):
    """
    Extrae todas las tablas del documento Word con análisis final optimizado
    
    Args:
        file_path (str): Ruta al archivo .docx
    
    Returns:
        list: Lista de tablas procesadas con información optimizada
    """
    try:
        doc = Document(file_path)
        tables_data = []
        
        # Obtener todos los elementos del documento en orden
        body_elements = []
        for element in doc.element.body:
            if element.tag.endswith('p'):
                # Es un párrafo
                para = Paragraph(element, doc)
                body_elements.append(('paragraph', para))
            elif element.tag.endswith('tbl'):
                # Es una tabla
                table = Table(element, doc)
                body_elements.append(('table', table))
        
        table_counter = 1
        
        for i, (element_type, element) in enumerate(body_elements):
            if element_type == 'table':
                # Buscar párrafos anteriores a esta tabla
                paragraphs_before = []
                for j in range(max(0, i-20), i):  # Buscar hasta 20 elementos anteriores
                    if body_elements[j][0] == 'paragraph':
                        paragraphs_before.append(body_elements[j][1])
                
                # Extraer descripción y nombre de tabla
                description, table_name = extract_table_description_and_name(paragraphs_before)
                
                # Si no se encontró nombre, intentar patrones adicionales
                if not table_name and description:
                    table_name = extract_table_name_from_text(description)
                
                # Si aún no hay nombre, usar genérico
                if not table_name:
                    table_name = f"Tabla{table_counter}"
                
                # Agregar prefijo si el nombre es muy corto o solo números
                if table_name and (len(table_name) <= 2 or table_name.isdigit()):
                    table_name = f"TBL_{table_name}"
                
                # Procesar la tabla
                table_data = []
                headers = []
                
                # Extraer headers de la primera fila
                if len(element.rows) > 0:
                    first_row = element.rows[0]
                    headers = [clean_text(cell.text) for cell in first_row.cells]
                    
                    # Procesar el resto de las filas
                    for row_idx, row in enumerate(element.rows[1:], 1):
                        row_data = []
                        for cell in row.cells:
                            row_data.append(clean_text(cell.text))
                        if any(row_data):  # Solo agregar filas que no estén completamente vacías
                            table_data.append(row_data)
                
                if headers and table_data:
                    tables_data.append({
                        'title': table_name,
                        'description': description,
                        'headers': headers,
                        'data': table_data,
                        'original_number': table_counter
                    })
                    print(f"✓ Tabla encontrada: {table_name} ({len(table_data)} filas)")
                    if description:
                        print(f"  Descripción: {description[:80]}...")
                    
                table_counter += 1
        
        return tables_data
    
    except Exception as e:
        print(f"Error al procesar el archivo Word: {e}")
        return []

def generate_sql_from_table_final(table_info):
    """
    Genera script SQL CREATE TABLE final optimizado
    
    Args:
        table_info (dict): Información de la tabla con headers, data y descripción
    
    Returns:
        str: Script SQL CREATE TABLE
    """
    title = table_info['title']
    description = table_info.get('description', '')
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
        return f"-- ERROR: No se pudieron procesar las columnas de {title}\n-- Headers encontrados: {headers}\n\n"
    
    # Generar el script SQL
    sql_lines = []
    
    # Agregar comentario con descripción de la tabla si existe
    if description:
        # Dividir descripción larga en múltiples líneas
        desc_lines = [description[i:i+80] for i in range(0, len(description), 80)]
        for line in desc_lines:
            sql_lines.append(f"-- {line}")
    else:
        sql_lines.append(f"-- {title}")
    
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
            
        # Limpiar nombre de campo de caracteres especiales
        nombre_limpio = re.sub(r'[^A-Za-z0-9_]', '_', nombre.strip())
        if nombre_limpio and not nombre_limpio[0].isalpha():
            nombre_limpio = 'F_' + nombre_limpio
            
        # Mapear el tipo de dato
        sql_type = map_data_type(tipo, longitud, decimales)
        
        # Construir la definición de columna
        column_def = f"    {nombre_limpio.ljust(20)} {sql_type.ljust(15)}"
        
        # Agregar comentario con la descripción
        if descripcion.strip():
            column_def += f" -- {descripcion}"
        
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
    """Función principal final optimizada"""
    docx_file = "020IN SAT Interfaces  v7.5- vol I - Batch_NUEK (1).docx"
    
    if not os.path.exists(docx_file):
        print(f"Error: No se encontró el archivo {docx_file}")
        return
    
    print(f"🔍 Procesando archivo con análisis final optimizado: {docx_file}")
    print("=" * 80)
    
    # Extraer tablas del documento con información optimizada
    tables = extract_tables_from_docx_final(docx_file)
    
    if not tables:
        print("No se encontraron tablas en el documento")
        return
    
    print(f"\n📊 Se encontraron {len(tables)} tabla(s) con información estructurada")
    print("=" * 80)
    
    # Generar scripts SQL
    all_sql = []
    all_sql.append("-- ===============================================================================")
    all_sql.append("-- Scripts SQL generados automáticamente desde documento Word")
    all_sql.append("-- Con nombres reales de tablas y descripciones extraídas")
    all_sql.append("-- Basado en las instrucciones de: instrucciones.md")
    all_sql.append("-- Fecha de generación: " + str(pd.Timestamp.now().strftime('%Y-%m-%d %H:%M:%S')))
    all_sql.append("-- ===============================================================================")
    all_sql.append("")
    
    tables_with_real_names = 0
    tables_with_descriptions = 0
    
    for i, table in enumerate(tables, 1):
        print(f"🛠️  Procesando {table['title']}...")
        
        # Mostrar información de la tabla encontrada
        if table['title'] != f"Tabla{table['original_number']}":
            tables_with_real_names += 1
            print(f"  ✅ Nombre extraído: {table['title']}")
        
        if table['description']:
            tables_with_descriptions += 1
            print(f"  📝 Descripción: {table['description'][:100]}...")
        
        print(f"  📋 Columnas: {len(table['headers'])}, Filas: {len(table['data'])}")
        
        sql_script = generate_sql_from_table_final(table)
        all_sql.append(sql_script)
        
        print(f"  ✅ Script SQL generado")
        print()
    
    # Guardar todos los scripts en un archivo
    output_file = "scripts_sql_finales.sql"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("\n".join(all_sql))
    
    print("=" * 80)
    print(f"🎉 Scripts SQL finales guardados en: {output_file}")
    print(f"📈 Estadísticas del procesamiento:")
    print(f"   • Total de tablas procesadas: {len(tables)}")
    print(f"   • Tablas con nombres reales extraídos: {tables_with_real_names}")
    print(f"   • Tablas con descripciones extraídas: {tables_with_descriptions}")
    print(f"   • Archivo generado: {round(os.path.getsize(output_file)/1024, 1)} KB")
    print("=" * 80)

if __name__ == "__main__":
    main()
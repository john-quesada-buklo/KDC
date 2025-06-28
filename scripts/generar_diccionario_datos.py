#!/usr/bin/env python3
"""
🏗️ GENERADOR DE DICCIONARIO DE DATOS Y SQL CON DESCRIPCIONES
=====================================================================

Script principal para generar:
1. Scripts SQL CREATE TABLE con comentarios detallados
2. Diccionario de datos completo en formato Excel y JSON
3. Documentación técnica estructurada

Versión: 2.0
Fecha: 2024
Equipo: KDC Data Engineering
"""

import os
import re
import json
from datetime import datetime
from docx import Document
from docx.table import Table
from docx.text.paragraph import Paragraph
import pandas as pd

def map_data_type(tipo, longitud, decimales):
    """
    Mapea los tipos de datos del documento a tipos SQL estándar
    
    Args:
        tipo (str): Tipo de dato original
        longitud (str): Longitud del campo
        decimales (str): Decimales para campos numéricos
    
    Returns:
        dict: Información completa del tipo de dato SQL
    """
    tipo = str(tipo).strip().lower() if tipo else ""
    longitud = str(longitud).strip() if longitud else ""
    decimales = str(decimales).strip() if decimales else ""
    
    # Mapeo de tipos con información extendida
    tipo_info = {
        'sql_type': 'VARCHAR(255)',
        'category': 'Texto',
        'nullable': True,
        'description': 'Campo de texto genérico'
    }
    
    if "alfanumerico" in tipo or "alfanumérico" in tipo or "texto" in tipo:
        if longitud and longitud.isdigit():
            longitud_int = int(longitud)
            if longitud_int > 8000:
                tipo_info.update({
                    'sql_type': 'NTEXT',
                    'category': 'Texto Largo',
                    'description': f'Campo de texto extenso hasta {longitud} caracteres'
                })
            else:
                tipo_info.update({
                    'sql_type': f'NVARCHAR({longitud})',
                    'category': 'Texto',
                    'description': f'Campo alfanumérico de hasta {longitud} caracteres'
                })
        else:
            tipo_info.update({
                'sql_type': 'NVARCHAR(255)',
                'category': 'Texto',
                'description': 'Campo alfanumérico de longitud estándar'
            })
            
    elif "numerico" in tipo or "numérico" in tipo or "entero" in tipo:
        if decimales and decimales != "0" and decimales != "":
            if longitud and longitud.isdigit():
                longitud_int = int(longitud)
                decimales_int = int(decimales) if decimales.isdigit() else 2
                if longitud_int <= 19:
                    tipo_info.update({
                        'sql_type': f'DECIMAL({longitud},{decimales})',
                        'category': 'Número Decimal',
                        'description': f'Campo numérico con {decimales} decimales'
                    })
                else:
                    tipo_info.update({
                        'sql_type': 'FLOAT',
                        'category': 'Número Decimal',
                        'description': f'Campo numérico de precisión extendida con {decimales} decimales'
                    })
            else:
                tipo_info.update({
                    'sql_type': f'DECIMAL(18,{decimales})',
                    'category': 'Número Decimal',
                    'description': f'Campo numérico con {decimales} decimales'
                })
        else:
            if longitud and longitud.isdigit():
                longitud_int = int(longitud)
                if longitud_int <= 3:
                    tipo_info.update({
                        'sql_type': 'TINYINT',
                        'category': 'Número Entero',
                        'description': f'Campo numérico entero pequeño (0-255)'
                    })
                elif longitud_int <= 5:
                    tipo_info.update({
                        'sql_type': 'SMALLINT',
                        'category': 'Número Entero',
                        'description': f'Campo numérico entero mediano'
                    })
                elif longitud_int <= 10:
                    tipo_info.update({
                        'sql_type': 'INT',
                        'category': 'Número Entero',
                        'description': f'Campo numérico entero estándar'
                    })
                else:
                    tipo_info.update({
                        'sql_type': 'BIGINT',
                        'category': 'Número Entero',
                        'description': f'Campo numérico entero grande'
                    })
            else:
                tipo_info.update({
                    'sql_type': 'INT',
                    'category': 'Número Entero',
                    'description': 'Campo numérico entero estándar'
                })
                
    elif "fecha" in tipo or "date" in tipo:
        if "hora" in tipo or "time" in tipo:
            tipo_info.update({
                'sql_type': 'DATETIME2',
                'category': 'Fecha y Hora',
                'description': 'Campo de fecha y hora con precisión de microsegundos'
            })
        else:
            tipo_info.update({
                'sql_type': 'DATE',
                'category': 'Fecha',
                'description': 'Campo de fecha (YYYY-MM-DD)'
            })
            
    elif "time" in tipo or "hora" in tipo:
        tipo_info.update({
            'sql_type': 'TIME',
            'category': 'Hora',
            'description': 'Campo de hora (HH:MM:SS)'
        })
        
    elif "bool" in tipo or "bit" in tipo or "logico" in tipo:
        tipo_info.update({
            'sql_type': 'BIT',
            'category': 'Booleano',
            'description': 'Campo booleano (0/1, verdadero/falso)'
        })
    
    return tipo_info

def extract_table_context(doc, table_idx):
    """
    Extrae el contexto y metadatos de una tabla del documento
    
    Args:
        doc: Documento Word
        table_idx: Índice de la tabla
    
    Returns:
        dict: Información contextual de la tabla
    """
    context = {
        'title': f'Tabla_{table_idx}',
        'description': '',
        'section': '',
        'type_code': '',
        'business_area': 'General'
    }
    
    # Buscar contexto en párrafos anteriores
    elements = doc.element.body
    table_found = False
    preceding_text = []
    
    for element in elements:
        if element.tag.endswith('tbl'):
            if table_found:
                break
            if len(doc.tables) > table_idx and element == doc.tables[table_idx]._element:
                table_found = True
                break
        elif element.tag.endswith('p') and not table_found:
            paragraph = Paragraph(element, doc)
            text = paragraph.text.strip()
            if text:
                preceding_text.append(text)
                
    # Analizar el texto precedente para extraer información
    context_text = " ".join(preceding_text[-10:])  # Últimos 10 párrafos
    
    # Buscar título principal
    title_patterns = [
        r"Detalle de campos de los registros de (.+?)(?:\.|$)",
        r"Estructura del tipo de registro (.+?)(?:\.|$)",
        r"Tabla de (.+?)(?:\.|$)"
    ]
    
    for pattern in title_patterns:
        match = re.search(pattern, context_text, re.IGNORECASE)
        if match:
            context['title'] = match.group(1).strip()
            context['section'] = match.group(1).strip()
            break
    
    # Buscar código de tipo de registro
    type_match = re.search(r"Tipo de registro ['\"]([^'\"]+)['\"]", context_text, re.IGNORECASE)
    if type_match:
        context['type_code'] = type_match.group(1)
        context['title'] = f"{context['type_code']}_{context['title']}" if context['title'] != f'Tabla_{table_idx}' else context['type_code']
    
    # Extraer descripción detallada
    sentences = [s.strip() for s in context_text.split('.') if s.strip()]
    if sentences:
        context['description'] = '. '.join(sentences[-3:])  # Últimas 3 oraciones
    
    # Determinar área de negocio basada en palabras clave
    business_keywords = {
        'extractos': 'Extractos y Facturación',
        'tarjeta': 'Tarjetas de Crédito',
        'cuota': 'Cuotas y Pagos',
        'transaccion': 'Transacciones',
        'cliente': 'Gestión de Clientes',
        'cuenta': 'Cuentas y Contratos',
        'comercio': 'Comercios',
        'pago': 'Pagos y Liquidaciones'
    }
    
    context_lower = context_text.lower()
    for keyword, area in business_keywords.items():
        if keyword in context_lower:
            context['business_area'] = area
            break
    
    return context

def generate_sql_with_descriptions(tables_data):
    """
    Genera scripts SQL con comentarios descriptivos completos
    
    Args:
        tables_data (list): Lista de datos de tablas
    
    Returns:
        str: Script SQL completo con descripciones
    """
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    sql_script = f"""/*
╔══════════════════════════════════════════════════════════════════════════════╗
║                    SCRIPTS SQL GENERADOS AUTOMÁTICAMENTE                     ║
║                           DICCIONARIO DE DATOS                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Fecha de generación: {timestamp}                                    ║
║ Fuente: 020IN SAT Interfaces v7.5- vol I - Batch_NUEK (1).docx              ║
║ Total de tablas: {len(tables_data)}                                                        ║
║ Generado por: Script automatizado KDC Data Engineering                      ║
╚══════════════════════════════════════════════════════════════════════════════╝
*/

-- =====================================================================
-- CONFIGURACIÓN INICIAL
-- =====================================================================
USE [SATInterfaces]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

"""
    
    for i, table_data in enumerate(tables_data, 1):
        table_name = table_data['metadata']['title'].replace(' ', '_').replace('-', '_')
        table_name = re.sub(r'[^\w]', '_', table_name)
        
        sql_script += f"""
-- =====================================================================
-- TABLA {i}: {table_name}
-- =====================================================================
/*
📋 INFORMACIÓN DE LA TABLA:
   • Nombre: {table_data['metadata']['title']}
   • Área de Negocio: {table_data['metadata']['business_area']}
   • Código de Tipo: {table_data['metadata']['type_code']}
   • Descripción: {table_data['metadata']['description']}
   • Total de Campos: {len(table_data['columns'])}
*/

-- Eliminar tabla si existe
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[{table_name}]') AND type in (N'U'))
    DROP TABLE [dbo].[{table_name}]
GO

-- Crear tabla con descripciones completas
CREATE TABLE [dbo].[{table_name}] (
"""
        
        # Generar columnas
        column_definitions = []
        for col in table_data['columns']:
            col_name = col['nombre'].replace(' ', '_').replace('-', '_')
            col_name = re.sub(r'[^\w]', '_', col_name)
            
            null_constraint = "NOT NULL" if not col['type_info']['nullable'] else "NULL"
            
            column_def = f"    [{col_name}] {col['type_info']['sql_type']} {null_constraint}"
            column_definitions.append(column_def)
        
        sql_script += ",\n".join(column_definitions)
        sql_script += f"\n);\nGO\n"
        
        # Agregar comentarios descriptivos
        sql_script += f"\n-- Comentarios descriptivos para la tabla\n"
        sql_script += f"EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{table_data['metadata']['description']}', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'{table_name}';\nGO\n"
        
        # Comentarios para cada columna
        for col in table_data['columns']:
            col_name = col['nombre'].replace(' ', '_').replace('-', '_')
            col_name = re.sub(r'[^\w]', '_', col_name)
            
            description = f"{col['descripcion']} | Tipo: {col['type_info']['category']} | {col['type_info']['description']}"
            sql_script += f"EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{description}', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'{table_name}', @level2type=N'COLUMN', @level2name=N'{col_name}';\nGO\n"
        
        sql_script += "\n"
    
    return sql_script

def generate_data_dictionary(tables_data):
    """
    Genera diccionario de datos en múltiples formatos
    
    Args:
        tables_data (list): Lista de datos de tablas
    
    Returns:
        dict: Diccionarios en diferentes formatos
    """
    # Crear DataFrame para Excel
    dictionary_rows = []
    
    for table_data in tables_data:
        table_name = table_data['metadata']['title']
        
        for col in table_data['columns']:
            row = {
                'Tabla': table_name,
                'Área_Negocio': table_data['metadata']['business_area'],
                'Código_Tipo': table_data['metadata']['type_code'],
                'Descripción_Tabla': table_data['metadata']['description'],
                'Campo': col['nombre'],
                'Tipo_SQL': col['type_info']['sql_type'],
                'Categoría': col['type_info']['category'],
                'Nullable': 'Sí' if col['type_info']['nullable'] else 'No',
                'Descripción_Campo': col['descripcion'],
                'Descripción_Técnica': col['type_info']['description'],
                'Tipo_Original': col.get('tipo', ''),
                'Longitud': col.get('longitud', ''),
                'Decimales': col.get('decimales', '')
            }
            dictionary_rows.append(row)
    
    df = pd.DataFrame(dictionary_rows)
    
    # Generar JSON estructurado
    json_dict = {
        'metadata': {
            'generated_at': datetime.now().isoformat(),
            'total_tables': len(tables_data),
            'total_fields': len(dictionary_rows),
            'source_document': '020IN SAT Interfaces v7.5- vol I - Batch_NUEK (1).docx'
        },
        'tables': []
    }
    
    for table_data in tables_data:
        table_entry = {
            'name': table_data['metadata']['title'],
            'business_area': table_data['metadata']['business_area'],
            'type_code': table_data['metadata']['type_code'],
            'description': table_data['metadata']['description'],
            'columns': []
        }
        
        for col in table_data['columns']:
            column_entry = {
                'name': col['nombre'],
                'sql_type': col['type_info']['sql_type'],
                'category': col['type_info']['category'],
                'nullable': col['type_info']['nullable'],
                'description': col['descripcion'],
                'technical_description': col['type_info']['description'],
                'original_type': col.get('tipo', ''),
                'length': col.get('longitud', ''),
                'decimals': col.get('decimales', '')
            }
            table_entry['columns'].append(column_entry)
        
        json_dict['tables'].append(table_entry)
    
    return {
        'dataframe': df,
        'json': json_dict
    }

def main():
    """Función principal que procesa el documento y genera todos los archivos"""
    
    print("🚀 Iniciando generación de diccionario de datos y SQL...")
    
    # Configurar rutas
    input_file = "020IN SAT Interfaces  v7.5- vol I - Batch_NUEK (1).docx"
    sql_output = "sql/final/scripts_sql_con_descripciones.sql"
    excel_output = "data-dictionary/diccionario_datos.xlsx"
    json_output = "data-dictionary/diccionario_datos.json"
    
    if not os.path.exists(input_file):
        print(f"❌ Error: No se encontró el archivo {input_file}")
        return
    
    try:
        # Abrir documento
        print("📖 Cargando documento Word...")
        doc = Document(input_file)
        print(f"✅ Documento cargado exitosamente. Total de tablas: {len(doc.tables)}")
        
        # Procesar cada tabla
        tables_data = []
        for i, table in enumerate(doc.tables):
            print(f"⚙️ Procesando tabla {i+1}/{len(doc.tables)}...")
            
            # Extraer contexto
            context = extract_table_context(doc, i)
            
            # Extraer datos de la tabla
            table_info = {
                'metadata': context,
                'columns': []
            }
            
            # Procesar filas de la tabla
            for row_idx, row in enumerate(table.rows):
                if row_idx == 0:  # Saltar encabezados
                    continue
                    
                cells = [cell.text.strip() for cell in row.cells]
                if len(cells) >= 3 and cells[0]:  # Validar fila
                    nombre = cells[0]
                    descripcion = cells[1] if len(cells) > 1 else nombre
                    tipo = cells[2] if len(cells) > 2 else ""
                    longitud = cells[3] if len(cells) > 3 else ""
                    decimales = cells[4] if len(cells) > 4 else ""
                    
                    type_info = map_data_type(tipo, longitud, decimales)
                    
                    column = {
                        'nombre': nombre,
                        'descripcion': descripcion,
                        'tipo': tipo,
                        'longitud': longitud,
                        'decimales': decimales,
                        'type_info': type_info
                    }
                    
                    table_info['columns'].append(column)
            
            if table_info['columns']:  # Solo agregar si tiene columnas
                tables_data.append(table_info)
        
        print(f"✅ Procesamiento completado. Total de tablas válidas: {len(tables_data)}")
        
        # Generar SQL con descripciones
        print("🏗️ Generando scripts SQL con descripciones...")
        sql_content = generate_sql_with_descriptions(tables_data)
        
        os.makedirs(os.path.dirname(sql_output), exist_ok=True)
        with open(sql_output, 'w', encoding='utf-8') as f:
            f.write(sql_content)
        print(f"✅ SQL generado: {sql_output}")
        
        # Generar diccionario de datos
        print("📚 Generando diccionario de datos...")
        dictionary = generate_data_dictionary(tables_data)
        
        # Guardar Excel
        os.makedirs(os.path.dirname(excel_output), exist_ok=True)
        with pd.ExcelWriter(excel_output, engine='openpyxl') as writer:
            dictionary['dataframe'].to_excel(writer, sheet_name='Diccionario_Datos', index=False)
            
            # Crear hoja de resumen
            summary_data = {
                'Métrica': [
                    'Total de Tablas',
                    'Total de Campos',
                    'Fecha de Generación',
                    'Documento Fuente',
                    'Áreas de Negocio Únicas'
                ],
                'Valor': [
                    len(tables_data),
                    len(dictionary['dataframe']),
                    datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    input_file,
                    len(dictionary['dataframe']['Área_Negocio'].unique())
                ]
            }
            pd.DataFrame(summary_data).to_excel(writer, sheet_name='Resumen', index=False)
        
        print(f"✅ Excel generado: {excel_output}")
        
        # Guardar JSON
        os.makedirs(os.path.dirname(json_output), exist_ok=True)
        with open(json_output, 'w', encoding='utf-8') as f:
            json.dump(dictionary['json'], f, ensure_ascii=False, indent=2)
        print(f"✅ JSON generado: {json_output}")
        
        # Mostrar estadísticas finales
        print("\n" + "="*70)
        print("📊 ESTADÍSTICAS FINALES")
        print("="*70)
        print(f"📁 Total de tablas procesadas: {len(tables_data)}")
        print(f"📝 Total de campos: {len(dictionary['dataframe'])}")
        print(f"🏢 Áreas de negocio: {len(dictionary['dataframe']['Área_Negocio'].unique())}")
        print(f"📄 Tamaño SQL: {len(sql_content):,} caracteres")
        print("="*70)
        
    except Exception as e:
        print(f"❌ Error durante el procesamiento: {str(e)}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()
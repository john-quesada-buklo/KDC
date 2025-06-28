-- ===============================================================================
-- Scripts SQL generados automáticamente desde documento Word
-- Con nombres reales de tablas y descripciones extraídas
-- Basado en las instrucciones de: instrucciones.md
-- Fecha de generación: 2025-06-28 00:01:42
-- ===============================================================================

-- Programa ATB526: Formatea los registros de detalle. Genera los 5 tipos de ficher
-- os ‘CU’, ‘LI’, ‘FI’, ‘CE’, ‘CC’ Programa ATB480: Genera la cinta. Detalle de cam
-- pos de los campos comunes.
CREATE TABLE Tabla1 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CU’ – CUENTA O CONTRATO DE TARJETA ‘LI’ – LÍNEAS DE CRÉDITO PARALELAS ‘FI’ – DATOS COMPRA EN CUOTAS ‘CE‘ – MOVIMIENTO CUOTA ‘CC’ – MOVIMIENTO CONCEPTO ECONÓMICO
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla2 (
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN,
    NUMBEN               INT             -- NÚMERO DE BENEFICIARIOS DE LA CUENTA,
    CODREGIMEN           INT             -- CÓDIGO DE RÉGIMEN FISCAL
);

-- En este apartado se describen los campos comunes que preceden al resto de estruc
-- turas de registro en todos y cada uno de los siguientes tipos de registro. Estru
-- ctura común inicial para todos los tipos de registro (ATEXTCU1):
CREATE TABLE Tabla3 (
    CLAMON               INT             -- CLAVE DE MONEDA,
    LIMCRECTA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA,
    LIMCRECTAC           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA,
    SALDISCRE            DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO,
    SALDISCREC           DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO EN COMPRA EN CUOTAS,
    INDMONPRIN           VARCHAR(1)      -- INDICADOR DE MONEDA PRINCIPAL (S/N),
    CODFORMATO           VARCHAR(10)     -- CÓDIGO DE FORMATO,
    FILLER               VARCHAR(146)   
);

-- Detalle de campos de los registros de extractos Estructura del tipo de registro 
-- de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla4 (
    LINEA                VARCHAR(4)      -- LÍNEA ASOCIADA A LA CUENTA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA COMERCIAL,
    CLAMON               INT             -- CLAVE DE MONEDA,
    LIMCRELIN            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA DE LA LÍNEA,
    SALAUTLIN            DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO DE LA LÍNEA,
    SALDISLIN            DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPUESTO DE LA LÍNEA,
    FECINILIN            UNKNOWN         -- FECHA DE INICIO DE LA LÍNEA,
    FECFINLIN            UNKNOWN         -- FECHA DE FIN DE LA LÍNEA
);

-- Detalle de campos de los registros de extractos Estructura del tipo de registro 
-- de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla5 (
    INDTIPLIN            VARCHAR(1)      -- INDICADOR DE TIPO DE LÍNEA A: LÍNEA ADICIONAL (NO DEPENDE DEL DISPONIBLE DEL CONTRATO) C: LÍNEA DE LIMITE COMPARTIDO(DEPENDIENTE DEL CONTRATO),
    INDTIPOPE            VARCHAR(1)      -- INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA: R: REVOLVING C: COMPRA CUOTAS M: MIXTAS,
    FILLER               VARCHAR(164)   
);

-- Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registr
-- o ‘CU’: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de regi
-- stro ‘LI’:
CREATE TABLE Tabla6 (
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    NUMOPECUO            INT             -- NÚMERO DE OPERACIÓN CUOTAS,
    CLAMON               INT             -- CLAVE DE MONEDA,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN ACTUAL,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    NUMCUOPAG            INT             -- NÚMERO DE CUOTAS PAGADAS,
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR
);

-- Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI
-- ’: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de regi
-- stro ‘FI’:
CREATE TABLE Tabla7 (
    IMPINTTOTAL          DECIMAL(17, 2)  -- IMPORTE DE INTERESES TOTAL A PAGAR,
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE DE CAPITAL AMORTIZADO,
    IMPINTAMORT          DECIMAL(17, 2)  -- IMPORTE DE INTERESES AMORTIZADO,
    FECULTLIQ            UNKNOWN         -- FECHA DE ÚLTIMA LIQUIDACIÓN,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    NUMULTCUO            INT             -- NÚMERO DE ÚLTIMA CUOTA,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    FILLER               VARCHAR(16)    
);

-- Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI
-- ’: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de regi
-- stro ‘FI’:
CREATE TABLE Tabla8 (
    NUMOPECUO            INT             -- NÚMERO DE MOVIMIENTO,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    IMPCAPITAL           DECIMAL(17, 2)  -- IMPORTE CAPITAL,
    IMPINTERESES         DECIMAL(17, 2)  -- IMPORTE INTERÉS,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN,
    FILLER               VARCHAR(152)   
);

-- Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registr
-- o ‘FI’: Estructura de datos correspondiente a los datos de la cuota traspasada a
-- l extracto o dada de alta: ’CE’:
CREATE TABLE Tabla9 (
    NUMOPECUO            INT             -- NÚMERO DE MOVIMIENTO,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS,
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL CONCEPTO ECONÓMICO,
    FILLER               VARCHAR(172)   
);

-- Programa ATB526: Formatea los registros de detalle. Genera los 5 tipos de ficher
-- os ‘CU’, ‘LI’, ‘FI’, ‘CE’, ‘CC’ Detalle de campos de los campos comunes.
CREATE TABLE Tabla10 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CU ’– CUENTA O CONTRATO DE TARJETA ‘LI’ – LÍNEAS DE CRÉDITO PARALELAS ‘FI’ – DATOS COMPRA EN CUOTAS ‘CE‘ – MOVIMIENTO CUOTA ‘CC’ – MOVIMIENTO CONCEPTO ECONÓMICO,
    REGISTRO             VARCHAR(248)   ,
    TOKENNEGOCIO         VARCHAR(37)     -- formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- ERROR: No se pudieron procesar las columnas de TBL_FI
-- Headers encontrados: ['PRODUCTO', 'CÓDIGO DE PRODUCTO', 'Alfanumérico', '2', '']


-- Detalle de campos de los registros de extractos Para el tipo de registro FI, se 
-- informará el PAN ofuscado y se enviará el nuevo campo TOKENNEGOCIO, que está for
-- mado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO.
CREATE TABLE TBL_FI (
    LINEA                VARCHAR(4)      -- LÍNEA ASOCIADA A LA CUENTA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA COMERCIAL,
    CLAMON               INT             -- CLAVE DE MONEDA
);

-- ERROR: No se pudieron procesar las columnas de TBL_FI
-- Headers encontrados: ['LIMCRELIN', 'LÍMITE DE CRÉDITO CUENTA TARJETA DE LA LÍNEA', 'Numérico con Signo', '17', '2']


-- Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registr
-- o ‘CU’: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de regi
-- stro ‘LI’:
CREATE TABLE Tabla15 (
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN- OFUSCADO--,
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    NUMOPECUO            INT             -- NÚMERO DE OPERACIÓN CUOTAS,
    CLAMON               INT             -- CLAVE DE MONEDA
);

-- ERROR: No se pudieron procesar las columnas de Tabla16
-- Headers encontrados: ['NUMFINAN', 'NÚMERO DE FINANCIACIÓN ACTUAL', 'Numérico con Signo', '3', '0']


-- Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI
-- ’: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de regi
-- stro ‘FI’:
CREATE TABLE Tabla17 (
    NUMOPECUO            INT             -- NÚMERO DE MOVIMIENTO,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA
);

-- ERROR: No se pudieron procesar las columnas de Tabla18
-- Headers encontrados: ['IMPCUOTA', 'IMPORTE DE LA CUOTA', 'Numérico con Signo', '17', '2']


-- Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registr
-- o ‘FI’: Estructura de datos correspondiente a los datos de la cuota traspasada a
-- l extracto o dada de alta: ’CE’:
CREATE TABLE Tabla19 (
    NUMOPECUO            INT             -- NÚMERO DE MOVIMIENTO,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS,
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL CONCEPTO ECONÓMICO
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla21 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA (PRIMERA TARJETA DEL CONTRATO),
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CU’ – CUENTA O CONTRATO DE TARJETA
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla22 (
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN,
    REGISTRO             VARCHAR(457)    -- REGISTRO DE EXTRACTO,
    TOKENNEGOCIO         VARCHAR(37)     -- Formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla23 (
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    DESPROD              VARCHAR(30)     -- DESCRIPCIÓN DEL PRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(30)     -- DESCRIPCIÓN CONDICIÓN ECONÓMICA
);

-- Estructura común inicial para todos los tipos de registro (ATIMPEXT): Detalle de
--  campos de los registros de extractos.
CREATE TABLE Tabla24 (
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN,
    DESCALPART           VARCHAR(30)     -- DESCRIPCIÓN CALIDAD DE PARTICIPACIÓN,
    NUMBEN               INT             -- NÚMERO DE BENEFICIARIOS DE LA CUENTA,
    CODREGIMEN           INT             -- CÓDIGO DE RÉGIMEN FISCAL,
    DESREGIMEN           VARCHAR(30)     -- DESCRIPCIÓN DE RÉGIMEN FISCAL,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    LIMCRECTA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA,
    SIGSALDISCRE         VARCHAR(1)      -- SIGNO DE SALDO DISPUESTO A CRÉDITO,
    SALDISCRE            DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO,
    LIMCRECTAC           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA DE CUOTAS,
    SIGSALDISCREC        VARCHAR(1)      -- SIGNO SALDO DISPUESTO A CRÉDITO DE CUOTAS,
    SALDISCREC           DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO DE CUOTAS,
    INDMONPRIN           VARCHAR(1)      -- INDICADOR DE MONEDA PRINCIPAL (S/N),
    CODFORMATO           VARCHAR(10)     -- CÓDIGO DE FORMATO,
    DESCODFORMATO        VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE FORMATO,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    INDDOMCARCRE         VARCHAR(1)      -- INDICADOR DOMICILIACIÓN,
    INDCTAEMP            INT             -- INDICADOR CUENTA EMPRESA
);

-- Estructura común inicial para todos los tipos de registro (ATIMPEXT): Detalle de
--  campos de los registros de extractos.
CREATE TABLE Tabla25 (
    CLASEG               VARCHAR(3)      -- CLASE DE SEGMENTO DEL CLIENTE(TIPO DE CLIENTE),
    DESCLASEG            VARCHAR(30)     -- DESCRIPCIÓN CLASE DE SEGMENTO DEL CLIENTE (TIPO DE CLIENTE) “01” - CLIENTE “02” - EMPLEADO,
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    CODIDIOMA            VARCHAR(2)      -- CÓDIGO DE IDIOMA,
    DESIDIOMA            VARCHAR(20)     -- DESCRIPCIÓN IDIOMA,
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    DESCODBLQ            VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE BLOQUEO,
    OFIGESTORA           VARCHAR(4)      -- OFICINA GESTORA,
    CLAVE_PARTICIP       VARCHAR(3)      -- CLAVE PARTICIP.,
    COD_PRODUCTO         VARCHAR(3)      -- CODIGO DE PRODUCTO,
    DIG_CUENTA           VARCHAR(11)     -- DIGITO CUENTA,
    DIG_VERIFICA         VARCHAR(1)      -- DIGITO VERIFICACION,
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    FILLER               VARCHAR(2)      -- SIN USO,
    SUBTIPCLI            VARCHAR(2)      -- SUBTIPO DE CLIENTE,
    FILLER               VARCHAR(12)    
);

-- Detalle de campos de los registros de extractos. Estructura del tipo de registro
--  de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla26 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA
);

-- Detalle de campos de los registros de extractos. Estructura del tipo de registro
--  de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla27 (
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESTIPIMP            VARCHAR(30)     -- DESCRIPCIÓN TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    SIGIMPINI            VARCHAR(1)      -- SIGNO IMPORTE INICIAL,
    IMPINI               DECIMAL(17, 2)  -- IMPORTE INICIAL,
    SIGIMPFIN            VARCHAR(1)      -- SIGNO IMPORTE FINAL,
    IMPFIN               DECIMAL(17, 2)  -- IMPORTE FINAL,
    SIGIMPBON            VARCHAR(1)      -- SIGNO IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    IMPBON               DECIMAL(17, 2)  -- IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    SIGIMPAPL            VARCHAR(1)      -- SIGNO IMPORTE APLICADO,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    SIGIMPREC            VARCHAR(1)      -- SIGNO IMPORTE DE RECIBO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DE RECIBO,
    SIGIMPMIN            VARCHAR(1)      -- SIGNO IMPORTE MÍNIMO,
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    FILLER               VARCHAR(247)   
);

-- Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos
--  de importe: ’TX’: Estructura tipo de registro de cabecera de cuentas. Tipo de r
-- egistro ‘LI’:
CREATE TABLE Tabla28 (
    LINREF               INT             -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOM            VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    CLAMON               INT             -- MONEDA DE LA LÍNEA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    LIMCRELIN            DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA,
    SIGSALAUTLIN         VARCHAR(1)      -- SIGNO SALDO AUTORIZADO DE LA LÍNEA,
    SALAUTLIN            DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA,
    SIGSALDISLIN         VARCHAR(1)      -- SIGNO SALDO DISPUESTO DE LA LÍNEA,
    SALDISLIN            DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA,
    INDVIG               VARCHAR(1)      -- INDICADOR DE VIGENCIA,
    FILLER               VARCHAR(294)   
);

-- Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos
--  de importe: ’TX’: Estructura tipo de registro de cabecera de cuentas. Tipo de r
-- egistro ‘LI’:
CREATE TABLE Tabla29 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    INDREP               INT             -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO.
);

-- Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos
--  de importe: ’TX’: Estructura tipo de registro de cabecera de cuentas. Tipo de r
-- egistro ‘LI’:
CREATE TABLE Tabla30 (
    DESINDREP            VARCHAR(30)     -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO 0 – NORMAL 2 – RELIQUIDADO,
    FORPAGO              INT             -- FORMA DE PAGO,
    DESFORPAGO           VARCHAR(30)     -- DESCRIPCIÓN FORMA DE PAGO,
    SIGIMPTOTPAG         VARCHAR(1)      -- SIGNO IMPORTE TOTAL A PAGAR,
    IMPTOTPAG            DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPMIN            VARCHAR(1)      -- SIGNO IMPORTE MÍNIMO,
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO,
    SIGIMPCARGO          VARCHAR(1)      -- SIGNO IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    IMPCARGO             DECIMAL(17, 2)  -- IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    FECEXT               UNKNOWN         -- FECHA DE EXTRACTO,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN,
    FECLIQANT            UNKNOWN         -- FECHA DE LIQUIDACIÓN ANTERIOR,
    FECCAR               UNKNOWN         -- FECHA DE CARGO EXTRACTO,
    FECVALCAR            UNKNOWN         -- FECHA VALOR DEL CARGO EXTRACTO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO,
    SIGIMPEXCLIM         VARCHAR(1)      -- SIGNO IMPORTE EXCESO DEL LÍMITE DE CRÉDITO,
    IMPEXCLIM            DECIMAL(17, 2)  -- IMPORTE EXCESO DEL LÍMITE DE CRÉDITO,
    SIGIMSALAPLPRX       VARCHAR(1)      -- SIGNO IMPORTE APLAZADO,
    IMSALAPLPRX          DECIMAL(17, 2)  -- IMPORTE APLAZADO
);

-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estru
-- ctura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla31 (
    SIGIMPCARGOANT       VARCHAR(1)      -- SIGNO IMPORTE DEL CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    IMPCARGOANT          DECIMAL(17, 2)  -- IMPORTE DEL CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIAL DEL RECIBO,
    INPFIJOAPL           DECIMAL(15, 2)  -- IMPORTE DE PAGO FIJO APLAZADO,
    FECVENULT            UNKNOWN         -- FECHA DE VENCIMIENTO ÚLTIMA PROCESADA,
    FECVENPRO            UNKNOWN         -- FECHA DE VENCIMIENTO PRÓXIMA,
    FILLER               VARCHAR(134)   
);

-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estru
-- ctura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla32 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    INDNORCOR            INT             -- INDICADOR DE TI PO DE FACTURA NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    DESINDNORCOR         VARCHAR(30)     -- DESCRIPCIÓN INDICADOR TIPO FACTURA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    SIGNO                VARCHAR(1)      -- SIGNO DEL IMPORTE,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FACTURA
);

-- Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’: Es
-- tructura de datos correspondiente a los movimientos de extracto. Tipo de registr
-- o: ’MX’:
CREATE TABLE Tabla33 (
    INDFACINF            VARCHAR(1)      -- INDICADOR FACTURA INFORMATIVA (S/N),
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMONDIV         VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE MONEDA OPERACIÓN ORIGINAL,
    SIGIMPDIV            VARCHAR(1)      -- SIGNO IMPORTE EN DIVISA ORIGINAL,
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGIMPFAC            VARCHAR(1)      -- SIGNO IMPORTE DE LA FACTURA,
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI              DECIMAL(9, 4)   -- FACTOR DE CAMBIO APLICADO (SOLO TIENE SENTIDO PARA OPERACIONES EN EXTRANJERO),
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    DESACT               VARCHAR(30)     -- DESCRIPCIÓN DE ACTIVIDAD,
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPAIS              VARCHAR(30)     -- NOMBRE DEL PAÍS,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE OPERACIÓN,
    SIGIMPIMPTO          VARCHAR(1)      -- SIGNO IMPORTE DEL IMPUESTO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD
);

-- Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’: Es
-- tructura de datos correspondiente a los movimientos de extracto. Tipo de registr
-- o: ’MX’:
CREATE TABLE Tabla34 (
    LINREF               INT             -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    FORPAGO              INT             -- FORMA DE PAGO,
    DESFORPAGO           VARCHAR(30)     -- DESCRIPCIÓN FORMA DE PAGO,
    DATADI               VARCHAR(1)      -- INDICADOR DE DATOS ADICIONALES DE AUTORIZACIÓN
);

-- Estructura de datos correspondiente a los movimientos de extracto. Tipo de regis
-- tro: ’MX’: Estructura de datos correspondiente a los conceptos económicos de cad
-- a movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla35 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESTIPIMP            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    SIGIMPAPLECO         VARCHAR(1)      -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO
);

-- Estructura de datos correspondiente a los movimientos de extracto. Tipo de regis
-- tro: ’MX’: Estructura de datos correspondiente a los conceptos económicos de cad
-- a movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla36 (
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO         VARCHAR(1)      -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPBONECO         VARCHAR(1)      -- SIGNO DEL IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPIMPTO          VARCHAR(1)      -- SIGNO DEL IMPORTE DEL IMPUESTO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL CONCEPTO,
    SIGIMPAPL            VARCHAR(1)      -- SIGNO DEL IMPORTE APLICADO,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    SIGIMPLIQUI          VARCHAR(1)      -- SIGNO IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO,
    IMPLIQUI             DECIMAL(17, 2)  -- IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO,
    FECULTCAL            UNKNOWN         -- ÚLTIMA FECHA EN LA QUE SE HA REALIZADO EL CÁLCULO DE INTERESES,
    ESTCONECO            VARCHAR(1)      -- ESTADO DEL CONCEPTO ECONÓMICO,
    DESESTCONECO         VARCHAR(30)     -- DESCRIPCIÓN DEL ESTADO DEL CONCEPTO ECONÓMICO: – PENDIENTE. – LIQUIDADO – AMORTIZADO – ANULADO – RETENIDO
);

-- Estructura de datos correspondiente a los movimientos de extracto. Tipo de regis
-- tro: ’MX’: Estructura de datos correspondiente a los conceptos económicos de cad
-- a movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla37 (
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    FILLER               VARCHAR(191)   
);

-- Estructura de datos correspondiente a los conceptos económicos de cada movimient
-- o. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Si
-- mulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla38 (
    NUMEXTCTA            INT             -- NUMERO EXTRACTO CUENTA,
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCION CLAVE MONEDA,
    NUMSEQ               INT             -- NUMERO SECUENCIAL SIMULACION,
    SIGDEUDAINI          VARCHAR(1)      -- SIGNO DE LA DEUDA INICIAL,
    DEUDAINI             DECIMAL(17, 2)  -- IMPORTE DE LA DEUDA INICIAL,
    PORPAGOAP            DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO,
    PORCUOMIN            DECIMAL(7, 4)   -- PORCENTAJE CUOTA MÍNIMA,
    SIGTOTCUOMIN         VARCHAR(1)      -- SIGNO DEL TOTAL CUOTA MÍNIMA,
    TOTCUOMIN            DECIMAL(17, 2)  -- IMPORTE TOTAL CUOTA MÍNIMA,
    FORPAGSIM            VARCHAR(1)      -- FORMA DE PAGO EN SIMULACIÓN,
    DESPAGSIM            VARCHAR(30)     -- DESCRIPCIÓN DE FORMA DE PAGO EN SIMULACIÓN,
    PORCENTAJE           DECIMAL(7, 4)   -- PORCENTAJE EN SIMULACIÓN,
    MESES                INT             -- MESES EN SIMULACIÓN,
    SIGIMPCUO            VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUO               DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPAMORCUO        VARCHAR(1)      -- SIGNO DEL CAPITAL AMORTIZADO DE LA CUOTA,
    IMPAMORCUO           DECIMAL(17, 2)  -- CAPITAL AMORTIZADO DE LA CUOTA
);

-- Estructura de datos correspondiente a los conceptos económicos de cada movimient
-- o. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Si
-- mulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla39 (
    SIGIMPINTCUO         VARCHAR(1)      -- SIGNO DEL INTERES DE LA CUOTA,
    IMPINTCUO            DECIMAL(17, 2)  -- INTERÉS DE LA CUOTA,
    FECULTCUO            UNKNOWN         -- FECHA DE ULTIMA CUOTA,
    SIGIMPTOTAL          VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL A PAGAR,
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPAMORTOTAL      VARCHAR(1)      -- SIGNO DEL CAPITAL AMORTIZADO TOTAL,
    IMPAMORTOTAL         DECIMAL(17, 2)  -- CAPITAL AMORTIZADO TOTAL,
    SIGIMPINTTOT         VARCHAR(1)      -- SIGNO DEL INTERES TOTAL,
    IMPINTTOT            DECIMAL(17, 2)  -- INTERÉS TOTAL,
    TASAINTMENS          DECIMAL(7, 4)   -- TASA INTERÉS MENSUAL,
    TASAEFECANU          DECIMAL(7, 4)   -- TASA EFECTIVA ANUAL,
    FILLER               VARCHAR(184)    -- FILLER
);

-- Estructura de datos correspondiente a los conceptos económicos de cada movimient
-- o. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Si
-- mulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla40 (
    NUMEXTCTA            INT             -- NUMERO EXTRACTO CUENTA,
    CLAMONN              INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCION CLAVE MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO            INT             -- - CODIGO CONCEPTO ECONOMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCION CONCEPTO ECONOMICO,
    INDTIPOSALD          VARCHAR(1)      -- INDICADOR TIPO SALDO
);

-- Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de 
-- registro: ’SP’: Estructura de datos correspondiente a registros de Interés por p
-- eríodo. Tipo de registro: ’IN’:
CREATE TABLE Tabla41 (
    DESINDTIPOSALD       VARCHAR(30)     -- DESCRIPCION INDICADOR TIPO SALDO,
    FECHAINI             UNKNOWN         -- FECHA INICIO DEL PERIODO,
    FECHAFIN             UNKNOWN         -- FECHA FIN DEL PERIODO,
    SIGSALDOPER          VARCHAR(1)      -- SIGNO DEL SALDO DEL PERIODO,
    SALDOPER             DECIMAL(17, 2)  -- SALDO DEL PERIODO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE INTERÉS PERIODO,
    SIGIMPINT            VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERÉS,
    IMPINT               DECIMAL(17, 2)  -- IMPORTE DE INTERÉS,
    FILLER               VARCHAR(MAX)   
);

-- Estructura de datos correspondiente a registros de Interés por período. Tipo de 
-- registro: ’IN’: Detalle de campos de los registros de impagados.
CREATE TABLE Tabla42 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    SITUACION            INT             -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION         VARCHAR(20)     -- DESCRIPCIÓN DE LA SITUACIÓN DEL CONTRATO IMPAGADO,
    IMPCONT              DECIMAL(17, 2)  -- IMPORTE TOTAL DE IMPAGO DEL CONTRATO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE MORA
);

-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo de registro ‘IC’:
CREATE TABLE Tabla43 (
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECULTAPL            UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB            UNKNOWN         -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    NUMRECIMP            INT             -- NÚMERO DE RECIBOS IMPAGADOS,
    FECVENMOV            UNKNOWN         -- FECHA VENCIMIENTO PRIMER RECIBO,
    FILLER               VARCHAR(319)   
);

-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo de registro ‘IC’:
CREATE TABLE Tabla44 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER               VARCHAR(304)   
);

-- Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’: Estr
-- uctura de datos correspondiente al desglose del contrato de impagado. Tipo de re
-- gistro: ’IL’:
CREATE TABLE Tabla45 (
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DEL RECIBO IMPAGADO,
    FECEMIMOV            UNKNOWN         -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL            UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB            UNKNOWN         -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER               VARCHAR(273)   
);

-- Estructura de datos correspondiente al desglose del contrato de impagado. Tipo d
-- e registro: ’IL’: Estructura de datos correspondiente al recibo impagado. Tipo d
-- e registro: ’RI’:
CREATE TABLE Tabla46 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE
);

-- Estructura de datos correspondiente al desglose del contrato de impagado. Tipo d
-- e registro: ’IL’: Estructura de datos correspondiente al recibo impagado. Tipo d
-- e registro: ’RI’:
CREATE TABLE Tabla47 (
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER               VARCHAR(342)   
);

-- Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’: 
-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla48 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LINEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE LINEA,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    FECFAC               UNKNOWN         -- FECHA DEL MOVIMIENTO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE DEL MOVIMIENTO
);

-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Est
-- ructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla49 (
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO DEL MOVIMIENTO,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE DEL MOVIMIENTO,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN OPERACIÓN,
    TIPDOCPAG            INT             -- TIPO DE DOCUMENTO DE PAGO (SÓLO PARA PAGOS),
    DESDOCPAG            VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE DOCUMENTO DE PAGO (SÓLO PARA PAGOS),
    REFDOCPAG            VARCHAR(20)     -- REFERENCIA DEL TIPO DE DOCUMENTO (SÓLO PAGOS),
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE AMORTIZADO (SÓLO PARA PAGOS),
    TIPDEVOL             INT             -- TIPOS DE IMPAGO,
    DESTIPDEVOL          VARCHAR(30)     -- DESCRIPCIÓN DE TIPOS DE IMPAGO,
    FEC2PRES             UNKNOWN         -- FECHA VENCIMIENTO DE 2ª PRESENTACIÓN,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    FILLER               VARCHAR(154)   
);

-- Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: E
-- structura de datos correspondiente a conceptos económicos de cada movimiento del
--  recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla50 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE
);

-- Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: E
-- structura de datos correspondiente a conceptos económicos de cada movimiento del
--  recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla51 (
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    IMPCONSOL            DECIMAL(17, 2)  -- IMPORTE CONSOLIDADO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    INDPERCON            VARCHAR(1)      -- INDICADOR DE CONCEPTO PERDONADO,
    DESPERCON            VARCHAR(30)     -- DESCRIPCIÓN DE INDICADOR DE CONCEPTO PERDONADO,
    FILLER               VARCHAR(246)   
);

-- Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: E
-- structura de datos correspondiente a conceptos económicos de cada movimiento del
--  recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla52 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    TEXTO__CANJE         NUMERIC(50)     -- TEXTO VOUCHER,
    FILLER               VARCHAR(381)   
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla53 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA (PRIMERA TARJETA DEL CONTRATO)
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla54 (
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CU’ – CUENTA O CONTRATO DE TARJETA ‘LI’ – LÍNEAS DE CRÉDITO PARALELAS ‘EX’ – EXTRACTO ‘TX’ – EXTRACTO – TIPO DE LÍNEA – TIPO IMPORTE ‘MX’ – MOVIMIENTO EXTRACTO ‘MC’ – MOVIMIENTO CONCEPTO ECONÓMICO ‘SP’ – SIMULACION DE PAGOS ‘IN’ – INTERES POR PERIODOS ‘IC’ – CONTRATO IMPAGADO ‘IL’ – DESGLOSE CONTRATO IMPAGADO ‘RI’ – RECIBO IMPAGADO ‘RL’ – DESGLOSE RECIBO IMPAGADO ‘MI’ – MOVIMIENTO RECIBO IMPAGADO ‘CI’ – CONCEPTO ECONÓMICO DE MOVIMIENTO RECIBO IMPAGADO,
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN,
    REGISTRO             VARCHAR(457)    -- REGISTRO DE EXTRACTO,
    TOKENNEGOCIO         VARCHAR(37)     -- Formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- En este apartado se describen los campos comunes que preceden al resto de estruc
-- turas de registro en todos y cada uno de los siguientes tipos de registro. Estru
-- ctura común inicial para todos los tipos de registro (ATIMPEXT):
CREATE TABLE Tabla55 (
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    DESPROD              VARCHAR(30)     -- DESCRIPCIÓN DEL PRODUCTO
);

-- ERROR: No se pudieron procesar las columnas de Tabla56
-- Headers encontrados: ['CONPROD', 'CÓDIGO DE CONDICIÓN ECONÓMICA', 'Alfanumérico', '3', '']


-- ERROR: No se pudieron procesar las columnas de Tabla57
-- Headers encontrados: ['IDENTCLI', 'IDENTIFICADOR DE CLIENTE', 'Alfanumérico', '8', '']


-- Detalle de campos de los registros de extractos. Estructura del tipo de registro
--  de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla58 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESTIPIMP            VARCHAR(30)     -- DESCRIPCIÓN TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD - 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO,
    SIGIMPINI            VARCHAR(1)      -- SIGNO IMPORTE INICIAL,
    IMPINI               DECIMAL(17, 2)  -- IMPORTE INICIAL,
    SIGIMPFIN            VARCHAR(1)      -- SIGNO IMPORTE FINAL,
    IMPFIN               DECIMAL(17, 2)  -- IMPORTE FINAL,
    SIGIMPBON            VARCHAR(1)      -- SIGNO IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    IMPBON               DECIMAL(17, 2)  -- IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    SIGIMPAPL            VARCHAR(1)      -- SIGNO IMPORTE APLICADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla59
-- Headers encontrados: ['IMPAPL', 'IMPORTE APLICADO', 'Numérico', '17', '2']


-- Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registr
-- o ‘CU’: Estructura de datos correspondiente a los datos por extracto-tipo de lín
-- ea-tipos de importe: ’TX’:
CREATE TABLE Tabla60 (
    LINREF               INT             -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOM            VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    CLAMON               INT             -- MONEDA DE LA LÍNEA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    LIMCRELIN            DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA,
    SIGSALAUTLIN         VARCHAR(1)      -- SIGNO SALDO AUTORIZADO DE LA LÍNEA,
    SALAUTLIN            DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA,
    SIGSALDISLIN         VARCHAR(1)      -- SIGNO SALDO DISPUESTO DE LA LÍNEA,
    SALDISLIN            DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA,
    FILLER               VARCHAR(295)   
);

-- Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos
--  de importe: ’TX’: Estructura tipo de registro de cabecera de cuentas. Tipo de r
-- egistro ‘LI’:
CREATE TABLE Tabla61 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    INDREP               INT             -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO.,
    DESINDREP            VARCHAR(30)     -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO - 0 – NORMAL - 2 – RELIQUIDADO,
    FORPAGO              INT             -- FORMA DE PAGO,
    DESFORPAGO           VARCHAR(30)     -- DESCRIPCIÓN FORMA DE PAGO,
    SIGIMPTOTPAG         VARCHAR(1)      -- SIGNO IMPORTE TOTAL A PAGAR,
    IMPTOTPAG            DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPMIN            VARCHAR(1)      -- SIGNO IMPORTE MÍNIMO,
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO,
    SIGIMPCARGO          VARCHAR(1)      -- SIGNO IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    IMPCARGO             DECIMAL(17, 2)  -- IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    FECEXT               UNKNOWN         -- FECHA DE EXTRACTO,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN,
    FECLIQANT            UNKNOWN         -- FECHA DE LIQUIDACIÓN ANTERIOR
);

-- ERROR: No se pudieron procesar las columnas de Tabla62
-- Headers encontrados: ['FECCAR', 'FECHA DE CARGO EXTRACTO', 'Fecha', '10', '']


-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estru
-- ctura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla63 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    INDNORCOR            INT             -- INDICADOR DE TI PO DE FACTURA NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    DESINDNORCOR         VARCHAR(30)     -- DESCRIPCIÓN INDICADOR TIPO FACTURA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    SIGNO                VARCHAR(1)      -- SIGNO DEL IMPORTE,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    INDFACINF            VARCHAR(1)      -- INDICADOR FACTURA INFORMATIVA (S/N),
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN (ofuscado),
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMONDIV         VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE MONEDA OPERACIÓN ORIGINAL,
    SIGIMPDIV            VARCHAR(1)      -- SIGNO IMPORTE EN DIVISA ORIGINAL
);

-- ERROR: No se pudieron procesar las columnas de Tabla64
-- Headers encontrados: ['IMPDIV', 'IMPORTE EN DIVISA ORIGINAL', 'Numérico', '17', '2']


-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estru
-- ctura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla65 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            UNKNOWN         -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            UNKNOWN         -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESTIPIMP            UNKNOWN         -- DESCRIPCIÓN DEL TIPO DE IMPORTE,
    SIGIMPAPLECO         UNKNOWN         -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO         UNKNOWN         -- SIGNO DEL IMPORTE BRUTO CALCULADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla66
-- Headers encontrados: ['', 'POR EL CONCEPTO ECONÓMICO', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla67
-- Headers encontrados: ['', '– AMORTIZADO – ANULADO – RETENIDO', '', '', '']


-- Estructura de datos correspondiente a los movimientos de extracto. Tipo de regis
-- tro: ’MX’: Estructura de datos correspondiente a los conceptos económicos de cad
-- a movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla68 (
    NUMEXTCTA            INT             -- NUMERO EXTRACTO CUENTA,
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCION CLAVE MONEDA,
    NUMSEQ               INT             -- NUMERO SECUENCIAL SIMULACION,
    SIGDEUDAINI          VARCHAR(1)      -- SIGNO DE LA DEUDA INICIAL,
    DEUDAINI             DECIMAL(17, 2)  -- IMPORTE DE LA DEUDA INICIAL,
    PORPAGOAP            DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO,
    PORCUOMIN            DECIMAL(7, 4)   -- PORCENTAJE CUOTA MÍNIMA,
    SIGTOTCUOMIN         VARCHAR(1)      -- SIGNO DEL TOTAL CUOTA MÍNIMA,
    TOTCUOMIN            DECIMAL(17, 2)  -- IMPORTE TOTAL CUOTA MÍNIMA,
    FORPAGSIM            VARCHAR(1)      -- FORMA DE PAGO EN SIMULACIÓN,
    DESPAGSIM            VARCHAR(30)     -- DESCRIPCIÓN DE FORMA DE PAGO EN SIMULACIÓN,
    PORCENTAJE           DECIMAL(7, 4)   -- PORCENTAJE EN SIMULACIÓN,
    MESES                INT             -- MESES EN SIMULACIÓN,
    SIGIMPCUO            VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUO               DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPAMORCUO        VARCHAR(1)      -- SIGNO DEL CAPITAL AMORTIZADO DE LA CUOTA
);

-- Estructura de datos correspondiente a los conceptos económicos de cada movimient
-- o. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Si
-- mulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla69 (
    IMPAMORCUO           DECIMAL(17, 2)  -- CAPITAL AMORTIZADO DE LA CUOTA,
    SIGIMPINTCUO         VARCHAR(1)      -- SIGNO DEL INTERES DE LA CUOTA,
    IMPINTCUO            DECIMAL(17, 2)  -- INTERÉS DE LA CUOTA,
    FECULTCUO            VARCHAR(10)     -- FECHA DE ULTIMA CUOTA,
    SIGIMPTOTAL          VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL A PAGAR,
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPAMORTOTAL      VARCHAR(1)      -- SIGNO DEL CAPITAL AMORTIZADO TOTAL,
    IMPAMORTOTAL         DECIMAL(17, 2)  -- CAPITAL AMORTIZADO TOTAL,
    SIGIMPINTTOT         VARCHAR(1)      -- SIGNO DEL INTERES TOTAL,
    IMPINTTOT            DECIMAL(17, 2)  -- INTERÉS TOTAL,
    TASAINTMENS          DECIMAL(7, 4)   -- TASA INTERÉS MENSUAL,
    TASAEFECANU          DECIMAL(7, 4)   -- TASA EFECTIVA ANUAL
);

-- Estructura de datos correspondiente a los conceptos económicos de cada movimient
-- o. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Si
-- mulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla70 (
    NUMEXTCTA            INT             -- NUMERO EXTRACTO CUENTA,
    CLAMONN              INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCION CLAVE MONEDA,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO            INT             -- - CODIGO CONCEPTO ECONOMICO
);

-- Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de 
-- registro: ’SP’: Estructura de datos correspondiente a registros de Interés por p
-- eríodo. Tipo de registro: ’IN’:
CREATE TABLE Tabla71 (
    DESCONECO            VARCHAR(30)     -- DESCRIPCION CONCEPTO ECONOMICO,
    INDTIPOSALD          VARCHAR(1)      -- INDICADOR TIPO SALDO,
    DESINDTIPOSALD       VARCHAR(30)     -- DESCRIPCION INDICADOR TIPO SALDO,
    FECHAINI             UNKNOWN         -- FECHA INICIO DEL PERIODO,
    FECHAFIN             UNKNOWN         -- FECHA FIN DEL PERIODO,
    SIGSALDOPER          VARCHAR(1)      -- SIGNO DEL SALDO DEL PERIODO,
    SALDOPER             DECIMAL(17, 2)  -- SALDO DEL PERIODO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE INTERÉS PERIODO,
    SIGIMPINT            VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERÉS,
    IMPINT               DECIMAL(17, 2)  -- IMPORTE DE INTERÉS,
    FILLER               VARCHAR(MAX)   
);

-- Estructura de datos correspondiente a registros de Interés por período. Tipo de 
-- registro: ’IN’: Detalle de campos de los registros de impagados.
CREATE TABLE Tabla72 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    SITUACION            INT             -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION         VARCHAR(20)     -- DESCRIPCIÓN DE LA SITUACIÓN DEL CONTRATO IMPAGADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla73
-- Headers encontrados: ['IMPCONT', 'IMPORTE TOTAL DE IMPAGO DEL CONTRATO', 'Numérico', '17', '2']


-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo de registro ‘IC’:
CREATE TABLE Tabla74 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla75
-- Headers encontrados: ['', '- 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO', '', '', '']


-- Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’: Estr
-- uctura de datos correspondiente al desglose del contrato de impagado. Tipo de re
-- gistro: ’IL’:
CREATE TABLE Tabla76 (
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DEL RECIBO IMPAGADO,
    FECEMIMOV            UNKNOWN         -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL            UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB            UNKNOWN         -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER               VARCHAR(273)   
);

-- Estructura de datos correspondiente al desglose del contrato de impagado. Tipo d
-- e registro: ’IL’: Estructura de datos correspondiente al recibo impagado. Tipo d
-- e registro: ’RI’:
CREATE TABLE Tabla77 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD - 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER               VARCHAR(342)   
);

-- Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’: 
-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla78 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            UNKNOWN         -- DESCRIPCIÓN DE CLAVE DE MONEDA
);

-- ERROR: No se pudieron procesar las columnas de Tabla79
-- Headers encontrados: ['TIPOLIN', 'TIPO DE LINEA', 'Alfanuméric o', '4', '']


-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Est
-- ructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla80 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD - 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO,
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    IMPCONSOL            DECIMAL(17, 2)  -- IMPORTE CONSOLIDADO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla81
-- Headers encontrados: ['INDPERCON', 'INDICADOR DE CONCEPTO PERDONADO', 'Alfanumérico', '1', '']


-- Los registros de la interfaz se dividen en dos partes, una de las cuales es comú
-- n a todos los tipos de carta y otra con datos concretos de cada tipo de carta. L
-- os datos generales tendrán la siguiente estructura:
CREATE TABLE Tabla82 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DEL CLIENTE,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    IND_ENVIO            VARCHAR(1)      -- INDICADOR DE ENVÍO (LLEVARÁ UNA ‘O’ SI VA A IR A OFICINA EN LUGAR DE AL CLIENTE),
    CENTRO               VARCHAR(4)      -- CENTRO DE ENVÍO,
    TIPO_CAR             INT             -- TIPO DE CARTA 1 - CARTA DE PIN 2 - CARTA DE BIENVENIDA 3 - CARTAS DE COMUNICACIÓN DE BLOQUEO 4 - CARTA DE COMUNICACIÓN DE IMPAGO 6 – CARTA DE CVV2,
    DATOS                VARCHAR(254)    -- DATOS VARIABLES
);

-- Los registros de la interfaz se dividen en dos partes, una de las cuales es comú
-- n a todos los tipos de carta y otra con datos concretos de cada tipo de carta. L
-- os datos generales tendrán la siguiente estructura:
CREATE TABLE Tabla83 (
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    VISAPHONE            INT             -- CÓDIGO VISAPHONE,
    CRIPPIN              VARCHAR(16)     -- CRIPTOGRAMA DEL PIN,
    MOTCARPIN            VARCHAR(2)      -- MOTIVO DE LA CARTA DE PIN,
    FILLER               VARCHAR(206)   
);

-- Estructura común inicial para todos los tipos de registro (ATINTCAR): La estruct
-- ura de los datos para las cartas de PIN es la siguiente:
CREATE TABLE Tabla84 (
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    FECEFE               UNKNOWN         -- FECHA DE EFECTIVIDAD DE LA TARJETA,
    FILLER               VARCHAR(218)   
);

-- La estructura de los datos para las cartas de PIN es la siguiente: El programa q
-- ue formatea el registro de detalle es el ATB431.
CREATE TABLE Tabla85 (
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA,
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    DESCRIPCI_N          VARCHAR(30)     -- DESCRIPCIÓN DEL BLOQUEO,
    INDAPLEMISOR         VARCHAR(1)      -- INDICADOR DE APLICACIÓN EN VERTIENTE EMISOR,
    FECBLQ               UNKNOWN         -- FECHA DE BLOQUEO,
    HORABLQ              VARCHAR(8)      -- HORA DE BLOQUEO,
    FILLER               VARCHAR(181)   
);

-- La estructura de los datos para las cartas de Bienvenida es la siguiente: El pro
-- grama que formatea el registro de detalle es el ATB430.
CREATE TABLE Tabla86 (
    FECIMPAGO            UNKNOWN         -- FECHA DE IMPAGO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE TOTAL DEL RECIBO IMPAGADO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE DEMORA,
    CLAMON               INT             -- CLAVE DE MONEDA,
    FILLER               VARCHAR(207)   
);

-- La estructura, para las cartas de comunicación de bloqueos es la siguiente: El p
-- rograma que formatea el registro de detalle es el ATB467.
CREATE TABLE Tabla87 (
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    FECCADTAR            INT             -- FECHA DE CADUCIDAD DE LA TARJETA,
    CVV2                 VARCHAR(3)      -- CÓDIGO DE CVV2,
    FILLER               VARCHAR(219)   
);

-- Los registros de la interfaz se dividen en dos partes, una de las cuales es comú
-- n a todos los tipos de carta y otra con datos concretos de cada tipo de carta. E
-- l programa ATBT80 para todos los tipos de registro ofusca el PAN y obtiene el ca
-- mpo TOKENNEGOCIO, que está formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUM
-- PLASTICO.
CREATE TABLE Tabla88 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DEL CLIENTE,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    IND_ENVIO            VARCHAR(1)      -- INDICADOR DE ENVÍO (LLEVARÁ UNA ‘O’ SI VA A IR A OFICINA EN LUGAR DE AL CLIENTE),
    CENTRO               VARCHAR(4)      -- CENTRO DE ENVÍO,
    TIPO_CAR             INT             -- TIPO DE CARTA 1 - CARTA DE PIN 2 - CARTA DE BIENVENIDA 3 - CARTAS DE COMUNICACIÓN DE BLOQUEO 4 - CARTA DE COMUNICACIÓN DE IMPAGO 6 – CARTA DE CVV2,
    DATOS                VARCHAR(259)    -- DATOS VARIABLES,
    TOKENNEGOCIO         VARCHAR(37)     -- formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Los registros de la interfaz se dividen en dos partes, una de las cuales es comú
-- n a todos los tipos de carta y otra con datos concretos de cada tipo de carta. E
-- l programa ATBT80 para todos los tipos de registro ofusca el PAN y obtiene el ca
-- mpo TOKENNEGOCIO, que está formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUM
-- PLASTICO.
CREATE TABLE Tabla89 (
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA – OFUSCADO --,
    VISAPHONE            INT             -- CÓDIGO VISAPHONE,
    CRIPPIN              VARCHAR(16)     -- CRIPTOGRAMA DEL PIN,
    MOTCARPIN            VARCHAR(2)      -- MOTIVO DE LA CARTA DE PIN,
    FILLER               VARCHAR(174)   
);

-- Estructura común inicial para todos los tipos de registro (ATINTCR2): La estruct
-- ura de los datos para las cartas de PIN es la siguiente:
CREATE TABLE Tabla90 (
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA– OFUSCADO --,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    FECEFE               UNKNOWN         -- FECHA DE EFECTIVIDAD DE LA TARJETA,
    FILLER               VARCHAR(186)   
);

-- ERROR: No se pudieron procesar las columnas de Tabla92
-- Headers encontrados: ['PAN', 'NÚMERO DE LA TARJETA– OFUSCADO --', 'Alfanumérico', '22', '']


-- El programa que formatea el registro de detalle es el ATB430. La estructura, par
-- a las cartas de comunicación de bloqueos es la siguiente:
CREATE TABLE Tabla93 (
    FECIMPAGO            UNKNOWN         -- FECHA DE IMPAGO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE TOTAL DEL RECIBO IMPAGADO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE DEMORA,
    CLAMON               INT             -- CLAVE DE MONEDA,
    FILLER               VARCHAR(175)   
);

-- ERROR: No se pudieron procesar las columnas de Tabla95
-- Headers encontrados: ['CODMAR', 'CÓDIGO DE MARCA', 'Numérico', '2', '0']


-- Programa ATB670: Formatea el registro de detalle. Programa ATB471: Genera la cin
-- ta. Detalle de campos de los campos comunes.
CREATE TABLE Tabla96 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CU’ – CUENTA DE MEDIOS DE PAGO ‘DC’ – DIRECCIONES DE PERSONA POR CONTRATO ‘LC’ – LIMITES DE LA CUENTA ‘CC’ – CARTERA CONGELADA ‘LI’ – LÍNEAS ASOCIADAS A LA CUENTA ‘PC’ – PLASTICOS DE LA CUENTA ‘MP’ – MEDIO DE PAGO (TARJETA) ‘RT’ – RESTRICCIONES DE TARJETA ‘DR’ – DESGLOSE POR LÍNEA ÚLTIMO RECIBO ‘IC’ – CONTRATO IMPAGADO ‘IL’ – DESGLOSE CONTRATO IMPAGADO ‘RI’ – RECIBO IMPAGADO ‘RL’ – DESGLOSE RECIBO IMPAGADO ‘MI’ – MOVIMIENTO RECIBO IMPAGADO ‘CI’ – CONCEPTO ECONÓMICO DE MOVIMIENTO RECIBO IMPAGADO ‘‘TX’ – EXTRACTO – TIPO DE LÍNEA – TIPO IMPORTE – DEUDA VIVA,
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN
);

-- Programa ATB670: Formatea el registro de detalle. Programa ATB471: Genera la cin
-- ta. Detalle de campos de los campos comunes.
CREATE TABLE Tabla97 (
    FECULTCAR            UNKNOWN         -- FECHA ÚLTIMO PAGO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla98 (
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    DESPRODU             VARCHAR(30)     -- DESCRIPCIÓN DEL PRODUCTO,
    TIPOCTO              VARCHAR(20)     -- TIPO DE CONTRATO DEBITO CREDITO PREPAGO PREPAGO REGALO,
    FECPROVEN            UNKNOWN         -- FECHA DE PRÓXIMO VENCIMIENTO,
    FECULTVEN            UNKNOWN         -- FECHA DE ÚLTIMO VENCIMIENTO,
    FECRESOL             UNKNOWN         -- FECHA DE RESOLUCIÓN DEL CONTRATO,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DEL CLIENTE,
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    DESBLQ               VARCHAR(30)     -- DESCRIPCIÓN DEL BLOQUEO,
    INDBLQOPE            VARCHAR(1)      -- INDICADOR DE BLOQUEO DE OPERATIVIDAD,
    DESBLQOPE            VARCHAR(25)     -- DESCRIPCIÓN DE BLOQUEO DE OPERATIVIDAD: N: SIN BLOQUEO S: BLOQUEO DE OPERACIONES T: BLOQUEO DE OPER. Y PAGOS,
    CODESTCTA            INT             -- CÓDIGO DE ESTADO DEL CONTRATO DE TARJETA,
    DESESTCTA            VARCHAR(30)     -- DESCRIPCIÓN ESTADO DE CONTRATO 00 – OPERATIVO 01 – IMPAGADO LEVE 02 – IMPAGADO GRAVE 03 – IMPAGADO DEFINITIVO,
    CLASIFCONT           VARCHAR(1)      -- CLASIFICACIÓN CONTABLE,
    DESCLASIFCONT        VARCHAR(30)     -- DESCRIPCIÓN CLASIFICACIÓN CONTABLE: N – NORMAL D – DUDOSO G – CONGELADA C – CASTIGO O FALLIDO
);

-- Estructura común inicial para todos los tipos de registro (ATENVPO1): Detalle de
--  campos de los registros de titulares.
CREATE TABLE Tabla99 (
    FECULTESTCTA         UNKNOWN         -- FECHA ÚLTIMO CAMBIO DE ESTADO DEL CONTRATO DE TARJETA,
    CODCONVEN            VARCHAR(4)      -- CÓDIGO DE CONVENIO,
    DESCONVENRED         VARCHAR(10)     -- DESCRIPCIÓN DE CONVENIO REDUCIDA (MPDT168),
    INDCTAEMP            INT             -- INDICADOR DE CUENTA DE EMPRESA,
    DESINDCTAEMP         VARCHAR(20)     -- DESCRIPCIÓN INDICADOR CUENTA DE EMPRESA 0 - PARTICULAR 1 – EMPRESA 2 – ESTRUCTURA BUSINESS,
    CODBUS               INT             -- CÓDIGO DE ESTRUCTURA BUSINESS,
    DESESTBUS            VARCHAR(30)     -- DESCRIPCIÓN DE LA ESTRUCTURA,
    CODELEMENTO          INT             -- CÓDIGO DE ELEMENTO DENTRO DE LA ESTRUCTURA BUSINESS,
    TIPROLCUENTA         VARCHAR(1)      -- TIPO DE ROL DE LA CUENTA EN LA ESTRUCTURA BUSINESS,
    DESROLCUENTA         VARCHAR(20)     -- DESCRIPCIÓN DE ROL DE LA CUENTA EN LA ESTRUCTURA BUSINESS U = CUENTA DE CONTROL DE CUOTAS O ACTIVIDAD (ÚNICA) E = CUENTA DE EMPLEADO,
    INDDOMCARCRE         VARCHAR(1)      -- INDICADOR DE DOMICILIACIÓN DEL CARGO DEL EXTRACTO DE CRÉDITO (S/N),
    FORPAGO              INT             -- FORMA DE PAGO DEL EXTRACTO DE CRÉDITO,
    DESFORPAGO           VARCHAR(15)     -- DESCRIPCIÓN DE LA FORMA DE PAGO – PAGO DÉBITO CONTADO – PAGO TOTAL – PAGO FIJO – PAGO APLAZADO – PAGO FIJO CON OP. FIN.
);

-- Detalle de campos de los registros de titulares. Estructura tipo de registro de 
-- cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla100 (
    INDSITCTA            INT             -- INDICADOR DE SITUACIÓN DEL CONTRATO,
    DESSITCTA            VARCHAR(30)     -- DESCRIPCIÓN INDICADOR DE SITUACION DEL CONTRATO 0 – ACTIVO 1 – EN ESPERA RESOLUCIÓN NO EMITIDA TJT 2 – NO RESUELTA 3 – EN ESPERA DE CONFIRMAR POR CLIENTE. TARJETA EMITIDA 4 – ALTA DE CONTRATO SIN TARJETA,
    OFIGESTORA           VARCHAR(4)      -- OFICINA GESTORA,
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    FECBAJA              UNKNOWN         -- FECHA DE BAJA,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    INDTIPOCTO           VARCHAR(1)      -- INDICADOR TIPO CONTRATO,
    INTGENMORA           DECIMAL(13, 4)  -- INTERES GENERACION MORA,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE PAGO,
    IMPPAGO              DECIMAL(17, 2)  -- IMPORTE FIJO PAGO,
    INDVCF               VARCHAR(1)      -- INDICACOR DE CONTRATO ACOGIDO A V.C.F. POSIBLES VALORES: S/N,
    INDPPMIN             VARCHAR(1)      -- INDICADOR DE CONTRATO ACOGIDO A PROMOCIÓN DE PAGO MÍNIMO. POSIBLES VALORES: S/N
);

-- Detalle de campos de los registros de titulares. Estructura tipo de registro de 
-- cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla101 (
    INDCREFI             VARCHAR(2)      -- INDICADOR DE CONTRATO REFINANCIADO N - NORMAL DF - DIFERIMIENTOS NV - NOVACIÓN R1 - REFINANCIAMIENTO B1 R2 - REFINANCIAMIENTO B2 RC - REFINANCIAMIENTO COVID RS - REESTRUCTURACIÓN RC - REESTRUCTURACIÓN COVID,
    DESINDCREFI          VARCHAR(30)     -- DESCRIPCIÓN DE CONTRATO REFINANCIADO,
    FECREFI              UNKNOWN         -- FECHA DE REFINANCIACIÓN,
    CODESTCTACR          INT             -- CÓDIGO DE ESTADO CORE,
    FECULTESTCTA_CR      UNKNOWN         -- FECHA DE ÚLTIMO ESTADO CORE,
    CODESTBCACT          VARCHAR(4)      -- CÓDIGO ESTADO CALIFIACIÓN DE RIESTO ANTERIOR,
    FECULTESTBC          UNKNOWN         -- FECHA DE ÚLTIMO ESTADO BANCO CENTRAL,
    INDCASTAUT           VARCHAR(1)      -- INDICADOR DE CASTIGO AUTOMÁTICO. POSIBLES VALORES: E-Exento N-No aplica,
    FECCASTAUT           UNKNOWN         -- FECHA DE CASTIGO AUTOMÁTICO
);

-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla102 (
    FORPAGOTEMP          INT             -- FORMA DE PAGO TEMPORAL DEL EXTRACTO DE CRÉDITO: – PAGO TOTAL – FIJO – PAGO APLAZADO – FIJO CON OPERACIONES FINANCIADAS,
    DESFORPAGOTE_M       VARCHAR(15)     -- DESCRIPCIÓN FORMA DE PAGO TEMPORAL,
    FIFORPAGT            UNKNOWN         -- FECHA INICIO FORMA PAGO TEMPORAL,
    FFFORPAGT            UNKNOWN         -- FECHA FIN FORMA PAGO TEMPORAL,
    IMPFPATEM            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL,
    PORPATEM             DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO TEMPORAL,
    FILLER               VARCHAR(207)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’
CREATE TABLE Tabla103 (
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    TIPDIREC             VARCHAR(2)      -- TIPO DE MEDIO,
    DESTIPDIREC          VARCHAR(30)     -- DESCRIPCIÓN TIPO DE MEDIO DP: DIRECCIÓN POSTAL EM: EMAIL,
    NUMSEC               INT             -- NÚMERO SECUENCIAL DEL REGISTRO,
    CODUSO               VARCHAR(2)      -- CÓDIGO DE USO DE LA DIRECCIÓN,
    DESCODUSO            VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE USO DE LA DIRECCIÓN,
    FECALTA              VARCHAR(10)     -- FECHA DE ALTA,
    DIREMAIL             VARCHAR(100)    -- DIRECCIÓN DE EMAIL
);

-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’
CREATE TABLE Tabla104 (
    CARACTER             VARCHAR(1)      -- CARÁCTER,
    DESCARACTER          VARCHAR(30)     -- DESCRIPCION CARÁCTER 1 – PARTICULAR 2 – PROFESIONAL,
    TIPDIRECC            VARCHAR(2)      -- TIPO DE DIRECCIÓN,
    DESTIPDIRECC         VARCHAR(30)     -- DESCRIPCION TIPO DE DIRECCIÓN DH – DIRECCIÓN HABITUAL DE – DIRECCIÓN EMPLEADO DS – DIRECCIÓN SECUNDARIA DL – DIRECCIÓN LABORAL DR – DIRECCIÓN EMPRESA,
    TIPLOCAL             VARCHAR(2)      -- TIPO DE LOCAL,
    CODPAISDIR           INT             -- PAÍS DE DIRECCIÓN,
    NOMPAISDIR           VARCHAR(20)     -- NOMBRE DEL PAIS,
    CODREGION            VARCHAR(3)      -- REGIÓN,
    CODPROV              VARCHAR(2)      -- CÓDIGO DE PROVINCIA,
    DESPROV              VARCHAR(30)     -- PROVINCIA,
    POBLACION            VARCHAR(35)     -- POBLACIÓN,
    TIPVIA               VARCHAR(2)      -- TIPO DE VÍA,
    NOMVIA               VARCHAR(40)     -- NOMBRE DE VÍA,
    NUMVIA               VARCHAR(6)      -- NÚMERO DE VÍA,
    EMPRESA              VARCHAR(3)      -- EMPRESA,
    CENTRO               VARCHAR(4)      -- CENTRO,
    DEPARTAM             VARCHAR(4)      -- DEPARTAMENTO,
    EDIFICIO             VARCHAR(4)      -- EDIFICIO,
    ESCALERA             VARCHAR(4)      -- ESCALERA,
    PISO                 VARCHAR(4)      -- PISO,
    PUERTA               VARCHAR(4)      -- PUERTA,
    RESTODIR             VARCHAR(40)     -- RESTO DIRECCIÓN
);

-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’
CREATE TABLE Tabla105 (
    CODPOSTAL            VARCHAR(10)     -- CÓDIGO POSTAL,
    CODAPTCOR            VARCHAR(10)     -- APARTADO DE CORREOS,
    VIACOMP              VARCHAR(50)     -- VIA COMPLETA/ DIRECCIÓN,
    FILLER               VARCHAR(318)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’ Estructura de datos a nivel de límites de la cuenta. Tipo de registro
--  ‘LC’:
CREATE TABLE Tabla106 (
    CLAMON1              INT             -- CLAVE DE MONEDA,
    DESCLAMON1           VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA,
    LIMCRECTA1           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    LIMCRECTATEM1        DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA. TEMPORAL,
    FECINITEM1           UNKNOWN         -- INICIO VIGENCIA DE LÍMITES TEMPORALES,
    FECFINTEM1           UNKNOWN         -- FIN VIGENCIA DE LÍMITES TEMPORALES,
    SIG__SALAUTCRE1      VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO AUTORIZADO,
    SALAUTCRE1           DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO,
    SIG_SALDISCRE1       VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO DISPUESTO,
    SALDISCRE1           DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPUESTO,
    SIG__SALDISPOCRE1    VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO DISPONIBLE,
    SALDISPOCRE1         DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPONIBLE,
    LIMCRECTAC1          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS
);

-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’ Estructura de datos a nivel de límites de la cuenta. Tipo de registro
--  ‘LC’:
CREATE TABLE Tabla107 (
    SIG__SALAUTCREC1     VARCHAR(1)      -- SIGNO SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SALAUTCREC1          DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SIG__SALDISCREC1     VARCHAR(1)      -- SIGNO SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SALDISCREC1          DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SIG__SALDISPOCREC1   VARCHAR(1)      -- SIGNO SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    SALDISPOCREC1        DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    IBAN1                VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO1            VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    CLAMON2              INT             -- CLAVE DE MONEDA,
    DESCLAMON2           VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA,
    LIMCRECTA2           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    LIMCRECTATEM2        DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA. TEMPORAL,
    FECINITEM2           UNKNOWN         -- INICIO VIGENCIA DE LÍMITES TEMPORALES,
    FECFINTEM2           UNKNOWN         -- FIN VIGENCIA DE LÍMITES TEMPORALES,
    SIG__SALAUTCRE2      VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO AUTORIZADO,
    SALAUTCRE2           DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO,
    SIG_SALDISCRE2       VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO DISPUESTO,
    SALDISCRE2           DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPUESTO,
    SIG__SALDISPOCRE2    VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO DISPONIBLE,
    SALDISPOCRE2         DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPONIBLE
);

-- Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’:
CREATE TABLE Tabla108 (
    LIMCRECTAC2          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS,
    SIG__SALAUTCREC2     VARCHAR(1)      -- SIGNO SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SALAUTCREC2          DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SIG__SALDISCREC2     VARCHAR(1)      -- SIGNO SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SALDISCREC2          DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SIG__SALDISPOCREC2   VARCHAR(1)      -- SIGNO SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    SALDISPOCREC2        DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    IBAN2                VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO2            VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    FECSALACRE1          UNKNOWN         -- INICIO VIGENCIA DE SALDO ACREEDOR MONEDA1,
    FECSALACRE2          UNKNOWN         -- INICIO VIGENCIA DE SALDO ACREEDOR MONEDA2,
    FILLER               VARCHAR(334)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’: Estr
-- uctura de datos a nivel de cartera congelada. Tipo de registro ‘CC’:
CREATE TABLE Tabla109 (
    NUMSECIMP1           NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO DE MONEDA1,
    CLAMON1              INT             -- CLAVE DE MONEDA1,
    DESCLAMON1           VARCHAR(30)     -- DESCRIPCIÓN DE MONEDA1,
    SIG_IMPORTE1         VARCHAR(1)      -- SIGNO DEL IMPORTE TRASPASADO MONEDA1
);

-- Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’: Estr
-- uctura de datos a nivel de cartera congelada. Tipo de registro ‘CC’:
CREATE TABLE Tabla110 (
    IMPORTE1             DECIMAL(17, 2)  -- IMPORTE TRASPASADO A CONGELACIÓN MONEDA1,
    SIG__IMPORTETOT1     VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL TRASPASADO MONEDA1,
    IMPORTETOT1          DECIMAL(17, 2)  -- IMPORTE TOTAL CONGELADO DE COBRO MONEDA1,
    IMPAPL1              DECIMAL(17, 2)  -- IMPORTE APLICADO MONEDA1,
    NUMULTMOV1           INT             -- NÚMERO DE ÚLTIMO MOVIMIENTO MONEDA1,
    FECULTAPL1           UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN PAGO MONEDA1,
    FECBAJA1             UNKNOWN         -- FECHA DE BAJA EN CONGELACIÓN MONEDA1,
    MOTBAJA1             INT             -- CÓDIGO DE MOTIVO DE BAJA MONEDA1,
    NUMSECIMP2           NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO DE MONEDA1,
    CLAMON2              INT             -- CLAVE DE MONEDA2,
    DESCLAMON2           VARCHAR(30)     -- DESCRIPCIÓN DE MONEDA2,
    SIG_IMPORTE2         VARCHAR(1)      -- SIGNO DEL IMPORTE TRASPASADO MONEDA2,
    IMPORTE2             DECIMAL(17, 2)  -- IMPORTE TRASPASADO A CONGELACIÓN MONEDA2,
    SIG__IMPORTETOT2     VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL TRASPASADO MONEDA2,
    IMPORTETOT2          DECIMAL(17, 2)  -- IMPORTE TOTAL CONGELADO DE COBRO MONEDA2,
    IMPAPL2              DECIMAL(17, 2)  -- IMPORTE APLICADO MONEDA2,
    NUMULTMOV2           INT             -- NÚMERO DE ÚLTIMO MOVIMIENTO MONEDA2,
    FECULTAPL2           UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN PAGO MONEDA2,
    FECBAJA2             UNKNOWN         -- FECHA DE BAJA EN CONGELACIÓN MONEDA2,
    MOTBAJA2             INT             -- CÓDIGO DE MOTIVO DE BAJA MONEDA2,
    FECALTA              UNKNOWN         -- FECHA DE ALTA EN CONGELACIÓN,
    FILLER               VARCHAR(576)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estruct
-- ura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla111 (
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DE CLIENTE EN EL SISTEMA CORPORATIVO DE LA ENTIDAD,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN.,
    DESCALPART           VARCHAR(15)     -- DESCRIPCIÓN DE CALIDAD DE PARTICIPACIÓN: TI – TITULAR BE – BENEFICIARIO,
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    DESMAR               VARCHAR(30)     -- DESCRIPCIÓN DE LA MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT              VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE TARJETA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE LA TARJETA,
    FECULTUSO            UNKNOWN         -- FECHA DE ÚLTIMO USO DE LA TARJETA,
    INDSITTAR            INT             -- INDICADOR DE SITUACIÓN,
    DESSITTAR            VARCHAR(30)     -- DESCRIPCIÓN DE LA SITUACIÓN DE LA TARJETA 01 – SELECCIONADA ESTAMPACIÓN ALTA 02 – PENDIENTE DE ACUSE DE RECIBO POR ALTA. 03 – SELECCIONADA PARA ESTAMPACIÓN POR RENOVACIÓN. 04 – PENDIENTE DE ACUSE DE RECIBO POR RENOVACIÓN. 05 – EN PODER DEL CLIENTE. 06 – PENDIENTE CAMBIO PIN POR ALTA.
);

-- Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estruct
-- ura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla112 (
    CODBLQ               INT             -- INDICADOR DE BLOQUEO,
    DESBLQ               VARCHAR(30)     -- DESCRIPCIÓN DEL BLOQUEO
);

-- Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estruct
-- ura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla113 (
    FECCADTAR            INT             -- FECHA DE CADUCIDAD DE LA TARJETA,
    INDDEBCRE            INT             -- INDICADOR DE OPERATIVIDAD DE LA TARJETA,
    DESDEBCRE            VARCHAR(15)     -- DESCRIPCIÓN INDICADOR DE OPERATIVIDAD DE LA TARJETA: 1 – CRÉDITO 2 – DÉBITO 3 – MIXTA 4 – PREPAGO MONEDERO 5 – PREPAGO REGALO 6 – PREPAGO,
    NUMPLASTICO          NUMERIC(12)     -- NÚMERO DE PLÁSTICO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA,
    MAXDIACAJ            INT             -- MÁXIMO DIARIO DE CAJERO,
    NUMOPERCAJ           INT             -- NÚMERO DE OPERACIONES EN CAJERO,
    MAXOPER              INT             -- MÁXIMO NÚMERO DE OPERACIONES POR PERIODO,
    NUMOPER              INT             -- NÚMERO DE OPERACIONES POR PERIODO,
    MAXODIA              INT             -- MÁXIMO NÚMERO DE OPERACIONES POR DIA,
    NUMODIA              INT             -- NÚMERO DE OPERACIONES DIARIA,
    OFFSET1              VARCHAR(12)     -- OFFSET1,
    LIMDIACAJ            DECIMAL(17, 2)  -- LÍMITE DIARIO EN CAJERO,
    SALDIACAJ            DECIMAL(17, 2)  -- SALDO DIARIO DE CAJERO,
    LIMCRETAR            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE TARJETA. LÍMITE GLOBAL DE LA TARJETA,
    LIMCRETARTEM         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO TEMPORAL DE TARJETA. LÍMITE GLOBAL TEMPORAL DE LA TARJETA
);

-- Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estruct
-- ura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla114 (
    FECINICRETAR         UNKNOWN         -- INICIO VIGENCIA LÍMITE TEMPORAL. CRÉDITO DE LA TARJETA,
    FECFINCRETAR         UNKNOWN         -- FIN VIGENCIA LÍMITE TEMPORAL CRÉDITO DE LA TARJETA,
    LIMCREMES            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO MENSUAL. LÍMITE MENSUAL CUANDO NO HAY RESTRICCIÓN A NIVEL DE ACTIVIDAD O COMERCIO.,
    LIMCREMESTEM         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO TEMPORAL MENSUAL. LÍMITE MENSUAL CUANDO NO HAY RESTRICCIÓN A NIVEL DE ACTIVIDAD O COMERCIO.,
    FECINICREMES         UNKNOWN         -- INICIO VIGENCIA LÍMITE TEMPORAL CRÉDITO MENSUAL,
    FECFINCREMES         UNKNOWN         -- FIN VIGENCIA LÍMITE TEMPORAL CRÉDITO MENSUAL,
    LIMDEBMES            DECIMAL(17, 2)  -- LÍMITE DE DÉBITO MENSUAL.,
    LIMDEBMESTEM         DECIMAL(17, 2)  -- LÍMITE DE DÉBITO TEMPORAL MENSUAL,
    FECINIDEBMES         UNKNOWN         -- INICIO VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    FECFINDEBMES         UNKNOWN         -- FIN VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    FECAUTDIA            UNKNOWN         -- FECHA DE AUTORIZACIÓN DIARIA,
    LIMCREDIA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DIARIO,
    LIMCREDIATEM         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO TEMPORAL DIARIO,
    FECINICREDIA         UNKNOWN         -- INICIO VIGENCIA LÍMITE TEMPORAL CRÉDITO DIARIO,
    FECFINCREDIA         UNKNOWN         -- FIN VIGENCIA LÍMITE TEMPORAL CRÉDITO DIARIO,
    LIMDEBDIA            DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DIARIO.,
    LIMDEBDIATEM         DECIMAL(17, 2)  -- LÍMITE DE DÉBITO TEMPORAL DIARIO
);

-- Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla115 (
    FECINIDEBDIA         UNKNOWN         -- INICIO VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    FECFINDEBDIA         UNKNOWN         -- FIN VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    SALAUTCREMES         DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO MENSUAL,
    SALAUTDEBMES         DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO MENSUAL,
    SALAUTCRED           DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO DIARIO,
    SALAUTDEBD           DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO DIARIO,
    SIG__SALAUTPRE       VARCHAR(1)      -- SIGNO SALDO AUTORIZADO EN PREPAGO,
    SALAUTPRE            DECIMAL(17, 2)  -- SALDO AUTORIZADO EN PREPAGO,
    SIG__SALDISPRE       VARCHAR(1)      -- SIGNO SALDO DISPUESTO EN PREPAGO,
    SALDISPRE            DECIMAL(17, 2)  -- SALDO DISPUESTO EN PREPAGO,
    IBAN                 VARCHAR(4)      -- CÓDIGO IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    TIPCLIEN             VARCHAR(2)      -- TIPO DE CLIENTE,
    SUBTIPCLI            VARCHAR(2)      -- SUBTIPO DE CLIENTE,
    FILLER               VARCHAR(75)     -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’: Estructura de da
-- tos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla116 (
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA DE TARJETA
);

-- Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla117 (
    TIPRESTRIC           VARCHAR(2)      -- TIPO DE RESTRICCIÓN,
    DESTIPRESTRIC        VARCHAR(20)     -- DESCRIPCIÓN TIPO DE RESTRICCIÓN: CO – COMERCIO GC – GRUPO DE COMERCIO CA – CÓDIGO DE ACTIVIDAD TF – TIPO DE FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO / GRUPO DE COMERCIO,
    DESCODCOM            VARCHAR(30)     -- DESCRIPCIÓN DEL GRUPO DE COMERCIO /COMERCIO (SOLO SI ES PROPIO) (GRUPO T003 Y COMERCIO T001),
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    DESCODACT            VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE ACTIVIDAD,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    SIGNO                VARCHAR(1)      -- SIGNO DEL TIPO DE FACTURA,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    LIMCREMES            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    LIMCREMESTEM         DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    FECINICREMES         UNKNOWN         -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    FECFINCREMES         UNKNOWN         -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA
);

-- Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla118 (
    SALAUTCREMES         DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO MENSUAL PARA LA RESTRICCION DE TARJETA,
    LIMDEBMES            DECIMAL(17, 2)  -- LÍMITE DE DÉBITO EN EL MES NATURAL PARA LA RESTRICCION DE LA TARJETA,
    LIMDEBMESTEM         DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE DÉBITO EN EL MES NATURAL PARA LA RESTRICCION DE LA TARJETA,
    FECINIDEBMES         UNKNOWN         -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    FECFINDEBMES         UNKNOWN         -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    SALAUTDEBMES         DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO EN EL MES NATURAL PARA LA RESTRICCION DE LA TARJETA,
    MAXOPER              INT             -- NÚMERO MÁXIMO DE OPERACIONES PERMITIDAS EN EL MES PARA LA RESTRICCION DE LA TARJETA,
    NUMOPER              INT             -- NÚMERO DE OPERACIONES REALIZADAS EN EL MES PARA LA RESTRICCION DE LA TARJETA,
    FECAUTDIA            UNKNOWN         -- FECHA DE AUTORIZACIÓN DIARIA,
    LIMCREDIA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    LIMCREDIATEM         DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECINICREDIA         UNKNOWN         -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECFINCREDIA         UNKNOWN         -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA
);

-- Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla119 (
    SALAUTCRED           DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    LIMDEBDIA            DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    LIMDEBDIATEM         DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECINIDEBDIA         UNKNOWN         -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECFINDEBDIA         UNKNOWN         -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    SALAUTDEBD           DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    MAXODIA              INT             -- NÚMERO MÁXIMO DE OPERACIONES PERMITIDAS EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    NUMODIA              INT             -- NÚMERO DE OPERACIONES REALIZADAS EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    FILLER               VARCHAR(354)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’: 
-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’:
CREATE TABLE Tabla120 (
    NUMPLASTICO          NUMERIC(12)     -- NÚMERO DE PLÁSTICO,
    FECENVEST            UNKNOWN         -- FECHA DE ENVÍO A ESTAMPACIÓN,
    FECRECEST            UNKNOWN         -- FECHA DE RECHAZO DE ESTAMPACIÓN,
    FECACUSER            UNKNOWN         -- FECHA ACUSE DE RECIBO,
    FECULTREN            UNKNOWN         -- FECHA ÚLTIMA RENOVACIÓN
);

-- Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’: 
-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’:
CREATE TABLE Tabla121 (
    FECRECTAR            UNKNOWN         -- FECHA DE RECUPERACIÓN PLÁSTICO,
    FCORETTAR            UNKNOWN         -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR            UNKNOWN         -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    CONDEST              VARCHAR(3)      -- CONDICIONES DE ESTAMPACIÓN,
    DESCONEST            VARCHAR(30)     -- DESCRIPCIÓN DE LA CONDICIÓN DE ESTAMPACIÓN (T662),
    FILLER               VARCHAR(733)    -- ESPACIO DISPONIBLE DEL REGISTRO.
);

-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Es
-- tructura de datos a nivel de desglose por línea de último recibo: Tipo de regist
-- ro ‘DR’:
CREATE TABLE Tabla122 (
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO,
    SITUAREC             INT             -- INDICADOR DE SITUACIÓN DEL RECIBO,
    DESSITUAC            VARCHAR(30)     -- DESCRIPCIÓN INDICADOR DE SITUACIÓN DEL RECIBO: 0 - PENDIENTE 1 - ENVIADO A PASIVO 2 - PAGADO 3 - DOMICILIACIÓN ERRÓNEA 4 - RECLAMADO 5 - NO PAGO 6 - ENVIADO A DOMICILIACIÓN AJENA 7 - ENVIADO A CHEQUES (SÓLO PARA ABONOS) 8 - REENVIADO (POR 2ª CÁMARA) 9 - PENDIENTE REENVÍO 10 - TRASPASADO A MONEDA PRINCIPAL,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA,
    FECEMIMOV            UNKNOWN         -- FECHA DE CARGO DEL RECIBO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO MOVIMIENTO,
    FECIMPMOV            UNKNOWN         -- FECHA DE IMPAGO (A PARTIR DE ESTA FECHA SIN COBRAR PASA A SITUACIÓN DE IMPAGADO),
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN DE LA LÍNEA,
    TIPIMP01             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 01),
    DESIMP01             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 01 - CAPITAL,
    SIG_IMPINI01         VARCHAR(1)      -- SIGNO IMPORTE INICIAL CAPITAL DEL EXTRACTO,
    IMPINI01             DECIMAL(17, 2)  -- IMPORTE INICIAL CAPITAL DEL EXTRACTO
);

-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Es
-- tructura de datos a nivel de desglose por línea de último recibo: Tipo de regist
-- ro ‘DR’:
CREATE TABLE Tabla123 (
    IMPREC01             DECIMAL(17, 2)  -- IMPORTE DE RECIBO CAPITAL,
    IMPMIN01             DECIMAL(17, 2)  -- IMPORTE MÍNIMO CAPITAL,
    IMPAPL01             DECIMAL(17, 2)  -- IMPORTE APLICADO CAPITAL,
    TIPIMP02             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 02),
    DESIMP02             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 02 - COMISIONES,
    SIG_IMPINI02         VARCHAR(1)      -- SIGNO IMPORTE INICIAL COMISIÓN DEL EXTRACTO,
    IMPINI02             DECIMAL(17, 2)  -- IMPORTE INICIAL DEL EXTRACTO COMISIÓN,
    IMPREC02             DECIMAL(17, 2)  -- IMPORTE DE RECIBO COMISIÓN,
    IMPMIN02             DECIMAL(17, 2)  -- IMPORTE MÍNIMO COMISIÓN,
    IMPAPL02             DECIMAL(17, 2)  -- IMPORTE APLICADO COMISIÓN,
    TIPIMP03             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 03),
    DESIMP03             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 03 - INTERESES,
    SIG_IMPINI03         VARCHAR(1)      -- SIGNO IMPORTE INICIAL INTERÉS DEL EXTRACTO,
    IMPINI03             DECIMAL(17, 2)  -- IMPORTE INICIAL DEL EXTRACTO INTERÉS,
    IMPREC03             DECIMAL(17, 2)  -- IMPORTE DE RECIBO INTERÉS,
    IMPMIN03             DECIMAL(17, 2)  -- IMPORTE MÍNIMO INTERÉS,
    IMPAPL03             DECIMAL(17, 2)  -- IMPORTE APLICADO INTERÉS,
    TIPIMP04             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 04),
    DESIMP04             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 04 - IMPUESTOS,
    SIG_IMPINI04         VARCHAR(1)      -- SIGNO IMPORTE INICIAL IMPUESTO DEL EXTRACTO,
    IMPINI04             DECIMAL(17, 2)  -- IMPORTE INICIAL IMPUESTO DEL EXTRACTO
);

-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Es
-- tructura de datos a nivel de desglose por línea de último recibo: Tipo de regist
-- ro ‘DR’:
CREATE TABLE Tabla124 (
    IMPREC04             DECIMAL(17, 2)  -- IMPORTE DE RECIBO IMPUESTO,
    IMPMIN04             DECIMAL(17, 2)  -- IMPORTE MÍNIMO IMPUESTO,
    IMPAPL04             DECIMAL(17, 2)  -- IMPORTE APLICADO IMPUESTO,
    TIPIMP05             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 05),
    DESIMP05             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 05 - COMISIONES MOROSIDAD,
    SIG_IMPINI05         VARCHAR(1)      -- SIGNO IMPORTE INICIAL COMISIÓN MORA DEL EXTRACTO,
    IMPINI05             DECIMAL(17, 2)  -- IMPORTE INICIAL COMISIÓN MORA DEL EXTRACTO,
    IMPREC05             DECIMAL(17, 2)  -- IMPORTE DE RECIBO COMISIÓN MORA,
    IMPMIN05             DECIMAL(17, 2)  -- IMPORTE MÍNIMO COMISIÓN MORA,
    IMPAPL05             DECIMAL(17, 2)  -- IMPORTE APLICADO COMISIÓN MORA,
    TIPIMP06             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 06),
    DESIMP06             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 06 - INTERESES MOROSIDAD,
    SIG_IMPINI06         VARCHAR(1)      -- SIGNO IMPORTE INICIAL INTERÉS MORA DEL EXTRACTO,
    IMPINI06             DECIMAL(17, 2)  -- IMPORTE INICIAL INTERÉS MORA DEL EXTRACTO,
    IMPREC06             DECIMAL(17, 2)  -- IMPORTE DE RECIBO INTERÉS MORA,
    IMPMIN06             DECIMAL(17, 2)  -- IMPORTE MÍNIMO INTERÉS MORA,
    IMPAPL06             DECIMAL(17, 2)  -- IMPORTE APLICADO INTERÉS MORA,
    TIPIMP07             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 07),
    DESIMP07             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 07 - IMPUESTOS MOROSIDAD,
    SIG_IMPINI07         VARCHAR(1)      -- SIGNO IMPORTE INICIAL IMPUESTO MORA DEL EXTRACTO
);

-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Es
-- tructura de datos a nivel de desglose por línea de último recibo: Tipo de regist
-- ro ‘DR’:
CREATE TABLE Tabla125 (
    IMPINI07             DECIMAL(17, 2)  -- IMPORTE INICIAL IMPUESTO MORA DEL EXTRACTO,
    IMPREC07             DECIMAL(17, 2)  -- IMPORTE DE RECIBO IMPUESTO MORA,
    IMPMIN07             DECIMAL(17, 2)  -- IMPORTE MÍNIMO IMPUESTO MORA,
    IMPAPL07             DECIMAL(17, 2)  -- IMPORTE APLICADO IMPUESTO MORA,
    TIPIMP08             INT             -- TIPO DE IMPORTE ( SIEMPRE VALOR 08),
    DESIMP08             VARCHAR(10)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 08 - VALOR PARA USO FUTURO,
    SIG_IMPINI08         VARCHAR(1)      -- SIGNO IMPORTE INICIAL USO FUTURO DEL EXTRACTO,
    IMPINI08             DECIMAL(17, 2)  -- IMPORTE INICIAL USO FUTURO DEL EXTRACTO,
    IMPREC08             DECIMAL(17, 2)  -- IMPORTE DE RECIBO USO FUTURO,
    IMPMIN08             DECIMAL(17, 2)  -- IMPORTE MÍNIMO USO FUTURO,
    IMPAPL08             DECIMAL(17, 2)  -- IMPORTE APLICADO USO FUTURO,
    FILLER               VARCHAR(54)     -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura de datos a nivel de desglose por línea de último recibo: Tipo de regi
-- stro ‘DR’: Estructura tipo de registro de cabecera de cuentas. Tipo de registro 
-- ‘LI’:
CREATE TABLE Tabla126 (
    LINREF               INT             -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN DE LA LÍNEA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOMRED         VARCHAR(10)     -- DESCRIPCIÓN DE LA CAMPAÑA COMERCIAL REDUCIDA,
    INDTIPOPE            VARCHAR(1)      -- INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA
);

-- Estructura de datos a nivel de desglose por línea de último recibo: Tipo de regi
-- stro ‘DR’: Estructura tipo de registro de cabecera de cuentas. Tipo de registro 
-- ‘LI’:
CREATE TABLE Tabla127 (
    DESTIPOPE            VARCHAR(15)     -- DESCRIPCIÓN INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA: R: REVOLVING C: COMPRA CUOTAS M: MIXTAS,
    TIPOLIM              VARCHAR(1)      -- INDICADOR DE TIPO DE LÍMITE DE LA LÍNEA,
    DESTIPOLIM           VARCHAR(20)     -- DESCRIPCIÓN INDICADOR DE TIPO DE LÍMITE DE LA LÍNEA: A: LÍMITE ADICIONAL C: LÍMITE COMPARTIDO,
    FECINI               UNKNOWN         -- FECHA DE INICIO,
    FECFIN               UNKNOWN         -- FECHA DE FIN,
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    DESBLQ               VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE BLOQUEO,
    FECBLQ               UNKNOWN         -- FECHA DE ÚLTIMO BLOQUEO,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    CLAMON1              INT             -- MONEDA1 DE LA LÍNEA,
    DESCLAMON1           VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA1,
    INDPORLIM1           VARCHAR(1)      -- INDICADOR DE TIPO DE LÍMITE MONEDA1,
    DESPORLIM1           VARCHAR(30)     -- DESCRIPCIÓN DE INDICADOR DE TIPO DE LIMITE MONEDA1 I: IMPORTE P: PORCENTAJE,
    PORLIM1              INT             -- PORCENTAJE DE LÍMITE DEL CONTRATO DE LA LÍNEA MONEDA1,
    LIMCRELIN1           DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA MONEDA1,
    SIG_SALAUTLIN1       VARCHAR(1)      -- SIGNO SALDO AUTORIZADO DE LA LÍNEA MONEDA1,
    SALAUTLIN1           DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA MONEDA1
);

-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla128 (
    SIG_SALDISLIN1       VARCHAR(1)      -- SIGNO SALDO DISPUESTO DE LA LÍNEA MONEDA1,
    SALDISLIN1           DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA MONEDA1,
    CLAMON2              INT             -- MONEDA2 DE LA LÍNEA,
    DESCLAMON2           VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA2,
    INDPORLIM2           VARCHAR(1)      -- INDICADOR DE TIPO DE LÍMITE MONEDA2,
    DESPORLIM2           VARCHAR(30)     -- DESCRIPCIÓN DE INDICADOR DE TIPO DE LIMITE MONEDA2 I: IMPORTE P: PORCENTAJE,
    PORLIM2              INT             -- PORCENTAJE DE LÍMITE DEL CONTRATO DE LA LÍNEA MONEDA2,
    LIMCRELIN2           DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA MONEDA2,
    SIG_SALAUTLIN2       VARCHAR(1)      -- SIGNO SALDO AUTORIZADO DE LA LÍNEA MONEDA2,
    SALAUTLIN2           DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA MONEDA2,
    SIG_SALDISLIN2       VARCHAR(1)      -- SIGNO SALDO DISPUESTO DE LA LÍNEA MONEDA2,
    SALDISLIN2           DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA MONEDA2,
    FILLER               VARCHAR(421)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Detal
-- le de campos de los registros de impagados.
CREATE TABLE Tabla129 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE MONEDA,
    SITUACION            INT             -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION         VARCHAR(20)     -- DESCRIPCIÓN SITUACIÓN DEL CONTRATO,
    IMPCONT              DECIMAL(17, 2)  -- IMPORTE TOTAL DE IMPAGO DEL CONTRATO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE MORA,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECULTAPL            UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB            UNKNOWN         -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    NUMRECIMP            INT             -- NÚMERO DE RECIBOS IMPAGADOS,
    FECVENMOV            UNKNOWN         -- FECHA VENCIMIENTO PRIMER RECIBO,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    NDIASIMPAG           INT             -- NUMERO DE DIAS DE IMPAGO,
    FILLER               VARCHAR(694)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo ‘IC’:
CREATE TABLE Tabla130 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA
);

-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo ‘IC’:
CREATE TABLE Tabla131 (
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LINEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 - IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    SIG__IMPRECUP        VARCHAR(1)      -- SIGNO IMPORTE CONDONACIONES/RECUPERACIONES,
    IMPRECUP             DECIMAL(17, 2)  -- IMPORTE CONDONACIONES/RECUPERACIONES,
    SIG__IMPINCORP       VARCHAR(1)      -- SIGNO IMPORTE INCORPORADO EN RESTO DE OPERACIONES,
    IMPINCORP            DECIMAL(17, 2)  -- IMPORTE INCORPORADO EN RESTO DE OPERACIONES,
    FILLER               VARCHAR(677)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro datos contrato Impagado. Tipo ‘IC’: Estructura tipo 
-- de registro desglose contrato impagado: Tipo de registro ‘IL’:
CREATE TABLE Tabla132 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE LA MONEDA,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DEL RECIBO IMPAGADO
);

-- Estructura tipo de registro datos contrato Impagado. Tipo ‘IC’: Estructura tipo 
-- de registro desglose contrato impagado: Tipo de registro ‘IL’:
CREATE TABLE Tabla133 (
    FECEMIMOV            UNKNOWN         -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL            UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB            UNKNOWN         -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER               VARCHAR(682)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’: E
-- structura tipo de registro recibo impagado: Tipo de registro ‘RI’:
CREATE TABLE Tabla134 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO LINEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCION TIPO DE IMPORTE 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 - IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE
);

-- Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’: Estructura t
-- ipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla135 (
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER               VARCHAR(731)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’: Estructura t
-- ipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla136 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LINEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LINEA,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN TIPO DE FACTURA,
    FECFAC               UNKNOWN         -- FECHA DEL MOVIMIENTO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE DEL MOVIMIENTO,
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO DEL MOVIMIENTO,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE DEL MOVIMIENTO,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN OPERACIÓN,
    TIPDOCPAG            INT             -- TIPO DE DOCUMENTO DE PAGO (SÓLO PARA PAGOS),
    DESCDOCPAG           VARCHAR(15)     -- DESCRIPCIÓN TIPO DE DOCUMENTO DE PAGO,
    REFDOCPAG            VARCHAR(20)     -- REFERENCIA DEL TIPO DE DOCUMENTO (SÓLO PAGOS),
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE AMORTIZADO (SÓLO PARA PAGOS),
    TIPDEVOL             INT             -- TIPOS DE IMPAGO,
    DESTIPDEVOL          VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE IMPAGO
);

-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Est
-- ructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla137 (
    FEC2PRES             UNKNOWN         -- FECHA VENCIMIENTO DE 2ª PRESENTACIÓN,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    FILLER               VARCHAR(558)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Est
-- ructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla138 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN TIPO DE IMPORTE 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    IMPCONSOL            DECIMAL(17, 2)  -- IMPORTE CONSOLIDADO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO
);

-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Est
-- ructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla139 (
    INDPERCON            VARCHAR(1)      -- INDICADOR DE CONCEPTO PERDONADO,
    DESPERCON            VARCHAR(30)     -- DESCRIPCIÓN DE INDICADOR DE CONCEPTO PERDONADO,
    FILLER               VARCHAR(635)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: E
-- structura de datos correspondiente a conceptos económicos de cada movimiento del
--  recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla140 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    FECEXT               UNKNOWN         -- FECHA DE EXTRACTO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESTIPIMP            VARCHAR(30)     -- DESCRIPCIÓN TIPO DE IMPORTE 00 – PAGOS 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO
);

-- Estructura de datos correspondiente a conceptos económicos de cada movimiento de
-- l recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla141 (
    SIGNOIMPORTE_CA      VARCHAR(1)      -- CARGOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE_CA           DECIMAL(17, 2)  -- CARGOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL_CA         VARCHAR(1)      -- CARGOS: SIGNO IMPORTE APLICADO,
    IMPAPL_CA            DECIMAL(17, 2)  -- CARGOS: IMPORTE APLICADO O AMORTIZADO,
    SIGIMPBON_CA         VARCHAR(1)      -- CARGOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBON_CA            DECIMAL(17, 2)  -- CARGOS: IMPORTE BONIFICABLE,
    SIGNOIMPORTE_AB      VARCHAR(1)      -- ABONOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE__AB          DECIMAL(17, 2)  -- ABONOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL__AB        VARCHAR(1)      -- ABONOS: SIGNO IMPORTE APLICADO,
    IMPAPL__AB           DECIMAL(17, 2)  -- ABONOS: IMPORTE APLICADO O AMORTIZADO
);

-- Estructura de datos correspondiente a conceptos económicos de cada movimiento de
-- l recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla142 (
    SIGIMPBON__AB        VARCHAR(1)      -- ABONOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBON__AB           DECIMAL(17, 2)  -- ABONOS: IMPORTE BONIFICABLE,
    FILLER               VARCHAR(626)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Programa ATB670: Formatea el registro de detalle. Detalle de campos de los campo
-- s comunes.
CREATE TABLE Tabla143 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla144
-- Headers encontrados: ['CENTALTA', 'CENTRO DE ALTA CUENTA DE TARJETA', 'Alfanumérico', '4', '']


-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla145 (
    FECULTCAR            UNKNOWN         -- FECHA ÚLTIMO PAGO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO
);

-- ERROR: No se pudieron procesar las columnas de Tabla146
-- Headers encontrados: ['DESPRODU', 'DESCRIPCIÓN DEL PRODUCTO', 'Alfanumérico', '30', '']


-- ERROR: No se pudieron procesar las columnas de Tabla147
-- Headers encontrados: ['', 'N – NORMAL D – DUDOSO G – CONGELADA C – CASTIGO O FALLIDO', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla148
-- Headers encontrados: ['DESFORPAGO', 'DESCRIPCIÓN DE LA FORMA DE PAGO 00 – PAGO DÉBITO CONTADO 01 – PAGO TOTAL 02 – PAGO FIJO 03 – PAGO APLAZADO 04 – PAGO FIJO CON OP. FINANCIADAS', 'Alfanumérico', '15', '']


-- ERROR: No se pudieron procesar las columnas de Tabla149
-- Headers encontrados: ['INDPPMIN', 'IND. CONTRATO ACOGIDO A PAGO MINIMO. POSIBLES VALORES S/N', 'Alfanumérico', '1', '']


-- ERROR: No se pudieron procesar las columnas de Tabla150
-- Headers encontrados: ['FORPAGOTEM', 'FORMA DE PAGO TEMPORAL DEL EXTRACTO DE CRÉDITO: – PAGO TOTAL - FIJO – PAGO APLAZADO – FIJO CON OPERACIONES FINANCIADAS', 'Numérico', '2', '']


-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’
CREATE TABLE Tabla151 (
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    TIPDIREC             VARCHAR(2)      -- TIPO DE MEDIO,
    DESTIPDIREC          VARCHAR(30)     -- DESCRIPCIÓN TIPO DE MEDIO DP: DIRECCIÓN POSTAL EM: EMAIL,
    NUMSEC               INT             -- NÚMERO SECUENCIAL DEL REGISTRO
);

-- ERROR: No se pudieron procesar las columnas de Tabla152
-- Headers encontrados: ['CODUSO', 'CÓDIGO DE USO DE LA DIRECCIÓN', 'Alfanumérico', '2', '']


-- ERROR: No se pudieron procesar las columnas de Tabla153
-- Headers encontrados: ['EMPRESA', 'EMPRESA', 'Alfanumérico', '3', '']


-- Estructura de datos a nivel de direcciones de personas por contrato. Tipo de reg
-- istro ‘DC’ Estructura de datos a nivel de límites de la cuenta. Tipo de registro
--  ‘LC’:
CREATE TABLE Tabla154 (
    CLAMON1              INT             -- CLAVE DE MONEDA,
    DESCLAMON1           VARCHAR(30)     -- DESCRIPCIÓN DE LA DIVISA,
    LIMCRECTA1           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    LIMCRECTATEM1        DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA. TEMPORAL,
    FECINITEM1           UNKNOWN         -- INICIO VIGENCIA DE LÍMITES TEMPORALES,
    FECFINTEM1           UNKNOWN         -- FIN VIGENCIA DE LÍMITES TEMPORALES,
    SIG__SALAUTCRE1      VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO AUTORIZADO,
    SALAUTCRE1           DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO,
    SIG_SALDISCRE1       VARCHAR(1)      -- SIGNO SALDO DE CRÉDITO DISPUESTO
);

-- ERROR: No se pudieron procesar las columnas de Tabla155
-- Headers encontrados: ['SALDISCRE1', 'SALDO DE CRÉDITO DISPUESTO', 'Numérico', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla156
-- Headers encontrados: ['SALAUTCRE2', 'SALDO DE CRÉDITO AUTORIZADO', 'Numérico', '17', '2']


-- Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’: Estr
-- uctura de datos a nivel de cartera congelada. Tipo de registro ‘CC’:
CREATE TABLE Tabla157 (
    NUMSECIMP1           NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO DE MONEDA1
);

-- ERROR: No se pudieron procesar las columnas de Tabla158
-- Headers encontrados: ['CLAMON1', 'CLAVE DE MONEDA1', 'Numérico', '3', '']


-- ERROR: No se pudieron procesar las columnas de Tabla159
-- Headers encontrados: ['FECALTA', 'FECHA DE ALTA EN CONGELACIÓN', 'Fecha', '10', '']


-- Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estruct
-- ura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla160 (
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DE CLIENTE EN EL SISTEMA CORPORATIVO DE LA ENTIDAD,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN.,
    DESCALPART           VARCHAR(15)     -- DESCRIPCIÓN DE CALIDAD DE PARTICIPACIÓN: TI – TITULAR BE – BENEFICIARIO,
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    DESMAR               VARCHAR(30)     -- DESCRIPCIÓN DE LA MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT              VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE TARJETA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE LA TARJETA,
    FECULTUSO            UNKNOWN         -- FECHA DE ÚLTIMO USO DE LA TARJETA,
    INDSITTAR            INT             -- INDICADOR DE SITUACIÓN,
    DESSITTAR            VARCHAR(30)     -- DESCRIPCIÓN DE LA SITUACIÓN DE LA TARJETA – SELECCIONADA ESTAMPACIÓN ALTA – PENDIENTE DE ACUSE DE RECIBO POR ALTA.
);

-- ERROR: No se pudieron procesar las columnas de Tabla161
-- Headers encontrados: ['', '– SELECCIONADA PARA ESTAMPACIÓN POR RENOVACIÓN. – PENDIENTE DE ACUSE DE RECIBO POR RENOVACIÓN. – EN PODER DEL CLIENTE. – PENDIENTE CAMBIO PIN POR ALTA. – PENDIENTE DE PRIMERA OPERACIÓN CON PIN CORRECTO POR ALTA. – RECOGIDA POR BAJA. – PENDIENTE POR RECOGER BAJA. – NO EMITIDA. – PENDIENTE POR RECOGER OTRA. – SELECCIONADA PARA ESTAMPACIÓN POR ALTA MASIVA. – PENDIENTE DE ACUSE DE RECIBO POR ALTA MASIVA. – INACTIVA POR REEMISIÓN O RENOVACIÓN CON CAMBIO DE PAN. – ERROR EN ESTAMPACIÓN. – PENDIENTE DE CAMBIO DE PIN POR RENOVACIÓN. – PENDIENTE DE PRIMERA OPERACIÓN CON PIN CORRECTO POR RENOVACIÓN. – ACTIVA EN PERIODO DE RENOVACIÓN. – SELECCIONADA PARA ESTAMPAR POR REEMISIÓN. 20 – PENDIENTE DE ACUSE DE RECIBO POR REEMISIÓN. – PENDIENTE DE CAMBIO DE PIN POR REEMISIÓN. – PENDIENTE DE PRIMERA OPERACIÓN CON PIN CORRECTO POR REEMISIÓN. –SELECCIONADA PARA ESTAMPACIÓN POR UPGRADE DE CONTRATO. –PENDIENTE ACUSE DE RECIBO POR UPGRADE DE CONTRATO. – INACTIVA POR UPGRADE DE CONTRATO. – ACTIVA EN PERIODO DE REEMISIÓN.', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla162
-- Headers encontrados: ['FECCADTAR', 'FECHA DE CADUCIDAD DE LA TARJETA', 'Numérico', '6', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla163
-- Headers encontrados: ['LIMCREMES', 'LÍMITE DE CRÉDITO MENSUAL. LÍMITE MENSUAL CUANDO NO HAY RESTRICCIÓN A NIVEL DE ACTIVIDAD O COMERCIO.', 'Numérico', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla164
-- Headers encontrados: ['SALAUTDEBD', 'SALDO AUTORIZADO A DÉBITO DIARIO', 'Numérico', '17', '2']


-- Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’: Estructura de da
-- tos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla165 (
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA DE TARJETA,
    TIPRESTRIC           VARCHAR(2)      -- TIPO DE RESTRICCIÓN,
    DESTIPRESTRIC        VARCHAR(20)     -- DESCRIPCIÓN TIPO DE RESTRICCIÓN: CO – COMERCIO GC – GRUPO DE COMERCIO CA – CÓDIGO DE ACTIVIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla166
-- Headers encontrados: ['', '- TF – TIPO DE FACTURA', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla167
-- Headers encontrados: ['FECFINDEBMES', 'FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO MENSUAL PARA LA RESTRICCION DE LA TARJETA', 'Fecha', '10', '']


-- ERROR: No se pudieron procesar las columnas de Tabla168
-- Headers encontrados: ['SALAUTDEBD', 'SALDO AUTORIZADO A DÉBITO EN EL DÍA PARA LA RESTRICCION DE LA TARJETA', 'Numérico', '17', '2']


-- Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’: 
-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’:
CREATE TABLE Tabla169 (
    NUMPLASTICO          NUMERIC(12)     -- NÚMERO DE PLÁSTICO,
    FECENVEST            UNKNOWN         -- FECHA DE ENVÍO A ESTAMPACIÓN,
    FECRECEST            UNKNOWN         -- FECHA DE RECHAZO DE ESTAMPACIÓN,
    FECACUSER            UNKNOWN         -- FECHA ACUSE DE RECIBO,
    FECULTREN            UNKNOWN         -- FECHA ÚLTIMA RENOVACIÓN,
    FECRECTAR            UNKNOWN         -- FECHA DE RECUPERACIÓN PLÁSTICO,
    FCORETTAR            UNKNOWN         -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR            UNKNOWN         -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    CONDEST              VARCHAR(3)      -- CONDICIONES DE ESTAMPACIÓN,
    DESCONEST            VARCHAR(30)     -- DESCRIPCIÓN DE LA CONDICIÓN DE ESTAMPACIÓN (T662),
    FILLER               VARCHAR(733)    -- ESPACIO DISPONIBLE DEL REGISTRO.
);

-- Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Es
-- tructura de datos a nivel de desglose por línea de último recibo: Tipo de regist
-- ro ‘DR’:
CREATE TABLE Tabla170 (
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO
);

-- ERROR: No se pudieron procesar las columnas de Tabla171
-- Headers encontrados: ['SITUAREC', 'INDICADOR DE SITUACIÓN DEL RECIBO', 'Numérico', '2', '']


-- ERROR: No se pudieron procesar las columnas de Tabla172
-- Headers encontrados: ['IMPREC01', 'IMPORTE DE RECIBO CAPITAL', 'Numérico', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla173
-- Headers encontrados: ['IMPMIN04', 'IMPORTE MÍNIMO IMPUESTO', 'Numérico', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla174
-- Headers encontrados: ['IMPREC07', 'IMPORTE DE RECIBO IMPUESTO MORA', 'Numérico', '17', '2']


-- Estructura de datos a nivel de desglose por línea de último recibo: Tipo de regi
-- stro ‘DR’: Estructura tipo de registro de cabecera de cuentas. Tipo de registro 
-- ‘LI’:
CREATE TABLE Tabla175 (
    LINREF               INT             -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN DE LA LÍNEA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOMRED         VARCHAR(10)     -- DESCRIPCIÓN DE LA CAMPAÑA COMERCIAL REDUCIDA,
    INDTIPOPE            VARCHAR(1)      -- INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA,
    DESTIPOPE            VARCHAR(15)     -- DESCRIPCIÓN INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA:
);

-- ERROR: No se pudieron procesar las columnas de Tabla176
-- Headers encontrados: ['', 'R: REVOLVING C: COMPRA CUOTAS M: MIXTAS', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla177
-- Headers encontrados: ['INDPORLIM2', 'INDICADOR DE TIPO DE LÍMITE MONEDA2', 'Alfanumérico', '1', '']


-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo ‘IC’:
CREATE TABLE Tabla178 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE MONEDA,
    SITUACION            INT             -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION         VARCHAR(20)     -- DESCRIPCIÓN SITUACIÓN DEL CONTRATO,
    IMPCONT              DECIMAL(17, 2)  -- IMPORTE TOTAL DE IMPAGO DEL CONTRATO
);

-- ERROR: No se pudieron procesar las columnas de Tabla179
-- Headers encontrados: ['IMPAGO', 'IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE MORA', 'Numérico', '17', '2']


-- Detalle de campos de los registros de impagados. Estructura tipo de registro dat
-- os contrato Impagado. Tipo ‘IC’:
CREATE TABLE Tabla180 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LINEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE IMPORTE 01 – CAPITAL – COMISIONES – INTERESES - IMPUESTOS – COMISIONES MOROSIDAD – INTERESES MOROSIDAD – IMPUESTOS MOROSIDAD – VALOR PARA USO FUTURO
);

-- ERROR: No se pudieron procesar las columnas de Tabla181
-- Headers encontrados: ['', '', '', '', '']


-- Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’: E
-- structura tipo de registro recibo impagado: Tipo de registro ‘RI’:
CREATE TABLE Tabla182 (
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE LA MONEDA,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DEL RECIBO IMPAGADO,
    FECEMIMOV            UNKNOWN         -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO               DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL            UNKNOWN         -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB            UNKNOWN         -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER               VARCHAR(682)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’: E
-- structura tipo de registro recibo impagado: Tipo de registro ‘RI’:
CREATE TABLE Tabla183 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO LINEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCION TIPO DE IMPORTE 01 – CAPITAL – COMISIONES – INTERESES - IMPUESTOS – COMISIONES MOROSIDAD – INTERESES MOROSIDAD – IMPUESTOS MOROSIDAD – VALOR PARA USO FUTURO,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER               VARCHAR(731)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’: Estructura t
-- ipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla184 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON               INT             -- MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE DE MONEDA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LINEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LINEA
);

-- ERROR: No se pudieron procesar las columnas de Tabla185
-- Headers encontrados: ['INDNORCOR', 'INDICADOR DE NORMAL O CORRECTORA', 'Numérico', '1', '0']


-- Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Est
-- ructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla186 (
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP            INT             -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE CONCEPTO ECONÓMICO
);

-- ERROR: No se pudieron procesar las columnas de Tabla187
-- Headers encontrados: ['TIPIMP', 'TIPO DE IMPORTE', 'Numérico', '2', '0']


-- Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: E
-- structura de datos correspondiente a conceptos económicos de cada movimiento del
--  recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla188 (
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    CLAMON               INT             -- CLAVE DE MONEDA
);

-- Estructura de datos correspondiente a conceptos económicos de cada movimiento de
-- l recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla189 (
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    FECEXT               UNKNOWN         -- FECHA DE EXTRACTO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESTIPIMP            VARCHAR(30)     -- DESCRIPCIÓN TIPO DE IMPORTE 00 – PAGOS 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    SIGNOIMPORTE_CA      VARCHAR(1)      -- CARGOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE_CA           DECIMAL(17, 2)  -- CARGOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL_CA         VARCHAR(1)      -- CARGOS: SIGNO IMPORTE APLICADO,
    IMPAPL_CA            DECIMAL(17, 2)  -- CARGOS: IMPORTE APLICADO O AMORTIZADO,
    SIGIMPBON_CA         VARCHAR(1)      -- CARGOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-)
);

-- Estructura de datos correspondiente a conceptos económicos de cada movimiento de
-- l recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla190 (
    IMPBON_CA            DECIMAL(17, 2)  -- CARGOS: IMPORTE BONIFICABLE,
    SIGNOIMPORTE_AB      VARCHAR(1)      -- ABONOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE__AB          DECIMAL(17, 2)  -- ABONOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL__AB        VARCHAR(1)      -- ABONOS: SIGNO IMPORTE APLICADO,
    IMPAPL__AB           DECIMAL(17, 2)  -- ABONOS: IMPORTE APLICADO O AMORTIZADO,
    SIGIMPBON__AB        VARCHAR(1)      -- ABONOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBON__AB           DECIMAL(17, 2)  -- ABONOS: IMPORTE BONIFICABLE,
    FILLER               VARCHAR(626)    -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Programa ATB822: Formatea el registro de detalle. Programa ATB491: Genera la cin
-- ta. Detalle de campos de los campos comunes.
CREATE TABLE Tabla191 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODHOLDING           VARCHAR(4)      -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA            VARCHAR(3)      -- CÓDIGO DE LA CADENA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA COMERCIO,
    CUENTA               VARCHAR(12)     -- CUENTA DE COMERCIO,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CP’ – CONTRATO DE COMERCIO ‘EC’ – CABECERA DE EXTRACTO ‘EM’ – MOVIMIENTOS DE EXTRACTO
);

-- Programa ATB822: Formatea el registro de detalle. Programa ATB491: Genera la cin
-- ta. Detalle de campos de los campos comunes.
CREATE TABLE Tabla192 (
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN,
    DATOS                VARCHAR(327)    -- DATOS,
    FILLER               VARCHAR(17)    
);

-- En este apartado se describen los campos comunes que preceden al resto de estruc
-- turas de registro en todos y cada uno de los siguientes tipos de registro. Estru
-- ctura común inicial para todos los tipos de registro (ATFCOIMP):
CREATE TABLE Tabla193 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODHOLDING           VARCHAR(4)      -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA            VARCHAR(3)      -- CÓDIGO DE CADENA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    TIPBON               VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    TIPOPROV             VARCHAR(1)      -- TIPO DE PROVEEDOR. ESTABLECIMIENTO, OFICINA O CAJERO,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DE CLIENTE,
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO,
    CLAMON               INT             -- CLAVE DE MONEDA DE CUENTA CARGO,
    INDTIPCTA            VARCHAR(2)      -- INDICADOR DE TIPO DE CUENTA CARGO
);

-- Estructura común inicial para todos los tipos de registro (ATFCOIMP): Detalle de
--  campos de los registros de Comercios.
CREATE TABLE Tabla194 (
    INDAJENA             VARCHAR(1)      -- INDICADOR DE CUENTA DE DOMICILIACIÓN AJENA(S/N),
    CODCAM               VARCHAR(6)      -- CÓDIGO CAMPAÑA,
    NUMMAQ               INT             -- NÚMERO DE MÁQUINAS MANUALES,
    NUMTPV               INT             -- NÚMERO DE TPVS,
    FECALTA              UNKNOWN         -- FECHA DE ALTA COMERCIO,
    FECBAJA              UNKNOWN         -- FECHA DE BAJA,
    MOTBAJA              VARCHAR(2)      -- MOTIVO DE BAJA,
    FECREACT             UNKNOWN         -- FECHA REACTIVACIÓN DEL COMERCIO,
    CODRIE               INT             -- CÓDIGO DE RIESGO,
    FECULTRIE            UNKNOWN         -- FECHA ÚLTIMA CLASIFICACIÓN RIESGO,
    NUMEXTCOM            INT             -- NÚMERO DE EXTRACTO DE COMERCIO,
    FECULTREM            UNKNOWN         -- FECHA ÚLTIMA REMESA,
    CODFUC               VARCHAR(15)     -- CÓDIGO DE FUC,
    INDCONT              VARCHAR(1)      -- INDICADOR COMERCIO CONTRATADO/CAPTADO,
    CODTERDEF            VARCHAR(16)     -- CÓDIGO DE TERMINAL POR DEFECTO,
    CODPROCESO           INT             -- CÓDIGO DE PROCESO,
    CODGRUPO             INT             -- CÓDIGO DE GRUPO DE PROCESO,
    INDENVEXT            VARCHAR(1)      -- INDICADOR DE ENVÍO DIARIO DEL EXTRACTO DE MOVIMIENTOS (S/N),
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    CODREGIMEN           INT             -- CÓDIGO DE RÉGIMEN FISCAL,
    FILLER               VARCHAR(14)    
);

-- Estructura tipo de registro de cabecera de Cuenta de Comercio. Tipo de registro 
-- ‘CP’ (ATFCOCOM): Detalle de campos de los registros de extractos.
CREATE TABLE Tabla195 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODHOLDING           VARCHAR(4)      -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA            VARCHAR(3)      -- CÓDIGO DE CADENA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NUMEXTCOM            INT             -- NÚMERO DE EXTRACTOS DE COMERCIO,
    FECEXTCOM            UNKNOWN         -- FECHA DE EXTRACTO COMERCIO,
    INDSITEXTCOM         INT             -- INDICADOR SITUACIÓN DEL EXTRACTO. VALORES: PENDIENTE LIQUIDADO CARGADO,
    NUMULTMOV            INT             -- NÚMERO DE ÚLTIMO MOVIMIENTO,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    FECEXT               UNKNOWN         -- FECHA DE EXTRACTO,
    FECVALCAR            UNKNOWN         -- FECHA VALOR APUNTE,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN,
    FECCAREXT            UNKNOWN         -- FECHA CARGO EXTRACTO,
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO,
    FILLER               VARCHAR(18)    
);

-- Detalle de campos de los registros de extractos. Este grupo de datos está difere
-- nciado en dos subtipos de registros, todos ellos están precedidos por la parte c
-- omún explicada previamente.
CREATE TABLE Tabla196 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODHOLDING           VARCHAR(4)      -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA            VARCHAR(3)      -- CÓDIGO DE CADENA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NUMEXTCOM            INT             -- NÚMERO DE EXTRACTOS DE COMERCIO,
    FECMOVEXTC           UNKNOWN         -- FECHA DE MOVIMIENTO EXTRACTO COMERCIO,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE,
    NUMMOVEXTCO          INT             -- NÚMERO DE MOVIMIENTOS DE EXTRACTO DE COMERCIOS,
    INDTIPO              VARCHAR(1)      -- INDICADOR DE REMESA O CONCEPTO: DOMINIOS: R – FACTURA C – COMISIÓN A- AJUSTE D-DESCUENTO,
    NUMREFREM            INT             -- NÚMERO REFERENCIA DE LA REMESA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESMOVEXTCO          VARCHAR(30)     -- DESCRIPCIÓN DEL MOVIMIENTO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL IMPORTE,
    INDNORCOR            VARCHAR(1)      -- INDICADOR DE NORMAL O CORRECTORA: 0 – NORMAL 1 – CORRECTORA,
    IMPMVTEXCO           DECIMAL(17, 2)  -- IMPORTE
);

-- Detalle de campos de los registros de extractos. Este grupo de datos está difere
-- nciado en dos subtipos de registros, todos ellos están precedidos por la parte c
-- omún explicada previamente.
CREATE TABLE Tabla197 (
    IMPIMPSTO            DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDANULMOV           INT             -- INDICADOR DE MOVIMIENTO ANULADO,
    INDENVPAS            VARCHAR(1)      -- INDICADOR DE MOVIMIENTO ENVIADO (S/N),
    DEPARTAMENTO         VARCHAR(4)      -- CÓDIGO DE DEPARTAMENTO,
    IMPIMPSTO_2          DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO (IMPUESTO EXTERNO 2),
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONOMICO,
    PRAPLECO             DECIMAL(7, 4)   -- PORCENTAJE DEL CONCEPTO APLICADO,
    FILLER               VARCHAR(71)    
);

-- Programa ATB439: Formatea los registros de detalle y genera la cinta. Programa A
-- TC500: Cruza movimientos de operaciones diarias con los datos generados TIPOREG 
-- = ‘OP’ con autorizaciones.
CREATE TABLE Tabla198 (
    DATOS_COMUNES        UNKNOWN         -- DATOS COMUNES,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA
);

-- Programa ATC500: Cruza movimientos de operaciones diarias con los datos generado
-- s TIPOREG = ‘OP’ con autorizaciones. Programa ATC501: Cruza movimientos de opera
-- ciones diarias con los datos generados TIPOREG = ‘OP’ que han cruzado con autori
-- zaciones con las operaciones diarias de tipo TIPOREG = DA’
CREATE TABLE Tabla199 (
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘OP’ – OPERACIÓN ‘CE’ – CONCEPTOS ECONÓMICOS ‘AU’ – AUTORIZACIONES ‘CG’– CUENTA CONGELADA ‘DA’ – DATOS ADICIONALES,
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN,
    REGISTRO__OP___REGISTRO_DE_MOVIMIENTOS_DE_CR_DITO__PREPAGO__PREPAGO_REGALO__D_BITO_Y_COMPRA_EN_CUOTAS_DIARIOS UNKNOWN         -- REGISTRO ‘OP’- REGISTRO DE MOVIMIENTOS DE CRÉDITO, PREPAGO, PREPAGO REGALO, DÉBITO Y COMPRA EN CUOTAS DIARIOS,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN CLAVE MONEDA,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA,
    DESNORC              VARCHAR(15)     -- DESCRIPCIÓN NORMAL/CORRECTORA: 0 - NORMAL 1 - CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN TIPO FACTURA,
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMOND           VARCHAR(30)     -- DESCRIPCIÓN MONEDA,
    SIGNODIV             VARCHAR(1)      -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-),
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOFAC             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA FACTURA(+/-),
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI              DECIMAL(9, 4)   -- FACTOR DE CAMBIO APLICADO (SOLO TIENE SENTIDO PARA OPERACIONES EN EXTRANJERO)
);

-- Programa ATC501: Cruza movimientos de operaciones diarias con los datos generado
-- s TIPOREG = ‘OP’ que han cruzado con autorizaciones con las operaciones diarias 
-- de tipo TIPOREG = DA’ Programa ATC504: Cruza movimientos de operaciones diarias 
-- con los datos generados TIPOREG = ‘OP’ con los movimientos
CREATE TABLE Tabla200 (
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    DESACT               VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO ACTIVIDAD(MPDT039),
    SIGNOLIQ             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LIQUIDACIÓN (+/-),
    IMPLIQ               DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    CLAMONLIQ            INT             -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONL           VARCHAR(30)     -- DESCRIPCIÓN MONEDA,
    SIGNOIMPTO           VARCHAR(1)      -- SIGNO DE IMPORTE DE IMPUESTO(+/-),
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPAIS              VARCHAR(30)     -- NOMBRE DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN OPERACIÓN,
    DESORIG              VARCHAR(20)     -- DESCRIPCIÓN ORIGEN,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    DESFRA               VARCHAR(20)     -- DESCRIPCIÓN DEL TIPO DE FRANQUICIA
);

-- Programa ATC505: Cruza movimientos de operaciones diarias con los datos generado
-- s TIPOREG = ‘OP’ cruzada con los movimientos con los registros de operaciones di
-- arias TIPOREG = ‘DA’ Inserta en la tabla de cintas MPDT064 los datos correspondi
-- entes a enviar a cada red o franquicia.
CREATE TABLE Tabla201 (
    SECOPE               NUMERIC(12)     -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC            NUMERIC(15)     -- NÚMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SOLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED            VARCHAR(12)     -- SESIÓN DE LA RED,
    SIAIDCD              VARCHAR(19)     -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    CALFRAUDE            VARCHAR(3)      -- SIN USO.,
    TIPDOCPAG            INT             -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A CEROS),
    DESTIPDOC            VARCHAR(20)     -- DESCRIPCIÓN TIPO DOCUMENTO,
    REFDOCPAG            VARCHAR(20)     -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A BLANCOS),
    SIGNOAMORT           VARCHAR(1)      -- SIGNO DEL IMPORTE AMORTIZADO (+/-),
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE AMORTIZADO (SÓLO VENDRÁ INFORMADO PARA MOVIMIENTOS DE CRÉDITO, PARA DÉBITO VENDRÁ A BLANCOS),
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN,
    NUMMOVDEB            INT             -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    IDENTCLI             VARCHAR(8)      -- NÚMERO ÚNICO DE PERSONA
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla202 (
    INDINCEST            VARCHAR(1)      -- INDICADOR DE INCIDENCIA EN ESTUDIO ‘S’ – SI ‘N’ – NO,
    INDMOVANU            INT             -- INDICADOR DE MOVIMIENTO ANULADO,
    DESMOVANU            VARCHAR(10)     -- DESCRIPCIÓN DEL INDICADOR DE MOVIMIENTO ANULADO: 0 – NORMAL 1 – ANULADO,
    INDRET               INT             -- INDICADOR DE MOVIMIENTO RETENIDO,
    DESINDRET            VARCHAR(22)     -- DESCRIPCIÓN DEL INDICADOR DE MOVIMIENTO RETENIDO: 0 – NORMAL 1 – RETENIDO,
    INDMOVEXT            INT             -- INDICADOR DE MOVIMIENTO EXTRACTADO,
    DESMOVEXT            VARCHAR(20)     -- DESCRIPCIÓN DEL INDICADOR DE MOVIMIENTO EXTRACTADO: 0 – PENDIENTE 1 – EXTRACTADO,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(25)     -- DESCRIPCIÓN COMPRA EN CUOTAS,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    NUMOPECUO            INT             -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    SIGNOCUO             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA(+/-),
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    INDDEBCRE            INT             -- INDICADOR DE DÉBITO O CRÉDITO.
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla203 (
    DESDEBCRE            VARCHAR(10)     -- DESCRIPCIÓN INDICADOR DE DÉBITO Ó CRÉDITO: 1 – CRÉDITO 2 – DÉBITO 6 - PREPAGO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(20)     -- DESCRIPCIÓN DE LA LÍNEA,
    FORPAGO              INT             -- FORMA DE PAGO DE LA OPERACIÓN,
    DESFORPAG            VARCHAR(20)     -- DESCRIPCIÓN FORMA DE PAGO,
    LINREF               VARCHAR(8)      -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    INDTOK               VARCHAR(1)      -- INDICADOR OPERACIÓN REALIZADA CON TOKEN(s/n),
    INDFACINF            VARCHAR(1)      -- INDICADOR FACTURA INFORMATIVA (S/N),
    INDDATADI            INT             -- INDICADOR DATOS ADICIONALES,
    FILLER               VARCHAR(1)     ,
    REGISTRO__CE___REGISTRO_DE_CONCEPTOS_ECON_MICOS_ASOCIADOS_A_MOVIMIENTOS_DE_OPERACIONES_DIARIAS_DE_CR_DITO_Y_D_BITO_ UNKNOWN         -- REGISTRO ‘CE’- REGISTRO DE CONCEPTOS ECONÓMICOS ASOCIADOS A MOVIMIENTOS DE OPERACIONES DIARIAS DE CRÉDITO Y DÉBITO.,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    SIGNOAPL             VARCHAR(1)      -- SIGNO DEL IMPORTE APLICADO,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO,
    SIGNOLIQUI           VARCHAR(1)      -- SIGNO DEL IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO,
    IMPLIQUI             DECIMAL(17, 2)  -- IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO
);

-- Tabla204
CREATE TABLE Tabla204 (
    FECULTCAL            UNKNOWN         -- ÚLTIMA FECHA EN LA QUE SE HA REALIZADO EL CÁLCULO DE INTERESES,
    ESTCONECO            VARCHAR(1)      -- ESTADO DEL CONCEPTO ECONÓMICO,
    DESESTCONECO         VARCHAR(30)     -- DESCRIPCIÓN DEL ESTADO DEL CONCEPTO ECONÓMICO: – PENDIENTE – LIQUIDADO – AMORTIZADO – ANULADO – RETENIDO,
    NUMMOVDEB            INT             -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    NUMOPECUO            INT             -- NÚMERO DE MOVIMIENTO,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN TIPO DE IMPORTE: 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS,
    SIGNOAPLECO          VARCHAR(1)      -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-),
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGNOBRU             VARCHAR(1)      -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO (+/-)
);

-- Tabla205
CREATE TABLE Tabla205 (
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGNOBON             VARCHAR(1)      -- SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGNOIMPTO           VARCHAR(1)      -- SIGNO DEL IMPORTE DE IMPUESTO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FILLER               VARCHAR(565)   ,
    REGISTRO__AU___REGISTRO_DE_AUTORIZACIONES_PENDIENTES_DE_CRUCE UNKNOWN         -- REGISTRO ‘AU’- REGISTRO DE AUTORIZACIONES PENDIENTES DE CRUCE,
    CLAMON1              INT             -- CLAVE DE MONEDA,
    DESCLAMON1           VARCHAR(30)     -- DESCRIPCIÓN CLAVE MONEDA,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA,
    DESNORC              VARCHAR(30)     -- DESCRIPCIÓN DEL INDICADOR DE NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC1             INT             -- TIPO DE FACTURA,
    DESTIPFAC1           VARCHAR(30)     -- DESCRIPCIÓN TIPO FACTURA,
    FECTRN               UNKNOWN         -- FECHA DE LA TRANSACCIÓN,
    HORTRN               UNKNOWN         -- HORA DE LA TRANSACCIÓN,
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMOND           VARCHAR(30)     -- DESCRIPCIÓN MONEDA DIVISA,
    SIGNODIV             VARCHAR(1)      -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-),
    IMPDIV               VARCHAR(17)     -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOAUT             VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL AUTORIZADO (+/-)
);

-- Tabla206
CREATE TABLE Tabla206 (
    IMPAUTCON            VARCHAR(17)     -- IMPORTE TOTAL AUTORIZADO MONEDA CONTRATO,
    CMBAPLI              DECIMAL(9, 4)   -- FACTOR DE CAMBIO APLICADO (SOLO TIENE SENTIDO PARA OPERACIONES EN EXTRANJERO),
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODACT1              INT             -- CÓDIGO DE ACTIVIDAD,
    DESACT1              VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO ACTIVIDAD,
    SIGNOCCA             VARCHAR(1)      -- SIGNO DE IMPORTE DE CONCILIACIÓN (+/-),
    IMPCCA               DECIMAL(17, 2)  -- IMPORTE DE CONCILIACIÓN,
    CLAMONCCA            INT             -- CÓDIGO DE MONEDA DE CONCILIACIÓN,
    DESCLAMOCCA          VARCHAR(30)     -- DESCRIPCIÓN MONEDA CONCILIACIÓN,
    SIAIDCD              VARCHAR(19)     -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    FILLER               VARCHAR(497)   ,
    REGISTRO__CG___REGISTRO_DE_OPERACIONES_DE_CUENTAS_EN_CARTERA_CONGELADA_ UNKNOWN         -- REGISTRO ‘CG’- REGISTRO DE OPERACIONES DE CUENTAS EN CARTERA CONGELADA.,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO CON FORMATO AAAAMMDDNNNNNNN,
    NUMMOV               INT             -- NÚMERO DE MOVIMIENTO,
    CLAMON2              INT             -- CLAVE DE MONEDA,
    DESCLAMON2           VARCHAR(30)     -- DESCRIPCIÓN CLAVE MONEDA
);

-- Tabla207
CREATE TABLE Tabla207 (
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA: – NORMAL – CORRECTORA,
    DESNORC              VARCHAR(30)     -- DESCRIPCIÓN DEL INDICADOR DE NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC2             INT             -- TIPO DE FACTURA,
    DESTIPFAC2           VARCHAR(30)     -- DESCRIPCIÓN TIPO FACTURA,
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    CLAMONDIV2           INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMOND2          VARCHAR(30)     -- DESCRIPCIÓN CLAVE MONEDA,
    SIGNODIV             VARCHAR(1)      -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL,
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOFAC             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA FACTURA,
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI              DECIMAL(9, 4)   -- FACTOR DE CAMBIO APLICADO (SÓLO TIENE SENTIDO PARA OPERACIONES EN EL EXTRANJERO),
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE REDUCIDO DEL COMERCIO,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    DESACT2              VARCHAR(30)     -- DESCRIPCIÓN CÓDIGO DE ACTIVIDAD
);

-- Tabla208
CREATE TABLE Tabla208 (
    SIGNOLIQ             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    IMPLIQ               DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    CLAMONLIQ2           INT             -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONL2          VARCHAR(30)     -- DESCRIPCIÓN CLAVE MONEDA,
    SIGNOIMPTO           VARCHAR(1)      -- SIGNO DEL IMPORTE DE IMPUESTO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPAIS              VARCHAR(30)     -- NOMBRE DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN DE LA OPERACIÓN,
    DESORIG              VARCHAR(30)     -- DESCRIPCIÓN DE ORIGEN DE LA OPERACIÓN,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    DESFRA               VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FRANQUICIA,
    SECOPE               NUMERIC(12)     -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC            NUMERIC(15)     -- NUMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SÓLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED            VARCHAR(12)     -- SESIÓN DE LA RED
);

-- Tabla209
CREATE TABLE Tabla209 (
    SIAIDCD              VARCHAR(19)     -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    TIPDOCPAG            INT             -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO,
    DESTIPDOC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO,
    REFDOCPAG            VARCHAR(20)     -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO,
    CALFRAUDE            VARCHAR(3)      -- SIN USO.,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN A LA RED,
    SIGNOAMORT           VARCHAR(1)      -- SIGNO DEL IMPORTE EN AMORTIZADO,
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE AMORTIZADO,
    IDENTCLI             VARCHAR(8)      -- NÚMERO ÚNICO DE PERSONA,
    FILLER               VARCHAR(146)   ,
    REGISTRO__DA___REGISTRO_DE_DATOS_ADICIONALES_A_LA_OPERACI_N UNKNOWN         -- REGISTRO ‘DA’- REGISTRO DE DATOS ADICIONALES A LA OPERACIÓN,
    NUMEXTCTA            INT             -- NÚMERO EXTRACTO DE CRÉDITO,
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO DEL EXTRACTO,
    NUMMOVDEB            INT             -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    TIPFRAN              INT             -- FRANQUICIA,
    DESTIPFRAN           VARCHAR(20)     -- DESCRIPCIÓN FRANQUICIA,
    SECOPE               NUMERIC(12)     -- NUMERO SECUENCIAL DE OPERACIÓN,
    SIAIDCD              VARCHAR(19)     -- CÓDIGO IDENTIFICACIÓN SIA,
    TOKNUMTOK            VARCHAR(22)     -- TOKEN,
    TOKFECEXP            VARCHAR(4)      -- FECHA EXPIRACIÓN DEL TOKEN
);

-- Tabla210
CREATE TABLE Tabla210 (
    CODTOK               VARCHAR(4)      -- CÓDIGO DE TOKENIZADOR,
    DESTOK               VARCHAR(30)     -- DESCRIP. CÓDIGO DE TOKENIZADOR,
    CODWALL              VARCHAR(4)      -- CÓDIGO DE TOKEN REQUESTOR,
    DESWALL              VARCHAR(30)     -- DESCRIPCIÓN DEL TOKEN REQUESTOR,
    TOKENQX              VARCHAR(15)     -- CÓDIGO DE TOKEN QX,
    CLAMON               INT             -- MONEDA,
    CICLOVIDA            VARCHAR(15)     -- CICLOVIDA,
    TIPTRANS             VARCHAR(1)      -- TIPO TRANSACCIÓN,
    PRIMTRAN             VARCHAR(1)      -- PRIMERA TRANSACCIÓN,
    FILLER               VARCHAR(4)      -- RELLENO,
    NUMCUOTA             INT             -- NÚMERO CUOTA,
    TEXTO_CANJE          VARCHAR(40)     -- TEXTO CANJEAR,
    FILLER               VARCHAR(568)    -- RELLENO
);

-- Programa ATC500: Cruza movimientos de operaciones diarias con los datos generado
-- s TIPOREG = ‘OP’ con autorizaciones. Programa ATC501: Cruza movimientos de opera
-- ciones diarias con los datos generados TIPOREG = ‘OP’ que han cruzado con autori
-- zaciones con las operaciones diarias de tipo TIPOREG = DA’
CREATE TABLE Tabla211 (
    DATOS_COMUNES        UNKNOWN         -- DATOS COMUNES,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA
);

-- ERROR: No se pudieron procesar las columnas de Tabla212
-- Headers encontrados: ['CUENTA', 'CUENTA DE TARJETA', 'Alfanumérico', '12', '']


-- ERROR: No se pudieron procesar las columnas de Tabla213
-- Headers encontrados: ['SIGNODIV', 'SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-)', 'Alfanumérico', '1', '']


-- ERROR: No se pudieron procesar las columnas de Tabla214
-- Headers encontrados: ['NOMPOB', 'POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN', 'Alfanumérico', '26', '']


-- ERROR: No se pudieron procesar las columnas de Tabla215
-- Headers encontrados: ['NUMMOVEXT', 'NÚMERO DE MOVIMIENTO EN EL EXTRACTO', 'Numérico', '7', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla216
-- Headers encontrados: ['PORINT', 'PORCENTAJE DE INTERÉS APLICADO', 'Numérico', '7', '4']


-- ERROR: No se pudieron procesar las columnas de Tabla217
-- Headers encontrados: ['SIGNOAPL', 'SIGNO DEL IMPORTE APLICADO', 'Alfanumérico', '1', '']


-- ERROR: No se pudieron procesar las columnas de Tabla218
-- Headers encontrados: ['SIGNOAPLECO', 'SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-)', 'Alfanumérico', '1', '']


-- ERROR: No se pudieron procesar las columnas de Tabla219
-- Headers encontrados: ['HORTRN', 'HORA DE LA TRANSACCIÓN', 'Hora', '8', '']


-- ERROR: No se pudieron procesar las columnas de Tabla220
-- Headers encontrados: ['NUMSECIMP', 'NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO CON FORMATO AAAAMMDDNNNNNNN', 'Numérico', '15', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla221
-- Headers encontrados: ['NOMCOMRED', 'NOMBRE REDUCIDO DEL COMERCIO', 'Alfanumérico', '27', '']


-- ERROR: No se pudieron procesar las columnas de Tabla222
-- Headers encontrados: ['SECOPE', 'SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED', 'Numérico', '12', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla223
-- Headers encontrados: ['DESTIPFRAN', 'DESCRIPCIÓN FRANQUICIA', 'Alfanumérico', '20', '']


-- Los programas que componen esta interfaz son: Programa ATB465: Formatea los regi
-- stros de detalle. Para cada tarjeta seleccionada se accederá a la tabla de datos
--  de tarjeta con el código de entidad
CREATE TABLE Tabla224 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE CONTRATO,
    CALPART              VARCHAR(2)      -- CALIDA DE PARTICIPACIÓN,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    TIPBON               VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE LA TARJETA,
    FECCADTAR            INT             -- FECHA DE CADUCIDAD DE LA TARJETA (AAAAMM),
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO
);

-- Para cada tarjeta seleccionada se accederá a la tabla de datos de tarjeta con el
--  código de entidad y el pan de la tarjeta, obteniendo así los datos necesarios p
-- ara la salida.
CREATE TABLE Tabla225 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE CONTRATO,
    CALPART              VARCHAR(2)      -- CALIDA DE PARTICIPACIÓN,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    TIPBON               VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA – OFUSCADO --,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE LA TARJETA,
    FECCADTAR            INT             -- FECHA DE CADUCIDAD DE LA TARJETA (AAAAMM),
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    TOKENNEGOCIO         VARCHAR(37)     -- Formado por CODENT, CENTALTA,
);

-- La Interfaz utiliza una única estructura de datos tanto para el envío como para 
-- la recepción de respuesta, aunque existirán datos específicos para el tratamient
-- o de la respuesta (ATDOMREC):
CREATE TABLE Tabla227 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    NUMSECREC            NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO
);

-- La Interfaz utiliza una única estructura de datos tanto para el envío como para 
-- la recepción de respuesta, aunque existirán datos específicos para el tratamient
-- o de la respuesta (ATDOMREC):
CREATE TABLE Tabla228 (
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO,
    NUMREFREM            INT             -- NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCIA MANUAL TARJETA CRÉDITO),
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA (SÓLO PARA TARJETAS),
    ORIGEN               VARCHAR(2)      -- ORIGEN DEL RECIBO: TC – TARJETAS DE COMPRA TD – TARJETAS DE DÉBITO CC – CADENA COMERCIAL VE – VENDEDOR,
    SITUAREC             INT             -- INDICADOR DE SITUACIÓN DEL RECIBO: 0 – PENDIENTE 1 – ENVIADO 2 – PAGADO 3 – DOMICILIACIÓN ERRÓNEA (PENDIENTE) 4 – VENCIDO PENDIENTE DE PAGO 5 – NO PAGO 6 – DOMICILIACIÓN AJENA 7 – ENVÍO A CHEQUES 8 – REENVIADO (POR 2ª CÁMARA) 9 – PENDIENTE DE REENVÍO 10 – TRASPASO A MONEDA PRINCIPAL,
    CODRECHPAS           INT             -- CÓDIGO DE RECHAZO DE PASIVO,
    DESCRECH             VARCHAR(30)     -- DESCRIPCIÓN DEL RECHAZO DE PASIVO,
    FECRECHPAS           UNKNOWN         -- FECHA DE RECHAZO PASIVO,
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO
);

-- La Interfaz utiliza una única estructura de datos tanto para el envío como para 
-- la recepción de respuesta, aunque existirán datos específicos para el tratamient
-- o de la respuesta (ATDOMREC):
CREATE TABLE Tabla229 (
    CLAMONCTACAR         INT             -- MONEDA DE LA CUENTA DE CARGO,
    INDENVPAS            VARCHAR(1)      -- INDICADOR DE ENVIAR A CUENTAS DE PASIVO (S/N),
    NUMENVPAS            INT             -- NÚMERO DE ENVÍOS A CUENTAS DE PASIVO (SE ARRASTRA EN SUCESIVOS ENVÍOS),
    CODMOV               VARCHAR(1)      -- CÓDIGO DE MOVIMIENTO: C – CARGO A - ABONO,
    CODPROCED            INT             -- CÓDIGO DE PROCEDENCIA (VER COPY ATCODPRO),
    FECEMIMOV            UNKNOWN         -- FECHA EMISIÓN MOVIMIENTO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO MOVIMIENTO,
    FECIMPMOV            UNKNOWN         -- FECHA DE IMPAGO (A PARTIR DE ESTA FECHA SIN COBRAR PASA A SITUACIÓN DE IMPAGADO),
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DEL RECIBO,
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO PARA NO ENTRAR EN IMPAGO,
    IMPRECENV            DECIMAL(17, 2)  -- IMPORTE ENVIADO A PASIVO,
    TIPOAPLI             VARCHAR(1)      -- TIPO DE IMPORTE APLICADO: P-PAGO D-DEVOLUCIÓN,
    IMPAPLICADO          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    CLAMON               INT             -- CLAVE DE MONEDA DEL RECIBO,
    INDRETSAL            VARCHAR(1)      -- INDICADOR DE RETENCIÓN DE SALDO (S/N),
    NUMRETSAL            INT             -- NÚMERO DE RETENCIÓN DE SALDO ASIGNADO POR EL SISTEMA CORPORATIVO,
    IMPRETSAL            DECIMAL(17, 2)  -- IMPORTE RETENIDO EN PASIVO
);

-- La Interfaz utiliza una única estructura de datos tanto para el envío como para 
-- la recepción de respuesta, aunque existirán datos específicos para el tratamient
-- o de la respuesta (ATDOMREC):
CREATE TABLE Tabla230 (
    CLAMONRET            INT             -- CLAVE DE MONEDA DE LA RETENCIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE,
    CICLOVIDA            VARCHAR(15)     -- CICLO DE VIDA,
    INDPREINC            VARCHAR(1)      -- INDICADOR PREAUTORIZACIÓN INCREMENTAL VALORES POSIBLES: Espacios – Pre-autorización o autorización normal. I – Pre-autorización Incremental O – Pre-autorización original de las pre- autorizaciones incrementales
);

-- MPJ08140.FREC0002: Registros rechazados. Los programas que intervienen son: Como
--  todas las interfaces de entrada de datos lo primero que se realiza son validaci
-- ones sobre los datos de cabecera de la cinta. Ir a ver validaciones
CREATE TABLE Tabla231 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    NUMSECREC            NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO,
    NUMREFREM            INT             -- NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCIA MANUAL TARJETA CRÉDITO),
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA (SÓLO PARA TARJETAS),
    ORIGEN               VARCHAR(2)      -- ORIGEN DEL RECIBO: TC - TARJETAS DE COMPRA TD - TARJETAS DE DÉBITO CO – COMERCIOS,
    SITUAREC             INT             -- INDICADOR DE SITUACIÓN DEL RECIBO: – PENDIENTE - ENVIADO – PAGADO – DOMICILIACIÓN ERRÓNEA (PENDIENTE) – VENCIDO PENDIENTE DE PAGO - NO PAGO - DOMICILIACIÓN AJENA – ENVÍO A CHEQUES – REENVIADO (POR 2ª CÁMARA) – RECOBRADO – PENDIENTE REENVÍO,
    CODRECHPAS           INT             -- CÓDIGO DE RECHAZO DE PASIVO,
    DESCRECH             VARCHAR(30)     -- DESCRIPCIÓN DEL RECHAZO DE PASIVO,
    FECRECHPAS           UNKNOWN         -- FECHA DE RECHAZO PASIVO
);

-- MPJ08140.FREC0002: Registros rechazados. Los programas que intervienen son: Como
--  todas las interfaces de entrada de datos lo primero que se realiza son validaci
-- ones sobre los datos de cabecera de la cinta. Ir a ver validaciones
CREATE TABLE Tabla232 (
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO,
    CLAMONCTACAR         INT             -- MONEDA DE LA CUENTA DE CARGO,
    INDENVPAS            VARCHAR(1)      -- INDICADOR DE ENVIAR A CUENTAS DE PASIVO (S/N),
    NUMENVPAS            INT             -- NÚMERO DE ENVÍOS A CUENTAS DE PASIVO (SE ARRASTRA EN SUCESIVOS ENVÍOS),
    CODMOV               VARCHAR(1)      -- CÓDIGO DE MOVIMIENTO: C – CARGO A - ABONO,
    CODPROCED            INT             -- CÓDIGO DE PROCEDENCIA (VER COPY ATCODPRO),
    FECEMIMOV            UNKNOWN         -- FECHA EMISIÓN MOVIMIENTO,
    FECVENMOV            UNKNOWN         -- FECHA DE VENCIMIENTO MOVIMIENTO,
    FECIMPMOV            UNKNOWN         -- FECHA DE IMPAGO (A PARTIR DE ESTA FECHA SIN COBRAR PASA A SITUACIÓN DE IMPAGADO),
    IMPREC               DECIMAL(17, 2)  -- IMPORTE DEL RECIBO,
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO PARA NO ENTRAR EN IMPAGO,
    IMPRECENV            DECIMAL(17, 2)  -- IMPORTE ENVIADO A PASIVO,
    TIPOAPLI             VARCHAR(1)      -- TIPO DE IMPORTE APLICADO: P-PAGO D-DEVOLUCIÓN,
    IMPAPLICADO          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    CLAMON               INT             -- CLAVE DE MONEDA DEL RECIBO,
    INDRETSAL            VARCHAR(1)      -- INDICADOR DE RETENCIÓN DE SALDO (S/N),
    NUMRETSAL            INT             -- NÚMERO DE RETENCIÓN DE SALDO ASIGNADO POR EL SISTEMA CORPORATIVO,
    IMPRETSAL            DECIMAL(17, 2)  -- IMPORTE RETENIDO EN PASIVO
);

-- MPJ08140.FREC0002: Registros rechazados. Los programas que intervienen son: Como
--  todas las interfaces de entrada de datos lo primero que se realiza son validaci
-- ones sobre los datos de cabecera de la cinta. Ir a ver validaciones
CREATE TABLE Tabla233 (
    CLAMONRET            INT             -- CLAVE DE MONEDA DE LA RETENCIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE,
    CICLOVIDA            VARCHAR(15)     -- CICLO DE VIDA,
    INDPREINC            VARCHAR(1)      -- INDICADOR PREAUTORIZACIÓN INCREMENTAL
);

-- La Interfaz utiliza una única estructura de datos tanto para el envío como para 
-- la recepción de respuesta, aunque existirán datos específicos para el tratamient
-- o de la respuesta (ATDOMRE2):
CREATE TABLE Tabla234 (
    CODENT               UNKNOWN         -- CÓDIGO DE ENTIDAD,
    NUMSECREC            NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM               UNKNOWN         -- CÓDIGO DE COMERCIO,
    CENTALTA             UNKNOWN         -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               UNKNOWN         -- CUENTA DE TARJETA,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO,
    NUMREFREM            INT             -- NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCI A MANUAL TARJETA CRÉDITO),
    PAN                  UNKNOWN         -- NÚMERO DE LA TARJETA (SÓLO PARA TARJETAS) --- OFUSCADO ---,
    ORIGEN               UNKNOWN         -- ORIGEN DEL RECIBO: TC – TARJETAS DE COMPRA TD – TARJETAS DE DÉBITO CO – COMERCIOS,
    SITUAREC             INT             -- INDICADOR DE SITUACIÓN DEL RECIBO: 0 – PENDIENTE 1 – ENVIADO 2 – PAGADO 3 – DOMICILIACIÓN ERRÓNEA (PENDIENTE) 4 – VENCIDO PENDIENTE DE PAGO 5 – NO PAGO
);

-- ERROR: No se pudieron procesar las columnas de Tabla235
-- Headers encontrados: ['', '6 – DOMICILIACIÓN AJENA 7 – ENVÍO A CHEQUES 8 – REENVIADO (POR 2ª CÁMARA) 9 – PENDIENTE DE REENVÍO 10 – TRASPASO A MONEDA PRINCIPAL', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla236
-- Headers encontrados: ['IMPRECENV', 'IMPORTE ENVIADO A PASIVO', 'Numérico con Signo', '17', '2']


-- MPJ08140.FREC0002: Registros rechazados. ATBI27: A partir del Tokennegocio, se r
-- ecupera de base de datos el Pan.
CREATE TABLE Tabla237 (
    CODENT               UNKNOWN         -- CÓDIGO DE ENTIDAD,
    NUMSECREC            NUMERIC(15)     -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM               UNKNOWN         -- CÓDIGO DE COMERCIO,
    CENTALTA             UNKNOWN         -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               UNKNOWN         -- CUENTA DE TARJETA,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO
);

-- ERROR: No se pudieron procesar las columnas de Tabla238
-- Headers encontrados: ['NUMREFREM', 'NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCI A MANUAL TARJETA CRÉDITO)', 'Numérico con Signo', '10', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla239
-- Headers encontrados: ['NUMENVPAS', 'NÚMERO DE ENVÍOS A CUENTAS DE PASIVO (SE ARRASTRA EN SUCESIVOS ENVÍOS)', 'Numérico con Signo', '2', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla240
-- Headers encontrados: ['IMPRETSAL', 'IMPORTE RETENIDO EN PASIVO', 'Numérico con Signo', '17', '2']


-- El fichero de envío constará de una parte fija llamada cabecera y pie, se difere
-- nciarán por el campo TIPO DE REGISTRO, ambos tendrán el siguiente formato: Datos
--  Cabecera (ATINTCA1):
CREATE TABLE Tabla241 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    NSECFIC              INT             -- NÚMERO DE SECUENCIA DE LA CINTA,
    TIPOCINTA            INT             -- TIPO DE LA CINTA - 12 ENVÍO / RESPUESTA ESTAMPACIÓN,
    TIPOREG              VARCHAR(1)      -- TIPO DE REGISTRO C = CABECERA P = PIE,
    FECENVIO             UNKNOWN         -- FECHA DE ENVÍO DE LA CINTA,
    HORAENVIO            VARCHAR(8)      -- HORA ENVÍO DE LA CINTA,
    NUMREGTOT            NUMERIC(12)     -- NÚMERO TOTAL DE REGISTROS,
    OTROSDATOSCAB        VARCHAR(951)    -- DATOS NO REPETITIVOS PROPIOS DE CADA INTERFAZ.
);

-- El fichero de envío constará de una parte fija llamada cabecera y pie, se difere
-- nciarán por el campo TIPO DE REGISTRO, ambos tendrán el siguiente formato: Datos
--  Cabecera (ATINTCA1):
CREATE TABLE Tabla242 (
    ESTADOCINTA          VARCHAR(1)      -- ESTADO DE LA CINTA - 4 – CINTA ENVIADA,
    VALIDACION           VARCHAR(1)      -- VALIDACIÓN DE LA CINTA S = SI N = NO,
    FILLER               VARCHAR(8346)  
);

-- Adicionalmente, el campo OTROSDATOSCAB aloja, en las dos primeras posiciones, el
--  motivo de estampación (MOTEST), quedando el resto del campo a espacios. Respect
-- o a los registros de detalle del Fichero de Envío y Respuesta de Estampación:
CREATE TABLE Tabla243 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    NSECFIC              INT             -- NÚMERO DE SECUENCIA DE LA CINTA,
    TIPOCINTA            INT             -- TIPO DE LA CINTA
);

-- Respecto a los registros de detalle del Fichero de Envío y Respuesta de Estampac
-- ión: En cuanto al cuerpo de los registros para cada plástico la estructura de la
--  interfaz es la siguiente:
CREATE TABLE Tabla244 (
    TIPOREG              VARCHAR(1)      -- TIPO DE REGISTRO - D = DETALLE,
    FILLER               VARCHAR(91)    ,
    NUMREGPROC           NUMERIC(12)     -- NÚMERO DE REGISTRO PROCESADO,
    RESTO_DE_CAMPOS      VARCHAR(9226)   -- PROPIOS DE CADA INTERFAZ.
);

-- Datos generales: Obligatorios en todos los plásticos. Datos electrónicos: Solo p
-- ara aquellos plásticos que llevan chip como tarjeta monedero.
CREATE TABLE Tabla245 (
    CODENT_ORD           VARCHAR(4)      -- CÓDIGO DE ENTIDAD PARA LA ORDENACIÓN,
    MOTEST_ORD           VARCHAR(2)      -- MOTIVO DE ESTAMPACIÓN PARA LA ORDENACIÓN,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CUENTA,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN. IDENTIFICADOR DE CLIENTE,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DEL CLIENTE,
    CONDEST              VARCHAR(3)      -- CONDICIÓN DE ESTAMPACIÓN,
    ESTPLAS1             VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO,
    ESTPLAS2             VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO,
    CODDISTRIB           VARCHAR(23)     -- CÓDIGO DE DISTRIBUCIÓN,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    NOMBREEMP            VARCHAR(30)     -- NOMBRE DE EMPRESA PARA ESTAMPACIÓN,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE LA TARJETA
);

-- Datos electrónicos: Solo para aquellos plásticos que llevan chip como tarjeta mo
-- nedero. Datos EMV: son los datos necesarios para personalizar el chip EMV. Solo 
-- para aquellas tarjetas que son EMV y que los datos del chip los genere la herram
-- ienta HPPEMV.
CREATE TABLE Tabla246 (
    LIMCRECTA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA DE TARJETA
);

-- Registro de detalle (ATINTDE3):
CREATE TABLE Tabla247 (
    PISTA1               VARCHAR(79)     -- DATOS DE LA PISTA 1,
    PISTA2               VARCHAR(40)     -- DATOS DE LA PISTA 2,
    PISTA3               VARCHAR(104)    -- DATOS DE LA PISTA 3,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    INDDEBCRE            VARCHAR(1)      -- TIPO DE TARJETA,
    FECCADTAR            INT             -- FECHA DE CADUCIDAD (formato MMAA),
    CVV2                 INT             -- VALOR DE VERIFICACIÓN DE TARJETA,
    VISAPHONE            INT             -- CÓDIGO DE VISAPHONE,
    NOMBENRED            VARCHAR(35)     -- NOMBRE DE ESTAMPACIÓN, FORMATO: NOMBRE*APELLIDO,
    INDFOTO              VARCHAR(1)      -- INDICADOR DE FOTO (S/N),
    REFFOTO              VARCHAR(30)     -- REFERENCIA DE LA FOTO,
    CODBARR              NUMERIC(14)     -- CÓDIGO DE BARRAS
);

-- Correspondientes a los datos de las tarjetas monedero:
CREATE TABLE Tabla248 (
    PAN_MND              VARCHAR(22)     -- NÚMERO DE TARJETA MONEDERO,
    INDDEBCRE__MND       VARCHAR(1)      -- TIPO DE TARJETA MONEDERO
);

-- Correspondientes a los datos de las tarjetas monedero:
CREATE TABLE Tabla249 (
    FECCADTAR__MND       INT             -- FECHA DE CADUCIDAD MONEDERO (formato MMAA),
    NOMBENRED__MND       VARCHAR(35)     -- NOMBRE DE ESTAMPACIÓN MONEDERO, FORMATO: NOMBRE*APELLIDO,
    INDFOTO_MND          VARCHAR(1)      -- INDICADOR DE FOTO MONEDERO (S/N),
    REFFOTO_MND          VARCHAR(30)     -- REFERENCIA DE LA FOTO MONEDERO,
    CODBARR_MND          NUMERIC(14)     -- CÓDIGO DE BARRAS MONEDERO,
    DATOS_MND            VARCHAR(1400)   -- DATOS DEL CHIP MONEDERO
);

-- Correspondientes a los datos de las tarjetas monedero: Dentro de la parte de dat
-- os de monedero, la estructura de los campos varía dependiendo de la tecnología d
-- el monedero y de la aplicación a implantar en el Chip.
CREATE TABLE Tabla250 (
    CENTALTA__SEC        VARCHAR(4)      -- CENTRO DE ALTA DE LA TARJETA DUAL SECUNDARIA,
    CUENTA_SEC           VARCHAR(12)     -- CUENTA DE LA TARJETA DUAL SECUNDARIA,
    CALPART__SEC         VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN. IDENTIFICADOR DE CLIENTE DE LA TARJETA DUAL SECUNDARIA,
    IDENTCLI__SEC        VARCHAR(8)      -- IDENTIFICACIÓN DEL CLIENTE DE LA TARJETA DUAL SECUNDARIA,
    ESTPLAS1__SEC        VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO DE LA TARJETA DUAL SECUNDARIA,
    ESTPLAS2__SEC        VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO DE LA TARJETA DUAL SECUNDARIA,
    PRODUCTO__SEC        VARCHAR(2)      -- CÓDIGO DE PRODUCTO DE LA TARJETA DUAL SECUNDARIA
);

-- Correspondientes a los datos de las tarjetas monedero: Dentro de la parte de dat
-- os de monedero, la estructura de los campos varía dependiendo de la tecnología d
-- el monedero y de la aplicación a implantar en el Chip.
CREATE TABLE Tabla251 (
    SUBPRODU__SEC        VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO DE LA TARJETAL DUAL SECUNDARIA,
    FECALTA__SEC         UNKNOWN         -- FECHA DE ALTA DE LA TARJETA DUAL SECUNDARIA,
    LIMCRECTA__SEC       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA DE TARJETA DUAL SECUNDARIA,
    PISTA1_SEC           VARCHAR(79)     -- DATOS DE LA PISTA 1 DE LA TARJETA DUAL SECUNDARIA,
    PISTA2_SEC           VARCHAR(40)     -- DATOS DE LA PISTA 2 DE LA TARJETA DUAL SECUNDARIA,
    PISTA3_SEC           VARCHAR(104)    -- DATOS DE LA PISTA 3 DE LA TARJETA DUAL SECUNDARIA,
    PAN_SEC              VARCHAR(22)     -- NÚMERO DE TARJETA DUAL SECUNDARIA,
    INDDEBCRE__SEC       VARCHAR(1)      -- TIPO DE TARJETA DUAL SECUNDARIA,
    CVV2_SEC             INT             -- VALOR DE VERIFICACIÓN DE TARJETA DUAL SECUNDARIA,
    NOMBENRED__SEC       VARCHAR(35)     -- NOMBRE DE ESTAMPACIÓN DE LA TARJETA DUAL SECUNDARIA, FORMATO:NOMBRE*APELLIDO,
    INDFOTO__SEC         VARCHAR(1)      -- INDICADOR DE FOTO (S/N) DE LA TARJETA DUAL SECUNDARIA,
    REFFOTO__SEC         VARCHAR(30)     -- REFERENCIA DE LA FOTO DE LA TARJETA DUAL SECUNDARIA,
    CODBARR__SEC         NUMERIC(14)     -- CÓDIGO DE BARRAS DE LA TARJETA DUAL SECUNDARIA,
    CODMAR_SEC           INT             -- CÓDIGO DE MARCA DE LA TARJETA DUAL SECUNDARIA,
    INDTIPT_SEC          INT             -- INDICADOR DE TIPO DE TARJETA DUAL SECUNDARIA,
    NUMBENCTA__SEC       INT             -- NÚMERO DE BENEFICIARIO DE LA CUENTA DE LA TARJETA DUAL SECUNDARIA,
    IBAN_SEC             VARCHAR(4)      -- CÓDIGO IBAN DE LA CUENTA DE CARGO DE LA TARJETA DUAL SECUNDARIA
);

-- Correspondientes a los datos de las tarjetas monedero: Dentro de la parte de dat
-- os de monedero, la estructura de los campos varía dependiendo de la tecnología d
-- el monedero y de la aplicación a implantar en el Chip.
CREATE TABLE Tabla252 (
    CTA_CARGO__SEC       VARCHAR(30)     -- CUENTA DE CARGO DE LA TARJETA DUAL SECUNDARIA,
    PINBLOCK__SEC        VARCHAR(16)     -- PIN BLOCK DE LA TARJETA DUAL SECUNDARIA
);

-- Dentro de la parte de datos de monedero, la estructura de los campos varía depen
-- diendo de la tecnología del monedero y de la aplicación a implantar en el Chip. 
-- Datos de tarjeta dual.
CREATE TABLE Tabla253 (
    DATOS_EMV            VARCHAR(2500)   -- DATOS DE LA TECNOLOGÍA EMV
);

-- ERROR: No se pudieron procesar las columnas de Tabla254
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla255
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla256
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla257
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla258
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla259
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla260
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG.', 'TIPO', 'VALOR EJEMPLO']


-- ERROR: No se pudieron procesar las columnas de Tabla261
-- Headers encontrados: ['DESCRIPCIÓN', 'LONG.', 'TIPO', 'VALOR EJEMPLO']


-- Los datos propietarios genéricos dependerán de las decisiones tomadas por la ent
-- idad para sus tarjetas EMV, además de la aplicación y versión de la tarjeta EMV.
--  Un Ejemplo podría ser: Datos Criptográficos.
CREATE TABLE Tabla262 (
    TIPOCLAVE            VARCHAR(10)     -- TIPO DE CLAVE: OFFSET1 OFFSET2 PVV CVV KEK: CLAVE DE INTERCAMBIO DE CLAVES KTC: CLAVE DE TRANSPORTE DE CLAVES KTP: CLAVE DE TRANSPORTE DE PIN,
    ETIQUETA             VARCHAR(32)     -- CLAVE CIFRADA
);

-- Los datos propietarios genéricos dependerán de las decisiones tomadas por la ent
-- idad para sus tarjetas EMV, además de la aplicación y versión de la tarjeta EMV.
--  Un Ejemplo podría ser: Datos Criptográficos.
CREATE TABLE Tabla263 (
    CODMAR               INT             -- CÓDIGO DE MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA DE TARJETA,
    OFIENVIO             VARCHAR(4)      -- OFICINA DE ENVÍO,
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO
);

-- Los datos propietarios genéricos dependerán de las decisiones tomadas por la ent
-- idad para sus tarjetas EMV, además de la aplicación y versión de la tarjeta EMV.
--  Un Ejemplo podría ser: Datos Criptográficos.
CREATE TABLE Tabla264 (
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    INDTAREMV            INT             -- INDICADOR DE TARJETA EMV,
    CODSERV              INT             -- CÓDIGO DE SERVICIO,
    OFFSET               VARCHAR(12)     -- OFFSET,
    PVV                  INT             -- PVV,
    INDOFFPVV            VARCHAR(1)      -- INDICADOR OFFSET PVV,
    PSN                  INT             -- NÚMERO DE SECUENCIA DEL PAN,
    ICVV                 VARCHAR(3)      -- CVV DEL CHIP EMV. SÓLO PARA TARJETAS EMV CON ESTAMPACIÓN EXTERNA.,
    PINOFFLINE           VARCHAR(16)     -- PINBLOCK OFFLINE DEL CHIP EMV. SÓLO PARA TARJETAS EMV CON ESTAMPACIÓN EXTERNA.,
    FECORIG              VARCHAR(10)     -- FECHA DE ALTA DEL BENEFICIARO,
    FILLER               VARCHAR(13)    
);

-- ATC419: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla265 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    IDENTESTAMP          VARCHAR(2)      -- IDENTIFICACIÓN DE ESTAMPADORA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICACIÓN DEL CLIENTE,
    DATLIBRE             VARCHAR(80)     -- DATOS LIBRES, ERRORES Y AVISOS,
    NUMSEFICH            INT             -- NÚMERO DE SECUENCIA DEL FICHERO ENVIADO,
    CODRESP              VARCHAR(2)      -- CÓDIGO DE RESPUESTA (‘00’ OK, RESTO VALORES NO OK)),
    MOTEST               VARCHAR(2)      -- MOTIVO DE ESTAMPACIÓN
);

-- ERROR: No se pudieron procesar las columnas de Tabla266
-- Headers encontrados: ['CAMPO', 'TIPO', 'LONG', 'VALOR', 'OBSERVACIONES']


-- ERROR: No se pudieron procesar las columnas de Tabla267
-- Headers encontrados: ['CAMPO', 'TIPO', 'LONG', 'VALOR', 'OBSERVACIONES']


-- ERROR: No se pudieron procesar las columnas de Tabla268
-- Headers encontrados: ['CAMPO', 'TIPO', 'LONG', 'VALOR', 'OBSERVACIONES']


-- ERROR: No se pudieron procesar las columnas de Tabla269
-- Headers encontrados: ['CAMPO', 'TIPO', 'LONG', 'VALOR', 'OBSERVACIONES']


-- ERROR: No se pudieron procesar las columnas de Tabla270
-- Headers encontrados: ['CAMPO', 'TIPO', 'LONG', 'VALOR', 'OBSERVACIONES']


-- ERROR: No se pudieron procesar las columnas de Tabla271
-- Headers encontrados: ['CAMPO', 'TIPO', 'LONG', 'VALOR', 'OBSERVACIONES']


-- ATC400: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla272 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    INDNORCOR            INT             -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CLAMON               INT             -- CLAVE DE MONEDA,
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN
);

-- ATC400: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla273 (
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    INDDEBCRE            VARCHAR(1)      -- INDICADOR DE DÉBITO / CRÉDITO,
    INDCOMPCUO           VARCHAR(1)      -- INDICADOR DE COMPRA EN CUOTAS,
    CODTIPC              VARCHAR(4)      -- TIPO DE CUOTA,
    NUMCUOTA             INT             -- NÚMERO DE CUOTAS,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE CUOTA,
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL,
    MESCARCUO            INT             -- MESES DE CARENCIA,
    LINREF               INT             -- REFERENCIA DE LÍNEA,
    FORPAGO              INT             -- FORMA DE PAGO,
    INDICA_TASA_0        INT             -- INDICADOR DE TASA CON VALOR 0 0 – LA TASA SE DEBE CALCULAR 1 – LA TASA ES 0
);

-- ATC400: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla274 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN --OFUSCADO--,
    INDNORCOR            INT             -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla275
-- Headers encontrados: ['IMPFAC', 'IMPORTE DE LA FACTURA', 'Numérico con Signo', '17', '2']


-- ATB648: Validación de datos particulares. Los datos de entrada de la interfaz se
--  construyen única y exclusivamente con los datos que se muestra en este apartado
-- .
CREATE TABLE Tabla277 (
    CODENTID             VARCHAR(8)      -- Código de Entidad. Identifica la entidad fidelizadora que ha generado las acciones del Evento.,
    CODPROGR             VARCHAR(8)      -- Código del programa al cual pertenece la cuenta.,
    CODCUENT             VARCHAR(20)     -- Código de la cuenta.,
    TIPIDCLI             VARCHAR(2)      -- Tipo Identificador de Cliente.,
    IDCLIENT             VARCHAR(20)     -- Código identificador de cliente,
    NUMSOLIC             INT             -- Número de Solicitud de Canje.,
    NUMAUTOR             VARCHAR(12)     -- Número de autorización. No obligatorio y de uso reservado a solicitudes de canje realizadas externamente.,
    FECHENVI             VARCHAR(8)      -- Fecha de Envío. Formato AAAAMMDD.,
    IMPOCASH             DECIMAL(15, 2)  -- Importe del premio cuando el tipo de este es CASHBACK,
    INDANULA             VARCHAR(1)      -- Indicador de anulación NO ANULACIÓN ANULACIÓN,
    CODRETOR             VARCHAR(2)      -- Código de retorno.,
    DESCERRO             VARCHAR(120)    -- Descripción de error.
);

-- ATC401: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla278 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    TIPEVENTO            VARCHAR(2)      -- TIPO DE EVENTO A BONIFICAR CE - CUOTA EMISIÓN CR - CUOTA RENOVACIÓN o MANTENIMIENTO CS - CUOTA SUSTITUCIÓN,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    PORBON               DECIMAL(7, 4)   -- PORCENTAJE DE BONIFICACIÓN INFORMADO,
    FECINI               UNKNOWN         -- FECHA DE INICIO VIGENCIA,
    FECFIN               UNKNOWN         -- FECHA DE FIN
);

-- ATC401: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla279 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    TIPEVENTO            VARCHAR(2)      -- TIPO DE EVENTO A BONIFICAR CE - CUOTA EMISIÓN CR - CUOTA RENOVACIÓN CS - CUOTA SUSTITUCIÓN,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    PORBON               DECIMAL(7, 4)   -- PORCENTAJE DE BONIFICACIÓN INFORMADO,
    FECINI               UNKNOWN         -- FECHA DE INICIO VIGENCIA,
    FECFIN               UNKNOWN         -- FECHA DE FIN
);

-- ATC414: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla280 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    TIPDOC               VARCHAR(2)      -- TIPO DE DOCUMENTO U ORIGEN DEL PAGO 01-CHEQUE 02-GIRO 03-METÁLICO (NO HAY DOCUMENTO) 04-INTERNET 05-OTROS,
    NUMDOC               VARCHAR(20)     -- NÚMERO DEL DOCUMENTO,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA.,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECAPL               UNKNOWN         -- FECHA DE APLICACIÓN,
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDANUL              VARCHAR(1)      -- INDICADOR DE ANULACIÓN,
    LINREF               INT             -- REFERENCIA DE LÍNEA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    CENTALTA             VARCHAR(4)      -- OFICINA DE ALTA DE CUENTA,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    FILLER               VARCHAR(28)    
);

-- ATC414: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla281 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    TIPDOC               VARCHAR(2)      -- TIPO DE DOCUMENTO U ORIGEN DEL PAGO 01-CHEQUE 02-GIRO 03-METÁLICO (NO HAY DOCUMENTO) 04-INTERNET 05-OTROS,
    NUMDOC               VARCHAR(20)     -- NÚMERO DEL DOCUMENTO,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    PAN                  VARCHAR(22)     -- NÚMERO DE LA TARJETA. – OFUSCADO --,
    IMPAPL               DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECAPL               UNKNOWN         -- FECHA DE APLICACIÓN,
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDANUL              VARCHAR(1)      -- INDICADOR DE ANULACIÓN,
    LINREF               INT             -- REFERENCIA DE LÍNEA,
    TIPOFAC              INT             -- TIPO DE FACTURA
);

-- ERROR: No se pudieron procesar las columnas de Tabla282
-- Headers encontrados: ['TOKENNEGOCIO', 'formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO', 'Alfanumérico', '37', '']


-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Si se cumplimentan dos registros sobre
--  el mismo servicio se ejecutarán ambos consecutivamente, sólo en el caso de info
-- rmar dos panes del mismo contrato.
CREATE TABLE Tabla283 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA
);

-- Si se cumplimentan dos registros sobre el mismo servicio se ejecutarán ambos con
-- secutivamente, sólo en el caso de informar dos panes del mismo contrato. Se cons
-- ideran cumplimentados como se describe en Consideraciones Generales de Interface
-- s Batch. Un servicio será activado si los campos que se consideran como obligato
-- rios han sido cumplimentados.
CREATE TABLE Tabla284 (
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ            VARCHAR(1)      -- INDICADOR DE DESBLOQUEO DE LA CUENTA,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    INDMODLIMT           VARCHAR(2)      -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    INDSITCTA            VARCHAR(1)      -- SITUACIÓN DE CUENTA,
    PORCVARLIM_1         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1
);

-- Se consideran cumplimentados como se describe en Consideraciones Generales de In
-- terfaces Batch. Un servicio será activado si los campos que se consideran como o
-- bligatorios han sido cumplimentados. Como todas las interfaces de entrada de dat
-- os lo primero que se realiza son validaciones sobre los datos de cabecera de la 
-- cinta. Ir a ver validaciones
CREATE TABLE Tabla285 (
    IMPVARLIMCUE_1       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    SIGNOVARLIMCU_E_1    VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    CLAMON_1             INT             -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN,
    PORCVARLIM_2         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    SIGNOVARLIMCU_E_2    VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    CLAMON_2             INT             -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN,
    FORPAGO              INT             -- FORMA DE PAGO SOLO PARA EL CRÉDITO,
    IMPFPAGOA            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    FORPAGOTEM           INT             -- FORMA DE PAGO TEMPORAL (SOLO PARA EL CRÉDITO),
    FIFORPAGT            UNKNOWN         -- FECHA INICIO FORMA PAGO TEMPORAL,
    FFFORPAGT            UNKNOWN         -- FECHA FIN FORMA PAGO TEMPORAL,
    IMPFPATEM            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL,
    CLAMONPAG            INT             -- CLAVE DE MONEDA DEL IMPORTE TEMPORAL,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO,
    PORPATEM             DECIMAL(7, 4)   -- PORCENTAJE PAGO TEMPORAL
);

-- Como todas las interfaces de entrada de datos lo primero que se realiza son vali
-- daciones sobre los datos de cabecera de la cinta. Ir a ver validaciones La Inter
-- faz consta de dos grupos de campos: generales y opcionales, a continuación, se d
-- escriben los
CREATE TABLE Tabla286 (
    INDDOMCARCRE         VARCHAR(1)      -- INDICADOR DE DOMICILIACIÓN DEL CARGO DE CRÉDITO,
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO,
    CLAMONCAR            INT             -- CLAVE DE MONEDA,
    CONPROD              VARCHAR(3)      -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    CODCAM               VARCHAR(6)      -- CÓDIGO DE CAMPAÑA,
    OFIGESTORA           VARCHAR(4)      -- CÓDIGO DE OFICINA GESTORA,
    GRUPOLIQ             INT             -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO             INT             -- GRUPO DE PROCESO DE CUOTA,
    TIPOBON              VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    INDPERCUO            VARCHAR(1)      -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT            INT             -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    CODREGIMEN           INT             -- CÓDIGO DE RÉGIMEN FISCAL,
    RESEMIEXT            VARCHAR(12)     -- RESTRICCIÓN DE MESES EMISIÓN DE EXTRACTO,
    CODPROMO             VARCHAR(3)      -- CÓDIGO DE PROMOCIÓN,
    CODFORMATO           VARCHAR(10)     -- CÓDIGO DE FORMATO,
    TRASALACR            VARCHAR(1)      -- TRATAMIENTO DE SALDO ACREEDOR,
    PORCVARLIM_C_1       INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1
);

-- La Interfaz consta de dos grupos de campos: generales y opcionales, a continuaci
-- ón, se describen los
CREATE TABLE Tabla287 (
    SIGNOPORCEN__C_1     VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 1,
    IMPVARLIMCUE__C_1    DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    SIGNOVARLIMCU_E_C_1  VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    PORCVARLIM_C_2       INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOPORCEN__C_2     VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 2,
    IMPVARLIMCUE__C_2    DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOVARLIMCU_E_C_2  VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    FILLER               VARCHAR(41)     -- ESPACIO DISPONIBLE DEL REGISTRO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    CLAMONLIN_1          INT             -- CLAVE DE MONEDA 1 DE LA LÍNEA,
    LIMLIN_1             DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    PORLIM_1             INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 1
);

-- La Interfaz consta de dos grupos de campos: generales y opcionales, a continuaci
-- ón, se describen los
CREATE TABLE Tabla288 (
    INDPORLIM_1          UNKNOWN         -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 1. VALORES: I: IMPORTE P: PORCENTAJE,
    CLAMONLIN_2          INT             -- CLAVE DE MONEDA 2 DE LA LÍNEA,
    LIMLIN_2             DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    PORLIM_2             INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    INDPORLIM_2          VARCHAR(1)      -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 2. VALORES: I: IMPORTE P: PORCENTAJE,
    CODBLQLIN            INT             -- CÓDIGO DE BLOQUEO DE LA LÍNEA,
    TEXBLQLIN            VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    TIPOLINBLQ           VARCHAR(4)      -- TIPO DE LÍNEA A BLOQUEAR,
    IMPFPAGOA1           DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO SEGUNDA MONEDA,
    IMPFPATEM1           DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL SEGUNDA MONEDA,
    CLAMONPAG1           INT             -- CLAVE DE MONEDA DEL IMPORTE TEMPORAL SEGUNDA MONEDA,
    PORPAGOA1            DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO SEGUNDA MONEDA,
    PORPATEM1            DECIMAL(7, 4)   -- PORCENTAJE PAGO TEMPORAL SEGUNDA MONEDA,
    IBAN1                VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO SEGUNDA MONEDA,
    CTACARGO1            VARCHAR(30)     -- CUENTA DE CARGO SEGUNDA MONEDA,
    CLAMONCAR1           INT             -- SEGUNDA MONEDA
);

-- Tabla289
CREATE TABLE Tabla289 (
    CONPRODP             VARCHAR(3)      -- CONDICION ECONÓMICA DEL NUEVO PRODUCTO,
    INDCASTAUT           VARCHAR(1)      -- INDICADOR DE CASTIGO AUTOMÁTICO. POSIBLES VALORES: E-Exento N-No aplica
);

-- Validaciones sobre los datos Obligatorios. Se validan los campos de entrada. Deb
-- en venir informados el centro de alta y la cuenta de tarjeta, o en su defecto el
--  pan de la tarjeta.
CREATE TABLE Tabla290 (
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ            VARCHAR(1)      -- INDICADOR DE DESBLOQUEO DE LA CUENTA
);

-- Se validan los campos de entrada. Deben venir informados el centro de alta y la 
-- cuenta de tarjeta, o en su defecto el pan de la tarjeta. Lectura del fichero de 
-- entrada. Los datos adicionales a cumplimentar además de los generales son los si
-- guientes:
CREATE TABLE Tabla291 (
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla292 (
    INDSITCTA            VARCHAR(1)      -- SITUACIÓN DE CUENTA
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla293 (
    INDMODLIMT           VARCHAR(2)      -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1,
    IMPVARLIMCUE_1       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    SIGNOVARLIMCUE_1     VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    CLAMON_1             INT             -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla294 (
    PORCVARLIM_2         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    SIGNOVARLIMCUE_2     VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    CLAMON_2             INT             -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN,
    PORCVARLIM_C_1       INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    SIGNOPORCEN_C_1      VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 1,
    IMPVARLIMCUE_C_1     DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    SIGNOVARLIMCUE_C__1  VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    PORCVARLIM_C_2       INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOPORCEN_C_2      VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 2
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla295 (
    IMPVARLIMCUE_C_2     DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOVARLIMCUE_C__2  VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla296 (
    INDMODLIMT           VARCHAR(2)      -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1,
    IMPVARLIMCUE_1       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1,
    SIGNOVARLIMCUE_1     VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla297 (
    CLAMON_1             INT             -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN,
    PORCVARLIM_2         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    SIGNOVARLIMCUE_2     VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    CLAMON_2             INT             -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN
);

-- El proceso de cambio de forma de pago permite modificar los campos asociados a l
-- a forma de pago y forma de pago temporal. Este proceso es Batch y tendrá los sig
-- uientes tratamientos: Lectura del fichero de entrada. Los datos adicionales a cu
-- mplimentar además de los generales son los siguientes:
CREATE TABLE Tabla298 (
    FORPAGO              INT             -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    IMPFPAGOA            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    FORPAGOTEM           INT             -- FORMA DE PAGO TEMPORAL (SOLO PARA EL CRÉDITO),
    FIFORPAGT            UNKNOWN         -- FECHA INICIO FORMA PAGO TEMPORAL,
    FFFORPAGT            UNKNOWN         -- FECHA FIN FORMA PAGO TEMPORAL,
    IMPFPATEM            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL,
    CLAMONPAG            INT             -- CLAVE MONEDA,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE DE PAGO APLAZADO,
    PORPATEM             DECIMAL(7, 4)   -- PORCENTAJE PAGO TEMPORAL,
    IMPFPAGOA1           DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO SEGUNDA MONEDA,
    IMPFPATEM1           DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL SEGUNDA MONEDA,
    CLAMONPAG1           INT             -- CLAVE MONEDA SEGUNDA MONEDA,
    PORPAGOA1            DECIMAL(7, 4)   -- PORCENTAJE DE PAGO APLAZADO SEGUNDA MONEDA
);

-- El proceso de cambio de forma de pago permite modificar los campos asociados a l
-- a forma de pago y forma de pago temporal. Este proceso es Batch y tendrá los sig
-- uientes tratamientos: Lectura del fichero de entrada. Los datos adicionales a cu
-- mplimentar además de los generales son los siguientes:
CREATE TABLE Tabla299 (
    PORPATEM1            DECIMAL(7, 4)   -- PORCENTAJE PAGO TEMPORAL SEGUNDA MONEDA
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla300 (
    INDDOMCARCRE         VARCHAR(1)      -- INDICADOR DE DOMICILIACIÓN DEL CARGO DE CRÉDITO (S/N),
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO,
    CLAMONCAR            INT             -- CLAVE DE MONEDA,
    IBAN1                VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO SEGUNDA MONEDA,
    CTACARGO1            VARCHAR(30)     -- CUENTA DE CARGO SEGUNDA MONEDA,
    CLAMONCAR1           INT             -- CLAVE DE MONEDA SEGUNDA MONEDA
);

-- Si se marca algún campo de los relacionados con este servicio como informado, se
--  rechazará el registro. La modificación del indicador de domiciliación del cargo
--  de crédito sólo tiene significado para las cuentas de tarjetas de crédito o mix
-- tas. Los valores permitidos están descritos en la estructura.
CREATE TABLE Tabla301 (
    CONPROD              VARCHAR(3)      -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    CODCAM               VARCHAR(6)      -- CÓDIGO DE CAMPAÑA,
    OFIGESTORA           VARCHAR(4)      -- CÓDIGO OFICINA GESTORA,
    GRUPOLIQ             INT             -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO             INT             -- GRUPO DE PROCESO DE CUOTA,
    TIPOBON              VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    INDPERCUO            VARCHAR(1)      -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT            INT             -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    CODREGIMEN           INT             -- CÓDIGO DE RÉGIMEN FISCAL,
    RESEMIEXT            VARCHAR(12)     -- RESTRICCIÓN DE MESES EMISIÓN DE EXTRACTO,
    CODPROMO             VARCHAR(3)      -- CÓDIGO DE PROMOCIÓN,
    CODFORMATO           VARCHAR(10)     -- CÓDIGO DE FORMATO,
    TRASALACR            VARCHAR(1)      -- TRATAMIENTO DE SALDO ACREEDOR,
    INDCASTAUT           VARCHAR(1)      -- INDICADOR DE CASTIGO AUTOMÁTICO. POSIBLES VALORES: E-Exento N-No aplica
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla302 (
    PRODUCTO             VARCHAR(2)      -- PRODUCTO A ASIGNAR AL CONTRATO,
    SUBPRODUCTO          VARCHAR(4)      -- SUBPRODUCTO A ASIGNAR AL CONTRATO,
    CONPRODP             VARCHAR(3)      -- CONDICION ECONOMICA DEL NUEVO PRODUCTO
);

-- Todos los campos son obligatorios. Cambio de límite asignado a un contrato por t
-- ipo de línea.
CREATE TABLE Tabla303 (
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    CLAMONLIN_1          INT             -- CLAVE DE MONEDA 1 DE LA LÍNEA,
    LIMLIN_1             DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    PORLIM_1             INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    INDPORLIM_1          VARCHAR(1)      -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 1. VALORES: I: IMPORTE P: PORCENTAJE,
    CLAMONLIN_2          INT             -- CLAVE DE MONEDA 2 DE LA LÍNEA,
    LIMLIN_2             DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 2
);

-- Todos los campos son obligatorios. Cambio de límite asignado a un contrato por t
-- ipo de línea.
CREATE TABLE Tabla304 (
    PORLIM_2             INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    INDPORLIM_2          VARCHAR(1)      -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 2. VALORES: I: IMPORTE P: PORCENTAJE
);

-- Todos los campos son obligatorios. Se debe validar que el nuevo límite esté entr
-- e los valores máximos y mínimos permitidos por producto/moneda/tipo de línea (TB
-- LINPRO).
CREATE TABLE Tabla305 (
    CODBLQLIN            INT             -- CÓDIGO DE BLOQUEO DE LA LÍNEA,
    TEXBLQLIN            VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    TIPOLINBLQ           VARCHAR(4)      -- TIPO DE LÍNEA A BLOQUEAR
);

-- En los apartados siguientes se describe la asociación entre qué conjuntos de cam
-- pos cumplimentados y qué procesos se desencadenan. Si se cumplimentan en un mism
-- o registro datos que cumplen por completo más de un servicio, se ejecutarán ambo
-- s servicios.
CREATE TABLE Tabla306 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA (ofuscado)
);

-- En los apartados siguientes se describe la asociación entre qué conjuntos de cam
-- pos cumplimentados y qué procesos se desencadenan. Si se cumplimentan en un mism
-- o registro datos que cumplen por completo más de un servicio, se ejecutarán ambo
-- s servicios.
CREATE TABLE Tabla307 (
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ            VARCHAR(1)      -- INDICADOR DE DESBLOQUEO DE LA CUENTA,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    INDMODLIMT           VARCHAR(2)      -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    INDSITCTA            VARCHAR(1)      -- SITUACIÓN DE CUENTA,
    PORCVARLIM_1         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.
);

-- ERROR: No se pudieron procesar las columnas de Tabla308
-- Headers encontrados: ['SIGNOPORCEN-1', 'SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1', 'Alfanumérico', '1', '']


-- ERROR: No se pudieron procesar las columnas de Tabla309
-- Headers encontrados: ['IMPFPATEM', 'IMPORTE FIJO PAGO TEMPORAL', 'Numérico con Signo', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla310
-- Headers encontrados: ['CODPROMO', 'CÓDIGO DE PROMOCIÓN', 'Alfanumérico', '3', '']


-- ERROR: No se pudieron procesar las columnas de Tabla311
-- Headers encontrados: ['TIPOLIN', 'TIPO DE LÍNEA', 'Alfanumérico', '4', '']


-- ERROR: No se pudieron procesar las columnas de Tabla312
-- Headers encontrados: ['PORPATEM1', 'PORCENTAJE PAGO TEMPORAL SEGUNDA MONEDA', 'Numérico', '7', '4']


-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla313 (
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ            VARCHAR(1)      -- INDICADOR DE DESBLOQUEO DE LA CUENTA,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla314 (
    INDSITCTA            VARCHAR(1)      -- SITUACIÓN DE CUENTA
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla315 (
    INDMODLIMT           VARCHAR(2)      -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.
);

-- ERROR: No se pudieron procesar las columnas de Tabla316
-- Headers encontrados: ['SIGNOPORCEN-1', 'SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1', 'Alfanumérico', '1', '']


-- ERROR: No se pudieron procesar las columnas de Tabla317
-- Headers encontrados: ['IMPVARLIMCUE-C-1', 'IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1', 'Numérico con Signo', '17', '2']


-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla318 (
    INDMODLIMT           VARCHAR(2)      -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1,
    IMPVARLIMCUE_1       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1,
    SIGNOVARLIMCUE_1     VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1,
    CLAMON_1             INT             -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN,
    PORCVARLIM_2         INT             -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2        VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2       DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    SIGNOVARLIMCUE_2     VARCHAR(1)      -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    CLAMON_2             INT             -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN
);

-- El proceso de cambio de forma de pago permite modificar los campos asociados a l
-- a forma de pago y forma de pago temporal. Este proceso es Batch y tendrá los sig
-- uientes tratamientos: Lectura del fichero de entrada. Los datos adicionales a cu
-- mplimentar además de los generales son los siguientes:
CREATE TABLE Tabla319 (
    FORPAGO              INT             -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    IMPFPAGOA            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    FORPAGOTEM           INT             -- FORMA DE PAGO TEMPORAL (SOLO PARA EL CRÉDITO),
    FIFORPAGT            UNKNOWN         -- FECHA INICIO FORMA PAGO TEMPORAL
);

-- ERROR: No se pudieron procesar las columnas de Tabla320
-- Headers encontrados: ['FFFORPAGT', 'FECHA FIN FORMA PAGO TEMPORAL', 'Fecha', '10', '']


-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla321 (
    INDDOMCARCRE         VARCHAR(1)      -- INDICADOR DE DOMICILIACIÓN DEL CARGO DE CRÉDITO (S/N),
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO,
    CLAMONCAR            INT             -- CLAVE DE MONEDA,
    IBAN1                VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO SEGUNDA MONEDA,
    CTACARGO1            VARCHAR(30)     -- CUENTA DE CARGO SEGUNDA MONEDA,
    CLAMONCAR1           INT             -- CLAVE DE MONEDA SEGUNDA MONEDA
);

-- Si se marca algún campo de los relacionados con este servicio como informado, se
--  rechazará el registro. La modificación del indicador de domiciliación del cargo
--  de crédito sólo tiene significado para las cuentas de tarjetas de crédito o mix
-- tas. Los valores permitidos están descritos en la estructura.
CREATE TABLE Tabla322 (
    CONPROD              VARCHAR(3)      -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    CODCAM               VARCHAR(6)      -- CÓDIGO DE CAMPAÑA,
    FILLER               VARCHAR(4)      -- ESPACIO DISPONIBLE DEL REGISTRO,
    GRUPOLIQ             INT             -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO             INT             -- GRUPO DE PROCESO DE CUOTA,
    TIPOBON              VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    INDPERCUO            VARCHAR(1)      -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT            INT             -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO)
);

-- ERROR: No se pudieron procesar las columnas de Tabla323
-- Headers encontrados: ['CODREGIMEN', 'CÓDIGO DE RÉGIMEN FISCAL', 'Numérico', '4', '0']


-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla324 (
    PRODUCTO             VARCHAR(2)      -- PRODUCTO A ASIGNAR AL CONTRATO,
    SUBPRODUCTO          VARCHAR(4)      -- SUBPRODUCTO A ASIGNAR AL CONTRATO,
    CONPRODP             VARCHAR(3)      -- CONDICION ECONOMICA DEL NUEVO PRODUCTO
);

-- Todos los campos son obligatorios. Cambio de límite asignado a un contrato por t
-- ipo de línea.
CREATE TABLE Tabla325 (
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    CLAMONLIN_1          INT             -- CLAVE DE MONEDA 1 DE LA LÍNEA,
    LIMLIN_1             DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    PORLIM_1             INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    INDPORLIM_1          VARCHAR(1)      -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 1. VALORES: I: IMPORTE P: PORCENTAJE,
    CLAMONLIN_2          INT             -- CLAVE DE MONEDA 2 DE LA LÍNEA,
    LIMLIN_2             DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    PORLIM_2             INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    INDPORLIM_2          VARCHAR(1)      -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 2. VALORES: I: IMPORTE P: PORCENTAJE
);

-- Todos los campos son obligatorios. Se debe validar que el nuevo límite esté entr
-- e los valores máximos y mínimos permitidos por producto/moneda/tipo de línea (TB
-- LINPRO).
CREATE TABLE Tabla326 (
    CODBLQLIN            INT             -- CÓDIGO DE BLOQUEO DE LA LÍNEA,
    TEXBLQLIN            VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    TIPOLINBLQ           VARCHAR(4)      -- TIPO DE LÍNEA A BLOQUEAR
);

-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Se consideran informados los campos si
--  están cumplimentados como se describe en Consideraciones Generales de Interface
-- s Batch. Si el campo es obligatorio, lo será cuando se marca como informado.
CREATE TABLE Tabla327 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA
);

-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Se consideran informados los campos si
--  están cumplimentados como se describe en Consideraciones Generales de Interface
-- s Batch. Si el campo es obligatorio, lo será cuando se marca como informado.
CREATE TABLE Tabla328 (
    INDNOREN             VARCHAR(1)      -- INDICADOR DE NO RENOVACIÓN,
    MOTBAJA              VARCHAR(2)      -- MOTIVOS DE BAJA,
    INDRECOG             VARCHAR(1)      -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N),
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO,
    INDACUSE             VARCHAR(1)      -- INDICADOR DE ACUSE DE RECIBO,
    FCORETTAR            UNKNOWN         -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO
);

-- Un servicio será activado si se han cumplimentado todos aquellos campos que cons
-- idere obligatorios. Si el servicio es incompatible con otros servicios se devolv
-- erá mensaje de error. Se detecta debido al chequeo de campos informados para otr
-- o servicio.
CREATE TABLE Tabla329 (
    HCORETTAR            UNKNOWN         -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    PORCVARLIM           DECIMAL(7, 4)   -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR LIMITES DE TARJETA,
    SIGNOPORCEN          VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE,
    CLAMON               INT             -- CLAVE DE MONEDA A LA QUE SE APLICA LA VARIACIÓN LÍMITE,
    CONDEST              VARCHAR(3)      -- CONDICION DE ESTAMPACION,
    FILLER               VARCHAR(2)     
);

-- Validaciones sobre los datos Obligatorios. Se validan los campos de entrada. el 
-- pan de la tarjeta debe venir siempre informado.
CREATE TABLE Tabla330 (
    INDNOREN             VARCHAR(1)      -- INDICADOR DE NO RENOVACIÓN 0 – SI RENOVAR 1 – NO RENOVAR
);

-- de esta Interfaz, si se marca algún otro campo como informado, se rechazará el r
-- egistro. Lectura del fichero de entrada. Los datos adicionales a cumplimentar ad
-- emás de los generales son los siguientes:
CREATE TABLE Tabla331 (
    MOTBAJA              VARCHAR(2)      -- MOTIVOS DE BAJA,
    INDRECOG             VARCHAR(1)      -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N)
);

-- La entrada de datos partirá de un fichero con un formato específico definido a c
-- ontinuación, cuyo procesamiento se realizará en un entorno Batch. Lectura del fi
-- chero de entrada. Los datos adicionales a cumplimentar además de los generales s
-- on los siguientes:
CREATE TABLE Tabla332 (
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla333 (
    INDACUSE             VARCHAR(1)      -- INDICADOR DE ACUSE DE RECIBO,
    CONDEST              VARCHAR(3)      -- CONDICION DE ESTAMPACION
);

-- Se valida que exista en la tabla de condiciones de estampación y también en cond
-- iciones de estampación por tipo de tarjeta. Lectura del fichero de entrada. Los 
-- datos adicionales a cumplimentar además de los generales son los siguientes:
CREATE TABLE Tabla334 (
    FCORETTAR            UNKNOWN         -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR            UNKNOWN         -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla335 (
    PORCVARLIM           DECIMAL(7, 4)   -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES.,
    SIGNOPORCEN          VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla336 (
    CLAMON               INT             -- CLAVE DE MONEDA DEL IMP. VARIACIÓN,
    IMPVARLIMCUE         DECIMAL(15, 2)  -- IMPORTE A INCREMENTAR O DECREMENTAR EN FUNCION DEL SIGNO DE LOS LIMITES,
    SIGNOVARLIMCUE       VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL IMPORTE LIMITE,
    FILLER               VARCHAR(2)     
);

-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Se consideran informados los campos si
--  están cumplimentados como se describe en Consideraciones Generales de Interface
-- s Batch. Si el campo es obligatorio, lo será cuando se marca como informado.
CREATE TABLE Tabla337 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA (Ofuscado)
);

-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Se consideran informados los campos si
--  están cumplimentados como se describe en Consideraciones Generales de Interface
-- s Batch. Si el campo es obligatorio, lo será cuando se marca como informado.
CREATE TABLE Tabla338 (
    INDNOREN             VARCHAR(1)      -- INDICADOR DE NO RENOVACIÓN,
    MOTBAJA              VARCHAR(2)      -- MOTIVOS DE BAJA,
    INDRECOG             VARCHAR(1)      -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N),
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO
);

-- ERROR: No se pudieron procesar las columnas de Tabla339
-- Headers encontrados: ['INDACUSE', 'INDICADOR DE ACUSE DE RECIBO', 'Alfanumérico', '1', '']


-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla340 (
    INDNOREN             VARCHAR(1)      -- INDICADOR DE NO RENOVACIÓN 0 – SI RENOVAR 1 – NO RENOVAR
);

-- de esta Interfaz, si se marca algún otro campo como informado, se rechazará el r
-- egistro. Lectura del fichero de entrada. Los datos adicionales a cumplimentar ad
-- emás de los generales son los siguientes:
CREATE TABLE Tabla341 (
    MOTBAJA              VARCHAR(2)      -- MOTIVOS DE BAJA,
    INDRECOG             VARCHAR(1)      -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N)
);

-- La entrada de datos partirá de un fichero con un formato específico definido a c
-- ontinuación, cuyo procesamiento se realizará en un entorno Batch. Lectura del fi
-- chero de entrada. Los datos adicionales a cumplimentar además de los generales s
-- on los siguientes:
CREATE TABLE Tabla342 (
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO,
    TEXBLQ               VARCHAR(30)     -- COMENTARIO DE BLOQUEO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla343 (
    INDACUSE             VARCHAR(1)      -- INDICADOR DE ACUSE DE RECIBO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla344 (
    FCORETTAR            UNKNOWN         -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR            UNKNOWN         -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO
);

-- Lectura del fichero de entrada. Los datos adicionales a cumplimentar además de l
-- os generales son los siguientes:
CREATE TABLE Tabla345 (
    PORCVARLIM           DECIMAL(7, 4)   -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES.,
    SIGNOPORCEN          VARCHAR(1)      -- SIGNO DE APLICACIÓN DEL PORCENTAJE
);

-- ERROR: No se pudieron procesar las columnas de Tabla346
-- Headers encontrados: ['CLAMON', 'CLAVE DE MONEDA DEL IMP. VARIACIÓN', 'Numérico', '3', '0']


-- conjunto de registros que forman el alta de tarjeta con sus límites..... Si algú
-- n registro del bloque no pasa las validaciones, se escribe la cabecera del bloqu
-- e marcándola como incorrecta.
CREATE TABLE Tabla347 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- OFICINA DE ALTA DE CUENTA,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘C1’– CUENTA DE MEDIOS DE PAGO ‘C2’– LÍMITES DE CUENTA POR MONEDA ‘C3’– CUENTAS DE CARGO (OPCIONAL) ‘T1’ – TARJETA (BANDA O MONEDERO) ‘T2’ – LÍMITES DE TARJETA POR MONEDA ‘T4’ – CUENTA CARGO DE TARJETA DE DÉBITO (OPCIONAL) ‘T5’ – SALDOS DE TARJETAS PREPAGO REGALO POR MONEDA,
    RESTO__DATOS         VARCHAR(858)    -- DATOS VARIABLES
);

-- La Interfaz consta de dos grupos de campos: Parte fija y común para todos los ti
-- pos de registros y parte variable según el tipo de registro a continuación se de
-- scriben los comunes. Tipo de registro. Contendrá un valor válido dentro del rang
-- o de valores indicado.
CREATE TABLE Tabla348 (
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    NUMPER               VARCHAR(8)      -- NÚMERO DE PERSONA,
    CODCAM               VARCHAR(6)      -- INDICADOR DE CAMPAÑAS ASOCIADAS,
    CODPROMO             VARCHAR(3)      -- CÓDIGO DE PROMOCIÓN,
    CODCONVEN            VARCHAR(4)      -- CÓDIGO DE CONVENIO,
    FORPAGO              INT             -- FORMA DE PAGO (TOTAL, FIJO, MÍNIMO),
    TIPOBON              VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    INDCTAEMP            INT             -- INDICADOR DE CUENTA DE EMPRESA,
    INDNOMEMP            INT             -- INDICADOR DE ESTAMPACIÓN DE NOMBRE DE EMPRESA EN PLÁSTICO, SOLO SI EL CLIENTE TITULAR DEL CONTRATO ES EMPRESA O ESTRUCTURA BUSINESS,
    NOMBREEMP            VARCHAR(30)     -- NOMBRE DE EMPRESA PARA ESTAMPACIÓN,
    GRUPOLIQ             INT             -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO             INT             -- GRUPO DE PROCESO DE CUOTA,
    RESEMIEXT            VARCHAR(12)     -- RESTRICCIÓN DE MESES DE EMISIÓN DE EXTRACTO (EN LA GENERACIÓN INICIAL DEBE CONTENER UNICAMENTE EL VALOR ‘N’, POR LO QUE SE CARGARA POR DEFECTO A ‘N’)
);

-- La Interfaz consta de dos grupos de campos: Parte fija y común para todos los ti
-- pos de registros y parte variable según el tipo de registro a continuación se de
-- scriben los comunes. Tipo de registro. Contendrá un valor válido dentro del rang
-- o de valores indicado.
CREATE TABLE Tabla349 (
    INDSITCTA            INT             -- INDICADOR DE SITUACIÓN DE CUENTA 0 - ACTIVA 1 – EN ESPERA RESOLUCIÓN O PRECONTRATO (NO EMITIDA LA TARJETA) 3 – EN ESPERA DE CONFIRMAR POR CLIENTE. TARJETA EMITIDA 4 - CONTRATO SIN TARJETA (SOLO CONTRATOS DE EMPRESA O ESTRUCTURA BUSINESS),
    INDPERCUO            VARCHAR(1)      -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT            INT             -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    CODREGIMEN           INT             -- CÓDIGO DE RÉGIMEN FISCAL,
    NUMFACSC             INT             -- CONTADOR DE FACTURACIONES CONSECUTIVAS SIN EMITIR CARGO,
    INDDOMCARCRE         VARCHAR(1)      -- INDICADOR DE DOMICILIACIÓN DEL CARGO EN CRÉDITO,
    CODFORMATO           VARCHAR(10)     -- CÓDIGO DE FORMATO IMPRESIÓN DE EXTRACTO,
    CODBUS               INT             -- Código de Estructura Business,
    CODELEMENTO          INT             -- Código de Elemento dentro de la Estructura Business,
    TIPROLCUENTA         VARCHAR(1)      -- Tipo de rol de la cuenta en la estructura business: U = Cuenta de control de cuotas o actividad (única) E = Cuenta de empleado
);

-- Tipo de registro. Contendrá un valor válido dentro del rango de valores indicado
-- . Parte variable del registro correspondiente a datos de cabecera de cuenta C1 (
-- ATMPAMC1):
CREATE TABLE Tabla350 (
    NUMSEC               INT             -- NUMERO DE SECUENCIA
);

-- Código de Estructura Business, opcional cuando INDCTAEMP = 2 (Estructura Buisnes
-- s), en caso contrario no debe aceptar valores pues la funcionalidad no aplica. C
-- ódigo de Elemento dentro de la Estructura Business, opcional cuando INDCTAEMP = 
-- 2 (Estructura Buisness), en caso contrario no debe aceptar valores pues la funci
-- onalidad no aplica.
CREATE TABLE Tabla351 (
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDMONPRIN           VARCHAR(1)      -- INDICADOR DE MONEDA PRINCIPAL DEL CONTRATO (S / N),
    LIMCRECTA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    IMPFPAGOA            DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    LIMCRECTAC           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE COMPRA EN CUOTAS,
    LIMCRECTAG           DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO GLOBAL
);

-- Código de Estructura Business, opcional cuando INDCTAEMP = 2 (Estructura Buisnes
-- s), en caso contrario no debe aceptar valores pues la funcionalidad no aplica. C
-- ódigo de Elemento dentro de la Estructura Business, opcional cuando INDCTAEMP = 
-- 2 (Estructura Buisness), en caso contrario no debe aceptar valores pues la funci
-- onalidad no aplica.
CREATE TABLE Tabla352 (
    LIMCRECTACG          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO GLOBAL DE COMPRA EN CUOTAS,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE PAGO APLAZADO
);

-- El indicador de moneda principal debe aparecer a “S” en uno y solo un registro d
-- e tipo C2 para un mismo contrato de medios de pago. Parte variable de registro d
-- e cuentas de cargo C3 (ATMPAMC3):
CREATE TABLE Tabla353 (
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    INDAJENA             VARCHAR(1)      -- INDICADOR DE CUENTA DE DOMICILIACIÓN AJENA (S/N),
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDTIPCTA            VARCHAR(2)      -- INDICADOR DE TIPO DE CUENTA DE CARGO
);

-- Indicador de tipo de cuenta de cargo. Si el producto tiene el indicador de cuent
-- a de domiciliación obligatoria para crédito, debe tener una o más cuentas de car
-- go definidas (bien en el registro de cabecera, bien en los registros C3).
CREATE TABLE Tabla354 (
    SEQPLASTICO          INT             -- SECUENCIAL DE IDENTIFICACIÓN DEL PLÁSTICO,
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    CALPART              VARCHAR(2)      -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DEL CLIENTE
);

-- Indicador de tipo de cuenta de cargo. Si el producto tiene el indicador de cuent
-- a de domiciliación obligatoria para crédito, debe tener una o más cuentas de car
-- go definidas (bien en el registro de cabecera, bien en los registros C3).
CREATE TABLE Tabla355 (
    TIPOBON              VARCHAR(6)      -- TIPO DE BONIFICACIÓN,
    INDACTLIM            VARCHAR(1)      -- INDICADOR DE ACTUALIZACIÓN DE LÍMITES DE TARJETA Y USO CON MOVIMIENTOS DE ABONO 0 - LAS RESTRICCIONES NO SE VEN AFECTADAS POR PAGOS NI POR SALDO INGRESO EN CUENTA O SALDO ACREEDOR. 1 - LOS PAGOS AFECTAN A LAS RESTRICCIONES. 2 - EL SALDO ACREEDOR AFECTA A LAS RESTRICCIONES. 3 - LOS PAGOS Y EL SALDO ACREEDOR AFECTAN A LAS RESTRICCIONES.,
    INDCAMLIM            VARCHAR(1)      -- INDICADOR DE SI AFECTA EL CAMBIO DE LÍMITES MASIVO,
    VISAPHONE            INT             -- CÓDIGO VISAPHONE,
    IDEMPLEADO           VARCHAR(20)     -- IDENTIFICADOR DE EMPLEADO,
    NOMBENRED            VARCHAR(35)     -- NOMBRE DE ESTAMPACIÓN, FORMATO:NOMBRE*APELLIDO,
    CODPROMO             VARCHAR(3)      -- CÓDIGO DE PROMOCIÓN DE LA TARJETA,
    INDFOTO              VARCHAR(1)      -- INDICADOR DE FOTO EN PLÁSTICO (S/N),
    REFFOTO              VARCHAR(30)     -- REFERENCIA DE LA FOTO, SOLO SI EL CAMPO ANTERIOR ESTÁ ACTIVO,
    CODBARR              NUMERIC(14)     -- CÓDIGO DE BARRAS ENVIADO DESDE ENTIDAD PROMOTORA,
    ESTPLAS1             VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD,
    ESTPLAS2             VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD,
    CONDEST              VARCHAR(3)      -- CÓDIGO DE ESTAMPACIÓN,
    INDENVEST            VARCHAR(1)      -- INDICADOR DE ENVÍO DE LA TARJETA A CENTRO (S/N)
);

-- Indicador de tipo de cuenta de cargo. Si el producto tiene el indicador de cuent
-- a de domiciliación obligatoria para crédito, debe tener una o más cuentas de car
-- go definidas (bien en el registro de cabecera, bien en los registros C3).
CREATE TABLE Tabla356 (
    INDENVPIN            VARCHAR(1)      -- INDICADOR DE ENVÍO DE LA CARTA DE PIN A CENTRO (S/N),
    CENTPIN              VARCHAR(4)      -- CENTRO DE ENVÍO SI LOS INDICADORES INDENVEST O INDENVPIN ESTÁN ACTIVOS,
    INDNIVSEG            VARCHAR(1)      -- INDICADOR DE NIVEL DE SEGURIDAD USUARIO,
    INDEXECUO            VARCHAR(1)      -- INDICADOR DE EXENCIÓN DE COMPRA EN CUOTAS,
    INDTAREMV            INT             -- INDICADOR DE TARJETA EMV: 0: TARJETA NO EMV 1: TARJETA EMV CON ESTAMPACIÓN INTERNA 2: TARJETA EMV CON ESTAMPACIÓN EXTERNA,
    CODPERFIL            VARCHAR(11)     -- PERFIL A ASOCIAR A LA TARJETA EMV,
    PANTAREXT            VARCHAR(22)     -- PAN DE LA TARJETA.,
    FECCADTAREXT         VARCHAR(6)      -- FECHA DE CADUCIDAD DE LA TARJETA. Formato AAAAMM.,
    INDESTTAREXT         VARCHAR(1)      -- INDICADOR DE ESTAMPACIÓN DE LA TARJETA (S/N).,
    NUMSEC               INT             -- NUMERO DE SECUENCIA,
    FILLER               VARCHAR(8)     
);

-- Número secuencial. Es el número del registro de la dirección postal del cliente.
--  Parte variable del registro correspondiente a límites por moneda y tarjeta ‘T2’
--  (ATMPAMT2):
CREATE TABLE Tabla357 (
    CLAMON               INT             -- CLAVE DE MONEDA,
    LIMCRETAR            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE TARJETA LÍMITE GLOBAL DE LA TARJETA,
    PORLIM               INT             -- PORCENTAJE DE LÍMITE Del DISPONIBLE DE CRÉDITO DEL CONTRATO,
    INDPORLIM            VARCHAR(1)      -- INDICADOR DE LIÍMITE DE CRÉDITO POR PORCENTAJE O IMPORTE. VALORES: I: IMPORTE P: PORCENTAJE,
    LIMCREMES            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO MENSUAL,
    LIMDEBMES            DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DE LA TARJETA EN EL MES NATURAL,
    LIMCREDIA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DIARIO,
    LIMDEBDIA            DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DIARIO,
    LIMDIACAJ            DECIMAL(17, 2)  -- LÍMITE DIARIO EN CAJERO,
    MAXOPER              INT             -- MÁXIMO NÚMERO DE OPERACIONES POR PERIODO,
    MAXODIA              INT             -- MÁXIMO NÚMERO DE OPERACIONES DIARIA,
    MAXDIACAJ            INT             -- MÁXIMO NÚMERO DE OPERACIONES EN CAJERO
);

-- Parte variable de registro de cuentas de cargo de tarjetas de débito T4 (ATMPAMT
-- 4):
CREATE TABLE Tabla358 (
    IBAN                 VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO             VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN,
    INDAJENA             VARCHAR(1)      -- INDICADOR DE CUENTA DE DOMICILIACIÓN AJENA (S/N),
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDTIPCTA            VARCHAR(2)      -- INDICADOR DE TIPO DE CUENTA DE CARGO
);

-- Parte variable de registro de cuentas de cargo de tarjetas de débito T4 (ATMPAMT
-- 4): El indicador de tipo de cuenta de cargo, opcional.
CREATE TABLE Tabla359 (
    CLAMON               INT             -- CLAVE DE MONEDA PRINCIPAL,
    SALDISPRE            DECIMAL(17, 2)  -- SALDO INICIAL A ASOCIAR A LA MONEDA PRINCIPAL,
    CLAMONSEC            INT             -- CLAVE DE MONEDA SECUNDARIA
);

-- El indicador de tipo de cuenta de cargo, opcional. Si se está tratando con una t
-- arjeta prepago regalo, este registro no se debe recibir.
CREATE TABLE Tabla360 (
    SALDISPRESEC         DECIMAL(17, 2)  -- SALDO INICIAL A ASOCIAR A LA MONEDA SECUNDARIA
);

-- Datos Carnet universitario. Como todas las interfaces de entrada de datos lo pri
-- mero que se realiza son validaciones sobre los datos de cabecera de la cinta. Ir
--  a ver validaciones
CREATE TABLE Tabla361 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- INDICADOR DE TIPO,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CUENTA,
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO,
    NUMPLASTICO          NUMERIC(12)     -- NÚMERO DE PLÁSTICO,
    FECCADTAR            INT             -- FECHA DE CADUCIDAD,
    PAN                  VARCHAR(22)     -- PAN,
    INDNOREN             INT             -- INDICADOR DE NO RENOVACIÓN 0 – SI RENOVAR 1 – NO RENOVAR,
    CODBLQ               INT             -- CÓDIGO DE BLOQUEO
);

-- Datos Carnet universitario. Como todas las interfaces de entrada de datos lo pri
-- mero que se realiza son validaciones sobre los datos de cabecera de la cinta. Ir
--  a ver validaciones
CREATE TABLE Tabla362 (
    CENTRO               VARCHAR(4)      -- CÓDIGO DE OFICINA (PARA ESTAM Y CARP) (Opcional),
    PANNUE               VARCHAR(22)     -- NUMERO DE PAN ASIGNADO PARA REEMISION (Opcional),
    FECCADTARNUE         INT             -- FECHA DE CADUCIDAD DE LA NUEVA TJT (Opcional),
    INDESTAMPA           VARCHAR(1)      -- INDICADOR ESTAMPACION S – Se estampa en proceso Batch N – No se estampa, tarjeta estampada externamente
);

-- Referencias de Tipo de Línea por Contrato Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla363 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CUENTA,
    CODCAMCOM            VARCHAR(4)      -- CÓDIGO DE CAMPAÑA COMERCIAL,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    FECINI               UNKNOWN         -- FECHA DE INICIO,
    FECFIN               UNKNOWN         -- FECHA DE FIN (SE EMPLEARÁ EXCLUSIVAMENTE SI LLEGA INFORMADO EL TIPO DE LÍNEA),
    CLAMON               INT             -- CÓDIGO DE MONEDA,
    L_MITE               DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA,
    PORLIM               INT             -- PORCENTAJE DE LÍMITE DE LA LÍNEA,
    INDPORLIM            VARCHAR(1)      -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE. VALORES: I: IMPORTE P: PORCENTAJE
);

-- ATC837: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla364 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE LA ENTIDAD DE LA FACTURA,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    FEC_OPER             UNKNOWN         -- FECHA DE LA OPERACIÓN,
    IMP_OPER             DECIMAL(17, 2)  -- IMPORTE DE LA OPERACIÓN,
    CLAMON               INT             -- CLAVE DE MONEDA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE DE COMERCIO REDUCIDO,
    INDDEBCRE            INT             -- INDICADOR DÉBITO CRÉDITO 1 – CRÉDITO 2 – DÉBITO 5 – PREPAGO REGALO 6 – PREPAGO,
    INDNORCOR            VARCHAR(1)      -- INDICADOR DE OPERACIÓN 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    SESIONRED            VARCHAR(12)     -- SESIÓN DE LA RED,
    PAIS                 INT             -- CÓDIGO DE PAÍS,
    INDCOMPCUO           VARCHAR(1)      -- INDICADOR DE COMPRA EN CUOTAS,
    NUMCUOTA             INT             -- NÚMERO DE CUOTAS
);

-- ATC837: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla365 (
    MESCARCUO            INT             -- MESES DE CARENCIA,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    PORINT               DECIMAL(7, 4)   -- TASA DE INTERÉS APLICADA,
    ID_TERMINAL          VARCHAR(16)     -- CÓDIGO DE TERMINAL,
    LINREF               INT             -- REFERENCIA DE TIPO DE LÍNEA,
    NUMAUT               VARCHAR(6)      -- NUMERO DE AUTORIZACION,
    PROPINA              DECIMAL(17, 2)  -- PROPINA DE LA OPERACIÓN,
    IMPUESTO             DECIMAL(17, 2)  -- IMPUESTO DE LA OPERACION,
    CODOFI               VARCHAR(4)      -- CODIGO DE OFICINA,
    IMPCALIMP            DECIMAL(17, 2)  -- IMPORTE BASE DE CALCULO DEL IMPUESTO EXTERNO,
    INDPAGO              INT             -- INDICADOR DE PAGO,
    NUMCOMPRO            VARCHAR(23)     -- NUMERO DE COMPROBANTE,
    IMPUESTO__EXT        DECIMAL(17, 2)  -- IMPUESTO EXTERNO,
    FILLER               VARCHAR(11)    
);

-- Detalle de la Interfaz. Estructura común inicial para todos los tipos de registr
-- o (ATRECSEG).
CREATE TABLE Tabla366 (
    ENTIDAD              VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    OFICINA              VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CONTRATO             VARCHAR(12)     -- Nº DE CONTRATO (PARA TODOS LOS IMPAGADOS DEL CONTRATO),
    RECIBO               NUMERIC(15)     -- NÚMERO DEL RECIBO SOBRE EL QUE HACER LA NUEVA PRESENTACIÓN,
    TIPRODUC             VARCHAR(2)      -- TIPO DE CONTRATO (TC – TARJETA),
    FECHPROC             UNKNOWN         -- FECHA DE PROCESO,
    FECCOBRO             UNKNOWN         -- FECHA DE COBRO DE LA NUEVA PRESENTACIÓN,
    XGASTOS              VARCHAR(1)      -- INDICADOR DE CÁLCULO DE COMISIONES A LA 2ª CÁMARA: S – INCLUIR COMISIONES N – NO INCLUIR COMISIONES,
    XINTERES             VARCHAR(1)      -- INDICADOR DE CÁLCULO DE INTERESES A LA 2ª CÁMARA: S – INCLUIR INTERESES N – NO INCLUIR INTERESES
);

-- ATCO60: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla367 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    CLAMON               INT             -- CODIGO DE MONEDA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA,
    TIPREF               VARCHAR(2)      -- TIPO DE REFERENCIA DEL PAGO EX – Se especifica número de extracto IM – Se especifica número de impago DO – Se especifica tipo y referencia de documento de pago,
    NUMEXTPG             NUMERIC(15)     -- NÚMERO DE EXTRACTO DEL PAGO - Se corresponderá con el número de extracto si TIPREF = EX o el número de secuencia del impago si TIPREF = IM. Valdrá ceros si TIPREF = DO.,
    NUMMOVPG             INT             -- NÚMERO DE MOVIMIENTO DEL EXTRACTO SI TIPREF = EX. CEROS EN EL RESTO.,
    TIPDOCPAG            INT             -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO SI TIPREF = DO 1-Cheque 2-Giro 3-Metálico 4-Internet
);

-- ATCO60: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla368 (
    REFDOCPAG            VARCHAR(20)     -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO SI TIPREF = DO.
);

-- ATCO60: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla369 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- DEL,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    CLAMON               INT             -- CODIGO DE MONEDA,
    PAN                  VARCHAR(22)     -- --,
    TIPREF               VARCHAR(2)      -- Tipo de referencia del pago EX – Se especifica número de extracto IM – Se especifica número de impago DO – Se especifica tipo y referencia de documento de pago,
    NUMEXTPG             NUMERIC(15)     -- Número de extracto del pago - Se corresponderá con el número de extracto si TIPREF = EX o el número de secuencia del impago si TIPREF = IM. Valdrá ceros si TIPREF = DO.,
    NUMMOVPG             INT             -- Número de movimiento del extracto si TIPREF = EX. Ceros en el resto.,
    TIPDOCPAG            INT             -- Tipo de documento para movimientos de pago si TIPREF = DO 1-Cheque 2-Giro
);

-- ERROR: No se pudieron procesar las columnas de Tabla370
-- Headers encontrados: ['', '3-Metálico 4-Internet 5-Otros medios', '', '', '']


-- ATB486: Validación de datos particulares. El proceso de recepción de los datos d
-- e contratos a pasar a cartera vencida, es una Interfaz de recepción donde se apl
-- ican las características generales de gestión de rechazos.
CREATE TABLE Tabla371 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA Se corresponderá con el número de contrato si TIPORECLAS = CO. Valdrá espacios si TIPORECLAS = CL.,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    TIPORECLAS           VARCHAR(2)      -- TIPO DE RECLASIFICACIÓN. VALORES: CO – Contrato. CL – Cliente.
);

-- Se consideran cumplimentados como se describe en Consideraciones Generales de In
-- terfaces Batch. Un servicio será activado si los campos que se consideran como o
-- bligatorios han sido cumplimentados. Como todas las interfaces de entrada de dat
-- os lo primero que se realiza son validaciones sobre los datos de cabecera de la 
-- cinta. Ir a ver validaciones
CREATE TABLE Tabla372 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA
);

-- Se consideran cumplimentados como se describe en Consideraciones Generales de In
-- terfaces Batch. Un servicio será activado si los campos que se consideran como o
-- bligatorios han sido cumplimentados. Como todas las interfaces de entrada de dat
-- os lo primero que se realiza son validaciones sobre los datos de cabecera de la 
-- cinta. Ir a ver validaciones
CREATE TABLE Tabla373 (
    DATOS_PARA_CAMBIO_PRODUCTO UNKNOWN         -- DATOS PARA CAMBIO PRODUCTO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON_SEC           INT             -- CLAVE DE MONEDA SECUNDARIA,
    INDMODLIM_REV        VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTA_1          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL
);

-- Se consideran cumplimentados como se describe en Consideraciones Generales de In
-- terfaces Batch. Un servicio será activado si los campos que se consideran como o
-- bligatorios han sido cumplimentados. Como todas las interfaces de entrada de dat
-- os lo primero que se realiza son validaciones sobre los datos de cabecera de la 
-- cinta. Ir a ver validaciones
CREATE TABLE Tabla374 (
    LIMCRECTA_2          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    INDMODLIM_CC         VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM C.CUOTAS CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTAC_1         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTAC_2         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    FORPAGO              INT             -- FORMA DE PAGO,
    CODFORMATO           VARCHAR(10)     -- CODIGO DE FORMATO DE IMPRESION DE EXTRACTO,
    PORPAGOA_1           INT             -- PORCENTAJE PAGO APLAZADO MONEDA PRINCIPAL,
    PORPAGOA_2           INT             -- PORCENTAJE PAGO APLAZADO MONEDA SECUNDARIA,
    IMPFPAGOA_1          DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA PRINCIPAL,
    IMPFPAGOA_2          DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA SECUNDARIA,
    INDMODCTACAR         VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN DE LAS CUENTAS DE CARGO CON LOS VALORES DE LA INTERFAZ.,
    IBAN_1               VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO MONEDA PRINCIPAL,
    CTACARGO_1           VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA PRINCIPAL,
    IBAN_2               VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA,
    CTACARGO_2           VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA SECUNDARIA,
    DATOS_PARA_CAMBIO_MARCA_TIPO_TARJETA_DEL_TITULAR UNKNOWN         -- DATOS PARA CAMBIO MARCA/TIPO TARJETA DEL TITULAR
);

-- Como todas las interfaces de entrada de datos lo primero que se realiza son vali
-- daciones sobre los datos de cabecera de la cinta. Ir a ver validaciones La Inter
-- faz consta de dos grupos de campos: generales y opcionales, a continuación, se d
-- escriben los
CREATE TABLE Tabla375 (
    CODMAR_TIT           INT             -- CÓDIGO DE MARCA DE LA TARJETA DEL TITULAR,
    INDTIPT_TIT          INT             -- TIPO DE TARJETA DEL TITULAR,
    CENTENVEST__TIT      VARCHAR(4)      -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL TITULAR,
    TABLA_MAR_TIP        UNKNOWN         -- TABLA DE MARCAS/TIPO PARA MODIFICACIÓN DE TARJETAS DE BENEFICIARIOS ( Máx. 10 OCURRENCIAS).,
    CODMAR_BANT          INT             -- CÓDIGO DE MARCA DE LAS TARJETAS A CAMBIAR,
    INDTIPT_BANT         INT             -- TIPO DE LAS TARJETAS A CAMBIAR,
    CODMAR_BNUE          INT             -- NUEVA MARCA DE LAS TARJETAS,
    INDTIPT_BNUE         INT             -- NUEVO TIPO DE LAS TARJETAS,
    CENTENVEST__BEN      VARCHAR(4)      -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL BENEFICIARIO,
    OTROS_DATOS_PARA_CAMBIO_MARCA_TIPO_TARJETA_DEL_TITULAR UNKNOWN         -- OTROS DATOS PARA CAMBIO MARCA/TIPO TARJETA DEL TITULAR,
    CONDEST_TIT          INT             -- CÓDIGO DE ESTAMPACION DE LA TARJETA DEL TITULAR,
    TABLA_COND__EST      UNKNOWN         -- TABLA DE CODIGO DE ESTMAPACION PARA MODIFICACIÓN DE TARJETAS DE BENEFICIARIOS ( Máx. 10 OCURRENCIAS).,
    CONDEST_BANT         INT             -- CODIGO DE ESTAMPACION DE LAS TARJETAS A CAMBIAR,
    CONDEST_BNUE         INT             -- NUEVO CODIGO DE ESTAMPACION DE LAS TARJETAS
);

-- Cambio de producto: si vienen informados los campos de PRODUCTO, SUBPRODU y CONP
-- ROD y éstos son distintos de los actuales del contrato de tarjeta. Cambio de la 
-- marca/tipo del titular: si vienen informados los campos PAN, CODMAR-TIT y INDTIP
-- T-TIT y la marca y el tipo de la tarjeta son distintos de los actuales de la tar
-- jeta del titular.
CREATE TABLE Tabla376 (
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON_SEC           INT             -- CLAVE DE MONEDA SECUNDARIA
);

-- Si el contrato tiene tarjetas de marca/tipo que no están relacionadas con el pro
-- ducto se rechaza el cambio. Validamos con la nueva marca/tipo de la tarjeta si h
-- ubiera cambio de marca/tipo. Los datos adicionales a cumplimentar además de los 
-- generales y los del cambio de producto son los siguientes:
CREATE TABLE Tabla377 (
    INDMODLIM_REV        VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTA_1          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTA_2          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    INDMODLIM_CC         VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM C.CUOTAS CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S,
    LIMCRECTAC_1         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTAC_2         DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA
);

-- Campos específicos en el fichero de entrada:
CREATE TABLE Tabla378 (
    FORPAGO              INT             -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    PORPAGOA_1           INT             -- PORCENTAJE PAGO APLAZADO MONEDA PRINCIPAL,
    PORPAGOA_2           INT             -- PORCENTAJE PAGO APLAZADO MONEDA SECUNDARIA,
    IMPFPAGOA_1          DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA PRINCIPAL,
    IMPFPAGOA_2          DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA SECUNDARIA
);

-- Tabla379
CREATE TABLE Tabla379 (
    CODFORMATO           VARCHAR(10)     -- CODIGO DE FORMATO DE IMPRESION DE EXTRACTO
);

-- Campo específico en el fichero de entrada. Los datos adicionales a cumplimentar 
-- además de los generales son los siguientes:
CREATE TABLE Tabla380 (
    INDMODCTACAR         VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN DE LAS CUENTAS DE CARGO CON LOS VALORES DE LA INTERFAZ.,
    IBAN_1               VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO MONEDA PRINCIPAL,
    CTACARGO_1           VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA PRINCIPAL,
    IBAN_2               VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA,
    CTACARGO_2           VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA SECUNDARIA
);

-- Campo específico en el fichero de entrada. Los datos adicionales a cumplimentar 
-- además de los generales son los siguientes: Si la cuenta es ajena y el producto 
-- no lo permite se rechaza el registro.
CREATE TABLE Tabla381 (
    CODMAR_TIT           INT             -- CÓDIGO DE MARCA DE LA TARJETA DEL TITULAR,
    INDTIPT_TIT          INT             -- TIPO DE TARJETA DEL TITULAR,
    CENTENVEST__TIT      VARCHAR(4)      -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL TITULAR,
    CONDEST_TIT          INT             -- CONDICION DE ESTAMPACION DEL TITULAR
);

-- La marca/tipo tiene que ser distinta de la marca/tipo de la nueva tarjeta. Cambi
-- o Marca/Tipo de los beneficiarios
CREATE TABLE Tabla382 (
    CODMAR_BANT          INT             -- CÓDIGO DE MARCA DE LAS TARJETAS A CAMBIAR,
    INDTIPT_BANT         INT             -- TIPO DE LAS TARJETAS A CAMBIAR,
    CODMAR_BNUE          INT             -- NUEVA MARCA DE LAS TARJETAS,
    INDTIPT_BNUE         INT             -- NUEVO TIPO DE LAS TARJETAS,
    CENTENVEST_BEN       VARCHAR(4)      -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL BENEFICIARIO
);

-- Cambio Marca/Tipo de los beneficiarios Lectura del fichero de entrada. Los datos
--  adicionales a cumplimentar además de los generales son los siguientes:
CREATE TABLE Tabla383 (
    CONDEST__BANT        INT             -- CÓDIGO DE ESTAMPACION DE LAS TARJETAS A CAMBIAR,
    CONDEST__BNUE        INT             -- NUEVO CÓDIGO DE ESTAMPACION DE LAS TARJETAS
);

-- Se consideran cumplimentados como se describe en Consideraciones Generales de In
-- terfaces Batch. Un servicio será activado si los campos que se consideran como o
-- bligatorios han sido cumplimentados. Como todas las interfaces de entrada de dat
-- os lo primero que se realiza son validaciones sobre los datos de cabecera de la 
-- cinta. Ir a ver validaciones
CREATE TABLE Tabla384 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA – OFUSCADO - -
);

-- Se consideran cumplimentados como se describe en Consideraciones Generales de In
-- terfaces Batch. Un servicio será activado si los campos que se consideran como o
-- bligatorios han sido cumplimentados. Como todas las interfaces de entrada de dat
-- os lo primero que se realiza son validaciones sobre los datos de cabecera de la 
-- cinta. Ir a ver validaciones
CREATE TABLE Tabla385 (
    DATOS_PARA_CAMBIO_PRODUCTO UNKNOWN         -- DATOS PARA CAMBIO PRODUCTO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON_SEC           INT             -- CLAVE DE MONEDA SECUNDARIA,
    INDMODLIM_REV        VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S)
);

-- ERROR: No se pudieron procesar las columnas de Tabla386
-- Headers encontrados: ['LIMCRECTA-1', 'LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL', 'Numérico con Signo', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla387
-- Headers encontrados: ['IBAN-2', 'IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA', 'Alfanumérico', '4', '']


-- La Interfaz consta de dos grupos de campos: generales y opcionales, a continuaci
-- ón, se describen los
CREATE TABLE Tabla388 (
    DATOS_PARA_EL_TOKEN_DE_NEGOCIO UNKNOWN         -- DATOS PARA EL TOKEN DE NEGOCIO,
    TOKENNEGOCIO         VARCHAR(37)     -- formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Si no se cumple ninguno de estos casos se devolverá error y se continuará con el
--  siguiente registro del fichero de entrada. Validación producto: Se valida que e
-- l producto del contrato esté vigente y no sea Prepago regalo, si es prepago rega
-- lo se rechaza el registro.
CREATE TABLE Tabla389 (
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    CONPROD              VARCHAR(3)      -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON__SEC          INT             -- CLAVE DE MONEDA SECUNDARIA
);

-- Si el contrato tiene tarjetas de marca/tipo que no están relacionadas con el pro
-- ducto se rechaza el cambio. Validamos con la nueva marca/tipo de la tarjeta si h
-- ubiera cambio de marca/tipo. Los datos adicionales a cumplimentar además de los 
-- generales y los del cambio de producto son los siguientes:
CREATE TABLE Tabla390 (
    INDMODLIM__REV       VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTA_1          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTA_2          DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    INDMODLIM__CC        VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN LIM C.CUOTAS CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S,
    LIMCRECTAC__1        DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTAC__2        DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA
);

-- Campos específicos en el fichero de entrada:
CREATE TABLE Tabla391 (
    FORPAGO              INT             -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    PORPAGOA__1          INT             -- PORCENTAJE PAGO APLAZADO MONEDA PRINCIPAL,
    PORPAGOA__2          INT             -- PORCENTAJE PAGO APLAZADO MONEDA SECUNDARIA,
    IMPFPAGOA__1         DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA PRINCIPAL,
    IMPFPAGOA__2         DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA SECUNDARIA
);

-- Tabla392
CREATE TABLE Tabla392 (
    CODFORMATO           VARCHAR(10)     -- CODIGO DE FORMATO DE IMPRESION DE EXTRACTO
);

-- Campo específico en el fichero de entrada. Los datos adicionales a cumplimentar 
-- además de los generales son los siguientes:
CREATE TABLE Tabla393 (
    INDMODCTACAR         VARCHAR(1)      -- INDICADOR DE MODIFICACIÓN DE LAS CUENTAS DE CARGO CON LOS VALORES DE LA INTERFAZ.,
    IBAN_1               VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO MONEDA PRINCIPAL,
    CTACARGO_1           VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA PRINCIPAL,
    IBAN_2               VARCHAR(4)      -- IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA,
    CTACARGO_2           VARCHAR(30)     -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA SECUNDARIA
);

-- Campo específico en el fichero de entrada. Los datos adicionales a cumplimentar 
-- además de los generales son los siguientes: Si la cuenta es ajena y el producto 
-- no lo permite se rechaza el registro.
CREATE TABLE Tabla394 (
    CODMAR_TIT           INT             -- CÓDIGO DE MARCA DE LA TARJETA DEL TITULAR,
    INDTIPT_TIT          INT             -- TIPO DE TARJETA DEL TITULAR,
    CENTENVEST__TIT      VARCHAR(4)      -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL TITULAR
);

-- La marca/tipo tiene que ser distinta de la marca/tipo de la nueva tarjeta. Cambi
-- o Marca/Tipo de los beneficiarios
CREATE TABLE Tabla395 (
    CODMAR__BANT         INT             -- CÓDIGO DE MARCA DE LAS TARJETAS A CAMBIAR,
    INDTIPT_BANT         INT             -- TIPO DE LAS TARJETAS A CAMBIAR,
    CODMAR__BNUE         INT             -- NUEVA MARCA DE LAS TARJETAS,
    INDTIPT_BNUE         INT             -- NUEVO TIPO DE LAS TARJETAS,
    CENTENVEST__BEN      VARCHAR(4)      -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL BENEFICIARIO
);

-- ATC418: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla396 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    INDNORCOR            INT             -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CLAMON               INT             -- CLAVE DE MONEDA,
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN,
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA
);

-- ATC418: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla397 (
    INDDEBCRE            INT             -- INDICADOR DE DÉBITO / CRÉDITO,
    INDCOMPCUO           VARCHAR(1)      -- INDICADOR DE COMPRA EN CUOTAS,
    CODTIPC              VARCHAR(4)      -- TIPO DE CUOTA,
    NUMCUOTA             INT             -- NÚMERO DE CUOTAS,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE CUOTA,
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL,
    MESCARCUO            INT             -- MESES DE CARENCIA,
    LINREF               INT             -- REFERENCIA DE LÍNEA,
    FORPAGO              INT             -- FORMA DE PAGO,
    Ajustes_de_conceptos_econ_micos_ UNKNOWN         -- Ajustes de conceptos económicos:,
    SIGNO__INTERES       VARCHAR(1)      -- SIGNO DE INTERÉS A REGULARIZAR (+/-),
    AJU_INTERES          DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO INTERÉS,
    SIGNO__COMISION      VARCHAR(1)      -- SIGNO DE COMISIÓN A REGULARIZAR (+/-),
    AJU__COMISION        DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO COMISIÓN,
    SIGNO__IMPUESTO      VARCHAR(1)      -- SIGNO DE IMPUESTO A REGULARIZAR (+/-),
    AJU__IMPUESTO        DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO IMPUESTO,
    SIGNO__INTMORA       VARCHAR(1)      -- SIGNO DE INTERÉS DE MORA A REGULARIZAR (+/-),
    AJU_INTMORA          DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO INTERÉS DE MORA,
    SIGNO__COMMORA       VARCHAR(1)      -- SIGNO DE COMISIÓN DE MORA A REGULARIZAR (+/-)
);

-- Como todas las interfaces de entrada de datos lo primero que se realiza son vali
-- daciones sobre los datos de cabecera de la cinta.
CREATE TABLE Tabla398 (
    AJU__COMMORA         DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO COMISIÓN DE MORA,
    SIGNO__IMPUMORA      VARCHAR(1)      -- SIGNO DE IMPUESTO DE MORA A REGULARIZAR (+/-),
    AJU__IMPUMORA        DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO IMPUESTO DE MORA,
    M_s_informaci_n_sobre_el_ajuste_del_movimiento_ UNKNOWN         -- Más información sobre el ajuste del movimiento:,
    INDICA_TASA_0        INT             -- INDICADOR DE TASA CON VALOR 0 0 – LA TASA SE DEBE CALCULAR 1 – LA TASA ES 0
);

-- ATC418: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta.
CREATE TABLE Tabla399 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    INDNORCOR            INT             -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla400
-- Headers encontrados: ['IMPFAC', 'IMPORTE DE LA FACTURA', 'Numérico con Signo', '17', '2']


-- ERROR: No se pudieron procesar las columnas de Tabla401
-- Headers encontrados: ['AJU-IMPUESTO', 'IMPORTE A REGULARIZAR COMO IMPUESTO', 'Numérico', '17', '2']


-- ATBT40: Validación de datos particulares. Como todas las interfaces de entrada d
-- e datos lo primero que se realiza son validaciones sobre los datos de cabecera d
-- e la cinta. Ir a ver validaciones
CREATE TABLE Tabla402 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    LONGPAN              INT             -- LONGITUD DE LA TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA
);

-- ATB711: Modificación e inserción de datos en tablas de tarjetas duales. ATC402: 
-- Formateo de los registros de detalle rechazados.
CREATE TABLE Tabla403 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    PAN1                 VARCHAR(22)     -- PAN DE LA TARJETA PRINCIPAL,
    PAN2                 VARCHAR(22)     -- PAN DE LA TARJETA SECUNDARIA,
    CENTALTA1            VARCHAR(4)      -- OFICINA DE ALTA DE CUENTA PRINCIPAL,
    CUENTA1              VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO PRINCIPAL,
    NUMBENTCA1           INT             -- NÚMERO DE BENEFICIARIOS DE LA CUENTA PRINCIPAL,
    NUMPLASTICO1         NUMERIC(12)     -- NÚMERO DE PLÁSTICO PRINCIPAL,
    CENTALTA2            VARCHAR(4)      -- OFICINA DE ALTA DE CUENTA SECUNDARIA,
    CUENTA2              VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO SECUNDARIA,
    NUMBENCTA2           INT             -- NÚMERO DE BENEFICIARIOS DE LA CUENTA SECUNDARIA,
    NUMPLASTICO2         NUMERIC(12)     -- NÚMERO DE PLÁSTICO SECUNDARIA,
    NOMBENRED            VARCHAR(35)     -- NOMBRE Y APELLIDOS PARA ESTAMPACIÓN, FORMATO:NOMBRE*APELLIDO,
    ESTPLAS1             VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD
);

-- ATC402: Formateo de los registros de detalle rechazados. Como todas las interfac
-- es de entrada de datos lo primero que se realiza son validaciones sobre los dato
-- s de cabecera de la cinta. Ir a ver validaciones
CREATE TABLE Tabla404 (
    ESTPLAS2             VARCHAR(40)     -- DATOS DE ESTAMPACIÓN A VOLUNTAD,
    CONDEST              VARCHAR(3)      -- CONDICIONES DE ESTAMPACIÓN,
    CENTROEST            VARCHAR(4)      -- CENTRO DE ESTAMPACIÓN,
    INDENVPIN            VARCHAR(1)      -- INDICADOR DE ENVÍO DE LA CARTA DE PIN A CENTRO (S/N),
    CENTPIN              VARCHAR(4)      -- CENTRO DE ENVÍO SI EL INDICADOR O INDENVPIN ESTÁ ACTIVO,
    INDFOTO              VARCHAR(1)      -- INDICADOR DE FOTO EN PLÁSTICO (S/N),
    REFFOTO              VARCHAR(30)     -- REFERENCIA DE LA FOTO, SOLO SI EL CAMPO ANTERIOR ESTÁ ACTIVO
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCON001):
CREATE TABLE Tabla405 (
    DATOS_GENERALES_OBLIGATORIOS UNKNOWN         -- DATOS GENERALES OBLIGATORIOS,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCON001):
CREATE TABLE Tabla406 (
    CODGRU               INT             -- CÓDIGO DE GRUPO CONTABLE 01 = FRANQUICIAS. ENTRADA 02 = INCOMING 03 = COMERCIOS 04 = INCIDENCIAS 05 = TITULARES 06 = OPERACIONES DIARIAS 07 = COMPRA EN CUOTAS 08 = IMPAGADOS 09 = LIQUIDACIÓN 10 = MAESTRO DE RECIBOS 11 = OUTGOING 12 = FRANQUICIAS. SALIDA,
    CODCCN               INT             -- CONCEPTO CONTABLE,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE,
    CLAMON               INT             -- CLAVE DE MONEDA,
    FECALTA              UNKNOWN         -- FECHA GRABACIÓN DEL REGISTRO,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE (AAAA-MM- DD),
    FECOPER              UNKNOWN         -- FECHA DE LA OPERACIÓN (AAAA-MM-DD),
    DATOS_GENERALES_NO_OBLIGATORIOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_ UNKNOWN         -- DATOS GENERALES NO OBLIGATORIOS (INFORMAR SI EL PGM DISPONE DE ELLOS),
    IMPORI               DECIMAL(17, 2)  -- IMPORTE ORIGINAL DE LA OPERACIÓN,
    CLAMONORI            INT             -- CLAVE MONEDA ORIGINAL,
    CMBAPLIORI           DECIMAL(9, 4)   -- CAMBIO APLICADO PASO DE MONEDA,
    IMPEMI               DECIMAL(17, 2)  -- IMPORTE RECEPCIÓN DE LA OPERACIÓN,
    CLAMONEMI            INT             -- CLAVE MONEDA EMISOR,
    CMBAPLIEMI           DECIMAL(9, 4)   -- CAMBIO APLICADO PASO DE MONEDA EMISOR,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA: NORMAL CORRECTORA
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCON001):
CREATE TABLE Tabla407 (
    TIPOFAC              INT             -- TIPO DE FACTURA,
    INDAPLDEBCRE         INT             -- INDICADOR DE OPERATIVIDAD DE LA TARJETA 1 – Crédito 2 – Débito 3 – Mixta 4- Monedero 5- Prepago banda,
    CODACT               INT             -- CÓDIGO ACTIVIDAD ISO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    SECOPE               NUMERIC(12)     -- SECUENCIA DE LA OPERACIÓN,
    OFIOPE               VARCHAR(4)      -- OFICINA QUE GENERA LA OPERACIÓN,
    IDTERM               VARCHAR(16)     -- IDENTIFICADOR DE TERMINAL,
    IDENTIFICADOR_DE_LA_OPERACI_N__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_SEG_N_SUBSISTEMA_ UNKNOWN         -- IDENTIFICADOR DE LA OPERACIÓN (INFORMAR SI EL PGM DISPONE DE ELLOS SEGÚN SUBSISTEMA),
    SIAIDCD              VARCHAR(19)     -- CÓDIGO IDENTIFICACIÓN DE SIA,
    NUMCINTA             NUMERIC(17)     -- NÚMERO DE CINTA,
    SECLOTE              INT             -- LOTE DENTRO DE LA CINTA,
    CENTALTA             VARCHAR(4)      -- CENTRO ALTA CUENTA TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO DE CRÉDITO,
    NUMMOV               INT             -- NÚMERO MOVIMIENTO CRÉDITO O DÉBITO,
    NUMOPECUO            INT             -- NÚMERO OPERACIÓN EN CUOTAS,
    FECINI               UNKNOWN         -- FECHA INICIO,
    FECFIN               UNKNOWN         -- FECHA FIN
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCON001):
CREATE TABLE Tabla408 (
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    CENTALTACOM          VARCHAR(4)      -- ALTA CONTRATO COMERCIO,
    CUENTACOM            VARCHAR(12)     -- CONTRATO COMERCIO,
    NUMEXTCOM            INT             -- NÚMERO EXTRACTO COMERCIO,
    NUMMOVEXTCO          INT             -- NÚMERO MOVIMIENTO EXTRACTO COMERCIO,
    NUMREFREM            INT             -- NÚMERO REFERENCIA REMESA,
    NUMREFFACREM         INT             -- NÚMERO REFERENCIA DE LA FACTURA,
    NUMINC               INT             -- NÚMERO INCIDENCIA,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA DE RECIBO,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA DE RECIBO IMPAGADO,
    DATOS_DE_TRAMA_CONTABLE_Y_ESTAD_STICOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS__CONTABILIDAD_INFORMAR__LOS_NECESARIOS_PARA_TRADUCCI_N_CONTABLE_ UNKNOWN         -- DATOS DE TRAMA CONTABLE Y ESTADÍSTICOS (INFORMAR SI EL PGM DISPONE DE ELLOS. CONTABILIDAD INFORMARÁ LOS NECESARIOS PARA TRADUCCIÓN CONTABLE),
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR TIPO DE TARJETA,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE,
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    CODRAZON             INT             -- CÓDIGO DE RAZÓN,
    TIPOREM              VARCHAR(1)      -- TIPO DE REMESA,
    CODESTCTA            INT             -- CÓDIGO ESTADO DE CUENTA DE TARJETA,
    CODPAIS              INT             -- CÓDIGO DE PAÍS,
    TIPOCLI              VARCHAR(4)      -- TIPO DE CLIENTE
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCON001):
CREATE TABLE Tabla409 (
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN DE OPERACIÓN,
    PROGRAMA             VARCHAR(8)      -- NOMBRE DE PROGRAMA,
    DATOS_CONTABLES__SE_INFORMARAN_EN_LOS_PROCESOS_CONTABLES_ UNKNOWN         -- DATOS CONTABLES (SE INFORMARAN EN LOS PROCESOS CONTABLES),
    IMPCON               DECIMAL(17, 2)  -- IMPORTE EN MONEDA CONTABLE,
    CLAMONCON            INT             -- CLAVE MONEDA CONTABLE,
    CMBAPLI              DECIMAL(9, 4)   -- CAMBIO APLICADO,
    CUENTADEBE           INT             -- CUENTA SAT DEBE,
    CUENTAHABER          INT             -- CUENTA SAT HABER,
    OFIIMPDEB            VARCHAR(4)      -- OFICINA IMPUTACIÓN DEBE,
    OFIIMPHAB            VARCHAR(4)      -- OFICINA IMPUTACIÓN HABER,
    INDNACINT            INT             -- INDICADOR OPERADOR NACIONAL INTERNACIONAL,
    NUMOPER              INT             -- NÚMERO DE REGISTROS QUE COMPONEN LA TOTALIZACIÓN DE CONCEPTOS,
    SIGNO                VARCHAR(1)      -- SIGNO DEL REGISTRO CONTABLE (SIGNO DEL TIPO DE FACTURA O INDICADOR DE NORMAL / CORRECTORA),
    DATOS_DE_L_NEA       UNKNOWN         -- DATOS DE LÍNEA,
    LINREF               INT             -- REFERENCIA DE TIPO DE LÍNEA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    CLASIFEXT            VARCHAR(1)      -- CLASIFICACIÓN EXTERNA,
    FILLER               VARCHAR(4)     
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCON002):
CREATE TABLE Tabla410 (
    DATOS_GENERALES_OBLIGATORIOS UNKNOWN         -- DATOS GENERALES OBLIGATORIOS,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODGRU               INT             -- CÓDIGO DE GRUPO CONTABLE - 01 = FRANQUICIAS. ENTRADA 02 = INCOMING 03 = COMERCIOS 04 = INCIDENCIAS 05 = TITULARES
);

-- ERROR: No se pudieron procesar las columnas de Tabla411
-- Headers encontrados: ['', '- 06 = OPERACIONES DIARIAS 07 = COMPRA EN CUOTAS 08 = IMPAGADOS 09 = LIQUIDACIÓN 10 = MAESTRO DE RECIBOS 11 = OUTGOING - 12 = FRANQUICIAS. SALIDA', '', '', '']


-- ERROR: No se pudieron procesar las columnas de Tabla412
-- Headers encontrados: ['CMBAPLIEMI', 'CAMBIO APLICADO PASO DE MONEDA EMISOR', 'Numérico', '9', '4']


-- ERROR: No se pudieron procesar las columnas de Tabla413
-- Headers encontrados: ['CUENTA', 'CUENTA DE TARJETA', 'Alfanumérico', '12', '']


-- ERROR: No se pudieron procesar las columnas de Tabla414
-- Headers encontrados: ['NUMSECIMP', 'NÚMERO SECUENCIA DE RECIBO IMPAGADO', 'Numérico', '15', '0']


-- ERROR: No se pudieron procesar las columnas de Tabla415
-- Headers encontrados: ['IMPCON', 'IMPORTE EN MONEDA CONTABLE', 'Numérico', '17', '2']


-- Programa ATB543: Formatea los registros de detalle de los conceptos económicos a
-- sociados a las compras en cuotas vigentes. Programa ATB546: Formatea los registr
-- os de detalle de las compras en cuotas canceladas o amortizadas en el proceso di
-- ario.
CREATE TABLE Tabla417 (
    DATOS_COMUNES        UNKNOWN         -- DATOS COMUNES,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    CLAMON               INT             -- CÓDIGO DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA,
    NUMOPECUO            INT             -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN ACTUAL
);

-- Programa ATB546: Formatea los registros de detalle de las compras en cuotas canc
-- eladas o amortizadas en el proceso diario. Programa ATB547: Formatea los registr
-- os de detalle de los conceptos económicos asociados a las compras en cuotas canc
-- eladas o amortizadas en el proceso diario.
CREATE TABLE Tabla418 (
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO: CC – COMPRA EN CUOTA FI – PLAN DE FINANCIACIÓN CU – DETALLE DE LA CUOTA CE – CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTAS,
    REGISTRO             VARCHAR(736)   ,
    REGISTRO_CC___REGISTRO_DE_COMPRA_EN_CUOTAS UNKNOWN         -- REGISTRO CC – REGISTRO DE COMPRA EN CUOTAS,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    FECALTCOMP           UNKNOWN         -- FECHA DE ALTA DE LA COMPRA EN CUOTAS,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA: – NORMAL – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZÓ LA OPERACIÓN. EL VALOR DE ESTE CAMPO DEBERÁ ALMACENARSE JUSTIFICADO A LA IZQUIERDA,
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA
);

-- Programa ATB546: Formatea los registros de detalle de las compras en cuotas canc
-- eladas o amortizadas en el proceso diario. Programa ATB547: Formatea los registr
-- os de detalle de los conceptos económicos asociados a las compras en cuotas canc
-- eladas o amortizadas en el proceso diario.
CREATE TABLE Tabla419 (
    DESCLAMONDIV         VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    SIGIMPDIV            VARCHAR(1)      -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL (+/-),
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGIMPFAC            VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA FACTURA (+/-),
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI              DECIMAL(9, 4)   -- FACTOR DE CAMBIO APLICADO (SÓLO TIENE SENTIDO PARA OPERACIONES EN EL EXTRANJERO),
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE REDUCIDO DEL COMERCIO,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    DESACT               VARCHAR(30)     -- DESCRIPCIÓN DE LA ACTIVIDAD,
    SIGIMPLIQ            VARCHAR(1)      -- SIGNO DEL IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO (+/-),
    IMPLIQ               DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    CLAMONLIQ            INT             -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONLIQ         VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO
);

-- Programa ATB548: Formatea los registros de detalle de las financiaciones y de lo
-- s detalles de las cuotas de las compras en cuotas canceladas o amortizadas en el
--  proceso diario. Inserta en la tabla de cintas MPDT064 los datos correspondiente
-- s a enviar a cada red o franquicia.
CREATE TABLE Tabla420 (
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPAIS              VARCHAR(30)     -- NOMBRE DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN OPERACIÓN (VER ATORIGEN),
    DESORIGENOPE         VARCHAR(30)     -- DESCRIPCIÓN DEL ORIGEN DE LA OPERACIÓN,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    DESFRA               VARCHAR(30)     -- DESCRIPCIÓN DE LA FRANQUICIA,
    SECOPE               NUMERIC(12)     -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC            NUMERIC(15)     -- NUMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SÓLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED            VARCHAR(12)     -- SESIÓN DE LA RED,
    SIAIDCD              VARCHAR(19)     -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    ESTCOMPRA            INT             -- ESTADO DE LA COMPRA
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla421 (
    DESESTCOMPRA         VARCHAR(30)     -- DESCRIPCIÓN DEL ESTADO DE LA COMPRA: - VIGENTE - CANCELADA - AMORTIZADA O FINALIZADA - FUSIÓN N COMPRAS - CANCELADA CARTERA-VENCIDA – INCIDENCIA EN ESTUDIO - REFINANCIADA – ACELERADA – CANCELADA CARTERA- CONGELADA – RETENIDA POR INCIDENCIA – INCIDENCIA ABONADA – REVERSADA – LIQUIDACIÓN DE COMPRA EN CUOTA VIGENTE – LIQUIDACIÓN DE COMPRA EN CUOTA EN ESTUDIO,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN A LA RED,
    SIGIMPCAP2           VARCHAR(1)      -- SIGNO DEL IMPORTE CAPITAL 2 (+/-),
    IMPCAP2              DECIMAL(17, 2)  -- IMPORTE CAPITAL 2,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN DE LA LÍNEA,
    PORINTORIG           DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS ORIGINAL,
    PORBONORIG           DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS VIGENTE,
    FILLER               VARCHAR(78)    
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla422 (
    REGISTRO_FI___INFORMACION_SOBRE_EL_PLAN_DE_FINANCIACION UNKNOWN         -- REGISTRO FI – INFORMACION SOBRE EL PLAN DE FINANCIACION,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    SIGIMPCUOTA          VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    NUMCUOPAG            INT             -- NÚMERO DE CUOTAS PAGADAS,
    NUMMESFIN            VARCHAR(12)     -- MESES DE FINANCIACIÓN,
    SIGIMPTOTAL          VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL A PAGAR (+/-),
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPINTTOTAL       VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERESES TOTAL A PAGAR (+/-),
    IMPINTTOTAL          DECIMAL(17, 2)  -- IMPORTE DE INTERESES TOTAL A PAGAR,
    SIGIMPAMORT          VARCHAR(1)      -- SIGNO DEL IMPORTE DE CAPITAL AMORTIZADO,
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE DE CAPITAL AMORTIZADO,
    SIGIMPINTAMORT       VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERESES AMORTIZADO (+/-),
    IMPINTAMORT          DECIMAL(17, 2)  -- IMPORTE DE INTERESES AMORTIZADO,
    FECULTLIQ            UNKNOWN         -- FECHA DE ÚLTIMA LIQUIDACIÓN,
    FECALTA              UNKNOWN         -- FECHA DE ALTA
);

-- Tabla423
CREATE TABLE Tabla423 (
    FECBAJA              UNKNOWN         -- FECHA DE BAJA,
    MOTBAJA              VARCHAR(2)      -- MOTIVO DE BAJA DEL NÚMERO DE FINANCIACIÓN,
    DESMOT               VARCHAR(30)     -- DESCRIPCIÓN DEL MOTIVO DE BAJA: - AMORTIZACIÓN ANTICIPADA - MODIFICACIÓN DEL NÚMERO DE CUOTAS - CANCELACIÓN DE COMPRA EN CUOTAS - FUSIÓN DE N COMPRAS EN CUOTAS - CANCELADA POR CARTERA-VENCIDA - GENERADA INCIDENCIA – REFINANCIADA – ACELERADA – USO SOFTWARE REGIONAL. 10 – USO SOFTWARE REGIONAL. 11 – ANULACIÓN DE COMPRA EN CUOTAS. 12 - REVERSADA 20 A 30 - RESERVADO PARA USO DEL CLIENTE.,
    NUMULTCUO            INT             -- NÚMERO DE ÚLTIMA CUOTA,
    SIGINTCARPTE         VARCHAR(1)      -- SIGNO DE INTERESES DE CARENCIA PENDIENTES (+/-),
    INTCARPTE            DECIMAL(17, 2)  -- INTERESES DE CARENCIA PENDIENTES,
    FILLER               VARCHAR(486)   
);

-- Tabla424
CREATE TABLE Tabla424 (
    REGISTRO_CU___INFORMACION_DE_LOS_DETALLES_DE_LA_CUOTA UNKNOWN         -- REGISTRO CU – INFORMACION DE LOS DETALLES DE LA CUOTA,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    FECPROCUO            UNKNOWN         -- FECHA DE COBRO DE LA CUOTA,
    SIGIMPCUOTA          VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA (+/-),
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPCAPITAL        VARCHAR(1)      -- SIGNO DEL IMPORTE CAPITAL (+/-),
    IMPCAPITAL           DECIMAL(17, 2)  -- IMPORTE CAPITAL,
    SIGIMPINTERESES      VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERÉS (+/-),
    IMPINTERESES         DECIMAL(17, 2)  -- IMPORTE INTERÉS,
    SIGIMPIMPTO          VARCHAR(1)      -- SIGNO DEL IMPORTE DEL IMPUESTO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    ESTCUO               INT             -- ESTADO DE LA CUOTA,
    DESESTCUO            VARCHAR(30)     -- DESCRIPCIÓN DEL ESTADO DE LA CUOTA: – PENDIENTE – LIQUIDADA – CANCELADA – VENCIDA – ANTICIPADA,
    FECLIQ               UNKNOWN         -- FECHA LIQUIDACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE,
    FILLER               VARCHAR(593)   ,
    REGISTRO_CE___INFORMACION_DE_LOS_CONCEPTOS_ECON_MICOS_ASOCIADOS_A_LA_COMPRA_EN_CUOTA UNKNOWN         -- REGISTRO CE – INFORMACION DE LOS CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTA,
    SIGNUMCUOTA          VARCHAR(1)      -- SIGNO DEL NÚMERO DE CUOTA,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA
);

-- Tabla425
CREATE TABLE Tabla425 (
    DESNUMCUOTA          VARCHAR(30)     -- DESCRIPCIÓN DEL NÚMERO DE CUOTA,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DEL CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE IMPORTE – COMISIONES – INTERESES – IMPUESTOS 08 - VALOR PARA USO FUTURO,
    SIGIMPAPLECO         VARCHAR(1)      -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-),
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO         VARCHAR(1)      -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO (+/-),
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPBONECO         VARCHAR(1)      -- SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGIMPIMPTO          VARCHAR(1)      -- SIGNO DEL IMPORTE DE IMPUESTO (+/-),
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FILLER               VARCHAR(558)   
);

-- Programa ATB546: Formatea los registros de detalle de las compras en cuotas canc
-- eladas o amortizadas en el proceso diario. Programa ATB547: Formatea los registr
-- os de detalle de los conceptos económicos asociados a las compras en cuotas canc
-- eladas o amortizadas en el proceso diario.
CREATE TABLE Tabla426 (
    DATOS_COMUNES        UNKNOWN         -- DATOS COMUNES,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    CLAMON               INT             -- CÓDIGO DE MONEDA
);

-- Programa ATB548: Formatea los registros de detalle de las financiaciones y de lo
-- s detalles de las cuotas de las compras en cuotas canceladas o amortizadas en el
--  proceso diario. Programa ATBT84: Obtiene el tokennegocio y ofusca el Pan en el 
-- tipo de registro ‘MP’.
CREATE TABLE Tabla427 (
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA,
    NUMOPECUO            INT             -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN ACTUAL,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO: CC – COMPRA EN CUOTA FI – PLAN DE FINANCIACIÓN CU – DETALLE DE LA CUOTA CE – CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTAS,
    REGISTRO             VARCHAR(736)   ,
    REGISTRO_CC___REGISTRO_DE_COMPRA_EN_CUOTAS UNKNOWN         -- REGISTRO CC – REGISTRO DE COMPRA EN CUOTAS,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    FECALTCOMP           UNKNOWN         -- FECHA DE ALTA DE LA COMPRA EN CUOTAS,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA: – NORMAL – CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    DESTIPFAC            VARCHAR(30)     -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla428 (
    PAN                  VARCHAR(22)     -- PAN DE LA TARJETA QUE REALIZÓ LA OPERACIÓN. EL VALOR DE ESTE CAMPO DEBERÁ ALMACENARSE JUSTIFICADO A LA IZQUIERDA OFUSCADO,
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMONDIV         VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    SIGIMPDIV            VARCHAR(1)      -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL (+/-),
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGIMPFAC            VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA FACTURA (+/-),
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI              DECIMAL(9, 4)   -- FACTOR DE CAMBIO APLICADO (SÓLO TIENE SENTIDO PARA OPERACIONES EN EL EXTRANJERO),
    NUMAUT               VARCHAR(6)      -- NÚMERO DE AUTORIZACIÓN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE REDUCIDO DEL COMERCIO,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    DESACT               VARCHAR(30)     -- DESCRIPCIÓN DE LA ACTIVIDAD,
    SIGIMPLIQ            VARCHAR(1)      -- SIGNO DEL IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO (+/-),
    IMPLIQ               DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla429 (
    CLAMONLIQ            INT             -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONLIQ         VARCHAR(30)     -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPAIS              VARCHAR(30)     -- NOMBRE DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN OPERACIÓN (VER ATORIGEN),
    DESORIGENOPE         VARCHAR(30)     -- DESCRIPCIÓN DEL ORIGEN DE LA OPERACIÓN,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    DESFRA               VARCHAR(30)     -- DESCRIPCIÓN DE LA FRANQUICIA,
    SECOPE               NUMERIC(12)     -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC            NUMERIC(15)     -- NUMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SÓLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED            VARCHAR(12)     -- SESIÓN DE LA RED,
    SIAIDCD              VARCHAR(19)     -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    ESTCOMPRA            INT             -- ESTADO DE LA COMPRA
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla430 (
    DESESTCOMPRA         VARCHAR(30)     -- DESCRIPCIÓN DEL ESTADO DE LA COMPRA: - VIGENTE - CANCELADA - AMORTIZADA O FINALIZADA - FUSIÓN N COMPRAS - CANCELADA CARTERA-VENCIDA – INCIDENCIA EN ESTUDIO - REFINANCIADA – ACELERADA – CANCELADA CARTERA- CONGELADA – RETENIDA POR INCIDENCIA – INCIDENCIA ABONADA – REVERSADA – LIQUIDACIÓN DE COMPRA EN CUOTA VIGENTE – LIQUIDACIÓN DE COMPRA EN CUOTA EN ESTUDIO,
    FECLIQ               UNKNOWN         -- FECHA DE LIQUIDACIÓN A LA RED,
    SIGIMPCAP2           VARCHAR(1)      -- SIGNO DEL IMPORTE CAPITAL 2 (+/-),
    IMPCAP2              DECIMAL(17, 2)  -- IMPORTE CAPITAL 2,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    DESTIPOLIN           VARCHAR(30)     -- DESCRIPCIÓN DE LA LÍNEA,
    PORINTORIG           DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS ORIGINAL,
    PORBONORIG           DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS VIGENTE
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes a enviar a cada
--  red o franquicia.
CREATE TABLE Tabla431 (
    TOKENNEGOCIO         VARCHAR(37)     -- Formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO,
    FILLER               VARCHAR(41)    ,
    REGISTRO_FI___INFORMACION_SOBRE_EL_PLAN_DE_FINANCIACION UNKNOWN         -- REGISTRO FI – INFORMACION SOBRE EL PLAN DE FINANCIACION,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    SIGIMPCUOTA          VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    NUMCUOPAG            INT             -- NÚMERO DE CUOTAS PAGADAS,
    NUMMESFIN            VARCHAR(12)     -- MESES DE FINANCIACIÓN,
    SIGIMPTOTAL          VARCHAR(1)      -- SIGNO DEL IMPORTE TOTAL A PAGAR (+/-),
    IMPTOTAL             DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPINTTOTAL       VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERESES TOTAL A PAGAR (+/-),
    IMPINTTOTAL          DECIMAL(17, 2)  -- IMPORTE DE INTERESES TOTAL A PAGAR,
    SIGIMPAMORT          VARCHAR(1)      -- SIGNO DEL IMPORTE DE CAPITAL AMORTIZADO,
    IMPAMORT             DECIMAL(17, 2)  -- IMPORTE DE CAPITAL AMORTIZADO,
    SIGIMPINTAMORT       VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERESES AMORTIZADO (+/-)
);

-- Tabla432
CREATE TABLE Tabla432 (
    IMPINTAMORT          DECIMAL(17, 2)  -- IMPORTE DE INTERESES AMORTIZADO,
    FECULTLIQ            UNKNOWN         -- FECHA DE ÚLTIMA LIQUIDACIÓN,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    FECBAJA              UNKNOWN         -- FECHA DE BAJA,
    MOTBAJA              VARCHAR(2)      -- MOTIVO DE BAJA DEL NÚMERO DE FINANCIACIÓN,
    DESMOT               VARCHAR(30)     -- DESCRIPCIÓN DEL MOTIVO DE BAJA: - AMORTIZACIÓN ANTICIPADA - MODIFICACIÓN DEL NÚMERO DE CUOTAS - CANCELACIÓN DE COMPRA EN CUOTAS - FUSIÓN DE N COMPRAS EN CUOTAS - CANCELADA POR CARTERA-VENCIDA - GENERADA INCIDENCIA – REFINANCIADA – ACELERADA – USO SOFTWARE REGIONAL. 10 – USO SOFTWARE REGIONAL. 11 – ANULACIÓN DE COMPRA EN CUOTAS. 12 - REVERSADA 20 A 30 - RESERVADO PARA USO DEL CLIENTE.,
    NUMULTCUO            INT             -- NÚMERO DE ÚLTIMA CUOTA
);

-- Tabla433
CREATE TABLE Tabla433 (
    SIGINTCARPTE         VARCHAR(1)      -- SIGNO DE INTERESES DE CARENCIA PENDIENTES (+/-),
    INTCARPTE            DECIMAL(17, 2)  -- INTERESES DE CARENCIA PENDIENTES,
    FILLER               VARCHAR(486)   ,
    REGISTRO_CU___INFORMACION_DE_LOS_DETALLES_DE_LA_CUOTA UNKNOWN         -- REGISTRO CU – INFORMACION DE LOS DETALLES DE LA CUOTA,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    FECPROCUO            UNKNOWN         -- FECHA DE COBRO DE LA CUOTA,
    SIGIMPCUOTA          VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA (+/-),
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPCAPITAL        VARCHAR(1)      -- SIGNO DEL IMPORTE CAPITAL (+/-),
    IMPCAPITAL           DECIMAL(17, 2)  -- IMPORTE CAPITAL,
    SIGIMPINTERESES      VARCHAR(1)      -- SIGNO DEL IMPORTE DE INTERÉS (+/-),
    IMPINTERESES         DECIMAL(17, 2)  -- IMPORTE INTERÉS,
    SIGIMPIMPTO          VARCHAR(1)      -- SIGNO DEL IMPORTE DEL IMPUESTO,
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    ESTCUO               INT             -- ESTADO DE LA CUOTA,
    DESESTCUO            VARCHAR(30)     -- DESCRIPCIÓN DEL ESTADO DE LA CUOTA: – PENDIENTE – LIQUIDADA – CANCELADA – VENCIDA – ANTICIPADA,
    FECLIQ               UNKNOWN         -- FECHA LIQUIDACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE,
    FILLER               VARCHAR(593)   
);

-- Tabla434
CREATE TABLE Tabla434 (
    REGISTRO_CE___INFORMACION_DE_LOS_CONCEPTOS_ECON_MICOS_ASOCIADOS_A_LA_COMPRA_EN_CUOTA UNKNOWN         -- REGISTRO CE – INFORMACION DE LOS CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTA,
    SIGNUMCUOTA          VARCHAR(1)      -- SIGNO DEL NÚMERO DE CUOTA,
    NUMCUOTA             INT             -- NÚMERO DE CUOTA,
    DESNUMCUOTA          VARCHAR(30)     -- DESCRIPCIÓN DEL NÚMERO DE CUOTA,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DEL CONCEPTO ECONÓMICO,
    TIPIMP               INT             -- TIPO DE IMPORTE,
    DESIMP               VARCHAR(30)     -- DESCRIPCIÓN DE TIPO DE IMPORTE – COMISIONES – INTERESES – IMPUESTOS 08 - VALOR PARA USO FUTURO,
    SIGIMPAPLECO         VARCHAR(1)      -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-),
    IMPAPLECO            DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO         VARCHAR(1)      -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO (+/-),
    IMPBRUECO            DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPBONECO         VARCHAR(1)      -- SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-)
);

-- Tabla435
CREATE TABLE Tabla435 (
    IMPBONECO            DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGIMPIMPTO          VARCHAR(1)      -- SIGNO DEL IMPORTE DE IMPUESTO (+/-),
    IMPIMPTO             DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FILLER               VARCHAR(558)   
);

-- ERROR: No se pudieron procesar las columnas de Tabla436
-- Headers encontrados: ['ENVÍO DE CUENTAS DADAS DE BAJA EN CARTERA VENCIDA']


-- Programa ATB689: Baja de contratos por cartera vencida formando los registros de
--  detalle Programa ATB488: Genera la cinta. El formato que corresponde al registr
-- o del fichero de salida sería (ATVENBAJ):
CREATE TABLE Tabla437 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE CONTRATO,
    MOTBAJA              VARCHAR(2)      -- MOTIVO DE BAJA,
    DESMOT               VARCHAR(30)     -- DESCRIPCIÓN DEL MOTIVO
);

-- Programa ATBO90: Formatea el registro de detalle del producto merchant. Programa
--  ATB608: Formatea el registro de detalle. Detalle de campos de los campos comune
-- s.
CREATE TABLE Tabla438 (
    SUBPRODU             VARCHAR(4)      -- DESCRIPCIÓN DE SUBPRODUCTO,
    DESPROD              VARCHAR(29)     -- DESCRIPCIÓN DE PRODUCTO- SUBPRODUCTO,
    VERTIENTE            VARCHAR(1)      -- VERTIENTE DEL PRODUCTO. POSIBLES VALORES: E-EMISOR M-MERCHANT,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTROS: PR- PRODUCTOS EMISOR PM- PRODUCTOS MERCHANT CE- CONDICIÓN ECONÓMICA CG-PRODUCTO-CONDICIÓN ECONÓMICA-CONCEPTO ECONÓMICO CT-PRODUCTO–CONDICIÓN ECONÓMICA – TIPO DE TARJETA – CONCEPTO ECONÓMICO TR- TRAMOS DE APLICACIÓN DE CONCEPTOS ECONÓMICOS CC - CONDICIÓN ECONÓMICA – TIPO DE CUOTA – CONCEPTO ECONÓMICO TT- TRAMOS DE APLICACIÓN DE CONCEPTOS ECONÓMICOS POR TIPO DE COMPRA EN CUOTAS TM- TRAMOS DE APLICACIÓN DE CONCEPTOS ECONÓMICOS POR TIPO DE COMPRA EN CUOTAS POR COEFICIENTE DE CÁLCULO Y NÚMERO DE MESES GA- GRUPOS DE ABONO DE PRODUCTO MERCHANT PA- PERIODO POR GRUPOS DE ABONO DE PRODUCTO MERCHANT GA- GRUPOS DE ABONO DE PRODUCTO MERCHANT RF-REGIMEN FISCAL,
    NUMORDEN             NUMERIC(12)     -- SECUENCIAL DE PROCESO DE GENERACIÓN DE LA INTERFAZ
);

-- Programa ATBO90: Formatea el registro de detalle del producto merchant. Programa
--  ATB608: Formatea el registro de detalle. Detalle de campos de los campos comune
-- s.
CREATE TABLE Tabla439 (
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    FECALTA              VARCHAR(10)     -- FECHA DE ALTA DEL PRODUCTO,
    INDRIESGO            VARCHAR(2)      -- INDICADOR DE RIESGO.,
    DESRIESGO            VARCHAR(30)     -- DESCRIPCIÓN DE INDRIESGO: ‘00’ DEBITO ‘01’ CREDITO CUENTA TARJETA ‘02 CREDITO Y OPERA. FINAN. ‘03 PREPAGO REGALO ‘05’ FINANCIACION AL CONSUMO ‘06’ PREPAGO,
    LIMCRECTAMIN         DECIMAL(17, 2)  -- LÍMITE MÍNIMO CRÉDITO CUENTA TARJETA,
    LIMCRECTAMAX         DECIMAL(17, 2)  -- LÍMITE MAXIMO CRÉDITO CUENTA TARJETA,
    LIMCRECOMPMIN        DECIMAL(17, 2)  -- LÍMITE MÍNIMO CRÉDITO PARA COMPRA EN CUOTAS,
    LIMCRECOMPMAX        DECIMAL(17, 2)  -- LÍMITE MÁXIMO CRÉDITO PARA COMPRA EN CUOTAS,
    INDGARAN             VARCHAR(1)      -- INDICADOR DE GARANTÍA (S/N),
    INDCTADOMCRE         VARCHAR(1)      -- INDICADOR DE CUENTA DE DOMICILIACIÓN OBLIGATORIA PARA CRÉDITO (S/N),
    CLASEG               VARCHAR(3)      -- CAMPO PARA USO FUTURO,
    TIPSEG               VARCHAR(3)      -- CAMPO PARA USO FUTURO,
    FECINI               UNKNOWN         -- FECHA DE INICIO,
    FECFIN               UNKNOWN         -- FECHA FIN DE PRODUCTO
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla440 (
    INDCTATIP            VARCHAR(1)      -- INDICADOR DE ADMISIÓN DE UN SOLO TIPO DE TARJETA POR CUENTA (S/N),
    IMPEXCLIMTOL         DECIMAL(17, 2)  -- IMPORTE TOLERADO DE EXCESO DE LÍMITE,
    INDEXCLIM            VARCHAR(1)      -- INDICADOR DE SI EL EXCESO DE LÍMITE SE INCORPORA AL PAGO MÍNIMO.,
    DESINDEXCLIM         VARCHAR(30)     -- DESCRIPCIÓN DE INDEXCLIM S- EL EXCESO DE LIMITE DE INCORPORA AL PAGO MÍNIMO N- EL EXCESO DE LÍMITE NO SE INCORPORA EL PAGO MÍNIMO F- EL EXCESO DE LÍMITE SE INCORPORA AL PAGO MÍNIMO, Y TANTO EL EXCESO DE LÍMITE COMO EL IMPAGADO SE INCREMENTAN A LA CUOTA FIJA.,
    INDTRAFECCAD         VARCHAR(1)      -- INDICADOR DE NIVEL DE TRATAMIENTO DE LA FECHA DE CADUCIDAD.,
    DESINDTRAFECCA       VARCHAR(30)     -- DESCRIPCIÓN DE INDTRAFECCAD: C – CUENTA DE TARJETA T – TARJETA,
    APLICUOTA            VARCHAR(1)      -- APLICACIÓN DE LA CUOTA DE TARJETA.,
    DESAPLICUOTA         VARCHAR(30)     -- DESCRIPCIÓN DE APLICUOTA P – CUENTA DE PASIVO L – LIQUIDACIÓN DE EXTRACTO,
    TRASALACR            VARCHAR(1)      -- APLICACIÓN DE LA CUOTA DE TARJETA.,
    DESTRASALACR         VARCHAR(30)     -- DESCRIPCIÓN DE TRASALACR: P – CUENTA DE PASIVO L – LIQUIDACIÓN DE EXTRACTO,
    NUMDIADEVACR         INT             -- MÁXIMO NÚMERO DE DÍAS PARA RETENER SALDO ACREEDOR
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla441 (
    TRASALDIS            VARCHAR(1)      -- TRATAMIENTO SALDO DISPUESTO.,
    DESTRASALDIS         VARCHAR(30)     -- DESCRIPCIÓN DE TRASALDIS: C – SÓLO CAPITAL I – TODO (CAPITAL + CONCEPTOS ECONÓMICOS),
    INDCUOUSO            INT             -- INDICATIVO DE COBRO CUOTA DE EMISIÓN.,
    DESINDCUOUSO         VARCHAR(30)     -- DESCRIPCIÓN DE INDCUOUSO: 1 – ALTA DE TARJETA 2 – A LA PRIMERA OPERACIÓN 3 – ACUSE RECIBO DE TARJETA,
    NUMMESDEMORA         INT             -- NÚMERO DE MESES DE DEMORA EN EL COBRO DE CUOTA,
    INDPERCUO            VARCHAR(1)      -- INDICADOR DE ADMISIÓN DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESMAX            INT             -- NÚMERO MÁXIMO DE PLAZOS PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SÓLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    NUMDIARESOL          INT             -- NÚMERO DE DÍAS MÁXIMO PARA RESOLUCIÓN,
    INDLIMUNI            VARCHAR(1)      -- INDICADOR DE LÍMITE ÚNICO PARA DOS MONEDAS. SI EL INDICADOR DE MONEDA ÚNICA ES “S”, ESTE CAMPO DEBE TENER VALOR “N”,
    DESINDLIMUNI         VARCHAR(30)     -- DESCRIPCIÓN DE INDLIMUNI N-NO EXISTE UN ÚNICO LÍMITE PARA LAS DOS MONEDAS S-LIMITE ÚNICO PARA LAS DOS MONEDAS A NIVEL DE CONTRATO T-LÍMITE ÚNICO PARA LAS DOS MONEDAS A NIVEL DE CONTRATO, TARJETA Y LÍNEA.
);

-- En este apartado se describen los campos comunes que preceden al resto de estruc
-- turas de registro en todos y cada uno de los siguientes tipos de registro. La es
-- tructura común inicial para todos los tipos de registros de cabecera y pie es AT
-- INTCAB, para los registros de detalle ATINTDE1.
CREATE TABLE Tabla442 (
    INDMONUNI            VARCHAR(1)      -- INDICADOR DE MONEDA ÚNICA POR CONTRATO (S/N). SI EL INDICADOR DE ADMISIÓN DE EXTRACTOS INDEXTMON INDICA UNA ÚNICA MONEDA (VALOR “N”), EL INDICADOR DE MONEDA ÚNICA SOLO PUEDE VALER “S”.,
    INDLIMITEU           VARCHAR(1)      -- INDICADOR DE LÍMITE ÚNICO LÍNEA REVOLVING Y COMPRA CUOTAS (S/N),
    PORIMPAGA            DECIMAL(7, 4)   -- PORCENTAJE DE TOLERANCIA PARA ENTRADA EN IMPAGO,
    IMPMINMOR            DECIMAL(17, 2)  -- IMPORTE MÍNIMO PARA ENTRADA EN IMPAGO,
    IMPMINMIN            DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO MÍNIMO,
    PORTOLTOT            DECIMAL(7, 4)   -- PORCENTAJE DE TOLERANCIA PARA CUBRIR PAGO TOTAL POR TIPO DE LÍNEA Y NO APLICAR SALDO APLAZADO,
    IMPTOLTOT            DECIMAL(17, 2)  -- IMPORTE MÁXIMO DE TOLERANCIA PARA CUBRIR PAGO POR TIPO DE LÍNEA Y NO APLICAR SALDO APLAZADO,
    IMPMAILING           DECIMAL(17, 2)  -- IMPORTE PARA GENERAR MAILING,
    NUMMESCAMGLIQ        INT             -- NÚMERO MÍNIMO DE MESES QUE DEBEN TRANSCURRIR ENTRE DOS CAMBIOS DE GRUPO DE LIQUIDACIÓN,
    INDCTADOM            VARCHAR(1)      -- INDICADOR DE ADMISIÓN DE CUENTA DE DOMICILIACIÓN AJENA,
    IMPMINSALACRTR       DECIMAL(17, 2)  -- IMPORTE MÍNIMO POR OPERACIÓN DE SALDO ACREEDOR PARA TRASPASAR
);

-- A continuación, detallamos la estructura propia de la interfaz (ATTARPRO): Campo
-- s comunes a todos los registros: ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO EMISOR.
--  TIPO DE REGISTRO ‘PR’:
CREATE TABLE Tabla443 (
    IMPMAXSALACRTR       DECIMAL(17, 2)  -- IMPORTE MÁXIMO POR OPERACIÓN SALDO ACREEDOR PARA TRASPASAR,
    NDIAPENDEVO          INT             -- RESERVADO PARA USO FUTURO.,
    GRUPOLIQ             INT             -- GRUPO DE LIQUIDACIÓN POR DEFECTO PARA EL PRODUCTO,
    DESGRUPOLIQ          VARCHAR(30)     -- DESCRIPCIÓN DE GRUPOLIQ,
    FORPAGO              INT             -- FORMA DE PAGO POR DEFECTO PARA EL PRODUCTO,
    DESFORPAGO           VARCHAR(30)     -- DESCRIPCIÓN DE LA FORMA DE PAGO 00 – PAGO DÉBITO CONTADO 01 – PAGO TOTAL 02 – PAGO FIJO 03 – PAGO APLAZADO 04 – PAGO FIJO CON OP. FINANCIADAS,
    PORLIMAUTCRE         DECIMAL(7, 4)   -- % AMPLIACIÓN DE DISPONIBLE PARA AUTORIZACIÓN DE OPERACIONES,
    NUMMESCOBCUO         INT             -- NÚMERO DE MESES PARA LA GENERACIÓN DE LA CUOTA DE ADMINISTRACIÓN.,
    DESPRODRED           VARCHAR(10)     -- DESCRIPCIÓN REDUCIDA DEL PRODUCTO
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO EMISOR. TIPO DE REGISTRO ‘PR’: ESTRUCTUR
-- A TIPO DE REGISTRO DE CONDICIÓN ECONOMICA. TIPO DE REGISTRO ‘CE’:
CREATE TABLE Tabla444 (
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE - E – EMISOR,
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE LA CONDICIÓN ECONÓMICA,
    FECINI               UNKNOWN         -- FECHA DE INICIO DE LA CONDICIÓN ECONÓMICA,
    FECFIN               UNKNOWN         -- FECHA DE FIN DE LA CONDICIÓN ECONÓMICA
);

-- ESTRUCTURA TIPO DE REGISTRO DE CONDICIÓN ECONOMICA. TIPO DE REGISTRO ‘CE’: ESTRU
-- CTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-CONCEPTO ECONOMICO.
CREATE TABLE Tabla445 (
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE - E – EMISOR,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONECO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    IMPFIJO              DECIMAL(17, 2)  -- IMPORTE FIJO
);

-- ESTRUCTURA TIPO DE REGISTRO DE CONDICIÓN ECONOMICA. TIPO DE REGISTRO ‘CE’: ESTRU
-- CTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-CONCEPTO ECONOMICO.
CREATE TABLE Tabla446 (
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    IMPMAX               DECIMAL(17, 2)  -- IMPORTE MÁXIMO,
    PORUF                DECIMAL(7, 4)   -- PORCENTAJE DE APLICACIÓN DE UNIDAD FICTICIA SOBRE EL IMPORTE CALCULADO DE LA APLICACIÓN DEL CONCEPTO ECONÓMICO, SE TRATA DE UN IMPORTE FIJO DEFINIDO COMO UN PORCENTAJE, SE DEBE DIVIDIR POR 100 PARA OBTENER EL VALOR REAL. SOLAMENTE APLICA A COMISIONES.,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    SIGN_REDONDEO        VARCHAR(1)      -- SIGNO DEL REDONDEO (+/-),
    REDONDEO             INT             -- REDONDEO A APLICAR AL IMPORTE RESULTANTE DE APLICAR EL CONCEPTO ECONÓMICO.,
    DESREDONDEO          VARCHAR(30)     -- DESCRIPCIÓN DE REDONDEO: -2 – CENTÉSIMA -1 – DÉCIMA 0 – UNIDAD 1 – DECENA 2 – CENTENA,
    INDPORTRAMO          VARCHAR(1)      -- INDICADOR DE FORMA DE UTILIZACIÓN DEL CAMPO PORTRAMO DE LA TABLA DE TRAMOS.,
    DESINDPORTRAMO       VARCHAR(30)     -- DESCRIPCIÓN DE INDPORTRAMO: P – PORCENTAJE D – DIVISOR F – FIJO (SOLAMENTE PAGO APLAZADO),
    PORREF               DECIMAL(7, 4)   -- PORCENTAJE O DIVISOR DE REFERENCIA PARA CAMBIOS MASIVOS EN TODOS LOS TRAMOS DONDE APAREZCA ESTE CONCEPTO ECONÓMICO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL IMPORTE (+/-)
);

-- ESTRUCTURA TIPO DE REGISTRO DE CONDICIÓN ECONOMICA. TIPO DE REGISTRO ‘CE’: ESTRU
-- CTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-CONCEPTO ECONOMICO.
CREATE TABLE Tabla447 (
    INDBONOPE            VARCHAR(1)      -- INDICADOR DE BONIFICACIÓN POR NÚMERO DE OPERACIONES (S/N),
    INDAPLICA            VARCHAR(1)      -- INDICADOR DE APLICACIÓN DEL CONCEPTO ECONÓMICO:,
    DESINDAPLICA         VARCHAR(30)     -- DESCRIPCIÓN DE INDAPLICA H – HORIZONTAL (SÓLO EL TRAMO) V – VERTICAL (TODOS LOS TRAMOS) N – SIN TRAMOS,
    CODIMPTO             INT             -- TIPO DE IMPUESTO APLICADO,
    DESIMPTO             VARCHAR(30)     -- DESCRIPCIÓN DE CODIMPTO,
    NIVAPLICA            VARCHAR(2)      -- NIVEL DE APLICACIÓN:,
    DESNIVAPLICA         VARCHAR(30)     -- DESCRIPCIÓN DE NIVAPLICA: CO – CONTRATO TA – TARJETA,
    PROCESO              VARCHAR(10)     -- RESERVADO PARA USO FUTURO.,
    IDEIMPAPL            VARCHAR(10)     -- RESERVADO PARA USO FUTURO.,
    FECALTACE            UNKNOWN         -- FECHA DE ALTA CONCEPTO ECONOMICO,
    FECINICE             UNKNOWN         -- FECHA DE INICIO CONCEPTO ECONOMICO,
    FECFINCE             UNKNOWN         -- FECHA DE FIN CONCEPTO ECONOMICO,
    INDCONFIN            VARCHAR(1)      -- INDICADOR DE CONCEPTO FINANCIABLE (S/N),
    INDAPLACR            VARCHAR(1)      -- INDICA SI SE SIGUEN APLICANDO LOS CONCEPTOS CON SALDO ACREEDOR (S/N). (ÚNICAMENTE PARA OPERACIONES REVOLVING).,
    INDAPLIMP            VARCHAR(1)      -- INDICA SI EL CONCEPTO TIENE IMPUESTOS ASOCIADOS,
    TIPCONECO            VARCHAR(1)      -- TIPO DE CONCEPTO ECONÓMICO.
);

-- ESTRUCTURA TIPO DE REGISTRO DE CONDICIÓN ECONOMICA. TIPO DE REGISTRO ‘CE’: ESTRU
-- CTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-CONCEPTO ECONOMICO.
CREATE TABLE Tabla448 (
    DESTIPCONECO         VARCHAR(30)     -- DESCRIPCIÓN DE TIPCONECO: C – COMISIÓN I – INTERÉS Y- INTERESES SOBRE COMISIONES,
    CODCONCEP            VARCHAR(4)      -- CÓDIGO DE CONCEPTO INTERÉS ASOCIADO AL CONCEPTO DE COMISIÓN,
    DESCONCEP            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONCEP
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-CONCEPTO ECONOMICO. 
-- TIPO DE REGISTRO ‘CG’:
CREATE TABLE Tabla449 (
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    CODMAR               INT             -- CÓDIGO DE MARCA DE TARJETA,
    DESMAR               VARCHAR(30)     -- DESCRIPCIÓN DE CODMAR,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT              VARCHAR(30)     -- DESCRIPCIÓN DE INDTIPT,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONECO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    IMPFIJO              DECIMAL(17, 2)  -- IMPORTE FIJO
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-CONCEPTO ECONOMICO. 
-- TIPO DE REGISTRO ‘CG’:
CREATE TABLE Tabla450 (
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    IMPMAX               DECIMAL(17, 2)  -- IMPORTE MÁXIMO,
    FECALTA              UNKNOWN         -- FECHA DE ALTA,
    PORUF                DECIMAL(7, 4)   -- PORCENTAJE DE APLICACIÓN DE UNIDAD FICTICIA SOBRE EL IMPORTE CALCULADO DE LA APLICACIÓN DEL CONCEPTO ECONÓMICO, SE TRATA DE UN IMPORTE FIJO DEFINIDO COMO UN PORCENTAJE, SE DEBE DIVIDIR POR 100 PARA OBTENER EL VALOR REAL. SOLAMENTE APLICA A COMISIONES.,
    SIGN_REDONDEO        VARCHAR(1)      -- SIGNO DEL REDONDEO (+/-),
    REDONDEO             INT             -- REDONDEO A APLICAR AL IMPORTE RESULTANTE DE APLICAR EL CONCEPTO ECONÓMICO.,
    DESREDONDEO          VARCHAR(30)     -- DESCRIPCIÓN DE REDONDEO: -2 – CENTÉSIMA -1 – DÉCIMA 0 – UNIDAD 1 – DECENA 2 – CENTENA,
    INDPORTRAMO          VARCHAR(1)      -- INDICADOR DE FORMA DE UTILIZACIÓN DEL CAMPO PORTRAMO DE LA TABLA DE TRAMOS.,
    DESINDPORTRAMO       VARCHAR(30)     -- DESCRIPCIÓN DE INDPORTRAMO: P – PORCENTAJE D – DIVISOR F – FIJO (SOLAMENTE PAGO APLAZADO),
    PORREF               DECIMAL(7, 4)   -- PORCENTAJE O DIVISOR DE REFERENCIA PARA CAMBIOS MASIVOS EN TODOS LOS TRAMOS DONDE APAREZCA ESTE CONCEPTO ECONÓMICO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL IMPORTE (+/-)
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-TIPO TARJETA- CONCEP
-- TO ECONOMICO. TIPO DE REGISTRO ‘CT’:
CREATE TABLE Tabla451 (
    INDBONOPE            VARCHAR(1)      -- INDICADOR DE BONIFICACIÓN POR NÚMERO DE OPERACIONES (S/N),
    INDAPLICA            VARCHAR(1)      -- INDICADOR DE APLICACIÓN DEL CONCEPTO ECONÓMICO.,
    DESINDAPLICA         VARCHAR(30)     -- DESCRIPCIÓN DE INDAPLICA: H – HORIZONTAL (SÓLO EL TRAMO) V – VERTICAL (TODOS LOS TRAMOS) N – SIN TRAMOS,
    CODIMPTO             INT             -- TIPO DE IMPUESTO APLICADO,
    DESIMPTO             VARCHAR(30)     -- DESCRIPCIÓN DE CODIMPTO,
    NIVAPLICA            VARCHAR(2)      -- NIVEL DE APLICACIÓN.,
    DESNIVAPLICA         VARCHAR(30)     -- DESCRIPCIÓN DE NIVAPLICA CO – CONTRATO TA – TARJETA,
    PROCESO              VARCHAR(10)     -- RESERVADO PARA USO FUTURO.,
    IDEIMPAPL            VARCHAR(10)     -- RESERVADO PARA USO FUTURO.,
    FECALTACE            UNKNOWN         -- FECHA DE ALTA CONCEPTO ECONOMICO,
    FECINICE             UNKNOWN         -- FECHA DE INICIO CONCEPTO ECONOMICO,
    FECFINCE             UNKNOWN         -- FECHA DE FIN CONCEPTO ECONOMICO,
    INDCONFIN            VARCHAR(1)      -- INDICADOR DE CONCEPTO FINANCIABLE (S/N),
    INDAPLACR            VARCHAR(1)      -- INDICA SI SE SIGUEN APLICANDO LOS CONCEPTOS CON SALDO ACREEDOR (S/N). (ÚNICAMENTE PARA OPERACIONES REVOLVING).,
    INDAPLIMP            VARCHAR(1)      -- INDICA SI EL CONCEPTO TIENE IMPUESTOS ASOCIADOS,
    TIPCONECO            VARCHAR(1)      -- TIPO DE CONCEPTO ECONÓMICO.
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-TIPO TARJETA- CONCEP
-- TO ECONOMICO. TIPO DE REGISTRO ‘CT’:
CREATE TABLE Tabla452 (
    DESTIPCONECO         VARCHAR(30)     -- DESCRIPCIÓN DE TIPCONECO: C – COMISIÓN I – INTERÉS Y- INTERESES SOBRE COMISIONES,
    CODCONCEP            VARCHAR(4)      -- CÓDIGO DE CONCEPTO INTERÉS ASOCIADO AL CONCEPTO DE COMISIÓN,
    DESCONCEP            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONCEP
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-TIPO TARJETA- CONCEP
-- TO ECONOMICO. TIPO DE REGISTRO ‘CT’:
CREATE TABLE Tabla453 (
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CODMAR               INT             -- CÓDIGO DE MARCA DE TARJETA,
    DESMAR               VARCHAR(30)     -- DESCRIPCIÓN DE CODMAR,
    INDTIPT              INT             -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT              VARCHAR(30)     -- DESCRIPCIÓN DE INDTIPT,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONECO,
    TIPOACCESO           VARCHAR(1)      -- TIPO DE ACCESO.,
    DESACCESO            VARCHAR(30)     -- DESCRIPCIÓN DE TIPOACCESO: I – IMPORTE M – MESES E IMPORTE,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE LA MONEDA
);

-- ESTRUCTURA TIPO DE REGISTRO DE PRODUCTO-CONDICION ECONOMICA-TIPO TARJETA- CONCEP
-- TO ECONOMICO. TIPO DE REGISTRO ‘CT’:
CREATE TABLE Tabla454 (
    TRAMOFIN             DECIMAL(17, 2)  -- VALOR FINAL DE APLICACIÓN DEL CONCEPTO ECONÓMICO,
    PORTRAMO             DECIMAL(13, 4)  -- PORCENTAJE, DIVISOR O FIJO A APLICAR AL IMPORTE PARA EL TRAMO
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS. TIPO DE REGISTRO ‘TR’: ESTRUCTURA 
-- TIPO DE REGISTRO DE ONDICIONES ECONOMICAS-TIPO DE CUOTA- CONCEPTO ECONOMICO.
CREATE TABLE Tabla455 (
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(30)     -- DESCRIPCIÓN DE CODTIPC,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONECO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE: E – EMISOR,
    IMPFIJO              DECIMAL(17, 2)  -- IMPORTE FIJO,
    IMPMIN               DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    IMPMAX               DECIMAL(17, 2)  -- IMPORTE MÁXIMO,
    FECALTA              UNKNOWN         -- FECHA DE ALTA
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS. TIPO DE REGISTRO ‘TR’: ESTRUCTURA 
-- TIPO DE REGISTRO DE ONDICIONES ECONOMICAS-TIPO DE CUOTA- CONCEPTO ECONOMICO.
CREATE TABLE Tabla456 (
    PORUF                DECIMAL(7, 4)   -- PORCENTAJE DE APLICACIÓN DE UNIDAD FICTICIA SOBRE EL IMPORTE CALCULADO DE LA APLICACIÓN DEL CONCEPTO ECONÓMICO, SE TRATA DE UN IMPORTE FIJO DEFINIDO COMO UN PORCENTAJE, SE DEBE DIVIDIR POR 100 PARA OBTENER EL VALOR REAL. SOLAMENTE APLICA A COMISIONES.,
    SIGN_REDONDEO        VARCHAR(1)      -- SIGNO DEL CAMPO REDONDEO(+/-),
    REDONDEO             INT             -- REDONDEO A APLICAR AL IMPORTE RESULTANTE DE APLICAR EL CONCEPTO ECONÓMICO.,
    DESREDONDEO          VARCHAR(30)     -- DESCRIPCIÓN DE REDONDEO -2 – CENTÉSIMA -1 – DÉCIMA 0 – UNIDAD 1 – DECENA 2 – CENTENA,
    TIPOACCESO           VARCHAR(1)      -- TIPO DE ACCESO,
    DESACCESO            VARCHAR(30)     -- DESCRIPCIÓN DE TIPOACCESO: I – IMPORTE M – MESES E IMPORTE,
    INDCAPINTC           VARCHAR(1)      -- INDICADOR DE CAPITALIZACIÓN DE CONCEPTO.,
    DESCAPINTC           VARCHAR(30)     -- DESCRIPCIÓN DE INDCAPINTC: – CARGAR EN EL ALTA DE LA COMPRA EN CUOTAS. – PRORRATEAR. – CARGAR CON LA PRIMERA CUOTA – FINANCIAR.,
    INDPORTRAMO          VARCHAR(1)      -- INDICADOR DE FORMA DE UTILIZACIÓN DEL CAMPO PORTRAMO DE LA TABLA DE TRAMOS.,
    DESINDPORTRAMO       VARCHAR(30)     -- DESCRIPCIÓN DE INDPORTRAMO: P – PORCENTAJE D – DIVISOR F–FIJO (SOLAMENTE PAGO APLAZADO)
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS. TIPO DE REGISTRO ‘TR’: ESTRUCTURA 
-- TIPO DE REGISTRO DE ONDICIONES ECONOMICAS-TIPO DE CUOTA- CONCEPTO ECONOMICO.
CREATE TABLE Tabla457 (
    PORREF               DECIMAL(7, 4)   -- PORCENTAJE O DIVISOR DE REFERENCIA PARA CAMBIOS MASIVOS EN TODOS LOS TRAMOS DONDE APAREZCA ESTE CONCEPTO ECONÓMICO,
    SIGNO                VARCHAR(1)      -- SIGNO DEL IMPORTE (+/-),
    INDBONOPE            VARCHAR(1)      -- INDICADOR DE BONIFICACIÓN POR NÚMERO DE OPERACIONES (S/N),
    INDAPLICA            VARCHAR(1)      -- INDICADOR DE APLICACIÓN DEL CONCEPTO ECONÓMICO.,
    DESINDAPLICA         VARCHAR(30)     -- DESCRIPCIÓN DE INDAPLICA H – HORIZONTAL (SÓLO EL TRAMO) V – VERTICAL (TODOS LOS TRAMOS) N – SIN TRAMOS,
    CODIMPTO             INT             -- TIPO DE IMPUESTO APLICADO,
    DESIMPTO             VARCHAR(30)     -- DESCRIPCIÓN DE CODIMPTO,
    NIVAPLICA            VARCHAR(2)      -- NIVEL DE APLICACIÓN.,
    DESNIVAPLICA         VARCHAR(30)     -- DESCRIPCIÓN DE NIVAPLICA CO – CONTRATO TA – TARJETA,
    PROCESO              VARCHAR(10)     -- RESERVADO PARA USO FUTURO.,
    IDEIMPAPL            VARCHAR(10)     -- RESERVADO PARA USO FUTURO.,
    FECALTACE            UNKNOWN         -- FECHA DE ALTA CONCEPTO ECONOMICO,
    FECINICE             UNKNOWN         -- FECHA DE INICIO CONCEPTO ECONOMICO,
    FECFINCE             UNKNOWN         -- FECHA DE FIN CONCEPTO ECONOMICO,
    INDCONFIN            VARCHAR(1)      -- INDICADOR DE CONCEPTO FINANCIABLE (S/N),
    INDAPLACR            VARCHAR(1)      -- INDICA SI SE SIGUEN APLICANDO LOS CONCEPTOS CON SALDO ACREEDOR (S/N). (ÚNICAMENTE PARA OPERACIONES REVOLVING).
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS. TIPO DE REGISTRO ‘TR’: ESTRUCTURA 
-- TIPO DE REGISTRO DE ONDICIONES ECONOMICAS-TIPO DE CUOTA- CONCEPTO ECONOMICO.
CREATE TABLE Tabla458 (
    INDAPLIMP            VARCHAR(1)      -- INDICA SI EL CONCEPTO TIENE IMPUESTOS ASOCIADOS,
    TIPCONECO            VARCHAR(1)      -- TIPO DE CONCEPTO ECONÓMICO.,
    DESTIPCONECO         VARCHAR(30)     -- DESCRIPCIÓN DE TIPCONECO: C – COMISIÓN I – INTERÉS Y- INTERESES SOBRE COMISIONES,
    CODCONCEP            VARCHAR(4)      -- CÓDIGO DE CONCEPTO INTERÉS ASOCIADO AL CONCEPTO DE COMISIÓN,
    DESCONCEP            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONCEP
);

-- ESTRUCTURA TIPO DE REGISTRO DE ONDICIONES ECONOMICAS-TIPO DE CUOTA- CONCEPTO ECO
-- NOMICO. TIPO DE REGISTRO ‘CC’:
CREATE TABLE Tabla459 (
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    TRAMOFIN             DECIMAL(17, 2)  -- VALOR FINAL DEL TRAMO DE APLICACIÓN DEL CONCEPTO ECONÓMICO,
    PORTRAMO             DECIMAL(7, 4)   -- PORCENTAJE/DIVISOR A APLICAR AL IMPORTE DEL TRAMO
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR COMPRA EN CUOTAS. TIPO DE REGIS
-- TRO ‘TT’: TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR TIPO DE COMPRA EN CUO
-- TAS POR COEFICIENTE DE CÁLCULO Y NÚMERO DE MESES.
CREATE TABLE Tabla460 (
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC              VARCHAR(30)     -- DESCRIPCIÓN DE CODTIPC,
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE: E – EMISOR,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONECO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    COECALIMP            INT             -- COEFICIENTE DE CÁLCULO POR IMPORTE,
    TRAMOFIN             DECIMAL(17, 2)  -- VALOR FINAL DEL TRAMO DE APLICACIÓN DEL CONCEPTO ECONÓMICO,
    PORTRAMO             DECIMAL(7, 4)   -- PORCENTAJE O DIVISOR A APLICAR AL IMPORTE DEL TRAMO
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR COMPRA EN CUOTAS. TIPO DE REGIS
-- TRO ‘TT’: TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR TIPO DE COMPRA EN CUO
-- TAS POR COEFICIENTE DE CÁLCULO Y NÚMERO DE MESES.
CREATE TABLE Tabla461 (
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE,
    DESVERTIENTE         VARCHAR(30)     -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    INDREMUNIC           VARCHAR(1)      -- Indicador de remesado factura a factura. Posibles valores S/N,
    IDCRIREM             VARCHAR(8)      -- Id criterio de remesado (este criterio marca la estructura de VALTIREM),
    INDFORZAR            VARCHAR(1)      -- Campo reservado para uso futuro.,
    DESINDFORZAR         VARCHAR(30)     -- DESCRIPCION DE INDFORZAR,
    TIPENVPASCOM         VARCHAR(2)      -- Indicador de envío a pasivo comercios: ND – Nominal y descuento NE – Neto NI - Nominal y descuentos independientes,
    DESTIPENVPASCOM      VARCHAR(30)    ,
    FECALTA              UNKNOWN         -- Fecha de alta,
    FECINI               UNKNOWN         -- Fecha de inicio para asignar producto,
    FECFIN               UNKNOWN         -- Fecha de fin para asignar producto,
    INDPROACT            VARCHAR(1)      -- Indicador de restricción de productos a códigos de actividad: I – Por inclusión: solo se permite asociar comercios que pertenezcan a sectores de actividad parametrizados en la tabla Producto Merchant por Actividad E – Por exclusión: no se permite asociar comercios que pertenezcan a sectores de actividad parametrizados en la tabla Producto Merchant por Actividad T – Todas: No se restringe.,
    DESINDPROACT         VARCHAR(30)     -- DESCRIPCION DE INDPROACT
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR COMPRA EN CUOTAS. TIPO DE REGIS
-- TRO ‘TT’: TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR TIPO DE COMPRA EN CUO
-- TAS POR COEFICIENTE DE CÁLCULO Y NÚMERO DE MESES.
CREATE TABLE Tabla462 (
    INDCTADOMCOM         VARCHAR(1)      -- Indicador de cuenta de domiciliación obligatoria para comercios,
    INDCTAAJECOM         VARCHAR(1)      -- Indicador de cuenta de domiciliación ajena permitida para comercios,
    INDRETDESC           VARCHAR(1)      -- Indicador de retención de descuento “S” = el abono se realiza con anterioridad a la aplicación del descuento. “N” = el abono y el descuento se aplican el mismo día.,
    LIMCONSUL            DECIMAL(17, 2)  -- Límite de consulta para remesas automáticas,
    LIMCONSULM           DECIMAL(17, 2)  -- Límite de consulta para remesas manuales (origen bacaladeras…),
    NUMDIALIQ            INT             -- Días de carencia de liquidación a partir de fecha de remesa.,
    DIAFIJSEM            VARCHAR(1)      -- Día fijo de la semana para abonar/cargar la remesa,
    DIAFIJMES            INT             -- Día fijo del mes para abonar/cargar la remesa,
    DIAFIJQUINC          INT             -- Día fijo de la quincena para abonar/cargar la remesa,
    TIPCOMER             INT             -- Tipo de comercio – NO APLICA – COMERCIO FISICO – COMERCIO VIRTUAL – FINANCIERA,
    DESTIPCOMER          VARCHAR(30)     -- DESCRIPCION TIPCOMER,
    INDTIPLIQ            VARCHAR(1)      -- Indicador de tipo de liquidación B – Batch O - Online,
    DESINDTIPLIQ         VARCHAR(30)     -- DESCRIPCIÓN DE INDTIPLIQ
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR COMPRA EN CUOTAS. TIPO DE REGIS
-- TRO ‘TT’: TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR TIPO DE COMPRA EN CUO
-- TAS POR COEFICIENTE DE CÁLCULO Y NÚMERO DE MESES.
CREATE TABLE Tabla463 (
    GRFECABO             INT             -- Grupo fecha abono,
    TIPOCALEND           VARCHAR(1)      -- Tipo de calendario: S: Estándar P: Promoción,
    DESTIPOCALEN         VARCHAR(30)     -- Descripción Tipo de Calendario,
    CALFABONO            VARCHAR(1)      -- Periodicidad de pago: D: Pago N días S: Pago día semana M: Pago día mes (n periodos) F: Fecha fija promoción,
    DESCALFABONO         VARCHAR(30)     -- Descripción Periodicidad del pago,
    TOTPERIO             INT             -- Número total de periodos,
    NUMABONOS            INT             -- Numero de plazos de abono de la operación,
    FECINI               UNKNOWN         -- Fecha inicio promoción,
    FECFIN               UNKNOWN         -- Fecha fin promoción,
    FECHAFIJA            UNKNOWN         -- Fecha de la promoción,
    FECEMISOR            UNKNOWN         -- Fecha de cargo de la primera cuota al emisor,
    TIPFECHA             VARCHAR(1)      -- Indicador de fecha de cálculo para la promoción: O: Fecha Operación P: Fecha de proceso,
    FILLER               VARCHAR(768)    -- Relleno
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR TIPO DE COMPRA EN CUOTAS POR CO
-- EFICIENTE DE CÁLCULO Y NÚMERO DE MESES. TIPO DE REGISTRO ‘TM’:
CREATE TABLE Tabla464 (
    GRFECABO             INT             -- Grupo fecha abono,
    NUMPERIO             INT             -- Número de periodo,
    CARLIQ               INT             -- Carencia del abono a partir de fecha de remesa, con la misma periodicidad del calendario: días, semanas y meses,
    DIAFIJSEM            VARCHAR(1)      -- Día fijo de la semana para abonar/cargar la remesa,
    DIAINISEM            VARCHAR(1)      -- Día de inicio de cálculo de la semana para el periodo,
    DIAFINSEM            VARCHAR(1)      -- Día de fin de cálculo de la semana para el periodo
);

-- TRAMOS DE APLICACION DE CONCEPTOS ECONOMICOS POR TIPO DE COMPRA EN CUOTAS POR CO
-- EFICIENTE DE CÁLCULO Y NÚMERO DE MESES. TIPO DE REGISTRO ‘TM’:
CREATE TABLE Tabla465 (
    DIAFIJMES            INT             -- Día fijo del mes para abonar/cargar la remesa,
    DIADESMES            INT             -- Día desde del mes para el periodo,
    DIAHASMES            INT             -- Día hasta del mes para el periodo,
    FILLER               VARCHAR(863)    -- Relleno
);

-- ESTRUCTURA TIPO DE REGISTRO DE GRUPO DE ABONO DEL PRODUCTO MERCHANT TIPO DE REGI
-- STRO ‘GA’: ESTRUCTURA TIPO DE REGISTRO DE PERIODOS POR GRUPO DE ABONO DEL PRODUC
-- TO MERCHANT
CREATE TABLE Tabla466 (
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    DESCON               VARCHAR(50)     -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE         VARCHAR(30)     -- ESCRIPCIÓN DE VERTIENTE E – EMISOR,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO            VARCHAR(30)     -- DESCRIPCIÓN DE CODCONECO,
    CLAMON               INT             -- CLAVE DE MONEDA,
    DESCLAMON            VARCHAR(30)     -- DESCRIPCIÓN DE CLAMON,
    CODREGIMEN           INT             -- Código de régimen fiscal,
    DESREGIMEN           VARCHAR(30)     -- Descripción del régimen fiscal,
    CODIMPTO             INT             -- Código del tipo de impuesto,
    DESIMPTO             VARCHAR(30)     -- Descripción del tipo de impuesto,
    PORIMPGRAV           DECIMAL(7, 4)   -- Porcentaje de importe gravable por el impuesto,
    PORIMPTO             DECIMAL(7, 4)   -- Porcentaje de aplicación del impuesto,
    SIGN_REDONDEO        VARCHAR(1)      -- SIGNO DEL REDONDEO (+/-),
    REDONDEO             INT             -- Redondeo a aplicar al importe resultante de aplicar el impuesto: -9 – redondeo externo -2 – centésima -1 – décima 0 – unidad 1 – decena 2 – centena,
    FILLER               VARCHAR(763)    -- Relleno
);

-- Programa ATBT47: Formatea los registros de detalle. Programa ATBT48: Validación 
-- registros bloqueos y desbloqueos del mismo cliente en fichero. Programa ATBT49: 
-- Genera la cinta.
CREATE TABLE Tabla467 (
    TIPOREGI             VARCHAR(1)      -- Identifica el tipo de registro para que sea tratado por los procesos. En este caso llevará el valor fijo D. (C=Cabecera y D=Detalle),
    CODENTID             VARCHAR(8)      -- Código de Entidad.,
    CODCINTA             VARCHAR(2)      -- Código de Cinta. Código reservado que identifica la cinta relacionada con el proceso que la trata o genera. En este caso llevará el valor fijo ‘60’,
    NUMSECUE             INT             -- Número de secuencia de cinta.,
    CODPROGR             VARCHAR(8)      -- Código del programa.,
    CODCUENT             VARCHAR(20)     -- Código de la Cuenta a bloquear/desbloquear.,
    TIPOOPER             VARCHAR(1)      -- Indica si se trata de una operación de bloqueo o de desbloqueo. Los posibles valores son B/D.,
    INDBLQAC             VARCHAR(1)      -- Indica si se trata de un bloqueo de acumulación. (S/N),
    INDLIBER             VARCHAR(1)      -- Sólo aplica si para TIPOOPER=D y INDBLQAC= S. 1, Liberar los posibles puntos que se encuentran retenidos para bloqueo de acumulación.,
    INDBLQRD             VARCHAR(1)      -- Indica si se trata de un bloqueo de redención. (S/N),
    TXTBLQACUM           VARCHAR(120)    -- SI INDBLQAC = N, irá a espacios. SI INDBLQAC = S, (bloqueo de acumulación) permite indicar el texto asociado a dicho bloqueo.,
    TXTBLQCJE            VARCHAR(120)    -- SI INDBLQRD = N, irá a espacios. SI INDBLQRD = S, (bloqueo de redención)
);

-- Programa ATBT47: Formatea los registros de detalle. Programa ATBT48: Validación 
-- registros bloqueos y desbloqueos del mismo cliente en fichero. Programa ATBT49: 
-- Genera la cinta.
CREATE TABLE Tabla468 (
    MODALIDAD            VARCHAR(1)      -- Indica el tipo de tratamiento a realizar. ‘2’-. Identificador de cliente y tipo de cliente,
    TIPIDCLI             VARCHAR(2)      -- Tipo de identificador de cliente. Informado solo si informado en la entrada.,
    IDCLIENT             VARCHAR(20)     -- Identificador de cliente. Informado solo si informado en la entrada.
);

-- ERROR: No se pudieron procesar las columnas de Tabla469
-- Headers encontrados: ['| INDICE DE FRAUDE DE REFERENCIA (%) PARA | EL INTERVALO: XX-XX-XXXX A XX-XX-XXXX', '| |']


-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Si se cumplimentan dos registros sobre
--  el mismo servicio se ejecutarán ambos consecutivamente, sólo en el caso de info
-- rmar dos panes del mismo contrato.
CREATE TABLE Tabla470 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA               VARCHAR(12)     -- CUENTA DE MEDIOS DE PAGO,
    CODCOM               VARCHAR(15)     -- CODIGO DE COMERCIO
);

-- Si se cumplimentan en un mismo registro datos que cumplen por completo más de un
--  servicio, se ejecutarán ambos servicios. Si se cumplimentan dos registros sobre
--  el mismo servicio se ejecutarán ambos consecutivamente, sólo en el caso de info
-- rmar dos panes del mismo contrato.
CREATE TABLE Tabla471 (
    OFIGESTORA           VARCHAR(4)      -- CODIGO DE OFICINA GESTORA,
    FILLER               VARCHAR(529)    -- ESPACIO RESERVADO PARA USO FUTURO
);

-- Se validan los campos de entrada. Deben venir informados el centro de alta y la 
-- cuenta de comercios, o en su defecto el código de comercio. Lectura del fichero 
-- de entrada. Los datos adicionales a cumplimentar además de los generales son los
--  siguientes:
CREATE TABLE Tabla472 (
    OFIGESTORA           VARCHAR(4)      -- OFICINA GESTORA
);

-- MPJD1060.FINT0002: Registros rechazados. ATCD01: Validación de datos particulare
-- s.
CREATE TABLE Tabla473 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- Código de la cuenta.,
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO,
    IDENTCLI             INT             -- Codigo identificador de cliente,
    FECEST               INT             -- FECHA DE ESTADO,
    ESTPER               VARCHAR(1)      -- SITUACIÓN DEL CIENTE,
    SECTOR               VARCHAR(3)      -- SECTOR ECONÓMICO DE LA PERSONA,
    CNAE                 VARCHAR(6)      -- CÓDIGO CNAE,
    NOPRSNA              VARCHAR(30)     -- NOMBRE DEL CLIENTE,
    NOPRLARG             VARCHAR(63)     -- NOMBRE LARGO DEL CLIENTE,
    NOMBRE               VARCHAR(30)     -- NOMBRE DEL CLIENTE,
    APELLIDO1            VARCHAR(30)     -- PRIMER APELLIDO,
    APELLIDO2            VARCHAR(30)     -- SEGUNDO APELLIDO,
    CTIPPERS             VARCHAR(1)      -- TIPO DE PERSONA,
    FORJUR               VARCHAR(3)      -- FORMA JURÍDICA,
    CTIDOCID             VARCHAR(2)      -- TIPO DE DOCUMENTO IDENTIFICATIVO,
    NUDOCIDE             VARCHAR(12)     -- NÚMERO DE DOCUMENTO IDENTIFICATIVO,
    TPRETLFI             VARCHAR(4)      -- PREFIJO TELEFÓNICO,
    NUTLFNO              INT             -- NÚMERO DE TELÉFONO,
    TELEMOVIL            INT             -- TLÉFONO MÓVIL,
    CIDIOMA              VARCHAR(2)      -- CÓDIGO DE IDIOMA,
    CPOSTAL              VARCHAR(5)      -- CÓDIGO POSTAL
);

-- ATCD01: Validación de datos particulares.
CREATE TABLE Tabla474 (
    DOMICILIO_FISCAL     UNKNOWN         -- DOMICILIO FISCAL,
    NOPOBLAC_FIS         VARCHAR(30)     -- POBLACION,
    NOPROVIN_FIS         VARCHAR(30)     -- PROVINCIA,
    CODPAISDIR_FIS       INT             -- CÓDIGO DE PAÍS,
    NOPAIS_FIS           VARCHAR(20)     -- NOMBRE DEL PAÍS,
    CTICALLE_FIS         VARCHAR(6)      -- TIPO DE DOMICILIO,
    NUPAIS_FIS           INT             -- NÚUMERO DE PAÍS,
    NOMCALLE_FIS         VARCHAR(40)     -- NOMBRE DE CALLE,
    NUMDOMI_FIS          INT             -- NÚMERO,
    TBLOCDOM_FIS         VARCHAR(2)      -- BLOQUE,
    TPTALDOM_FIS         VARCHAR(3)      -- PORTAL,
    TPISODOM_FIS         VARCHAR(2)      -- PISO,
    TPRTADOM_FIS         VARCHAR(2)      -- PUERTA,
    TESCADOM_FIS         VARCHAR(2)      -- ESCALERA,
    RESTODIR_FIS         VARCHAR(40)     -- RESTO DE DIRECCIÓN,
    CPROVINC_FIS         INT             -- CÓDIGO DE PROVINCIA,
    DOMICILIO_VENTANILLA UNKNOWN         -- DOMICILIO VENTANILLA,
    CPOSTAL_VTA          INT             -- CÓDIGO POSTAL,
    NOPOBLAC_VTA         VARCHAR(30)     -- POBLACION,
    NOPROVIN_VTA         VARCHAR(30)     -- PROVINCIA,
    CODPAISDIR_VTA       INT             -- CÓDIGO DE PAÍS,
    NOPAIS_VTA           VARCHAR(20)     -- NOMBRE DEL PAÍS,
    CTICALLE_VTA         VARCHAR(6)      -- TIPO DE DOMICILIO,
    NUPAIS_VTA           INT             -- NÚUMERO DE PAÍS,
    NOMCALLE_VTA         VARCHAR(40)     -- NOMBRE DE CALLE,
    NUMDOMI_VTA          INT             -- NÚMERO,
    TBLOCDOM_VTA         VARCHAR(2)      -- BLOQUE
);

-- ATCD01: Validación de datos particulares.
CREATE TABLE Tabla475 (
    TPTALDOM_VTA         VARCHAR(3)      -- PORTAL,
    TPISODOM_VTA         VARCHAR(2)      -- PISO,
    TPRTADOM_VTA         VARCHAR(2)      -- PUERTA,
    TESCADOM_VTA         VARCHAR(2)      -- ESCALERA,
    RESTODIR_VTA         VARCHAR(40)     -- RESTO DE DIRECCIÓN,
    CPROVINC_VTA         INT             -- CÓDIGO DE PROVINCIA,
    TELEMOVIL_VTA        INT             -- TELÉFONO MOVIL,
    CTIPCLIEN            VARCHAR(2)      -- TIPO DE CLIENTE,
    CSUBTIPCLI           VARCHAR(2)      -- SUBTIPO DE CLIENTE,
    MAIL                 VARCHAR(100)    -- CORREO ELECTRÓNICO,
    CODPAISNCT           INT             -- PAIS DE NACIMIENTO,
    FECNAC               VARCHAR(8)      -- FECHA DE NACIMIENTO,
    CODPAISNAC           INT             -- PAÍS DE NACIONALIDAD,
    SEXO                 VARCHAR(2)      -- SEXO,
    INDESTCIV            VARCHAR(2)      -- ESTADO CIVIL,
    REGECON              VARCHAR(2)      -- RÉGIMEN ECONÓMICO
);

-- El formato que corresponde al registro del fichero de salida sería (ATRNOTIF):
CREATE TABLE Tabla476 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CÓDIGO DE LA CUENTA,
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA (OFUSCADO),
    FECCADTAR            INT             -- FECHA DE CADUCIDAD,
    FECTRN               VARCHAR(10)     -- FECHA LOCAL DE LA OPERACIÓN,
    HORTRN               VARCHAR(8)      -- HORA LOCAL DE LA OPERACIÓN,
    FECPROCES            VARCHAR(10)     -- FECHA DE PROCESO
);

-- El formato que corresponde al registro del fichero de salida sería (ATRNOTIF):
CREATE TABLE Tabla477 (
    HORAPROCESO          VARCHAR(8)      -- HORA DE PROCESO,
    IMPTRN               DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA TITULAR,
    CLAMONTRN            INT             -- CODIGO ISO DE LA MONEDA TITULAR,
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA ORIGINAL,
    CLAMONDIV            INT             -- CODIGO ISO DE LA MONEDA TITULAR,
    TIPMEDIO             VARCHAR(2)      -- MEDIO DE COMUNICACIÓN,
    TIPMEDIODES          VARCHAR(30)     -- DESCRIPCIÓN DEL MEDIO DE COMUNICACIÓN,
    CODEVENT             INT             -- CÓDIGO DE EVENTO DE NOTIFICACIÓN,
    DESEVENT             VARCHAR(30)     -- DESCRIPCIÓN DEL EVENETO,
    DESEVENTRED          VARCHAR(10)     -- DESCRIPCIÓN REDUCIDA DEL EVENTO,
    REFDOC               VARCHAR(20)     -- DOCUMENTO DE REFERENCIA,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    PORINT               DECIMAL(3, 4)   -- PORCENTAJE DE INTERÉS MENSUAL,
    TAE                  DECIMAL(3, 4)   -- Tae/cae,
    IMPINTTOTAL          DECIMAL(17, 2)  -- IMPORTE TOTAL DE INTERESES,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    IMPCOMIS             DECIMAL(17, 2)  -- IMPORTE DE COMISIONES,
    FECALTCOMP           VARCHAR(10)     -- FECHA DE ALTA DE LA COMPRA A PLAZOS,
    FECPROCUO            VARCHAR(10)     -- FECHA DE PRÓXIMA CUOTA,
    IMPCOMAPE            DECIMAL(17, 2)  -- IMPORTE DE LA COMISIÓN DE APERTURA,
    LIMCRECTA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA,
    FORPAGO              INT             -- FORMA DE PAGO
);

-- El formato que corresponde al registro del fichero de salida sería (ATRNOTIF):
CREATE TABLE Tabla478 (
    IMPFPAGOA            DECIMAL(17, 2)  -- IMPORTE FIJO DE PAGO APLAZADO,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE DE PAGO APLAZADO,
    IMPMINPAGOA          DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO APLAZADO,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE DE COMERCIO,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DEL COMERCIO,
    CODPAIS              INT             -- PAÍS DEL COMERCIO,
    NUMSECHIS            NUMERIC(15)     -- SECUENCIAL DE NOTIFICACIÓN,
    CODPUBLI             VARCHAR(10)     -- CÓDIGO DE PUBLICIDAD,
    CODNOTIF             VARCHAR(10)     -- CÓDIGO DE NOTIFICACIÓN,
    FECCAR               VARCHAR(10)     -- FECHA DE CARGO,
    IMPCARGO             DECIMAL(17, 2)  -- IMPORTE DEL VARGO
);

-- El formato que corresponde al registro del fichero de salida sería (ATTKMBOK):
CREATE TABLE Tabla479 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CÓDIGO DE LA CUENTA,
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO,
    TOKEN                VARCHAR(22)     -- NÚMERO DE TOKEN ASOCIADO AL PAN
);

-- El proceso grabará los siguientes registros de salida: Registros con las bajas d
-- e tarjetas EMV;
CREATE TABLE Tabla480 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- NUMERO DE TARJETA,
    TOKENNEGOCIO         VARCHAR(37)     -- FORMADO por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO,
    MOTIVO               VARCHAR(2)      -- MOTIVO DE BAJA
);

-- El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla481 (
    Tipo_de_registro     VARCHAR(2)      -- Valor Fijo "HR",
    Fecha_de_Proceso     INT             -- Fecha De Proceso de la interfaz con formato "AAAAMMDD",
    C_digo_de_organizaci_n INT             -- Código de organización,
    Glosa                VARCHAR(30)     -- Valor fijo "Informacion Iva Digital",
    FILLER               VARCHAR(242)   
);

-- El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla482 (
    Tipo_de_registro     VARCHAR(2)      -- Valor Fijo "DT",
    Producto_1           VARCHAR(22)     -- Corresponde el número de la Tarjeta del Cliente que realizó la Transacción internacional que generó el IVA,
    Producto_2           VARCHAR(20)     -- Corresponde al número de Contrato asociada a la Tarjeta que realizó la transacción internacional que generó el IVA Formado por: Código de entidad (alfanumérico de 4 posiciones) Centro de alta (alfanumérico de 4 posiciones) Cuenta (alfanumérico de 12 posiciones),
    RUT_Del_Cliente_Titular VARCHAR(22)     -- Corresponde al RUT asociado a la Cuenta informada,
    Signo_de_monto_de_TRX_en_d_lares VARCHAR(1)      -- Corresponde el signo del monto de la transacción internacional en dólar (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX_en_d_lares DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional en dólar,
    Signo_de_monto_de_TRX VARCHAR(1)      -- Corresponde el signo del monto de la transacción internacional (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX         DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional,
    Fecha_efectiva       INT             -- Corresponde a la fecha efectiva en la cual se realizó la transacción internacional,
    Fecha_posteo         INT             -- Corresponde a la fecha de proceso de la transacción internacional,
    C_digo_de_Comercio   VARCHAR(15)     -- Corresponde al código de comercio, de largo 15, informado para la transacción internacional
);

-- El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla483 (
    Moneda_de_Origen     INT             -- Corresponde al código de la Moneda de Origen informado para la transacción internacional (en formato ISO 4217 numérico),
    N_mero_o_c_digo_de_la_referencia_internacional NUMERIC(23)     -- N° referencia o microfilm de la transacción. Número único asociado a la transacción,
    Nombre_del_comercio  VARCHAR(27)     -- Nombre del comercio, según la información enviada por SII para el correspondiente código de comercio en el listado : Contribuyentes IVA SD Afectos a Cambio de Sujeto,
    C_digo_pa_s_de_comercio VARCHAR(3)      -- Corresponde al código de país de origen informado para la transacción internacional. En formato ISO 3166-1, Alpha-3; o en su defecto Alpha-2,
    N_mero_o_c_digo_de_la_referencia_bancaria_internacional NUMERIC(23)     -- N° referencia o microfilm de la transacción. Número único asociado a la transacción internacional bancaria,
    MCC_Merchant_category_code_ INT             -- Código de rubro,
    FILLER               VARCHAR(65)    
);

-- El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla484 (
    Tipo_de_registro     VARCHAR(2)      -- Valor Fijo "TR",
    Total_de_registros   VARCHAR(7)      -- Suma todos los registros de la interfaz, incluye reg de Header y Trailer,
    Signo_de_monto_de_TRX_en_d_lares VARCHAR(1)      -- Corresponde el signo del monto de la transacción internacional en dólar (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX_en_d_lares DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional en dólar
);

-- Tabla485
CREATE TABLE Tabla485 (
    Signo_de_monto_de_TRX VARCHAR(1)      -- Corresponde el signo del monto de la transacción internacional (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX         DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional,
    Total_del_monto      DECIMAL(17, 2)  -- Sumatoria del campo Monto de TRX en dólares,
    FILLER               VARCHAR(240)   
);

-- Programa ATB886: Genera fichero con los datos adicionales de los comercios. Prog
-- rama ATB893: Genera fichero de particularización de comercios por marca/tipo. De
-- talle de campos de los campos comunes.
CREATE TABLE Tabla486 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO ‘CO’– DATOS DE COMERCIO ‘CR’– DATOS ADICIONALES DE COMERCIO ‘DC’ – PARTICULARIZACION DE COMERCIOS POR MARCA/TIPO ‘S1‘ – SALDOS PENDIENTES DE 1 A 6 MESES ‘S2’ – SALDOS PENDIENTES DE 6 A 12 MESES,
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla487 (
    NOMCOMRED            VARCHAR(27)     -- Nombre reducido del comercio,
    CODCADENA            VARCHAR(3)      -- Código de cadena comercial,
    DESCADENA            VARCHAR(30)     -- Descripción de cadena comercial,
    CODHOLDING           VARCHAR(4)      -- Código de Holding al que pertenece,
    IDENTCLI             VARCHAR(8)      -- Identificación de cliente en el sistema corporativo de Clientes,
    TIPDOC               VARCHAR(3)      -- Tipo de documento identificativo,
    NUMDOC               VARCHAR(20)     -- Número de documento identificativo,
    PRODUCTO             VARCHAR(2)      -- Código de producto de comercios,
    SUBPRODU             VARCHAR(4)      -- Código de subproducto de comercios,
    DESPROD              VARCHAR(30)     -- Descripción del producto de comercios
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla488 (
    CONPROD              VARCHAR(3)      -- Código de condición económica,
    DESCONRED            VARCHAR(10)     -- Descripción de la condición económica,
    TIPBON               VARCHAR(6)      -- Tipo de bonificación,
    TIPOPROV             VARCHAR(1)      -- Tipo de proveedor: ‘E’ – Establecimiento ‘O’ - Oficina ‘C’ - Cajero,
    CODACT               INT             -- Código de actividad,
    DESACT               VARCHAR(30)     -- Descripción de la actividad,
    NIVAPLCG             VARCHAR(1)      -- Nivel de aplicación del cargo/abono – Comercio – Cadena comercial,
    IBAN                 VARCHAR(4)      -- Código Iban de la Cuenta de Cargo,
    CTACARGO             VARCHAR(30)     -- Cuenta de cargo,
    CLAMON               INT             -- Clave de moneda de la cuenta de cargo,
    DESCLAMON            VARCHAR(30)     -- Descripción Moneda,
    INDTIPCTA            VARCHAR(2)      -- Indicador de tipo de cuenta de cargo,
    INDAJENA             VARCHAR(1)      -- Indicador de cuenta de domiciliación ajena (S/N),
    CODCAM               VARCHAR(6)      -- Código campaña,
    FECALTA              UNKNOWN         -- Fecha de alta comercio,
    FECBAJA              UNKNOWN         -- Fecha de baja,
    MOTBAJA              VARCHAR(2)      -- Motivo de baja,
    DESMOT               VARCHAR(30)     -- Descripción del motivo de baja,
    FECREACT             UNKNOWN         -- Fecha reactivación del comercio,
    CODRIE               INT             -- Código de riesgo,
    FECULTRIE            UNKNOWN         -- Fecha última clasificación riesgo,
    INDCONT              VARCHAR(1)      -- Indicador de comercio contratado/captado: ‘0’ – Contratado ‘1’ – Captado
);

-- Detalle de campos de los campos comunes. En este apartado se describen los campo
-- s comunes que preceden al resto de estructuras de registro en todos y cada uno d
-- e los siguientes tipos de registro.
CREATE TABLE Tabla489 (
    CODPROCESO           INT             -- Código de proceso,
    CODGRUPO             INT             -- Código de grupo de proceso,
    CODREGIMEN           INT             -- Código de régimen fiscal,
    DESREGIMEN           VARCHAR(30)     -- Descripción de régimen fiscal
);

-- Estructura común inicial para todos los tipos de registro (ATENVPCO): Estructura
--  tipo de registro de Datos de Comercios. Tipo de registro ‘CO’:
CREATE TABLE Tabla490 (
    NIVAPLCG             VARCHAR(1)      -- Nivel de aplicación del cargo – Comercio – Cadena comercial,
    PERSCOM              VARCHAR(40)     -- Persona de contacto,
    PREFINTT             VARCHAR(4)      -- Prefijo internacional teléfono de contacto,
    TELEFONO             VARCHAR(10)     -- Teléfono de contacto comercio,
    EMAILCOM             VARCHAR(55)     -- Email de contacto comercio,
    URLCOMER             VARCHAR(40)     -- Dirección electrónica del comercio,
    CODPAISDIR           INT             -- Código ISO de país de la dirección,
    DESCODPAISDIR        VARCHAR(30)     -- Descripción País de la dirección,
    POBLACION            VARCHAR(35)     -- Nombre de la población del comercio,
    TIPVIA               VARCHAR(2)      -- Tipo de vía del comercio,
    NOMVIA               VARCHAR(40)     -- Nombre de la vía del comercio,
    NUMVIA               VARCHAR(6)      -- Número de la vía del comercio,
    EDIFICIO             VARCHAR(4)      -- Edificio del comercio,
    ESCALERA             VARCHAR(4)      -- Escalera del comercio,
    PISO                 VARCHAR(4)      -- Piso del comercio,
    PUERTA               VARCHAR(4)      -- Puerta del comercio,
    RESTODIR             VARCHAR(40)     -- Resto de la dirección del comercio
);

-- Estructura tipo de registro de Datos de Comercios. Tipo de registro ‘CO’: Estruc
-- tura del tipo de registro de Datos Adicionales de Comercio. Tipo de registro ‘CR
-- ’:
CREATE TABLE Tabla491 (
    CODPOSTAL            VARCHAR(10)     -- Código postal del comercio,
    CODENTCOB            VARCHAR(10)     -- Código de entidad Cobranding,
    PDTOECOB             DECIMAL(7, 4)   -- Porcentaje de cesión del descuento de la entidad a entidad cobranding,
    PDTOCCOB             DECIMAL(7, 4)   -- Porcentaje de cesión del descuento del comercio a entidad cobranding
);

-- Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de regist
-- ro ‘CR’: Estructura del tipo de registro de particularizaciones de comercio por 
-- marca/tipo. Tipo de registro ‘DC’:
CREATE TABLE Tabla492 (
    CODMAR               INT             -- Código de Marca de la Tarjeta,
    DESMAR               VARCHAR(30)     -- Descripción de Marca de la Tarjeta,
    INDTIPT              INT             -- Tipo de la Tarjeta,
    DESTIPT              VARCHAR(30)     -- Descripción del Tipo de la Tarjeta,
    CODCONECO            INT             -- Código de concepto económico,
    DESCONECO            VARCHAR(30)     -- Descripción del concepto económico,
    CLAMON               INT             -- Clave de la moneda,
    TRAMOFIN             DECIMAL(17, 2)  -- Valor final de aplic. de concp. económico,
    TIPOACCESO           VARCHAR(1)      -- Tipo de acceso,
    PORTRAMOPAR          DECIMAL(13, 4)  -- % Particularizado a aplicar en imp. De tramo,
    IMPMINPAR            DECIMAL(17, 2)  -- Imp. Min particularizado a aplicar en tramo,
    IMPMAXPAR            DECIMAL(17, 2)  -- Imp. Mxa. Particularizado a aplicar en tramo,
    FECALTA              VARCHAR(10)     -- Fecha alta tarifa particularizada,
    INDPORPAR            VARCHAR(1)      -- Ind. Porcentaje particularizado,
    INDMINPAR            VARCHAR(1)      -- Ind. Min particularizado,
    INDMAXPAR            VARCHAR(1)      -- Ind. Max particularizado
);

-- Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de regist
-- ro ‘CR’: Estructura del tipo de registro de particularizaciones de comercio por 
-- marca/tipo. Tipo de registro ‘DC’:
CREATE TABLE Tabla493 (
    INDDEBCRE            INT             -- Indicador de Tipo Operación: 1 – Crédito 2 – Débito 4 – Prepago Monedero 5 – Prepago Regalo 6 – Prepago
);

-- Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de regist
-- ro ‘CR’: Estructura del tipo de registro de particularizaciones de comercio por 
-- marca/tipo. Tipo de registro ‘DC’:
CREATE TABLE Tabla494 (
    CLAMON               INT             -- Clave de Moneda,
    DESCLAMON            VARCHAR(12)     -- Descripción moneda,
    Saldos_a_30_D_as     UNKNOWN        ,
    SGN_IMPORTE_30       VARCHAR(1)      -- Signo Importe a 30 días,
    IMPORTE_30           DECIMAL(14, 2)  -- Importe a 30 días,
    SGN_IMPSTO_30        VARCHAR(1)      -- Signo Importe del impuesto a 30 días,
    IMPSTO_30            DECIMAL(14, 2)  -- Importe del impuesto a 30 días,
    SGN_IMPDES_30        VARCHAR(1)      -- Signo Importe del descuento a 30 días,
    IMPDES_30            DECIMAL(14, 2)  -- Importe del descuento a 30 días,
    SGN_IMPBON_30        VARCHAR(1)      -- Signo Importe bonificación del descuento a 30 días,
    IMPBON_30            DECIMAL(14, 2)  -- Importe bonificación del descuento a 30 días,
    SGN_IMPPROPINA__30   VARCHAR(1)      -- Signo Importe de la propina a 30 días,
    IMPPROPINA_30        DECIMAL(14, 2)  -- Importe de la propina a 30 días,
    SGN_IMPEXT_30        VARCHAR(1)      -- Signo Importe externo a 30 días,
    IMPEXT_30            DECIMAL(14, 2)  -- Importe externo a 30 días,
    SGN_IMPOTR1_30       VARCHAR(1)      -- Signo Otros importes1 a 30 días,
    IMPOTR1_30           DECIMAL(14, 2)  -- Otros importes1 a 30 días,
    SGN_IMPOTR2_30       VARCHAR(1)      -- Signo Otros importes2 a 30 días,
    IMPOTR2_30           DECIMAL(14, 2)  -- Otros importes2 a 30 días
);

-- Estructura del tipo de registro de particularizaciones de comercio por marca/tip
-- o. Tipo de registro ‘DC’: Estructura del tipo de registro de saldos pendientes d
-- e pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla495 (
    Saldos_a_60_D_as     UNKNOWN         -- Saldos a 60 Días,
    SGN_IMPORTE_60       VARCHAR(1)      -- Signo Importe de 31 a 60 días,
    IMPORTE_60           DECIMAL(14, 2)  -- Importe de 31 a 60 días,
    SGN_IMPSTO_60        VARCHAR(1)      -- Signo Importe del impuesto de 31 a 60 días,
    IMPSTO_60            DECIMAL(14, 2)  -- Importe del impuesto de 31 a 60 días,
    SGN_IMPDES_60        VARCHAR(1)      -- Signo Importe del descuento de 31 a 60 días,
    IMPDES_60            DECIMAL(14, 2)  -- Importe del descuento de 31 a 60 días,
    SGN_IMPBON_60        VARCHAR(1)      -- Signo Importe bonificación del descuento de 31 a 60 días,
    IMPBON_60            DECIMAL(14, 2)  -- Importe bonificación del descuento de 31 a 60 días,
    SGN_IMPPROPINA__60   VARCHAR(1)      -- Signo Importe de la propina de 31 a 60 días,
    IMPPROPINA_60        DECIMAL(14, 2)  -- Importe de la propina de 31 a 60 días,
    SGN_IMPEXT_60        VARCHAR(1)      -- Signo Importe externo de 31 a 60 días,
    IMPEXT_60            DECIMAL(14, 2)  -- Importe externo de 31 a 60 días,
    SGN_IMPOTR1_60       VARCHAR(1)      -- Signo Otros importes1 de 31 a 60 días,
    IMPOTR1_60           DECIMAL(14, 2)  -- Otros importes1 de 31 a 60 días,
    SGN_IMPOTR2_60       VARCHAR(1)      -- Signo Otros importes2 de 31 a 60 días,
    IMPOTR2_60           DECIMAL(14, 2)  -- Otros importes2 de 31 a 60 días,
    Saldos_a_90_D_as     UNKNOWN         -- Saldos a 90 Días,
    SGN_IMPORTE_90       VARCHAR(1)      -- Signo Importe de 61 a 90 días,
    IMPORTE_90           DECIMAL(14, 2)  -- Importe de 61 a 90 días,
    SGN_IMPSTO_90        VARCHAR(1)      -- Signo Importe del impuesto de 61 a 90 días,
    IMPSTO_90            DECIMAL(14, 2)  -- Importe del impuesto de 61 a 90 días
);

-- Estructura del tipo de registro de particularizaciones de comercio por marca/tip
-- o. Tipo de registro ‘DC’: Estructura del tipo de registro de saldos pendientes d
-- e pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla496 (
    SGN_IMPDES_90        VARCHAR(1)      -- Signo Importe del descuento de 61 a 90 días,
    IMPDES_90            DECIMAL(14, 2)  -- Importe del descuento de 61 a 90 días,
    SGN_IMPBON_90        VARCHAR(1)      -- Signo Importe bonificación del descuento de 61 a 90 días,
    IMPBON_90            DECIMAL(14, 2)  -- Importe bonificación del descuento de 61 a 90 días,
    SGN_IMPPROPINA__90   VARCHAR(1)      -- Signo Importe de la propina de 61 a 90 días,
    IMPPROPINA_90        DECIMAL(14, 2)  -- Importe de la propina de 61 a 90 días,
    SGN_IMPEXT_90        VARCHAR(1)      -- Signo Importe externo de 61 a 90 días,
    IMPEXT_90            DECIMAL(14, 2)  -- Importe externo de 61 a 90 días,
    SGN_IMPOTR1_90       VARCHAR(1)      -- Signo Otros importes1 de 61 a 90 días,
    IMPOTR1_90           DECIMAL(14, 2)  -- Otros importes1 de 61 a 90 días,
    SGN_IMPOTR2_90       VARCHAR(1)      -- Signo Otros importes2 de 61 a 90 días,
    IMPOTR2_90           DECIMAL(14, 2)  -- Otros importes2 de 61 a 90 días,
    Saldos_a_120_D_as    UNKNOWN         -- Saldos a 120 Días,
    SGN_IMPORTE_120      VARCHAR(1)      -- Signo Importe de 91 a 120 días,
    IMPORTE_120          DECIMAL(14, 2)  -- Importe de 91 a 120 días,
    SGN_IMPSTO_120       VARCHAR(1)      -- Signo Importe del impuesto de 91 a 120 días,
    IMPSTO_120           DECIMAL(14, 2)  -- Importe del impuesto de 91 a 120 días,
    SGN_IMPDES_120       VARCHAR(1)      -- Signo Importe del descuento de 91 a 120 días,
    IMPDES_120           DECIMAL(14, 2)  -- Importe del descuento de 91 a 120 días,
    SGN_IMPBON_120       VARCHAR(1)      -- Signo Importe bonificación del descuento de 91 a 120 días,
    IMPBON_120           DECIMAL(14, 2)  -- Importe bonificación del descuento de 91 a 120 días
);

-- Estructura del tipo de registro de particularizaciones de comercio por marca/tip
-- o. Tipo de registro ‘DC’: Estructura del tipo de registro de saldos pendientes d
-- e pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla497 (
    SGN_IMPPROPINA__120  VARCHAR(1)      -- Signo Importe de la propina de 91 a 120 días,
    IMPPROPINA_120       DECIMAL(14, 2)  -- Importe de la propina de 91 a 120 días,
    SGN_IMPEXT_120       VARCHAR(1)      -- Signo Importe externo de 91 a 120 días,
    IMPEXT_120           DECIMAL(14, 2)  -- Importe externo de 91 a 120 días,
    SGN_IMPOTR1_120      VARCHAR(1)      -- Signo Otros importes1 de 91 a 120 días,
    IMPOTR1_120          DECIMAL(14, 2)  -- Otros importes1 de 91 a 120 días,
    SGN_IMPOTR2_120      VARCHAR(1)      -- Signo Otros importes2 de 91 a 120 días,
    IMPOTR2_120          DECIMAL(14, 2)  -- Otros importes2 de 91 a 120 días,
    Saldos_a_150_D_as    UNKNOWN         -- Saldos a 150 Días,
    SGN_IMPORTE_150      VARCHAR(1)      -- Signo Importe de 121 a 150 días,
    IMPORTE_150          DECIMAL(14, 2)  -- Importe de 121 a 150 días,
    SGN_IMPSTO_150       VARCHAR(1)      -- Signo Importe del impuesto de 121 a 150 días,
    IMPSTO_150           DECIMAL(14, 2)  -- Importe del impuesto de 121 a 150 días,
    SGN_IMPDES_150       VARCHAR(1)      -- Signo Importe del descuento de 121 a 150 días,
    IMPDES_150           DECIMAL(14, 2)  -- Importe del descuento de 121 a 150 días,
    SGN_IMPBON_150       VARCHAR(1)      -- Signo Importe bonificación del descuento de 121 a 150 días,
    IMPBON_150           DECIMAL(14, 2)  -- Importe bonificación del descuento de 121 a 150 días,
    SGN_IMPPROPINA__150  VARCHAR(1)      -- Signo Importe de la propina de 121 a 150 días,
    IMPPROPINA_150       DECIMAL(14, 2)  -- Importe de la propina de 121 a 150 días,
    SGN_IMPEXT_150       VARCHAR(1)      -- Signo Importe externo de 121 a 150 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Ti
-- po de registro ‘S1’:
CREATE TABLE Tabla498 (
    IMPEXT_150           DECIMAL(14, 2)  -- Importe externo de 121 a 150 días,
    SGN_IMPOTR1_150      VARCHAR(1)      -- Signo Otros importes1 de 121 a 150 días,
    IMPOTR1_150          DECIMAL(14, 2)  -- Otros importes1 de 121 a 150 días,
    SGN_IMPOTR2_150      VARCHAR(1)      -- Signo Otros importes2 de 121 a 150 días,
    IMPOTR2_150          DECIMAL(14, 2)  -- Otros importes2 de 121 a 150 días,
    Saldos_a_180_D_as    UNKNOWN         -- Saldos a 180 Días,
    SGN_IMPORTE_180      VARCHAR(1)      -- Signo Importe de 151 a 180 días,
    IMPORTE_180          DECIMAL(14, 2)  -- Importe de 151 a 180 días,
    SGN_IMPSTO_180       VARCHAR(1)      -- Signo Importe del impuesto de 151 a 180 días,
    IMPSTO_180           DECIMAL(14, 2)  -- Importe del impuesto de 151 a 180 días,
    SGN_IMPDES_180       VARCHAR(1)      -- Signo Importe del descuento de 151 a 180 días,
    IMPDES_180           DECIMAL(14, 2)  -- Importe del descuento de 151 a 180 días,
    SGN_IMPBON_180       VARCHAR(1)      -- Signo Importe bonificación del descuento de 151 a 180 días,
    IMPBON_180           DECIMAL(14, 2)  -- Importe bonificación del descuento de 151 a 180 días,
    SGN_IMPPROPINA__180  VARCHAR(1)      -- Signo Importe de la propina de 151 a 180 días,
    IMPPROPINA_180       DECIMAL(14, 2)  -- Importe de la propina de 151 a 180 días,
    SGN_IMPEXT_180       VARCHAR(1)      -- Signo Importe externo de 151 a 180 días,
    IMPEXT_180           DECIMAL(14, 2)  -- Importe externo de 151 a 180 días,
    SGN_IMPOTR1_180      VARCHAR(1)      -- Signo Otros importes1 de 151 a 180 días,
    IMPOTR1_180          DECIMAL(14, 2)  -- Otros importes1 de 151 a 180 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Ti
-- po de registro ‘S1’:
CREATE TABLE Tabla499 (
    SGN_IMPOTR2_180      VARCHAR(1)      -- Signo Otros importes2 de 151 a 180 días,
    IMPOTR2_180          DECIMAL(14, 2)  -- Otros importes2 de 151 a 180 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. T
-- ipo de registro ‘S2’:
CREATE TABLE Tabla500 (
    CLAMON               INT             -- Clave de Moneda,
    DESCLAMON            VARCHAR(12)     -- Descripción moneda,
    Saldos_a_210_D_as    UNKNOWN         -- Saldos a 210 Días,
    SGN_IMPORTE_210      VARCHAR(1)      -- Signo Importe de 181 a 210 días,
    IMPORTE_210          DECIMAL(14, 2)  -- Importe de 181 a 210 días,
    SGN_IMPSTO_210       VARCHAR(1)      -- Signo Importe del impuesto de 181 a 210 días,
    IMPSTO_210           DECIMAL(14, 2)  -- Importe del impuesto de 181 a 210 días,
    SGN_IMPDES_210       VARCHAR(1)      -- Signo Importe del descuento de 181 a 210 días,
    IMPDES_210           DECIMAL(14, 2)  -- Importe del descuento de 181 a 210 días,
    SGN_IMPBON_210       VARCHAR(1)      -- Signo Importe bonificación del descuento de 181 a 210 días,
    IMPBON_210           DECIMAL(14, 2)  -- Importe bonificación del descuento de 181 a 210 días,
    SGN_IMPPROPINA__210  VARCHAR(1)      -- Signo Importe de la propina de 181 a 210 días,
    IMPPROPINA_210       DECIMAL(14, 2)  -- Importe de la propina de 181 a 210 días,
    SGN_IMPEXT_210       VARCHAR(1)      -- Signo Importe externo de 181 a 210 días,
    IMPEXT_201           DECIMAL(14, 2)  -- Importe externo de 151 a 210 días,
    SGN_IMPOTR1_210      VARCHAR(1)      -- Signo Otros importes1 de 151 a 210 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. T
-- ipo de registro ‘S2’:
CREATE TABLE Tabla501 (
    IMPOTR1_210          DECIMAL(14, 2)  -- Otros importes1 de 151 a 210 días,
    SGN_IMPOTR2_210      VARCHAR(1)      -- Signo Otros importes2 de 151 a 210 días,
    IMPOTR2_210          DECIMAL(14, 2)  -- Otros importes2 de 151 a 210 días,
    Saldos_a_240_D_as    UNKNOWN         -- Saldos a 240 Días,
    SGN_IMPORTE_240      VARCHAR(1)      -- Signo Importe de 211 a 240 días,
    IMPORTE_240          DECIMAL(14, 2)  -- Importe de 211 a 240 días,
    SGN_IMPSTO_240       VARCHAR(1)      -- Signo Importe del impuesto de 211 a 240 días,
    IMPSTO_240           DECIMAL(14, 2)  -- Importe del impuesto de 211 a 240 días,
    SGN_IMPDES_240       VARCHAR(1)      -- Signo Importe del descuento de 211 a 240 días,
    IMPDES_240           DECIMAL(14, 2)  -- Importe del descuento de 211 a 240 días,
    SGN_IMPBON_240       VARCHAR(1)      -- Signo Importe bonificación del descuento de 211 a 240 días,
    IMPBON_240           DECIMAL(14, 2)  -- Importe bonificación del descuento de 211 a 240 días,
    SGN_IMPPROPINA__240  VARCHAR(1)      -- Signo Importe de la propina de 211 a 240 días,
    IMPPROPINA_240       DECIMAL(14, 2)  -- Importe de la propina de 211 a 240 días,
    SGN_IMPEXT_240       VARCHAR(1)      -- Signo Importe externo de 211 a 240 días,
    IMPEXT_240           DECIMAL(14, 2)  -- Importe externo de 211 a 240 días,
    SGN_IMPOTR1_240      VARCHAR(1)      -- Signo Otros importes1 de 211 a 240 días,
    IMPOTR1_240          DECIMAL(14, 2)  -- Otros importes1 de 211 a 240 días,
    SGN_IMPOTR2_240      VARCHAR(1)      -- Signo Otros importes2 de 211 a 240 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. T
-- ipo de registro ‘S2’:
CREATE TABLE Tabla502 (
    IMPOTR2_240          DECIMAL(14, 2)  -- Otros importes2 de 211 a 240 días,
    Saldos_a_270_D_as    UNKNOWN         -- Saldos a 270 Días,
    SGN_IMPORTE_270      VARCHAR(1)      -- Signo Importe de 241 a 270 días,
    IMPORTE_270          DECIMAL(14, 2)  -- Importe de 241 a 270 días,
    SGN_IMPSTO_270       VARCHAR(1)      -- Signo Importe del impuesto de 241 a 270 días,
    IMPSTO_270           DECIMAL(14, 2)  -- Importe del impuesto de 241 a 270 días,
    SGN_IMPDES_270       VARCHAR(1)      -- Signo Importe del descuento de 241 a 270 días,
    IMPDES_270           DECIMAL(14, 2)  -- Importe del descuento de 241 a 270 días,
    SGN_IMPBON_270       VARCHAR(1)      -- Signo Importe bonificación del descuento de 241 a 270 días,
    IMPBON_270           DECIMAL(14, 2)  -- Importe bonificación del descuento de 241 a 270 días,
    SGN_IMPPROPINA__270  VARCHAR(1)      -- Signo Importe de la propina de 241 a 270 días,
    IMPPROPINA_270       DECIMAL(14, 2)  -- Importe de la propina de 241 a 270 días,
    SGN_IMPEXT_270       VARCHAR(1)      -- Signo Importe externo de 241 a 270 días,
    IMPEXT_270           DECIMAL(14, 2)  -- Importe externo de 241 a 270 días,
    SGN_IMPOTR1_270      VARCHAR(1)      -- Signo Otros importes1 de 241 a 270 días,
    IMPOTR1_270          DECIMAL(14, 2)  -- Otros importes1 de 241 a 270 días,
    SGN_IMPOTR2_270      VARCHAR(1)      -- Signo Otros importes2 de 241 a 270 días,
    IMPOTR2_270          DECIMAL(14, 2)  -- Otros importes2 de 241 a 270 días,
    Saldos_a_300_D_as    UNKNOWN         -- Saldos a 300 Días,
    SGN_IMPORTE_300      VARCHAR(1)      -- Signo Importe de 271 a 300 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. T
-- ipo de registro ‘S2’:
CREATE TABLE Tabla503 (
    IMPORTE_300          DECIMAL(14, 2)  -- Importe de 271 a 300 días,
    SGN_IMPSTO_300       VARCHAR(1)      -- Signo Importe del impuesto de 271 a 300 días,
    IMPSTO_300           DECIMAL(14, 2)  -- Importe del impuesto de 271 a 300 días,
    SGN_IMPDES_300       VARCHAR(1)      -- Signo Importe del descuento de 271 a 300 días,
    IMPDES_300           DECIMAL(14, 2)  -- Importe del descuento de 271 a 300 días,
    SGN_IMPBON_300       VARCHAR(1)      -- Signo Importe bonificación del descuento de 271 a 300 días,
    IMPBON_300           DECIMAL(14, 2)  -- Importe bonificación del descuento de 271 a 300 días,
    SGN_IMPPROPINA__300  VARCHAR(1)      -- Signo Importe de la propina de 271 a 300 días,
    IMPPROPINA_300       DECIMAL(14, 2)  -- Importe de la propina de 271 a 300 días,
    SGN_IMPEXT_300       VARCHAR(1)      -- Signo Importe externo de 271 a 300 días,
    IMPEXT_300           DECIMAL(14, 2)  -- Importe externo de 271 a 300 días,
    SGN_IMPOTR1_300      VARCHAR(1)      -- Signo Otros importes1 de 271 a 300 días,
    IMPOTR1_300          DECIMAL(14, 2)  -- Otros importes1 de 271 a 300 días,
    SGN_IMPOTR2_300      VARCHAR(1)      -- Signo Otros importes2 de 271 a 300 días,
    IMPOTR2_300          DECIMAL(14, 2)  -- Otros importes2 de 271 a 300 días,
    Saldos_a_330_D_as    UNKNOWN         -- Saldos a 330 Días,
    SGN_IMPORTE_330      VARCHAR(1)      -- Signo Importe de 301 a 330 días,
    IMPORTE_330          DECIMAL(14, 2)  -- Importe de 301 a 330 días,
    SGN_IMPSTO_330       VARCHAR(1)      -- Signo Importe del impuesto de 301 a 330 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. T
-- ipo de registro ‘S2’:
CREATE TABLE Tabla504 (
    IMPSTO_330           DECIMAL(14, 2)  -- Importe del impuesto de 301 a 330 días,
    SGN_IMPDES_330       VARCHAR(1)      -- Signo Importe del descuento de 301 a 330 días,
    IMPDES_330           DECIMAL(14, 2)  -- Importe del descuento de 301 a 300 días,
    SGN_IMPBON_330       VARCHAR(1)      -- Signo Importe bonificación del descuento de 301 a 330 días,
    IMPBON_330           DECIMAL(14, 2)  -- Importe bonificación del descuento de 301 a 330 días,
    SGN_IMPPROPINA__330  VARCHAR(1)      -- Signo Importe de la propina de 301 a 330 días,
    IMPPROPINA_330       DECIMAL(14, 2)  -- Importe de la propina de 301 a 330 días,
    SGN_IMPEXT_330       VARCHAR(1)      -- Signo Importe externo de 301 a 330 días,
    IMPEXT_330           DECIMAL(14, 2)  -- Importe externo de 301 a 330 días,
    SGN_IMPOTR1_330      VARCHAR(1)      -- Signo Otros importes1 de 301 a 330 días,
    IMPOTR1_330          DECIMAL(14, 2)  -- Otros importes1 de 301 a 330 días,
    SGN_IMPOTR2_330      VARCHAR(1)      -- Signo Otros importes2 de 301 a 330 días,
    IMPOTR2_330          DECIMAL(14, 2)  -- Otros importes2 de 301 a 330 días,
    Saldos___360         UNKNOWN         -- Saldos > 360,
    SGN_IMPORTE_360      VARCHAR(1)      -- Signo Importe más de 360 días,
    IMPORTE_360          DECIMAL(14, 2)  -- Importe más de 360 días,
    SGN_IMPSTO_360       VARCHAR(1)      -- Signo Importe del impuesto más de 360 días,
    IMPSTO_360           DECIMAL(14, 2)  -- Importe del impuesto más de 360 días,
    SGN_IMPDES_360       VARCHAR(1)      -- Signo Importe del descuento más de 360 días
);

-- Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. T
-- ipo de registro ‘S2’:
CREATE TABLE Tabla505 (
    IMPDES_360           DECIMAL(14, 2)  -- Importe del descuento más de 360 días,
    SGN_IMPBON_360       VARCHAR(1)      -- Signo Importe bonificación del descuento más de 360 días,
    IMPBON_360           DECIMAL(14, 2)  -- Importe bonificación del descuento más de 360 días,
    SGN_IMPPROPINA__360  VARCHAR(1)      -- Signo Importe de la propina más de 360 días,
    IMPPROPINA_360       DECIMAL(14, 2)  -- Importe de la propina más de 360 días,
    SGN_IMPEXT_360       VARCHAR(1)      -- Signo Importe externo más de 360 días,
    IMPEXT_360           DECIMAL(14, 2)  -- Importe externo más de 360 días,
    SGN_IMPOTR1_360      VARCHAR(1)      -- Signo Otros importes1 más de 360 días,
    IMPOTR1_360          DECIMAL(14, 2)  -- Otros importes1 más de 360 días,
    SGN_IMPOTR2_360      VARCHAR(1)      -- Signo Otros importes2 más de 360 días,
    IMPOTR2_360          DECIMAL(14, 2)  -- Otros importes2 más de 360 días
);

-- La estructura de la información emitida viene desglosada de la siguiente forma: 
-- Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes re
-- cibidas en el día.
CREATE TABLE Tabla506 (
    DATOS_COMUNES        UNKNOWN        ,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CUENTA,
    CODCOM               VARCHAR(15)     -- CODIGO DE COMERCIO
);

-- La estructura de la información emitida viene desglosada de la siguiente forma: 
-- Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes re
-- cibidas en el día.
CREATE TABLE Tabla507 (
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO: ‘OP’ – OPERACIONES ‘CE’ – CONC ECO OPERACIONES ‘AU’ – AUTORIZACIONES PTES DE CRUCE Si INDPLAZOS = ‘S’ ‘PP’ – PLAZOS PENDIENTES ‘CP’ – CONCEPTOS ECONOMICOS PLAZOS PENDIENTES,
    NUMORDEN             NUMERIC(12)     -- NÚMERO DE ORDEN
);

-- La estructura de la información emitida viene desglosada de la siguiente forma: 
-- Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes re
-- cibidas en el día.
CREATE TABLE Tabla508 (
    CODCOM               VARCHAR(15)     -- Código de comercio,
    NOMCOMRED            VARCHAR(27)     -- Nombre reducido del comercio,
    CODCADENA            VARCHAR(3)      -- Código de cadena comercial,
    DESCADENA            VARCHAR(30)     -- Descripción de cadena comercial,
    CODHOLDING           VARCHAR(4)      -- Código de Holding al que pertenece,
    DESHOLDIG            VARCHAR(30)     -- Descripción de holding,
    NUMCOMPRO            VARCHAR(23)     -- Número de comprobante,
    NUMREFREM            INT             -- Número de referencia de la remesa,
    NUMREFFAC            VARCHAR(23)     -- Número referencia factura (universal),
    NUMREFFACREM         INT             -- Número referencia factura de la remesa,
    NUMEXTCOM            INT             -- Número de extracto de comercio,
    NUMMOVEXTCO          INT             -- Número de movimiento en el extracto de comercio,
    TIPFRAN              INT             -- Tipo de franquicia,
    DESTIPFRAN           VARCHAR(30)     -- Descripción tipo Franquicia,
    PAN                  VARCHAR(22)     -- PAN de la tarjeta,
    INDNORCOR            INT             -- Indicador de normal o correctora: – Normal – Correctora,
    TIPOFAC              INT             -- Tipo de factura,
    DESTIPFAC            VARCHAR(30)     -- Descripción del tipo de factura,
    TIPOFACSIST          INT             -- Tipo de factura de sistema,
    SIGNO                VARCHAR(1)      -- Signo del importe (+/-),
    CLAMON               INT             -- Clave de moneda
);

-- Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes re
-- cibidas en el día. El formato que corresponde al registro del fichero de salida 
-- sería (ATENVODC):
CREATE TABLE Tabla509 (
    DESCLAMON            VARCHAR(30)     -- Descripción de la moneda,
    CODTIPC              VARCHAR(4)      -- Código de operación en cuotas,
    DESTIPC              VARCHAR(30)     -- Descripción de tipo de compra en cuotas,
    TOTCUOTAS            INT             -- Número total de cuotas (abonos al comercio),
    NUMCUOTACT           INT             -- *campo para uso futuro*,
    NUMABONOS            INT             -- Numero de abonos,
    CODMAR               INT             -- Marca de la tarjeta,
    DESCODMAR            VARCHAR(30)     -- Descripción de la marca de la tarjeta,
    INDTIPT              INT             -- Tipo de la tarjeta,
    DESINDTIPT           VARCHAR(30)     -- Descripción del tipo de la tarjeta,
    INDDEBCRE            INT             -- Indicador de Tipo Operación: – Crédito – Débito – Prepago Monedero – Prepago Regalo – Prepago,
    INDPLAZOS            VARCHAR(1)      -- Indicador de plazos,
    TASADESC             DECIMAL(7, 4)   -- Tasa de Descuento Aplicada al Comercio,
    FECLIQ               UNKNOWN         -- Fecha de Liquidación/Fecha de proceso,
    FECPAGO              UNKNOWN         -- Fecha de Pago,
    FECFAC               UNKNOWN         -- Fecha de Factura,
    NUMAUT               VARCHAR(6)      -- Número de autorización,
    SECOPE               NUMERIC(12)     -- Secuencial Interno de operación,
    IMPDESFAC            DECIMAL(17, 2)  -- Importe descuento de la factura,
    IMPBONFAC            DECIMAL(17, 2)  -- Importe bonificado de la factura,
    IMPIMPTOFAC          DECIMAL(17, 2)  -- Impuesto de la factura,
    IMPPROPINAFAC        DECIMAL(17, 2)  -- Propina de la factura,
    IMPLIQFAC            DECIMAL(17, 2)  -- Importe intercambio de la factura,
    IMPCUOFAC            DECIMAL(17, 2)  -- Importe de la cuota de la factura,
    IMPEXTFAC            DECIMAL(17, 2)  -- Impuesto del extracto de la factura,
    IMPFACFAC            DECIMAL(17, 2)  -- Importe de la factura,
    IMPTASASFAC          DECIMAL(17, 6)  -- Importe de tasas de la factura,
    CODTERM              VARCHAR(16)     -- Código de Terminal,
    FECCONTA             UNKNOWN         -- Fecha Contable,
    SIAIDCD              VARCHAR(4)      -- Identificación de la Autorización,
    INDERROR             VARCHAR(16)     -- Indicador de error Tarjeta Ajena. Error de operatividad de la tarjeta Fecha de factura mayor o igual que la fecha de baja de tarjeta
);

-- Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes re
-- cibidas en el día. El formato que corresponde al registro del fichero de salida 
-- sería (ATENVODC):
CREATE TABLE Tabla510 (
    INDANOM              VARCHAR(8)      -- Indicador de anomalía Excedido plazo de presentación Cuenta de tarjeta bloqueada ABONO Cuenta de tarjeta bloqueada pero la operación está autorizada Tarjeta propia caducada Tarjeta propia robada o perdida pero la operación es de ABONO Situación tarjeta No permitida pero la operación es de ABONO a 8 Libres,
    INDSITREM            VARCHAR(1)      -- Situación de la Remesa,
    DESSITREM            VARCHAR(30)     -- Descripción de la Situación de la Remesa,
    INDOPDCC             VARCHAR(1)      -- Indicador de si es operación DCC (S/N),
    FECBAJA              UNKNOWN         -- Fecha de Baja de las operaciones
);

-- Estructura del tipo de registro de operaciones recibidas en el día. Tipo de regi
-- stro ‘OP’: Estructura del tipo de registro de conceptos económicos en el día. Ti
-- po de registro ‘CE’:
CREATE TABLE Tabla511 (
    NUMEXTCOM            INT             -- Número de extracto de comercio,
    NUMMOVEXTCO          INT             -- Número de movimiento en el extracto de comercio,
    NUMREFREM            INT             -- Número de referencia de la remesa,
    NUMREFFACREM         INT             -- Número de referencia de la factura,
    CODCONECO            INT             -- Código de concepto económico
);

-- Estructura del tipo de registro de operaciones recibidas en el día. Tipo de regi
-- stro ‘OP’: Estructura del tipo de registro de conceptos económicos en el día. Ti
-- po de registro ‘CE’:
CREATE TABLE Tabla512 (
    DESCONECO            VARCHAR(30)     -- Descripción Concepto Económico,
    TIPIMP               INT             -- Tipo de importe: 02 – Comisiones 04 – Impuestos,
    SIGNO                VARCHAR(1)      -- Signo del importe,
    CLAMON               INT             -- Clave de Moneda,
    IMPAPLECO            DECIMAL(17, 2)  -- Importe base de calculo,
    PRAPLECO             DECIMAL(7, 2)   -- Porcentaje de calculo,
    IMPCONCEP            DECIMAL(17, 2)  -- Importe del concepto,
    IMPIMPTO             DECIMAL(17, 2)  -- Importe del impuesto,
    INDENVPAS            VARCHAR(1)      -- Indicador de enviado a pasivo S- Enviado N- No enviado T- Traspasado
);

-- Estructura del tipo de registro de conceptos económicos en el día. Tipo de regis
-- tro ‘CE’: Estructura del tipo de registro de autorizaciones pendientes de cruce.
--  Tipo de registro ‘AU’:
CREATE TABLE Tabla513 (
    TIPOMSGON            VARCHAR(4)      -- Código de mensaje on-line,
    CODPROON             INT             -- Código de proceso on-line,
    SIAIDCD              VARCHAR(19)     -- Código de identificación SIA compuesto de la sesión SIA y del identificador del mensaje,
    PAN                  VARCHAR(22)     -- PAN de la tarjeta que realizó la operación,
    CODMAR               INT             -- Código de marca de tarjeta,
    DESCODMAR            VARCHAR(30)     -- Descripción de Marca,
    INDTIPT              INT             -- Indicador de tipo de tarjeta,
    DESINDTIPT           VARCHAR(30)     -- Descripción de Tipo de tarjeta,
    INDDEBCRE            INT             -- Indicador de operatividad de la operación: – Crédito – Débito – Prepago Regalo – Prepago,
    IMPTRN               DECIMAL(17, 2)  -- Importe de la transacción
);

-- Estructura del tipo de registro de conceptos económicos en el día. Tipo de regis
-- tro ‘CE’: Estructura del tipo de registro de autorizaciones pendientes de cruce.
--  Tipo de registro ‘AU’:
CREATE TABLE Tabla514 (
    CLAMONTRN            INT             -- Código de moneda de la transacción,
    DESCLAMONTRN         VARCHAR(30)     -- Descripción moneda de la transacción,
    IMPCCA               DECIMAL(17, 2)  -- Importe de conciliación,
    CLAMONCCA            INT             -- Código de moneda de conciliación,
    DESCLAMONCCA         VARCHAR(30)     -- Descripción moneda de conciliación,
    IMPDIV               DECIMAL(17, 2)  -- Importe en divisa original,
    CLAMONDIV            INT             -- Código de moneda de la divisa original,
    DESCLAMONDIV         VARCHAR(30)     -- Descripción moneda de la divisa original,
    FECTRN               UNKNOWN         -- Fecha de la transacción,
    HORTRN               UNKNOWN         -- Hora de la transacción,
    CODACT               INT             -- Código de actividad,
    DESACT               VARCHAR(30)     -- Descripción de la actividad,
    CODPAIS              INT             -- Código del país,
    DESPAIS              VARCHAR(30)     -- Descripción del País,
    IDADQUIR             VARCHAR(11)     -- Identificador de adquirente,
    IDTERM               VARCHAR(16)     -- Identificador del terminal,
    CODCOM               VARCHAR(15)     -- Código de comercio,
    NOMCOM               VARCHAR(25)     -- Nombre del establecimiento,
    LOCALIDAD            VARCHAR(15)     -- Localidad del comercio,
    RTSITD               VARCHAR(40)     -- Clave de franquicia,
    DATORI               VARCHAR(30)     -- Datos del origen.,
    NUMAUT               VARCHAR(6)      -- Número de autorización,
    CODRESPU             VARCHAR(3)      -- Código respuesta,
    CODACCRED            INT             -- Código de acción de red,
    TIPFRAN              INT             -- Código de la franquicia,
    DESTIPFRAN           VARCHAR(30)     -- Descripción Franquicia,
    INDNORCOR            INT             -- Indicador de normal o correctora: 0 - Normal
);

-- Estructura del tipo de registro de conceptos económicos en el día. Tipo de regis
-- tro ‘CE’: Estructura del tipo de registro de autorizaciones pendientes de cruce.
--  Tipo de registro ‘AU’:
CREATE TABLE Tabla515 (
    TIPOFAC              INT             -- Tipo de factura,
    DESTIPFAC            VARCHAR(30)     -- Descripción Factura,
    TIPOFACSIST          INT             -- Tipo de factura de sistema,
    SIGNO                VARCHAR(1)      -- Signo del importe (+/-),
    INDPREAUT            INT             -- Indicador de pre-autorización: 0 - Normal 1 - Pre-autorización 2 - Pre-autorización confirmada 3 - Confirmación de la pre-autorización,
    INDCRUCE             INT             -- Indicativo de cruce: – No cruzada – Cruzada – Expirada – Cruzada manual – Cruzada manual y cruzada – Cruzada manual y expirada – Contable – Comunicación contable errónea,
    INDANUL              INT             -- Indicativo de anulación - Transacción sin anular - Transacción anulada,
    IMPTRNCON            DECIMAL(17, 2)  -- Importe transacción en moneda del contrato,
    IMPAUTCON            DECIMAL(17, 2)  -- Importe total autorizado en moneda del contrato,
    CLAMONCON            INT             -- Clave de moneda del contrato,
    DESCLAMONCON         VARCHAR(30)     -- Descripción Moneda,
    FECCONTA             UNKNOWN         -- Fecha contable,
    IMPPROP              DECIMAL(17, 2)  -- Importe de la propina,
    ACCMERCH             VARCHAR(1)      -- Acción de evento Merchant: - No acción - Grabar operación en remesas + actualización saldos – Actualización de saldos del comercio 5 – Remesar en conciliación
);

-- Estructura del tipo de registro de conceptos económicos en el día. Tipo de regis
-- tro ‘CE’: Estructura del tipo de registro de autorizaciones pendientes de cruce.
--  Tipo de registro ‘AU’:
CREATE TABLE Tabla516 (
    FECCADTAR            INT             -- Fecha de caducidad de la tarjeta,
    RESOLUTOR            VARCHAR(11)     -- Identificador de la red o elemento SWITCH que autorizó la operación.,
    IMPCOMISION          DECIMAL(17, 2)  -- Comisión de la operación,
    IMPUESTO             DECIMAL(17, 2)  -- Impuesto de la operación,
    MODENTDAT            VARCHAR(12)     -- Modo de Entrada de Datos,
    NUMCUOTA             INT             -- Numero de cuotas,
    CODTIPC              VARCHAR(4)      -- Tipo de compra en cuotas,
    DESTIPC              VARCHAR(30)     -- Descripción tipo de compra en cuotas
);

-- Estructura del tipo de registro de autorizaciones pendientes de cruce. Tipo de r
-- egistro ‘AU’: Estructura del tipo de registro de plazos pendientes. Tipo de regi
-- stro ‘PP’:
CREATE TABLE Tabla517 (
    NUMREFREM            INT             -- Numero de referencia de la remesa,
    NUMREFFACREM         INT             -- Numero de referencia de la factura,
    NUMPLAZO             INT             -- Número de plazo,
    CLAMON               INT             -- Clave de moneda,
    SIGNO                VARCHAR(1)      -- Signo del importe de Liquidación. Valores ‘+’, ‘-‘,
    FECPROABO            VARCHAR(10)     -- Fecha próximo Abono,
    IMPLIQUID            DECIMAL(17, 2)  -- Importe liquidación,
    IMPFAC               DECIMAL(17, 2)  -- Importe total de la factura,
    IMPSTO               DECIMAL(17, 2)  -- Importe del impuesto,
    IMPDES               DECIMAL(17, 2)  -- Importe del descuento,
    IMPBON               DECIMAL(17, 2)  -- Importe bonificación del descuento,
    IMPPROPINA           DECIMAL(17, 2)  -- Importe de la propina,
    IMPEXT               DECIMAL(17, 2)  -- Impuesto externo,
    IMPTASA              DECIMAL(17, 2)  -- Importe de la tasa fija,
    ESTPLAZO             INT             -- Estado del plazo: 01 – Pendiente 02 – Abonado 04 – Acelerado
);

-- Estructura del tipo de registro de plazos pendientes. Tipo de registro ‘PP’: Est
-- ructura del tipo de registro de conceptos económicos de plazos pendientes. Tipo 
-- de registro ‘CP’:
CREATE TABLE Tabla518 (
    NUMREFREM            INT             -- Numero de referencia de la remesa,
    NUMREFFACREM         INT             -- Numero de referencia de la factura,
    NUMPLAZO             INT             -- Número de plazo,
    CODCONECO            INT             -- Código de concepto económico,
    DESCONECO            VARCHAR(30)     -- Descripción Concepto Económico,
    TIPIMP               INT             -- Tipo de importe: 02 – Comisiones 04 – Impuestos,
    SIGNO                VARCHAR(1)      -- Signo del importe,
    CLAMON               INT             -- Clave de Moneda,
    IMPAPLECO            DECIMAL(17, 2)  -- Importe sobre el que se aplica el concepto económico,
    PRAPLECO             DECIMAL(7, 4)   -- Porcentaje aplicado sobre el concepto económico,
    IMPCONCEP            DECIMAL(17, 2)  -- Importe del concepto,
    IMPIMPTO             DECIMAL(17, 2)  -- Importe de impuesto
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCONEXT):
CREATE TABLE Tabla519 (
    DATOS_GENERALES_OBLIGATORIOS UNKNOWN         -- DATOS GENERALES OBLIGATORIOS,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CODGRU               INT             -- CÓDIGO DE GRUPO CONTABLE 01 = FRANQUICIAS. ENTRADA 02 = INCOMING 03 = COMERCIOS 04 = INCIDENCIAS 05 = TITULARES 06 = OPERACIONES DIARIAS 07 = COMPRA EN CUOTAS 08 = IMPAGADOS 09 = LIQUIDACIÓN 10 = MAESTRO DE RECIBOS 11 = OUTGOING 12 = FRANQUICIAS. SALIDA 27 = Contabilidad Externa,
    CODCCN               INT             -- CONCEPTO CONTABLE,
    IMPORTE              DECIMAL(17, 2)  -- IMPORTE,
    CLAMON               INT             -- CLAVE DE MONEDA,
    FECALTA              UNKNOWN         -- FECHA GRABACIÓN DEL REGISTRO,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE (AAAA-MM- DD),
    FECOPER              UNKNOWN         -- FECHA DE LA OPERACIÓN (AAAA-MM-DD),
    DATOS_GENERALES_NO_OBLIGATORIOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_ UNKNOWN         -- DATOS GENERALES NO OBLIGATORIOS (INFORMAR SI EL PGM DISPONE DE ELLOS),
    IMPORI               DECIMAL(17, 2)  -- IMPORTE ORIGINAL DE LA OPERACIÓN,
    CLAMONORI            INT             -- CLAVE MONEDA ORIGINAL
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCONEXT):
CREATE TABLE Tabla520 (
    CMBAPLIORI           DECIMAL(9, 4)   -- CAMBIO APLICADO PASO DE MONEDA,
    IMPEMI               DECIMAL(17, 2)  -- IMPORTE RECEPCIÓN DE LA OPERACIÓN,
    CLAMONEMI            INT             -- CLAVE MONEDA EMISOR,
    CMBAPLIEMI           DECIMAL(9, 4)   -- CAMBIO APLICADO PASO DE MONEDA EMISOR,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA: NORMAL CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA,
    INDAPLDEBCRE         INT             -- INDICADOR DE OPERATIVIDAD DE LA TARJETA 1 – Crédito 2 – Débito 3 – Mixta 4- Monedero 5- Prepago banda,
    CODACT               INT             -- CÓDIGO ACTIVIDAD ISO,
    CODCONECO            INT             -- CÓDIGO DE CONCEPTO ECONÓMICO,
    SECOPE               NUMERIC(12)     -- SECUENCIA DE LA OPERACIÓN,
    OFIOPE               VARCHAR(4)      -- OFICINA QUE GENERA LA OPERACIÓN,
    IDTERM               VARCHAR(16)     -- IDENTIFICADOR DE TERMINAL,
    IDENTIFICADOR_DE_LA_OPERACI_N__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_SEG_N_SUBSISTEMA_ UNKNOWN         -- IDENTIFICADOR DE LA OPERACIÓN (INFORMAR SI EL PGM DISPONE DE ELLOS SEGÚN SUBSISTEMA),
    SIAIDCD              VARCHAR(19)     -- CÓDIGO IDENTIFICACIÓN DE SIA,
    NUMCINTA             NUMERIC(17)     -- NÚMERO DE CINTA,
    SECLOTE              INT             -- LOTE DENTRO DE LA CINTA,
    CENTALTA             VARCHAR(4)      -- CENTRO ALTA CUENTA TARJETA
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCONEXT):
CREATE TABLE Tabla521 (
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO DE CRÉDITO,
    NUMMOV               INT             -- NÚMERO MOVIMIENTO CRÉDITO O DÉBITO,
    NUMOPECUO            INT             -- NÚMERO OPERACIÓN EN CUOTAS,
    FECINI               UNKNOWN         -- FECHA INICIO,
    FECFIN               UNKNOWN         -- FECHA FIN,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    CENTALTACOM          VARCHAR(4)      -- ALTA CONTRATO COMERCIO,
    CUENTACOM            VARCHAR(12)     -- CONTRATO COMERCIO,
    NUMEXTCOM            INT             -- NÚMERO EXTRACTO COMERCIO,
    NUMMOVEXTCO          INT             -- NÚMERO MOVIMIENTO EXTRACTO COMERCIO,
    NUMREFREM            INT             -- NÚMERO REFERENCIA REMESA,
    NUMREFFACREM         INT             -- NÚMERO REFERENCIA DE LA FACTURA,
    NUMINC               INT             -- NÚMERO INCIDENCIA,
    NUMSECREC            NUMERIC(15)     -- NÚMERO SECUENCIA DE RECIBO,
    NUMSECIMP            NUMERIC(15)     -- NÚMERO SECUENCIA DE RECIBO IMPAGADO,
    DATOS_DE_TRAMA_CONTABLE_Y_ESTAD_STICOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS__CONTABILIDAD_INFORMAR__LOS_NECESARIOS_PARA_TRADUCCI_N_CONTABLE_ UNKNOWN         -- DATOS DE TRAMA CONTABLE Y ESTADÍSTICOS (INFORMAR SI EL PGM DISPONE DE ELLOS. CONTABILIDAD INFORMARÁ LOS NECESARIOS PARA TRADUCCIÓN CONTABLE),
    CODMAR               INT             -- CÓDIGO MARCA DE TARJETA,
    INDTIPT              INT             -- INDICADOR TIPO DE TARJETA,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCONEXT):
CREATE TABLE Tabla522 (
    VERTIENTE            VARCHAR(1)      -- INDICADOR DE VERTIENTE,
    CONPROD              VARCHAR(3)      -- CONDICIÓN ECONÓMICA,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    CODRAZON             INT             -- CÓDIGO DE RAZÓN,
    TIPOREM              VARCHAR(1)      -- TIPO DE REMESA,
    CODESTCTA            INT             -- CÓDIGO ESTADO DE CUENTA DE TARJETA,
    CODPAIS              INT             -- CÓDIGO DE PAÍS,
    TIPOCLI              VARCHAR(4)      -- TIPO DE CLIENTE,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN DE OPERACIÓN,
    PROGRAMA             VARCHAR(8)      -- NOMBRE DE PROGRAMA,
    DATOS_CONTABLES__SE_INFORMARAN_EN_LOS_PROCESOS_CONTABLES_ UNKNOWN         -- DATOS CONTABLES (SE INFORMARAN EN LOS PROCESOS CONTABLES),
    IMPCON               DECIMAL(17, 2)  -- IMPORTE EN MONEDA CONTABLE,
    CLAMONCON            INT             -- CLAVE MONEDA CONTABLE,
    CMBAPLI              DECIMAL(9, 4)   -- CAMBIO APLICADO,
    CUENTADEBE           INT             -- CUENTA SAT DEBE,
    CUENTAHABER          INT             -- CUENTA SAT HABER,
    OFIIMPDEB            VARCHAR(4)      -- OFICINA IMPUTACIÓN DEBE,
    OFIIMPHAB            VARCHAR(4)      -- OFICINA IMPUTACIÓN HABER,
    INDNACINT            INT             -- INDICADOR OPERADOR NACIONAL INTERNACIONAL,
    NUMOPER              INT             -- NÚMERO DE REGISTROS QUE COMPONEN LA TOTALIZACIÓN DE CONCEPTOS,
    SIGNO                VARCHAR(1)      -- SIGNO DEL REGISTRO CONTABLE (SIGNO DEL TIPO DE FACTURA O INDICADOR DE NORMAL / CORRECTORA)
);

-- El formato que corresponde al registro de detalle del fichero de salida sería (A
-- TCONEXT):
CREATE TABLE Tabla523 (
    DATOS_DE_L_NEA       UNKNOWN         -- DATOS DE LÍNEA,
    LINREF               INT             -- REFERENCIA DE TIPO DE LÍNEA,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    CLASIFEXT            VARCHAR(1)      -- CLASIFICACIÓN EXTERNA,
    FILLER               VARCHAR(4)     ,
    DATOS_REGISTRO_ORIGINAL_RED_FRANQUICIA UNKNOWN         -- DATOS REGISTRO ORIGINAL RED-FRANQUICIA,
    REGORI               VARCHAR(2488)   -- REGISTRO ORIGINAL CON EL QUE SE GENERA EL CONCEPTO CONTABLE
);

-- Programa ATC115: Enriquecimiento del registro con datos del contrato. Programa A
-- TC116: Enriquecimiento del registro con datos de la tarjeta. Programa ATB116: En
-- riquecimiento de las operaciones de comercio propio con datos de la estructura c
-- omercial.
CREATE TABLE Tabla524 (
    DATOS_COMUNES        UNKNOWN         -- DATOS COMUNES,
    TIPOREGI             VARCHAR(1)      -- Identifica el tipo de registro para que sea tratado por los procesos. En este caso llevará el valor fijo C. (C=Cabecera y D=Detalle),
    CODENTID             VARCHAR(8)      -- Código de Entidad.,
    CODCINTA             VARCHAR(2)      -- Código de Cinta. En este caso llevará el valor fijo ‘01’,
    NUMSECUE             INT             -- Número de secuencia de cinta.,
    REGISTRO_DE_CABECERA UNKNOWN         -- REGISTRO DE CABECERA,
    NUMTOTRE             INT             -- Número total de Registros recibidos en el Detalle.,
    FECENVIO             VARCHAR(8)      -- Fecha de Envío de la cinta. Formato AAAAMMDD,
    HORAENVI             VARCHAR(8)      -- Hora envío de la cinta. Formato HH:MM:SS,
    FILLER               VARCHAR(2048)   -- Campo libre,
    REGISTRO_DE_DETALLE  UNKNOWN         -- REGISTRO DE DETALLE
);

-- Programa ATC115: Enriquecimiento del registro con datos del contrato. Programa A
-- TC116: Enriquecimiento del registro con datos de la tarjeta. Programa ATB116: En
-- riquecimiento de las operaciones de comercio propio con datos de la estructura c
-- omercial.
CREATE TABLE Tabla525 (
    NUMSEREG             INT             -- Número secuencial de registros. El sistema entenderá que los registros con un número menor han sucedido antes en tiempo.,
    CODAPLIC             VARCHAR(8)      -- Código de Aplicación. Llevará el valor “SAT”,
    APLICPET             VARCHAR(8)      -- Código aplicación origen de la petición. Valor SAT (tiene que ser el mismo valor que van a enviar en la compra con puntos en línea.,
    CODTRANS             VARCHAR(19)     -- Código único de transacción.,
    INDANULAC            VARCHAR(2)      -- Indicador de anulación.,
    IDTRAORI             VARCHAR(19)     -- Identificador de transacción original.,
    CODEVENT             VARCHAR(8)      -- Código de Evento. Llevará el valor “OPDIARIA”,
    EDETALLE             VARCHAR(2000)   -- Registro compuesto por los campos de las operaciones. Detallado a continuación
);

-- Programa ATB110: Obtiene las autorizaciones expiradas de compra por puntos. Prog
-- rama ATB117: Formatea los registros de detalle y genera la cinta. Inserta en la 
-- tabla de cintas MPDT064 los datos correspondientes.
CREATE TABLE Tabla526 (
    CODENTID             VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CUENTA_SFC           UNKNOWN         -- CUENTA SFC,
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DE TARJETA,
    RESTO                UNKNOWN         -- RESTO,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA (Ofuscado),
    CLAMON               INT             -- CLAVE DE MONEDA,
    INDNORCOR            INT             -- INDICADOR DE NORMAL O CORRECTORA,
    TIPOFAC              INT             -- TIPO DE FACTURA
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes. El formato que
--  corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla527 (
    FECFAC               UNKNOWN         -- FECHA DE LA FACTURA,
    CLAMONDIV            INT             -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    SIGNODIV             VARCHAR(1)      -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-),
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOFAC             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA FACTURA(+/-),
    IMPFAC               DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE COMERCIO REDUCIDO,
    CODACT               INT             -- CÓDIGO DE ACTIVIDAD,
    FECPROCES            UNKNOWN         -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS              INT             -- CÓDIGO DEL PAÍS,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA             UNKNOWN         -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE            VARCHAR(4)      -- ORIGEN OPERACIÓN,
    TIPFRAN              INT             -- TIPO DE FRANQUICIA,
    SESIONRED            VARCHAR(12)     -- SESIÓN DE LA RED,
    SECOPE               NUMERIC(12)     -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    SIAIDCD              VARCHAR(19)     -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    TIPDOCPAG            INT             -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A CEROS)
);

-- Inserta en la tabla de cintas MPDT064 los datos correspondientes. El formato que
--  corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla528 (
    REFDOCPAG            VARCHAR(20)     -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A BLANCOS),
    NUMMOVEXT            INT             -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMEXTCTA            INT             -- NÚMERO DE EXTRACTO,
    NUMMOVDEB            INT             -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    IDENTCLI             VARCHAR(8)      -- NÚMERO ÚNICO DE PERSONA,
    INDINCEST            VARCHAR(1)      -- INDICADOR DE INCIDENCIA EN ESTUDIO ‘S’ – SI ‘N’ – NO,
    INDMOVANU            INT             -- INDICADOR DE MOVIMIENTO ANULADO,
    INDRET               INT             -- INDICADOR DE MOVIMIENTO RETENIDO,
    INDMOVEXT            INT             -- INDICADOR DE MOVIMIENTO EXTRACTADO,
    CODTIPC              VARCHAR(4)      -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    PORINT               DECIMAL(7, 4)   -- PORCENTAJE DE INTERÉS APLICADO,
    NUMOPECUO            INT             -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    SIGNOCUO             VARCHAR(1)      -- SIGNO DEL IMPORTE DE LA CUOTA(+/-),
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    INDDEBCRE            INT             -- INDICADOR DE DÉBITO O CRÉDITO.,
    TIPOLIN              VARCHAR(4)      -- TIPO DE LÍNEA,
    FORPAGO              INT             -- FORMA DE PAGO DE LA OPERACIÓN
);

-- El formato que corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla529 (
    LINREF               VARCHAR(8)      -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    NUMREFFAC            VARCHAR(23)     -- NÚMERO REFERENCIA FACTURA,
    CODESTCTA            INT             -- CÓDIGO DE ESTADO DEL CONTRATO DE TARJETA,
    FORPAGOC             INT             -- FORMA DE PAGO,
    PRODUCTO             VARCHAR(2)      -- CÓDIGO DE PRODUCTO,
    SUBPRODU             VARCHAR(4)      -- CÓDIGO DE SUBPRODUCTO,
    INDEMPRESA           VARCHAR(1)      -- INDICADOR CUENTA EMPRESA,
    INDEMPLEADO          VARCHAR(1)      -- INDICADOR DE EMPLEADO,
    CODHOLDING           VARCHAR(4)      -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA            VARCHAR(3)      -- CÓDIGO DE LA CADENA,
    CODMAR               INT             -- CÓDIGO DE MARCA,
    INDTIPT              INT             -- TIPO DE TARJETA,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DEL CONTRATO,
    CLVTOKEN             VARCHAR(37)     -- CLAVE TOKEN,
    FHORATRANS           VARCHAR(14)     -- FECHA Y HORA TRANSACCION,
    FILLER               VARCHAR(1532)  
);

-- ATC615: Comprobación de formatos y campos correctos. ATC616: Cruce de registros 
-- de la interfase con contratos
CREATE TABLE Tabla530 (
    CODENT               VARCHAR(4)      -- CODIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA               VARCHAR(12)     -- CUENTA DEL CONTRATO DE TARJETA,
    TIPOREG              VARCHAR(2)      -- TIPO DE REGISTRO A DAR DE ALTA ‘CG’,
    FECALTA              UNKNOWN         -- FECHA DE ALTA DE CALIFICACIÓN CONTABLE,
    CALIFICACI_N         VARCHAR(1)      -- CALIFICACIÓN CONTABLE INFORMADA
);

-- ATB788: Validación de datos del fichero de notificaciones. ATC432: Formateo de r
-- egistros rechazados
CREATE TABLE Tabla531 (
    CODENT               VARCHAR(4)      -- CÓDIGO DE ENTIDAD,
    CENTALTA             VARCHAR(4)      -- CENTRO DE ALTA,
    CUENTA               VARCHAR(12)     -- CÓDIGO DE LA CUENTA,
    NUMBENCTA            INT             -- NÚMERO DE BENEFICIARIO,
    IDENTCLI             VARCHAR(8)      -- IDENTIFICADOR DE CLIENTE,
    PAN                  VARCHAR(22)     -- NÚMERO DE TARJETA (OFUSCADO),
    FECCADTAR            INT             -- FECHA DE CADUCIDAD,
    FECTRN               VARCHAR(10)     -- FECHA LOCAL DE LA OPERACIÓN,
    HORTRN               VARCHAR(8)      -- HORA LOCAL DE LA OPERACIÓN,
    FECPROCES            VARCHAR(10)     -- FECHA DE PROCESO,
    HORAPROCESO          VARCHAR(8)      -- HORA DE PROCESO,
    IMPTRN               DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA TITULAR,
    CLAMONTRN            INT             -- CODIGO ISO DE LA MONEDA TITULAR,
    IMPDIV               DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA ORIGINAL,
    CLAMONDIV            INT             -- CODIGO ISO DE LA MONEDA TITULAR,
    TIPMEDIO             VARCHAR(2)      -- MEDIO DE COMUNICACIÓN,
    TIPMEDIODES          VARCHAR(30)     -- DESCRIPCIÓN DEL MEDIO DE COMUNICACIÓN,
    CODEVENT             INT             -- CÓDIGO DE EVENTO DE NOTIFICACIÓN,
    DESEVENT             VARCHAR(30)     -- DESCRIPCIÓN DEL EVENETO,
    DESEVENTRED          VARCHAR(10)     -- DESCRIPCIÓN REDUCIDA DEL EVENTO,
    REFDOC               VARCHAR(20)     -- DOCUMENTO DE REFERENCIA,
    NUMFINAN             INT             -- NÚMERO DE FINANCIACIÓN,
    PORINT               DECIMAL(3, 4)   -- PORCENTAJE DE INTERÉS MENSUAL,
    TAE                  DECIMAL(3, 4)   -- Tae/cae
);

-- ATC432: Formateo de registros rechazados Detalle de campos de los campos comunes
CREATE TABLE Tabla532 (
    IMPINTTOTAL          DECIMAL(17, 2)  -- IMPORTE TOTAL DE INTERESES,
    IMPCUOTA             DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    TOTCUOTAS            INT             -- NÚMERO TOTAL DE CUOTAS,
    IMPCOMIS             DECIMAL(17, 2)  -- IMPORTE DE COMISIONES,
    FECALTCOMP           VARCHAR(10)     -- FECHA DE ALTA DE LA COMPRA A PLAZOS,
    FECPROCUO            VARCHAR(10)     -- FECHA DE PRÓXIMA CUOTA,
    IMPCOMAPE            DECIMAL(17, 2)  -- IMPORTE DE LA COMISIÓN DE APERTURA,
    LIMCRECTA            DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA,
    FORPAGO              INT             -- FORMA DE PAGO,
    IMPFPAGOA            DECIMAL(17, 2)  -- IMPORTE FIJO DE PAGO APLAZADO,
    PORPAGOA             DECIMAL(7, 4)   -- PORCENTAJE DE PAGO APLAZADO,
    IMPMINPAGOA          DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO APLAZADO,
    CODCOM               VARCHAR(15)     -- CÓDIGO DE COMERCIO,
    NOMCOMRED            VARCHAR(27)     -- NOMBRE DE COMERCIO,
    NOMPOB               VARCHAR(26)     -- POBLACIÓN DEL COMERCIO,
    CODPAIS              INT             -- PAÍS DEL COMERCIO,
    NUMSECHIS            NUMERIC(15)     -- SECUENCIAL DE NOTIFICACIÓN,
    CODPUBLI             VARCHAR(10)     -- CÓDIGO DE PUBLICIDAD,
    CODNOTIF             VARCHAR(10)     -- CÓDIGO DE NOTIFICACIÓN,
    FECCAR               VARCHAR(10)     -- FECHA DE CARGO,
    IMPCARGO             DECIMAL(17, 2)  -- IMPORTE DEL VARGO
);

-- Estructura común inicial para todos los tipos de registro (ATRNOTIF).
CREATE TABLE Tabla533 (
    ORIGEN__OPE          VARCHAR(4)      -- ORIGEN-CAPTURA VALOR 'TPVS'. ORIGEN-INCOMING VALOR 'INCO'.
);

-- Tabla534
CREATE TABLE Tabla534 (
    VALOR__ORIGEN__OPE   INT             -- VALOR-REMESAS VALOR 01. VALOR-INCOMING VALOR 04.
);

-- ERROR: No se pudieron procesar las columnas de Tabla535
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla536
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla537
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla538
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla539
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla540
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla541
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla542
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla543
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla544
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla545
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla546
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla547
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla548
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla549
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla550
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla551
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla552
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla553
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla554
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla555
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- ERROR: No se pudieron procesar las columnas de Tabla556
-- Headers encontrados: ['NOMBRE', 'DESCRIPCIÓN']


-- Tabla557
CREATE TABLE Tabla557 (
    ATCODPRO__CODPRO     INT             -- NOMINAL-REMESA VALOR 10. AJUS-AUTO-EXPI VALOR 15.
);

-- Tabla558
CREATE TABLE Tabla558 (
    -- No se encontraron columnas válidas
);

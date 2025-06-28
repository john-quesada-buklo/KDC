-- Scripts SQL generados automáticamente desde documento Word
-- Con nombres reales de tablas y descripciones extraídas
-- Basado en las instrucciones de: instrucciones.md
-- ==================================================================

-- Tabla1: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATEXTCU1):
CREATE TABLE Tabla1 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CU’ – CUENTA O CONTRATO DE TARJETA ‘LI’ – LÍNEAS DE CRÉDITO PARALELAS ‘FI’ – DATOS COMPRA EN CUOTAS ‘CE‘ – MOVIMIENTO CUOTA ‘CC’ – MOVIMIENTO CONCEPTO ECONÓMICO
);

-- Tabla2: Detalle de campos de los registros de extractos Este grupo de datos está diferenciado en cuatro subtipos de registros: Por cuenta o contrato de tarjeta, por compra en cuotas, por cuota liquidada o dada de alta y por conceptos económicos vinculados a la cuota liquidada o dada de alta. Todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla2 (
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN,
    NUMBEN          INT  -- NÚMERO DE BENEFICIARIOS DE LA CUENTA,
    CODREGIMEN      INT  -- CÓDIGO DE RÉGIMEN FISCAL
);

-- Tabla3: Detalle de campos de los registros de extractos Este grupo de datos está diferenciado en cuatro subtipos de registros: Por cuenta o contrato de tarjeta, por compra en cuotas, por cuota liquidada o dada de alta y por conceptos económicos vinculados a la cuota liquidada o dada de alta. Todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla3 (
    CLAMON          INT  -- CLAVE DE MONEDA,
    LIMCRECTA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA,
    LIMCRECTAC      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA,
    SALDISCRE       DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO,
    SALDISCREC      DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO EN COMPRA EN CUOTAS,
    INDMONPRIN      VARCHAR(1)  -- INDICADOR DE MONEDA PRINCIPAL (S/N),
    CODFORMATO      VARCHAR(10)  -- CÓDIGO DE FORMATO,
    FILLER          VARCHAR(146)
);

-- Tabla4: Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI’:
CREATE TABLE Tabla4 (
    LINEA           VARCHAR(4)  -- LÍNEA ASOCIADA A LA CUENTA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA COMERCIAL,
    CLAMON          INT  -- CLAVE DE MONEDA,
    LIMCRELIN       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA DE LA LÍNEA,
    SALAUTLIN       DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO DE LA LÍNEA,
    SALDISLIN       DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPUESTO DE LA LÍNEA,
    FECINILIN       UNKNOWN  -- FECHA DE INICIO DE LA LÍNEA,
    FECFINLIN       UNKNOWN  -- FECHA DE FIN DE LA LÍNEA
);

-- Tabla5: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI’:
CREATE TABLE Tabla5 (
    INDTIPLIN       VARCHAR(1)  -- INDICADOR DE TIPO DE LÍNEA A: LÍNEA ADICIONAL (NO DEPENDE DEL DISPONIBLE DEL CONTRATO) C: LÍNEA DE LIMITE COMPARTIDO(DEPENDIENTE DEL CONTRATO),
    INDTIPOPE       VARCHAR(1)  -- INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA: R: REVOLVING C: COMPRA CUOTAS M: MIXTAS,
    FILLER          VARCHAR(164)
);

-- Tabla6: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registro ‘FI’:
CREATE TABLE Tabla6 (
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    NUMOPECUO       INT  -- NÚMERO DE OPERACIÓN CUOTAS,
    CLAMON          INT  -- CLAVE DE MONEDA,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN ACTUAL,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    NUMCUOPAG       INT  -- NÚMERO DE CUOTAS PAGADAS,
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR
);

-- Tabla7: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registro ‘FI’:
CREATE TABLE Tabla7 (
    IMPINTTOTAL     DECIMAL(17, 2)  -- IMPORTE DE INTERESES TOTAL A PAGAR,
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE DE CAPITAL AMORTIZADO,
    IMPINTAMORT     DECIMAL(17, 2)  -- IMPORTE DE INTERESES AMORTIZADO,
    FECULTLIQ       UNKNOWN  -- FECHA DE ÚLTIMA LIQUIDACIÓN,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    NUMULTCUO       INT  -- NÚMERO DE ÚLTIMA CUOTA,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    FILLER          VARCHAR(16)
);

-- Tabla8: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registro ‘FI’: Estructura de datos correspondiente a los datos de la cuota traspasada al extracto o dada de alta: ’CE’:
CREATE TABLE Tabla8 (
    NUMOPECUO       INT  -- NÚMERO DE MOVIMIENTO,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    IMPCAPITAL      DECIMAL(17, 2)  -- IMPORTE CAPITAL,
    IMPINTERESES    DECIMAL(17, 2)  -- IMPORTE INTERÉS,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN,
    FILLER          VARCHAR(152)
);

-- Tabla9: Estructura de datos correspondiente a los datos de la cuota traspasada al extracto o dada de alta: ’CE’: Estructura de datos correspondiente a los conceptos económicos aplicados a la cuota. Tipo de registro: ’CC’:
CREATE TABLE Tabla9 (
    NUMOPECUO       INT  -- NÚMERO DE MOVIMIENTO,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS,
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL CONCEPTO ECONÓMICO,
    FILLER          VARCHAR(172)
);

-- Tabla10: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATEXTCU3):
CREATE TABLE Tabla10 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CU ’– CUENTA O CONTRATO DE TARJETA ‘LI’ – LÍNEAS DE CRÉDITO PARALELAS ‘FI’ – DATOS COMPRA EN CUOTAS ‘CE‘ – MOVIMIENTO CUOTA ‘CC’ – MOVIMIENTO CONCEPTO ECONÓMICO,
    REGISTRO        VARCHAR(248),
    TOKENNEGOCIO    VARCHAR(37)  -- formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- ERROR: No se pudieron procesar las columnas de FI

-- Tabla12: Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI’:
CREATE TABLE Tabla12 (
    LINEA           VARCHAR(4)  -- LÍNEA ASOCIADA A LA CUENTA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA COMERCIAL,
    CLAMON          INT  -- CLAVE DE MONEDA
);

-- ERROR: No se pudieron procesar las columnas de Tabla13

-- Tabla14: Estructura tipo de registro de Líneas de Crédito Paralelas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registro ‘FI’:
CREATE TABLE Tabla14 (
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN- OFUSCADO--,
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    NUMOPECUO       INT  -- NÚMERO DE OPERACIÓN CUOTAS,
    CLAMON          INT  -- CLAVE DE MONEDA
);

-- ERROR: No se pudieron procesar las columnas de Tabla15

-- Tabla16: Estructura del tipo de registro de datos de la Compra en Cuotas. Tipo de registro ‘FI’: Estructura de datos correspondiente a los datos de la cuota traspasada al extracto o dada de alta: ’CE’:
CREATE TABLE Tabla16 (
    NUMOPECUO       INT  -- NÚMERO DE MOVIMIENTO,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA
);

-- ERROR: No se pudieron procesar las columnas de Tabla17

-- Tabla18: Estructura de datos correspondiente a los datos de la cuota traspasada al extracto o dada de alta: ’CE’: Estructura de datos correspondiente a los conceptos económicos aplicados a la cuota. Tipo de registro: ’CC’:
CREATE TABLE Tabla18 (
    NUMOPECUO       INT  -- NÚMERO DE MOVIMIENTO,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS,
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL CONCEPTO ECONÓMICO
);

-- Tabla19: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATIMPEXT):
CREATE TABLE Tabla19 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA (PRIMERA TARJETA DEL CONTRATO),
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CU’ – CUENTA O CONTRATO DE TARJETA
);

-- Tabla20: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATIMPEXT):
CREATE TABLE Tabla20 (
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN,
    REGISTRO        VARCHAR(457)  -- REGISTRO DE EXTRACTO,
    TOKENNEGOCIO    VARCHAR(37)  -- Formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Tabla21: Detalle de campos de los registros de extractos. Este grupo de datos está diferenciado en seis subtipos de registros: Por cuenta o contrato de tarjeta, por extracto, por extracto – tipo de línea – tipo de importe, por movimiento de extracto y por conceptos económicos vinculados a los movimientos del extracto. Todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla21 (
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    DESPROD         VARCHAR(30)  -- DESCRIPCIÓN DEL PRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(30)  -- DESCRIPCIÓN CONDICIÓN ECONÓMICA
);

-- Tabla22: Detalle de campos de los registros de extractos. Este grupo de datos está diferenciado en seis subtipos de registros: Por cuenta o contrato de tarjeta, por extracto, por extracto – tipo de línea – tipo de importe, por movimiento de extracto y por conceptos económicos vinculados a los movimientos del extracto. Todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla22 (
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN,
    DESCALPART      VARCHAR(30)  -- DESCRIPCIÓN CALIDAD DE PARTICIPACIÓN,
    NUMBEN          INT  -- NÚMERO DE BENEFICIARIOS DE LA CUENTA,
    CODREGIMEN      INT  -- CÓDIGO DE RÉGIMEN FISCAL,
    DESREGIMEN      VARCHAR(30)  -- DESCRIPCIÓN DE RÉGIMEN FISCAL,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    LIMCRECTA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA,
    SIGSALDISCRE    VARCHAR(1)  -- SIGNO DE SALDO DISPUESTO A CRÉDITO,
    SALDISCRE       DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO,
    LIMCRECTAC      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA DE CUOTAS,
    SIGSALDISCREC   VARCHAR(1)  -- SIGNO SALDO DISPUESTO A CRÉDITO DE CUOTAS,
    SALDISCREC      DECIMAL(17, 2)  -- SALDO DISPUESTO A CRÉDITO DE CUOTAS,
    INDMONPRIN      VARCHAR(1)  -- INDICADOR DE MONEDA PRINCIPAL (S/N),
    CODFORMATO      VARCHAR(10)  -- CÓDIGO DE FORMATO,
    DESCODFORMATO   VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE FORMATO,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    INDDOMCARCRE    VARCHAR(1)  -- INDICADOR DOMICILIACIÓN,
    INDCTAEMP       INT  -- INDICADOR CUENTA EMPRESA
);

-- Tabla23: Detalle de campos de los registros de extractos. Este grupo de datos está diferenciado en seis subtipos de registros: Por cuenta o contrato de tarjeta, por extracto, por extracto – tipo de línea – tipo de importe, por movimiento de extracto y por conceptos económicos vinculados a los movimientos del extracto. Todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla23 (
    CLASEG          VARCHAR(3)  -- CLASE DE SEGMENTO DEL CLIENTE(TIPO DE CLIENTE),
    DESCLASEG       VARCHAR(30)  -- DESCRIPCIÓN CLASE DE SEGMENTO DEL CLIENTE (TIPO DE CLIENTE) “01” - CLIENTE “02” - EMPLEADO,
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    CODIDIOMA       VARCHAR(2)  -- CÓDIGO DE IDIOMA,
    DESIDIOMA       VARCHAR(20)  -- DESCRIPCIÓN IDIOMA,
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    DESCODBLQ       VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE BLOQUEO,
    OFIGESTORA      VARCHAR(4)  -- OFICINA GESTORA,
    CLAVE_PARTICIP  VARCHAR(3)  -- CLAVE PARTICIP.,
    COD_PRODUCTO    VARCHAR(3)  -- CODIGO DE PRODUCTO,
    DIG_CUENTA      VARCHAR(11)  -- DIGITO CUENTA,
    DIG_VERIFICA    VARCHAR(1)  -- DIGITO VERIFICACION,
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    FILLER          VARCHAR(2)  -- SIN USO,
    SUBTIPCLI       VARCHAR(2)  -- SUBTIPO DE CLIENTE,
    FILLER          VARCHAR(12)
);

-- Tabla24: Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’:
CREATE TABLE Tabla24 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA
);

-- Tabla25: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’:
CREATE TABLE Tabla25 (
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESTIPIMP       VARCHAR(30)  -- DESCRIPCIÓN TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    SIGIMPINI       VARCHAR(1)  -- SIGNO IMPORTE INICIAL,
    IMPINI          DECIMAL(17, 2)  -- IMPORTE INICIAL,
    SIGIMPFIN       VARCHAR(1)  -- SIGNO IMPORTE FINAL,
    IMPFIN          DECIMAL(17, 2)  -- IMPORTE FINAL,
    SIGIMPBON       VARCHAR(1)  -- SIGNO IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    IMPBON          DECIMAL(17, 2)  -- IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    SIGIMPAPL       VARCHAR(1)  -- SIGNO IMPORTE APLICADO,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    SIGIMPREC       VARCHAR(1)  -- SIGNO IMPORTE DE RECIBO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DE RECIBO,
    SIGIMPMIN       VARCHAR(1)  -- SIGNO IMPORTE MÍNIMO,
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    FILLER          VARCHAR(247)
);

-- Tabla26: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla26 (
    LINREF          INT  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOM       VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    CLAMON          INT  -- MONEDA DE LA LÍNEA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    LIMCRELIN       DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA,
    SIGSALAUTLIN    VARCHAR(1)  -- SIGNO SALDO AUTORIZADO DE LA LÍNEA,
    SALAUTLIN       DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA,
    SIGSALDISLIN    VARCHAR(1)  -- SIGNO SALDO DISPUESTO DE LA LÍNEA,
    SALDISLIN       DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA,
    INDVIG          VARCHAR(1)  -- INDICADOR DE VIGENCIA,
    FILLER          VARCHAR(294)
);

-- Tabla27: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla27 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    INDREP          INT  -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO.
);

-- Tabla28: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla28 (
    DESINDREP       VARCHAR(30)  -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO 0 – NORMAL 2 – RELIQUIDADO,
    FORPAGO         INT  -- FORMA DE PAGO,
    DESFORPAGO      VARCHAR(30)  -- DESCRIPCIÓN FORMA DE PAGO,
    SIGIMPTOTPAG    VARCHAR(1)  -- SIGNO IMPORTE TOTAL A PAGAR,
    IMPTOTPAG       DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPMIN       VARCHAR(1)  -- SIGNO IMPORTE MÍNIMO,
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO,
    SIGIMPCARGO     VARCHAR(1)  -- SIGNO IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    IMPCARGO        DECIMAL(17, 2)  -- IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    FECEXT          UNKNOWN  -- FECHA DE EXTRACTO,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN,
    FECLIQANT       UNKNOWN  -- FECHA DE LIQUIDACIÓN ANTERIOR,
    FECCAR          UNKNOWN  -- FECHA DE CARGO EXTRACTO,
    FECVALCAR       UNKNOWN  -- FECHA VALOR DEL CARGO EXTRACTO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO,
    SIGIMPEXCLIM    VARCHAR(1)  -- SIGNO IMPORTE EXCESO DEL LÍMITE DE CRÉDITO,
    IMPEXCLIM       DECIMAL(17, 2)  -- IMPORTE EXCESO DEL LÍMITE DE CRÉDITO,
    SIGIMSALAPLPRX  VARCHAR(1)  -- SIGNO IMPORTE APLAZADO,
    IMSALAPLPRX     DECIMAL(17, 2)  -- IMPORTE APLAZADO
);

-- Tabla29: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla29 (
    SIGIMPCARGOANT  VARCHAR(1)  -- SIGNO IMPORTE DEL CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    IMPCARGOANT     DECIMAL(17, 2)  -- IMPORTE DEL CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIAL DEL RECIBO,
    INPFIJOAPL      DECIMAL(15, 2)  -- IMPORTE DE PAGO FIJO APLAZADO,
    FECVENULT       UNKNOWN  -- FECHA DE VENCIMIENTO ÚLTIMA PROCESADA,
    FECVENPRO       UNKNOWN  -- FECHA DE VENCIMIENTO PRÓXIMA,
    FILLER          VARCHAR(134)
);

-- Tabla30: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’: Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’MX’:
CREATE TABLE Tabla30 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    INDNORCOR       INT  -- INDICADOR DE TI PO DE FACTURA NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    DESINDNORCOR    VARCHAR(30)  -- DESCRIPCIÓN INDICADOR TIPO FACTURA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    SIGNO           VARCHAR(1)  -- SIGNO DEL IMPORTE,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FACTURA
);

-- Tabla31: Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’MX’:
CREATE TABLE Tabla31 (
    INDFACINF       VARCHAR(1)  -- INDICADOR FACTURA INFORMATIVA (S/N),
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMONDIV    VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE MONEDA OPERACIÓN ORIGINAL,
    SIGIMPDIV       VARCHAR(1)  -- SIGNO IMPORTE EN DIVISA ORIGINAL,
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGIMPFAC       VARCHAR(1)  -- SIGNO IMPORTE DE LA FACTURA,
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI         DECIMAL(9, 4)  -- FACTOR DE CAMBIO APLICADO (SOLO TIENE SENTIDO PARA OPERACIONES EN EXTRANJERO),
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    DESACT          VARCHAR(30)  -- DESCRIPCIÓN DE ACTIVIDAD,
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPAIS         VARCHAR(30)  -- NOMBRE DEL PAÍS,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE OPERACIÓN,
    SIGIMPIMPTO     VARCHAR(1)  -- SIGNO IMPORTE DEL IMPUESTO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD
);

-- Tabla32: Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’MX’:
CREATE TABLE Tabla32 (
    LINREF          INT  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    FORPAGO         INT  -- FORMA DE PAGO,
    DESFORPAGO      VARCHAR(30)  -- DESCRIPCIÓN FORMA DE PAGO,
    DATADI          VARCHAR(1)  -- INDICADOR DE DATOS ADICIONALES DE AUTORIZACIÓN
);

-- Tabla33: Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’MX’: Estructura de datos correspondiente a los conceptos económicos de cada movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla33 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESTIPIMP       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    SIGIMPAPLECO    VARCHAR(1)  -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO
);

-- Tabla34: Estructura de datos correspondiente a los conceptos económicos de cada movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla34 (
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO    VARCHAR(1)  -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPBONECO    VARCHAR(1)  -- SIGNO DEL IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPIMPTO     VARCHAR(1)  -- SIGNO DEL IMPORTE DEL IMPUESTO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL CONCEPTO,
    SIGIMPAPL       VARCHAR(1)  -- SIGNO DEL IMPORTE APLICADO,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    SIGIMPLIQUI     VARCHAR(1)  -- SIGNO IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO,
    IMPLIQUI        DECIMAL(17, 2)  -- IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO,
    FECULTCAL       UNKNOWN  -- ÚLTIMA FECHA EN LA QUE SE HA REALIZADO EL CÁLCULO DE INTERESES,
    ESTCONECO       VARCHAR(1)  -- ESTADO DEL CONCEPTO ECONÓMICO,
    DESESTCONECO    VARCHAR(30)  -- DESCRIPCIÓN DEL ESTADO DEL CONCEPTO ECONÓMICO: – PENDIENTE. – LIQUIDADO – AMORTIZADO – ANULADO – RETENIDO
);

-- Tabla35: Estructura de datos correspondiente a los conceptos económicos de cada movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla35 (
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    FILLER          VARCHAR(191)
);

-- Tabla36: Estructura de datos correspondiente a los conceptos económicos de cada movimiento. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla36 (
    NUMEXTCTA       INT  -- NUMERO EXTRACTO CUENTA,
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCION CLAVE MONEDA,
    NUMSEQ          INT  -- NUMERO SECUENCIAL SIMULACION,
    SIGDEUDAINI     VARCHAR(1)  -- SIGNO DE LA DEUDA INICIAL,
    DEUDAINI        DECIMAL(17, 2)  -- IMPORTE DE LA DEUDA INICIAL,
    PORPAGOAP       DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO,
    PORCUOMIN       DECIMAL(7, 4)  -- PORCENTAJE CUOTA MÍNIMA,
    SIGTOTCUOMIN    VARCHAR(1)  -- SIGNO DEL TOTAL CUOTA MÍNIMA,
    TOTCUOMIN       DECIMAL(17, 2)  -- IMPORTE TOTAL CUOTA MÍNIMA,
    FORPAGSIM       VARCHAR(1)  -- FORMA DE PAGO EN SIMULACIÓN,
    DESPAGSIM       VARCHAR(30)  -- DESCRIPCIÓN DE FORMA DE PAGO EN SIMULACIÓN,
    PORCENTAJE      DECIMAL(7, 4)  -- PORCENTAJE EN SIMULACIÓN,
    MESES           INT  -- MESES EN SIMULACIÓN,
    SIGIMPCUO       VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUO          DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPAMORCUO   VARCHAR(1)  -- SIGNO DEL CAPITAL AMORTIZADO DE LA CUOTA,
    IMPAMORCUO      DECIMAL(17, 2)  -- CAPITAL AMORTIZADO DE LA CUOTA
);

-- Tabla37: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla37 (
    SIGIMPINTCUO    VARCHAR(1)  -- SIGNO DEL INTERES DE LA CUOTA,
    IMPINTCUO       DECIMAL(17, 2)  -- INTERÉS DE LA CUOTA,
    FECULTCUO       UNKNOWN  -- FECHA DE ULTIMA CUOTA,
    SIGIMPTOTAL     VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL A PAGAR,
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPAMORTOTAL VARCHAR(1)  -- SIGNO DEL CAPITAL AMORTIZADO TOTAL,
    IMPAMORTOTAL    DECIMAL(17, 2)  -- CAPITAL AMORTIZADO TOTAL,
    SIGIMPINTTOT    VARCHAR(1)  -- SIGNO DEL INTERES TOTAL,
    IMPINTTOT       DECIMAL(17, 2)  -- INTERÉS TOTAL,
    TASAINTMENS     DECIMAL(7, 4)  -- TASA INTERÉS MENSUAL,
    TASAEFECANU     DECIMAL(7, 4)  -- TASA EFECTIVA ANUAL,
    FILLER          VARCHAR(184)  -- FILLER
);

-- Tabla38: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’: Estructura de datos correspondiente a registros de Interés por período. Tipo de registro: ’IN’:
CREATE TABLE Tabla38 (
    NUMEXTCTA       INT  -- NUMERO EXTRACTO CUENTA,
    CLAMONN         INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCION CLAVE MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO       INT  -- - CODIGO CONCEPTO ECONOMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCION CONCEPTO ECONOMICO,
    INDTIPOSALD     VARCHAR(1)  -- INDICADOR TIPO SALDO
);

-- Tabla39: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’: Estructura de datos correspondiente a registros de Interés por período. Tipo de registro: ’IN’:
CREATE TABLE Tabla39 (
    DESINDTIPOSALD  VARCHAR(30)  -- DESCRIPCION INDICADOR TIPO SALDO,
    FECHAINI        UNKNOWN  -- FECHA INICIO DEL PERIODO,
    FECHAFIN        UNKNOWN  -- FECHA FIN DEL PERIODO,
    SIGSALDOPER     VARCHAR(1)  -- SIGNO DEL SALDO DEL PERIODO,
    SALDOPER        DECIMAL(17, 2)  -- SALDO DEL PERIODO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE INTERÉS PERIODO,
    SIGIMPINT       VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERÉS,
    IMPINT          DECIMAL(17, 2)  -- IMPORTE DE INTERÉS,
    FILLER          VARCHAR(MAX)
);

-- Tabla40: Detalle de campos de los registros de impagados. Este grupo de estructura de datos está diferenciado en dos subestructuras: el impagado en sí y el detalle por tipo de línea – tipo de importe. Ambos irán precedidos por la parte común comentada previamente. Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’:
CREATE TABLE Tabla40 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    SITUACION       INT  -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION    VARCHAR(20)  -- DESCRIPCIÓN DE LA SITUACIÓN DEL CONTRATO IMPAGADO,
    IMPCONT         DECIMAL(17, 2)  -- IMPORTE TOTAL DE IMPAGO DEL CONTRATO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE MORA
);

-- Tabla41: Detalle de campos de los registros de impagados. Este grupo de estructura de datos está diferenciado en dos subestructuras: el impagado en sí y el detalle por tipo de línea – tipo de importe. Ambos irán precedidos por la parte común comentada previamente. Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’:
CREATE TABLE Tabla41 (
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECULTAPL       UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB       UNKNOWN  -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    NUMRECIMP       INT  -- NÚMERO DE RECIBOS IMPAGADOS,
    FECVENMOV       UNKNOWN  -- FECHA VENCIMIENTO PRIMER RECIBO,
    FILLER          VARCHAR(319)
);

-- Tabla42: Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’: Estructura de datos correspondiente al desglose del contrato de impagado. Tipo de registro: ’IL’:
CREATE TABLE Tabla42 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER          VARCHAR(304)
);

-- Tabla43: Estructura de datos correspondiente al desglose del contrato de impagado. Tipo de registro: ’IL’: Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’:
CREATE TABLE Tabla43 (
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DEL RECIBO IMPAGADO,
    FECEMIMOV       UNKNOWN  -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL       UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB       UNKNOWN  -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER          VARCHAR(273)
);

-- Tabla44: Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla44 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE
);

-- Tabla45: Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla45 (
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER          VARCHAR(342)
);

-- Tabla46: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla46 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LINEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE LINEA,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    FECFAC          UNKNOWN  -- FECHA DEL MOVIMIENTO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE DEL MOVIMIENTO
);

-- Tabla47: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla47 (
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO DEL MOVIMIENTO,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE DEL MOVIMIENTO,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN OPERACIÓN,
    TIPDOCPAG       INT  -- TIPO DE DOCUMENTO DE PAGO (SÓLO PARA PAGOS),
    DESDOCPAG       VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE DOCUMENTO DE PAGO (SÓLO PARA PAGOS),
    REFDOCPAG       VARCHAR(20)  -- REFERENCIA DEL TIPO DE DOCUMENTO (SÓLO PAGOS),
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE AMORTIZADO (SÓLO PARA PAGOS),
    TIPDEVOL        INT  -- TIPOS DE IMPAGO,
    DESTIPDEVOL     VARCHAR(30)  -- DESCRIPCIÓN DE TIPOS DE IMPAGO,
    FEC2PRES        UNKNOWN  -- FECHA VENCIMIENTO DE 2ª PRESENTACIÓN,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    FILLER          VARCHAR(154)
);

-- Tabla48: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla48 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE
);

-- Tabla49: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla49 (
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE 01-CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    IMPCONSOL       DECIMAL(17, 2)  -- IMPORTE CONSOLIDADO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    INDPERCON       VARCHAR(1)  -- INDICADOR DE CONCEPTO PERDONADO,
    DESPERCON       VARCHAR(30)  -- DESCRIPCIÓN DE INDICADOR DE CONCEPTO PERDONADO,
    FILLER          VARCHAR(246)
);

-- Tabla50: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’: Estructura de datos correspondiente a datos adicionales de autorizaciones. Tipo de registro: ’DA’:
CREATE TABLE Tabla50 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    TEXTO__CANJE    NUMERIC(50)  -- TEXTO VOUCHER,
    FILLER          VARCHAR(381)
);

-- Tabla51: En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Se ofusca el campo PAN, por tanto, se expondrán un máximo de 10 dígitos (es decir, los primeros seis y cualquier otros cuatro, que en este caso serán los 4 últimos dígitos del PAN. El TOKENNEGOCIO está formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO (total 37 posiciones). Estructura común inicial para todos los tipos de registro (ATIMPEXT):
CREATE TABLE Tabla51 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA (PRIMERA TARJETA DEL CONTRATO)
);

-- Tabla52: En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Se ofusca el campo PAN, por tanto, se expondrán un máximo de 10 dígitos (es decir, los primeros seis y cualquier otros cuatro, que en este caso serán los 4 últimos dígitos del PAN. El TOKENNEGOCIO está formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO (total 37 posiciones). Estructura común inicial para todos los tipos de registro (ATIMPEXT):
CREATE TABLE Tabla52 (
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CU’ – CUENTA O CONTRATO DE TARJETA ‘LI’ – LÍNEAS DE CRÉDITO PARALELAS ‘EX’ – EXTRACTO ‘TX’ – EXTRACTO – TIPO DE LÍNEA – TIPO IMPORTE ‘MX’ – MOVIMIENTO EXTRACTO ‘MC’ – MOVIMIENTO CONCEPTO ECONÓMICO ‘SP’ – SIMULACION DE PAGOS ‘IN’ – INTERES POR PERIODOS ‘IC’ – CONTRATO IMPAGADO ‘IL’ – DESGLOSE CONTRATO IMPAGADO ‘RI’ – RECIBO IMPAGADO ‘RL’ – DESGLOSE RECIBO IMPAGADO ‘MI’ – MOVIMIENTO RECIBO IMPAGADO ‘CI’ – CONCEPTO ECONÓMICO DE MOVIMIENTO RECIBO IMPAGADO,
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN,
    REGISTRO        VARCHAR(457)  -- REGISTRO DE EXTRACTO,
    TOKENNEGOCIO    VARCHAR(37)  -- Formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Tabla53: Detalle de campos de los registros de extractos. Este grupo de datos está diferenciado en seis subtipos de registros: Por cuenta o contrato de tarjeta, por extracto, por extracto – tipo de línea – tipo de importe, por movimiento de extracto y por conceptos económicos vinculados a los movimientos del extracto. Todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’:
CREATE TABLE Tabla53 (
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    DESPROD         VARCHAR(30)  -- DESCRIPCIÓN DEL PRODUCTO
);

-- ERROR: No se pudieron procesar las columnas de Tabla54

-- ERROR: No se pudieron procesar las columnas de Tabla55

-- Tabla56: Estructura del tipo de registro de cuenta o contrato de tarjeta. Tipo de registro ‘CU’: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’:
CREATE TABLE Tabla56 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESTIPIMP       VARCHAR(30)  -- DESCRIPCIÓN TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD - 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO,
    SIGIMPINI       VARCHAR(1)  -- SIGNO IMPORTE INICIAL,
    IMPINI          DECIMAL(17, 2)  -- IMPORTE INICIAL,
    SIGIMPFIN       VARCHAR(1)  -- SIGNO IMPORTE FINAL,
    IMPFIN          DECIMAL(17, 2)  -- IMPORTE FINAL,
    SIGIMPBON       VARCHAR(1)  -- SIGNO IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    IMPBON          DECIMAL(17, 2)  -- IMPORTE BONIFICABLE (SOLO PARA INTERESES SI SE REALIZA EL PAGO DE TODA LA DEUDA),
    SIGIMPAPL       VARCHAR(1)  -- SIGNO IMPORTE APLICADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla57

-- Tabla58: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla58 (
    LINREF          INT  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOM       VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    CLAMON          INT  -- MONEDA DE LA LÍNEA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    LIMCRELIN       DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA,
    SIGSALAUTLIN    VARCHAR(1)  -- SIGNO SALDO AUTORIZADO DE LA LÍNEA,
    SALAUTLIN       DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA,
    SIGSALDISLIN    VARCHAR(1)  -- SIGNO SALDO DISPUESTO DE LA LÍNEA,
    SALDISLIN       DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA,
    FILLER          VARCHAR(295)
);

-- Tabla59: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’:
CREATE TABLE Tabla59 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    INDREP          INT  -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO.,
    DESINDREP       VARCHAR(30)  -- INDICADOR DE RELIQUIDACIÓN DE EXTRACTO - 0 – NORMAL - 2 – RELIQUIDADO,
    FORPAGO         INT  -- FORMA DE PAGO,
    DESFORPAGO      VARCHAR(30)  -- DESCRIPCIÓN FORMA DE PAGO,
    SIGIMPTOTPAG    VARCHAR(1)  -- SIGNO IMPORTE TOTAL A PAGAR,
    IMPTOTPAG       DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPMIN       VARCHAR(1)  -- SIGNO IMPORTE MÍNIMO,
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO,
    SIGIMPCARGO     VARCHAR(1)  -- SIGNO IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    IMPCARGO        DECIMAL(17, 2)  -- IMPORTE DE CARGO MENSUAL CALCULADO SEGÚN FORMA DE PAGO,
    FECEXT          UNKNOWN  -- FECHA DE EXTRACTO,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN,
    FECLIQANT       UNKNOWN  -- FECHA DE LIQUIDACIÓN ANTERIOR
);

-- ERROR: No se pudieron procesar las columnas de Tabla60

-- Tabla61: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EX’: Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’MX’:
CREATE TABLE Tabla61 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    INDNORCOR       INT  -- INDICADOR DE TI PO DE FACTURA NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    DESINDNORCOR    VARCHAR(30)  -- DESCRIPCIÓN INDICADOR TIPO FACTURA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    SIGNO           VARCHAR(1)  -- SIGNO DEL IMPORTE,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    INDFACINF       VARCHAR(1)  -- INDICADOR FACTURA INFORMATIVA (S/N),
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN (ofuscado),
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMONDIV    VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE MONEDA OPERACIÓN ORIGINAL,
    SIGIMPDIV       VARCHAR(1)  -- SIGNO IMPORTE EN DIVISA ORIGINAL
);

-- ERROR: No se pudieron procesar las columnas de Tabla62

-- Tabla63: Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’MX’: Estructura de datos correspondiente a los conceptos económicos de cada movimiento. Tipo de registro: ’MC’:
CREATE TABLE Tabla63 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       UNKNOWN  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       UNKNOWN  -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESTIPIMP       UNKNOWN  -- DESCRIPCIÓN DEL TIPO DE IMPORTE,
    SIGIMPAPLECO    UNKNOWN  -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO    UNKNOWN  -- SIGNO DEL IMPORTE BRUTO CALCULADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla64

-- ERROR: No se pudieron procesar las columnas de Tabla65

-- Tabla66: Estructura de datos correspondiente a los conceptos económicos de cada movimiento. Tipo de registro: ’MC’: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla66 (
    NUMEXTCTA       INT  -- NUMERO EXTRACTO CUENTA,
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCION CLAVE MONEDA,
    NUMSEQ          INT  -- NUMERO SECUENCIAL SIMULACION,
    SIGDEUDAINI     VARCHAR(1)  -- SIGNO DE LA DEUDA INICIAL,
    DEUDAINI        DECIMAL(17, 2)  -- IMPORTE DE LA DEUDA INICIAL,
    PORPAGOAP       DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO,
    PORCUOMIN       DECIMAL(7, 4)  -- PORCENTAJE CUOTA MÍNIMA,
    SIGTOTCUOMIN    VARCHAR(1)  -- SIGNO DEL TOTAL CUOTA MÍNIMA,
    TOTCUOMIN       DECIMAL(17, 2)  -- IMPORTE TOTAL CUOTA MÍNIMA,
    FORPAGSIM       VARCHAR(1)  -- FORMA DE PAGO EN SIMULACIÓN,
    DESPAGSIM       VARCHAR(30)  -- DESCRIPCIÓN DE FORMA DE PAGO EN SIMULACIÓN,
    PORCENTAJE      DECIMAL(7, 4)  -- PORCENTAJE EN SIMULACIÓN,
    MESES           INT  -- MESES EN SIMULACIÓN,
    SIGIMPCUO       VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUO          DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPAMORCUO   VARCHAR(1)  -- SIGNO DEL CAPITAL AMORTIZADO DE LA CUOTA
);

-- Tabla67: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’:
CREATE TABLE Tabla67 (
    IMPAMORCUO      DECIMAL(17, 2)  -- CAPITAL AMORTIZADO DE LA CUOTA,
    SIGIMPINTCUO    VARCHAR(1)  -- SIGNO DEL INTERES DE LA CUOTA,
    IMPINTCUO       DECIMAL(17, 2)  -- INTERÉS DE LA CUOTA,
    FECULTCUO       VARCHAR(10)  -- FECHA DE ULTIMA CUOTA,
    SIGIMPTOTAL     VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL A PAGAR,
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPAMORTOTAL VARCHAR(1)  -- SIGNO DEL CAPITAL AMORTIZADO TOTAL,
    IMPAMORTOTAL    DECIMAL(17, 2)  -- CAPITAL AMORTIZADO TOTAL,
    SIGIMPINTTOT    VARCHAR(1)  -- SIGNO DEL INTERES TOTAL,
    IMPINTTOT       DECIMAL(17, 2)  -- INTERÉS TOTAL,
    TASAINTMENS     DECIMAL(7, 4)  -- TASA INTERÉS MENSUAL,
    TASAEFECANU     DECIMAL(7, 4)  -- TASA EFECTIVA ANUAL
);

-- Tabla68: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’: Estructura de datos correspondiente a registros de Interés por período. Tipo de registro: ’IN’:
CREATE TABLE Tabla68 (
    NUMEXTCTA       INT  -- NUMERO EXTRACTO CUENTA,
    CLAMONN         INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCION CLAVE MONEDA,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO       INT  -- - CODIGO CONCEPTO ECONOMICO
);

-- Tabla69: Estructura de datos correspondiente a registros de Simulación de pagos. Tipo de registro: ’SP’: Estructura de datos correspondiente a registros de Interés por período. Tipo de registro: ’IN’:
CREATE TABLE Tabla69 (
    DESCONECO       VARCHAR(30)  -- DESCRIPCION CONCEPTO ECONOMICO,
    INDTIPOSALD     VARCHAR(1)  -- INDICADOR TIPO SALDO,
    DESINDTIPOSALD  VARCHAR(30)  -- DESCRIPCION INDICADOR TIPO SALDO,
    FECHAINI        UNKNOWN  -- FECHA INICIO DEL PERIODO,
    FECHAFIN        UNKNOWN  -- FECHA FIN DEL PERIODO,
    SIGSALDOPER     VARCHAR(1)  -- SIGNO DEL SALDO DEL PERIODO,
    SALDOPER        DECIMAL(17, 2)  -- SALDO DEL PERIODO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE INTERÉS PERIODO,
    SIGIMPINT       VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERÉS,
    IMPINT          DECIMAL(17, 2)  -- IMPORTE DE INTERÉS,
    FILLER          VARCHAR(MAX)
);

-- Tabla70: Detalle de campos de los registros de impagados. Este grupo de estructura de datos está diferenciado en dos subestructuras: el impagado en sí y el detalle por tipo de línea – tipo de importe. Ambos irán precedidos por la parte común comentada previamente. Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’:
CREATE TABLE Tabla70 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    SITUACION       INT  -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION    VARCHAR(20)  -- DESCRIPCIÓN DE LA SITUACIÓN DEL CONTRATO IMPAGADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla71

-- Tabla72: Estructura tipo de registro datos contrato Impagado. Tipo de registro ‘IC’: Estructura de datos correspondiente al desglose del contrato de impagado. Tipo de registro: ’IL’:
CREATE TABLE Tabla72 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla73

-- Tabla74: Estructura de datos correspondiente al desglose del contrato de impagado. Tipo de registro: ’IL’: Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’:
CREATE TABLE Tabla74 (
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DEL RECIBO IMPAGADO,
    FECEMIMOV       UNKNOWN  -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL       UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB       UNKNOWN  -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER          VARCHAR(273)
);

-- Tabla75: Estructura de datos correspondiente al recibo impagado. Tipo de registro: ’RI’: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla75 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD - 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER          VARCHAR(342)
);

-- Tabla76: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla76 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       UNKNOWN  -- DESCRIPCIÓN DE CLAVE DE MONEDA
);

-- ERROR: No se pudieron procesar las columnas de Tabla77

-- Tabla78: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla78 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE IMPORTE - 01-CAPITAL - 02 – COMISIONES - 03 – INTERESES - 04 – IMPUESTOS - 05 – COMISIONES MOROSIDAD - 06 – INTERESES MOROSIDAD - 07 – IMPUESTOS MOROSIDAD - 08 – VALOR PARA USO FUTURO,
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    IMPCONSOL       DECIMAL(17, 2)  -- IMPORTE CONSOLIDADO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO
);

-- ERROR: No se pudieron procesar las columnas de Tabla79

-- Tabla80: Los registros de la interfaz se dividen en dos partes, una de las cuales es común a todos los tipos de carta y otra con datos concretos de cada tipo de carta. Los datos generales tendrán la siguiente estructura: Estructura común inicial para todos los tipos de registro (ATINTCAR):
CREATE TABLE Tabla80 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DEL CLIENTE,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    IND_ENVIO       VARCHAR(1)  -- INDICADOR DE ENVÍO (LLEVARÁ UNA ‘O’ SI VA A IR A OFICINA EN LUGAR DE AL CLIENTE),
    CENTRO          VARCHAR(4)  -- CENTRO DE ENVÍO,
    TIPO_CAR        INT  -- TIPO DE CARTA 1 - CARTA DE PIN 2 - CARTA DE BIENVENIDA 3 - CARTAS DE COMUNICACIÓN DE BLOQUEO 4 - CARTA DE COMUNICACIÓN DE IMPAGO 6 – CARTA DE CVV2,
    DATOS           VARCHAR(254)  -- DATOS VARIABLES
);

-- Tabla81: Estructura común inicial para todos los tipos de registro (ATINTCAR): La estructura de los datos para las cartas de PIN es la siguiente:
CREATE TABLE Tabla81 (
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    VISAPHONE       INT  -- CÓDIGO VISAPHONE,
    CRIPPIN         VARCHAR(16)  -- CRIPTOGRAMA DEL PIN,
    MOTCARPIN       VARCHAR(2)  -- MOTIVO DE LA CARTA DE PIN,
    FILLER          VARCHAR(206)
);

-- Tabla82: La estructura de los datos para las cartas de PIN es la siguiente: El programa que formatea el registro de detalle es el ATB431. La estructura de los datos para las cartas de Bienvenida es la siguiente:
CREATE TABLE Tabla82 (
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    FECEFE          UNKNOWN  -- FECHA DE EFECTIVIDAD DE LA TARJETA,
    FILLER          VARCHAR(218)
);

-- Tabla83: La estructura de los datos para las cartas de Bienvenida es la siguiente: El programa que formatea el registro de detalle es el ATB430. La estructura, para las cartas de comunicación de bloqueos es la siguiente:
CREATE TABLE Tabla83 (
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA,
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    DESCRIPCI_N     VARCHAR(30)  -- DESCRIPCIÓN DEL BLOQUEO,
    INDAPLEMISOR    VARCHAR(1)  -- INDICADOR DE APLICACIÓN EN VERTIENTE EMISOR,
    FECBLQ          UNKNOWN  -- FECHA DE BLOQUEO,
    HORABLQ         VARCHAR(8)  -- HORA DE BLOQUEO,
    FILLER          VARCHAR(181)
);

-- Tabla84: La estructura, para las cartas de comunicación de bloqueos es la siguiente: El programa que formatea el registro de detalle es el ATB467. La estructura, para las cartas de comunicación de mora es la siguiente:
CREATE TABLE Tabla84 (
    FECIMPAGO       UNKNOWN  -- FECHA DE IMPAGO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE TOTAL DEL RECIBO IMPAGADO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE DEMORA,
    CLAMON          INT  -- CLAVE DE MONEDA,
    FILLER          VARCHAR(207)
);

-- Tabla85: La estructura, para las cartas de comunicación de mora es la siguiente: El programa que formatea el registro de detalle es el ATBI04. La estructura de los datos para las cartas de CVV2 es la siguiente:
CREATE TABLE Tabla85 (
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    FECCADTAR       INT  -- FECHA DE CADUCIDAD DE LA TARJETA,
    CVV2            VARCHAR(3)  -- CÓDIGO DE CVV2,
    FILLER          VARCHAR(219)
);

-- Tabla86: El programa ATBT80 para todos los tipos de registro ofusca el PAN y obtiene el campo TOKENNEGOCIO, que está formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO. Los datos generales tendrán la siguiente estructura: Estructura común inicial para todos los tipos de registro (ATINTCR2):
CREATE TABLE Tabla86 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DEL CLIENTE,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    IND_ENVIO       VARCHAR(1)  -- INDICADOR DE ENVÍO (LLEVARÁ UNA ‘O’ SI VA A IR A OFICINA EN LUGAR DE AL CLIENTE),
    CENTRO          VARCHAR(4)  -- CENTRO DE ENVÍO,
    TIPO_CAR        INT  -- TIPO DE CARTA 1 - CARTA DE PIN 2 - CARTA DE BIENVENIDA 3 - CARTAS DE COMUNICACIÓN DE BLOQUEO 4 - CARTA DE COMUNICACIÓN DE IMPAGO 6 – CARTA DE CVV2,
    DATOS           VARCHAR(259)  -- DATOS VARIABLES,
    TOKENNEGOCIO    VARCHAR(37)  -- formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Tabla87: Estructura común inicial para todos los tipos de registro (ATINTCR2): La estructura de los datos para las cartas de PIN es la siguiente:
CREATE TABLE Tabla87 (
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA – OFUSCADO --,
    VISAPHONE       INT  -- CÓDIGO VISAPHONE,
    CRIPPIN         VARCHAR(16)  -- CRIPTOGRAMA DEL PIN,
    MOTCARPIN       VARCHAR(2)  -- MOTIVO DE LA CARTA DE PIN,
    FILLER          VARCHAR(174)
);

-- Tabla88: La estructura de los datos para las cartas de PIN es la siguiente: El programa que formatea el registro de detalle es el ATB431. La estructura de los datos para las cartas de Bienvenida es la siguiente:
CREATE TABLE Tabla88 (
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA– OFUSCADO --,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    FECEFE          UNKNOWN  -- FECHA DE EFECTIVIDAD DE LA TARJETA,
    FILLER          VARCHAR(186)
);

-- ERROR: No se pudieron procesar las columnas de Tabla89

-- Tabla90: El programa que formatea el registro de detalle es el ATB467. La estructura, para las cartas de comunicación de mora es la siguiente:
CREATE TABLE Tabla90 (
    FECIMPAGO       UNKNOWN  -- FECHA DE IMPAGO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE TOTAL DEL RECIBO IMPAGADO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE DEMORA,
    CLAMON          INT  -- CLAVE DE MONEDA,
    FILLER          VARCHAR(175)
);

-- ERROR: No se pudieron procesar las columnas de Tabla91

-- Tabla92: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATENVPO1):
CREATE TABLE Tabla92 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CU’ – CUENTA DE MEDIOS DE PAGO ‘DC’ – DIRECCIONES DE PERSONA POR CONTRATO ‘LC’ – LIMITES DE LA CUENTA ‘CC’ – CARTERA CONGELADA ‘LI’ – LÍNEAS ASOCIADAS A LA CUENTA ‘PC’ – PLASTICOS DE LA CUENTA ‘MP’ – MEDIO DE PAGO (TARJETA) ‘RT’ – RESTRICCIONES DE TARJETA ‘DR’ – DESGLOSE POR LÍNEA ÚLTIMO RECIBO ‘IC’ – CONTRATO IMPAGADO ‘IL’ – DESGLOSE CONTRATO IMPAGADO ‘RI’ – RECIBO IMPAGADO ‘RL’ – DESGLOSE RECIBO IMPAGADO ‘MI’ – MOVIMIENTO RECIBO IMPAGADO ‘CI’ – CONCEPTO ECONÓMICO DE MOVIMIENTO RECIBO IMPAGADO ‘‘TX’ – EXTRACTO – TIPO DE LÍNEA – TIPO IMPORTE – DEUDA VIVA,
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN
);

-- Tabla93: Detalle de campos de los registros de titulares. Este grupo de datos está diferenciado en dos subtipos de registros: Por cuenta y por tarjeta. Describe la situación de los límites y el dispuesto realizado en el nivel de cuenta y de tarjeta. Todos ellos irán precedidos por la parte común explicada previamente. Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla93 (
    FECULTCAR       UNKNOWN  -- FECHA ÚLTIMO PAGO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO
);

-- Tabla94: Detalle de campos de los registros de titulares. Este grupo de datos está diferenciado en dos subtipos de registros: Por cuenta y por tarjeta. Describe la situación de los límites y el dispuesto realizado en el nivel de cuenta y de tarjeta. Todos ellos irán precedidos por la parte común explicada previamente. Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla94 (
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    DESPRODU        VARCHAR(30)  -- DESCRIPCIÓN DEL PRODUCTO,
    TIPOCTO         VARCHAR(20)  -- TIPO DE CONTRATO DEBITO CREDITO PREPAGO PREPAGO REGALO,
    FECPROVEN       UNKNOWN  -- FECHA DE PRÓXIMO VENCIMIENTO,
    FECULTVEN       UNKNOWN  -- FECHA DE ÚLTIMO VENCIMIENTO,
    FECRESOL        UNKNOWN  -- FECHA DE RESOLUCIÓN DEL CONTRATO,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DEL CLIENTE,
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    DESBLQ          VARCHAR(30)  -- DESCRIPCIÓN DEL BLOQUEO,
    INDBLQOPE       VARCHAR(1)  -- INDICADOR DE BLOQUEO DE OPERATIVIDAD,
    DESBLQOPE       VARCHAR(25)  -- DESCRIPCIÓN DE BLOQUEO DE OPERATIVIDAD: N: SIN BLOQUEO S: BLOQUEO DE OPERACIONES T: BLOQUEO DE OPER. Y PAGOS,
    CODESTCTA       INT  -- CÓDIGO DE ESTADO DEL CONTRATO DE TARJETA,
    DESESTCTA       VARCHAR(30)  -- DESCRIPCIÓN ESTADO DE CONTRATO 00 – OPERATIVO 01 – IMPAGADO LEVE 02 – IMPAGADO GRAVE 03 – IMPAGADO DEFINITIVO,
    CLASIFCONT      VARCHAR(1)  -- CLASIFICACIÓN CONTABLE,
    DESCLASIFCONT   VARCHAR(30)  -- DESCRIPCIÓN CLASIFICACIÓN CONTABLE: N – NORMAL D – DUDOSO G – CONGELADA C – CASTIGO O FALLIDO
);

-- Tabla95: Detalle de campos de los registros de titulares. Este grupo de datos está diferenciado en dos subtipos de registros: Por cuenta y por tarjeta. Describe la situación de los límites y el dispuesto realizado en el nivel de cuenta y de tarjeta. Todos ellos irán precedidos por la parte común explicada previamente. Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla95 (
    FECULTESTCTA    UNKNOWN  -- FECHA ÚLTIMO CAMBIO DE ESTADO DEL CONTRATO DE TARJETA,
    CODCONVEN       VARCHAR(4)  -- CÓDIGO DE CONVENIO,
    DESCONVENRED    VARCHAR(10)  -- DESCRIPCIÓN DE CONVENIO REDUCIDA (MPDT168),
    INDCTAEMP       INT  -- INDICADOR DE CUENTA DE EMPRESA,
    DESINDCTAEMP    VARCHAR(20)  -- DESCRIPCIÓN INDICADOR CUENTA DE EMPRESA 0 - PARTICULAR 1 – EMPRESA 2 – ESTRUCTURA BUSINESS,
    CODBUS          INT  -- CÓDIGO DE ESTRUCTURA BUSINESS,
    DESESTBUS       VARCHAR(30)  -- DESCRIPCIÓN DE LA ESTRUCTURA,
    CODELEMENTO     INT  -- CÓDIGO DE ELEMENTO DENTRO DE LA ESTRUCTURA BUSINESS,
    TIPROLCUENTA    VARCHAR(1)  -- TIPO DE ROL DE LA CUENTA EN LA ESTRUCTURA BUSINESS,
    DESROLCUENTA    VARCHAR(20)  -- DESCRIPCIÓN DE ROL DE LA CUENTA EN LA ESTRUCTURA BUSINESS U = CUENTA DE CONTROL DE CUOTAS O ACTIVIDAD (ÚNICA) E = CUENTA DE EMPLEADO,
    INDDOMCARCRE    VARCHAR(1)  -- INDICADOR DE DOMICILIACIÓN DEL CARGO DEL EXTRACTO DE CRÉDITO (S/N),
    FORPAGO         INT  -- FORMA DE PAGO DEL EXTRACTO DE CRÉDITO,
    DESFORPAGO      VARCHAR(15)  -- DESCRIPCIÓN DE LA FORMA DE PAGO – PAGO DÉBITO CONTADO – PAGO TOTAL – PAGO FIJO – PAGO APLAZADO – PAGO FIJO CON OP. FIN.
);

-- Tabla96: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla96 (
    INDSITCTA       INT  -- INDICADOR DE SITUACIÓN DEL CONTRATO,
    DESSITCTA       VARCHAR(30)  -- DESCRIPCIÓN INDICADOR DE SITUACION DEL CONTRATO 0 – ACTIVO 1 – EN ESPERA RESOLUCIÓN NO EMITIDA TJT 2 – NO RESUELTA 3 – EN ESPERA DE CONFIRMAR POR CLIENTE. TARJETA EMITIDA 4 – ALTA DE CONTRATO SIN TARJETA,
    OFIGESTORA      VARCHAR(4)  -- OFICINA GESTORA,
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    FECBAJA         UNKNOWN  -- FECHA DE BAJA,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    INDTIPOCTO      VARCHAR(1)  -- INDICADOR TIPO CONTRATO,
    INTGENMORA      DECIMAL(13, 4)  -- INTERES GENERACION MORA,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE PAGO,
    IMPPAGO         DECIMAL(17, 2)  -- IMPORTE FIJO PAGO,
    INDVCF          VARCHAR(1)  -- INDICACOR DE CONTRATO ACOGIDO A V.C.F. POSIBLES VALORES: S/N,
    INDPPMIN        VARCHAR(1)  -- INDICADOR DE CONTRATO ACOGIDO A PROMOCIÓN DE PAGO MÍNIMO. POSIBLES VALORES: S/N
);

-- Tabla97: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla97 (
    INDCREFI        VARCHAR(2)  -- INDICADOR DE CONTRATO REFINANCIADO N - NORMAL DF - DIFERIMIENTOS NV - NOVACIÓN R1 - REFINANCIAMIENTO B1 R2 - REFINANCIAMIENTO B2 RC - REFINANCIAMIENTO COVID RS - REESTRUCTURACIÓN RC - REESTRUCTURACIÓN COVID,
    DESINDCREFI     VARCHAR(30)  -- DESCRIPCIÓN DE CONTRATO REFINANCIADO,
    FECREFI         UNKNOWN  -- FECHA DE REFINANCIACIÓN,
    CODESTCTACR     INT  -- CÓDIGO DE ESTADO CORE,
    FECULTESTCTA_CR UNKNOWN  -- FECHA DE ÚLTIMO ESTADO CORE,
    CODESTBCACT     VARCHAR(4)  -- CÓDIGO ESTADO CALIFIACIÓN DE RIESTO ANTERIOR,
    FECULTESTBC     UNKNOWN  -- FECHA DE ÚLTIMO ESTADO BANCO CENTRAL,
    INDCASTAUT      VARCHAR(1)  -- INDICADOR DE CASTIGO AUTOMÁTICO. POSIBLES VALORES: E-Exento N-No aplica,
    FECCASTAUT      UNKNOWN  -- FECHA DE CASTIGO AUTOMÁTICO
);

-- Tabla98
CREATE TABLE Tabla98 (
    FORPAGOTEMP     INT  -- FORMA DE PAGO TEMPORAL DEL EXTRACTO DE CRÉDITO: – PAGO TOTAL – FIJO – PAGO APLAZADO – FIJO CON OPERACIONES FINANCIADAS,
    DESFORPAGOTE_M  VARCHAR(15)  -- DESCRIPCIÓN FORMA DE PAGO TEMPORAL,
    FIFORPAGT       UNKNOWN  -- FECHA INICIO FORMA PAGO TEMPORAL,
    FFFORPAGT       UNKNOWN  -- FECHA FIN FORMA PAGO TEMPORAL,
    IMPFPATEM       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL,
    PORPATEM        DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO TEMPORAL,
    FILLER          VARCHAR(207)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla99: Estructura de datos a nivel de direcciones de personas por contrato. Tipo de registro ‘DC’
CREATE TABLE Tabla99 (
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    TIPDIREC        VARCHAR(2)  -- TIPO DE MEDIO,
    DESTIPDIREC     VARCHAR(30)  -- DESCRIPCIÓN TIPO DE MEDIO DP: DIRECCIÓN POSTAL EM: EMAIL,
    NUMSEC          INT  -- NÚMERO SECUENCIAL DEL REGISTRO,
    CODUSO          VARCHAR(2)  -- CÓDIGO DE USO DE LA DIRECCIÓN,
    DESCODUSO       VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE USO DE LA DIRECCIÓN,
    FECALTA         VARCHAR(10)  -- FECHA DE ALTA,
    DIREMAIL        VARCHAR(100)  -- DIRECCIÓN DE EMAIL
);

-- Tabla100: Estructura de datos a nivel de direcciones de personas por contrato. Tipo de registro ‘DC’
CREATE TABLE Tabla100 (
    CARACTER        VARCHAR(1)  -- CARÁCTER,
    DESCARACTER     VARCHAR(30)  -- DESCRIPCION CARÁCTER 1 – PARTICULAR 2 – PROFESIONAL,
    TIPDIRECC       VARCHAR(2)  -- TIPO DE DIRECCIÓN,
    DESTIPDIRECC    VARCHAR(30)  -- DESCRIPCION TIPO DE DIRECCIÓN DH – DIRECCIÓN HABITUAL DE – DIRECCIÓN EMPLEADO DS – DIRECCIÓN SECUNDARIA DL – DIRECCIÓN LABORAL DR – DIRECCIÓN EMPRESA,
    TIPLOCAL        VARCHAR(2)  -- TIPO DE LOCAL,
    CODPAISDIR      INT  -- PAÍS DE DIRECCIÓN,
    NOMPAISDIR      VARCHAR(20)  -- NOMBRE DEL PAIS,
    CODREGION       VARCHAR(3)  -- REGIÓN,
    CODPROV         VARCHAR(2)  -- CÓDIGO DE PROVINCIA,
    DESPROV         VARCHAR(30)  -- PROVINCIA,
    POBLACION       VARCHAR(35)  -- POBLACIÓN,
    TIPVIA          VARCHAR(2)  -- TIPO DE VÍA,
    NOMVIA          VARCHAR(40)  -- NOMBRE DE VÍA,
    NUMVIA          VARCHAR(6)  -- NÚMERO DE VÍA,
    EMPRESA         VARCHAR(3)  -- EMPRESA,
    CENTRO          VARCHAR(4)  -- CENTRO,
    DEPARTAM        VARCHAR(4)  -- DEPARTAMENTO,
    EDIFICIO        VARCHAR(4)  -- EDIFICIO,
    ESCALERA        VARCHAR(4)  -- ESCALERA,
    PISO            VARCHAR(4)  -- PISO,
    PUERTA          VARCHAR(4)  -- PUERTA,
    RESTODIR        VARCHAR(40)  -- RESTO DIRECCIÓN
);

-- Tabla101: Estructura de datos a nivel de direcciones de personas por contrato. Tipo de registro ‘DC’
CREATE TABLE Tabla101 (
    CODPOSTAL       VARCHAR(10)  -- CÓDIGO POSTAL,
    CODAPTCOR       VARCHAR(10)  -- APARTADO DE CORREOS,
    VIACOMP         VARCHAR(50)  -- VIA COMPLETA/ DIRECCIÓN,
    FILLER          VARCHAR(318)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla102: Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’:
CREATE TABLE Tabla102 (
    CLAMON1         INT  -- CLAVE DE MONEDA,
    DESCLAMON1      VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA,
    LIMCRECTA1      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    LIMCRECTATEM1   DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA. TEMPORAL,
    FECINITEM1      UNKNOWN  -- INICIO VIGENCIA DE LÍMITES TEMPORALES,
    FECFINTEM1      UNKNOWN  -- FIN VIGENCIA DE LÍMITES TEMPORALES,
    SIG__SALAUTCRE1 VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO AUTORIZADO,
    SALAUTCRE1      DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO,
    SIG_SALDISCRE1  VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO DISPUESTO,
    SALDISCRE1      DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPUESTO,
    SIG__SALDISPOCRE1 VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO DISPONIBLE,
    SALDISPOCRE1    DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPONIBLE,
    LIMCRECTAC1     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS
);

-- Tabla103: Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’:
CREATE TABLE Tabla103 (
    SIG__SALAUTCREC1 VARCHAR(1)  -- SIGNO SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SALAUTCREC1     DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SIG__SALDISCREC1 VARCHAR(1)  -- SIGNO SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SALDISCREC1     DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SIG__SALDISPOCREC1 VARCHAR(1)  -- SIGNO SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    SALDISPOCREC1   DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    IBAN1           VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO1       VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    CLAMON2         INT  -- CLAVE DE MONEDA,
    DESCLAMON2      VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA,
    LIMCRECTA2      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    LIMCRECTATEM2   DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA. TEMPORAL,
    FECINITEM2      UNKNOWN  -- INICIO VIGENCIA DE LÍMITES TEMPORALES,
    FECFINTEM2      UNKNOWN  -- FIN VIGENCIA DE LÍMITES TEMPORALES,
    SIG__SALAUTCRE2 VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO AUTORIZADO,
    SALAUTCRE2      DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO,
    SIG_SALDISCRE2  VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO DISPUESTO,
    SALDISCRE2      DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPUESTO,
    SIG__SALDISPOCRE2 VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO DISPONIBLE,
    SALDISPOCRE2    DECIMAL(17, 2)  -- SALDO DE CRÉDITO DISPONIBLE
);

-- Tabla104: Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’:
CREATE TABLE Tabla104 (
    LIMCRECTAC2     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS,
    SIG__SALAUTCREC2 VARCHAR(1)  -- SIGNO SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SALAUTCREC2     DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS AUTORIZADO,
    SIG__SALDISCREC2 VARCHAR(1)  -- SIGNO SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SALDISCREC2     DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPUESTO,
    SIG__SALDISPOCREC2 VARCHAR(1)  -- SIGNO SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    SALDISPOCREC2   DECIMAL(17, 2)  -- SALDO DE COMPRA EN CUOTAS DISPONIBLE,
    IBAN2           VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO2       VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    FECSALACRE1     UNKNOWN  -- INICIO VIGENCIA DE SALDO ACREEDOR MONEDA1,
    FECSALACRE2     UNKNOWN  -- INICIO VIGENCIA DE SALDO ACREEDOR MONEDA2,
    FILLER          VARCHAR(334)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla105: Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’:
CREATE TABLE Tabla105 (
    NUMSECIMP1      NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO DE MONEDA1,
    CLAMON1         INT  -- CLAVE DE MONEDA1,
    DESCLAMON1      VARCHAR(30)  -- DESCRIPCIÓN DE MONEDA1,
    SIG_IMPORTE1    VARCHAR(1)  -- SIGNO DEL IMPORTE TRASPASADO MONEDA1
);

-- Tabla106: Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’:
CREATE TABLE Tabla106 (
    IMPORTE1        DECIMAL(17, 2)  -- IMPORTE TRASPASADO A CONGELACIÓN MONEDA1,
    SIG__IMPORTETOT1 VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL TRASPASADO MONEDA1,
    IMPORTETOT1     DECIMAL(17, 2)  -- IMPORTE TOTAL CONGELADO DE COBRO MONEDA1,
    IMPAPL1         DECIMAL(17, 2)  -- IMPORTE APLICADO MONEDA1,
    NUMULTMOV1      INT  -- NÚMERO DE ÚLTIMO MOVIMIENTO MONEDA1,
    FECULTAPL1      UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN PAGO MONEDA1,
    FECBAJA1        UNKNOWN  -- FECHA DE BAJA EN CONGELACIÓN MONEDA1,
    MOTBAJA1        INT  -- CÓDIGO DE MOTIVO DE BAJA MONEDA1,
    NUMSECIMP2      NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO DE MONEDA1,
    CLAMON2         INT  -- CLAVE DE MONEDA2,
    DESCLAMON2      VARCHAR(30)  -- DESCRIPCIÓN DE MONEDA2,
    SIG_IMPORTE2    VARCHAR(1)  -- SIGNO DEL IMPORTE TRASPASADO MONEDA2,
    IMPORTE2        DECIMAL(17, 2)  -- IMPORTE TRASPASADO A CONGELACIÓN MONEDA2,
    SIG__IMPORTETOT2 VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL TRASPASADO MONEDA2,
    IMPORTETOT2     DECIMAL(17, 2)  -- IMPORTE TOTAL CONGELADO DE COBRO MONEDA2,
    IMPAPL2         DECIMAL(17, 2)  -- IMPORTE APLICADO MONEDA2,
    NUMULTMOV2      INT  -- NÚMERO DE ÚLTIMO MOVIMIENTO MONEDA2,
    FECULTAPL2      UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN PAGO MONEDA2,
    FECBAJA2        UNKNOWN  -- FECHA DE BAJA EN CONGELACIÓN MONEDA2,
    MOTBAJA2        INT  -- CÓDIGO DE MOTIVO DE BAJA MONEDA2,
    FECALTA         UNKNOWN  -- FECHA DE ALTA EN CONGELACIÓN,
    FILLER          VARCHAR(576)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla107: Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla107 (
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DE CLIENTE EN EL SISTEMA CORPORATIVO DE LA ENTIDAD,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN.,
    DESCALPART      VARCHAR(15)  -- DESCRIPCIÓN DE CALIDAD DE PARTICIPACIÓN: TI – TITULAR BE – BENEFICIARIO,
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    DESMAR          VARCHAR(30)  -- DESCRIPCIÓN DE LA MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT         VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE TARJETA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE LA TARJETA,
    FECULTUSO       UNKNOWN  -- FECHA DE ÚLTIMO USO DE LA TARJETA,
    INDSITTAR       INT  -- INDICADOR DE SITUACIÓN,
    DESSITTAR       VARCHAR(30)  -- DESCRIPCIÓN DE LA SITUACIÓN DE LA TARJETA 01 – SELECCIONADA ESTAMPACIÓN ALTA 02 – PENDIENTE DE ACUSE DE RECIBO POR ALTA. 03 – SELECCIONADA PARA ESTAMPACIÓN POR RENOVACIÓN. 04 – PENDIENTE DE ACUSE DE RECIBO POR RENOVACIÓN. 05 – EN PODER DEL CLIENTE. 06 – PENDIENTE CAMBIO PIN POR ALTA.
);

-- Tabla108: Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’: Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla108 (
    CODBLQ          INT  -- INDICADOR DE BLOQUEO,
    DESBLQ          VARCHAR(30)  -- DESCRIPCIÓN DEL BLOQUEO
);

-- Tabla109: Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla109 (
    FECCADTAR       INT  -- FECHA DE CADUCIDAD DE LA TARJETA,
    INDDEBCRE       INT  -- INDICADOR DE OPERATIVIDAD DE LA TARJETA,
    DESDEBCRE       VARCHAR(15)  -- DESCRIPCIÓN INDICADOR DE OPERATIVIDAD DE LA TARJETA: 1 – CRÉDITO 2 – DÉBITO 3 – MIXTA 4 – PREPAGO MONEDERO 5 – PREPAGO REGALO 6 – PREPAGO,
    NUMPLASTICO     NUMERIC(12)  -- NÚMERO DE PLÁSTICO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA,
    MAXDIACAJ       INT  -- MÁXIMO DIARIO DE CAJERO,
    NUMOPERCAJ      INT  -- NÚMERO DE OPERACIONES EN CAJERO,
    MAXOPER         INT  -- MÁXIMO NÚMERO DE OPERACIONES POR PERIODO,
    NUMOPER         INT  -- NÚMERO DE OPERACIONES POR PERIODO,
    MAXODIA         INT  -- MÁXIMO NÚMERO DE OPERACIONES POR DIA,
    NUMODIA         INT  -- NÚMERO DE OPERACIONES DIARIA,
    OFFSET1         VARCHAR(12)  -- OFFSET1,
    LIMDIACAJ       DECIMAL(17, 2)  -- LÍMITE DIARIO EN CAJERO,
    SALDIACAJ       DECIMAL(17, 2)  -- SALDO DIARIO DE CAJERO,
    LIMCRETAR       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE TARJETA. LÍMITE GLOBAL DE LA TARJETA,
    LIMCRETARTEM    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO TEMPORAL DE TARJETA. LÍMITE GLOBAL TEMPORAL DE LA TARJETA
);

-- Tabla110: Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla110 (
    FECINICRETAR    UNKNOWN  -- INICIO VIGENCIA LÍMITE TEMPORAL. CRÉDITO DE LA TARJETA,
    FECFINCRETAR    UNKNOWN  -- FIN VIGENCIA LÍMITE TEMPORAL CRÉDITO DE LA TARJETA,
    LIMCREMES       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO MENSUAL. LÍMITE MENSUAL CUANDO NO HAY RESTRICCIÓN A NIVEL DE ACTIVIDAD O COMERCIO.,
    LIMCREMESTEM    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO TEMPORAL MENSUAL. LÍMITE MENSUAL CUANDO NO HAY RESTRICCIÓN A NIVEL DE ACTIVIDAD O COMERCIO.,
    FECINICREMES    UNKNOWN  -- INICIO VIGENCIA LÍMITE TEMPORAL CRÉDITO MENSUAL,
    FECFINCREMES    UNKNOWN  -- FIN VIGENCIA LÍMITE TEMPORAL CRÉDITO MENSUAL,
    LIMDEBMES       DECIMAL(17, 2)  -- LÍMITE DE DÉBITO MENSUAL.,
    LIMDEBMESTEM    DECIMAL(17, 2)  -- LÍMITE DE DÉBITO TEMPORAL MENSUAL,
    FECINIDEBMES    UNKNOWN  -- INICIO VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    FECFINDEBMES    UNKNOWN  -- FIN VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    FECAUTDIA       UNKNOWN  -- FECHA DE AUTORIZACIÓN DIARIA,
    LIMCREDIA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DIARIO,
    LIMCREDIATEM    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO TEMPORAL DIARIO,
    FECINICREDIA    UNKNOWN  -- INICIO VIGENCIA LÍMITE TEMPORAL CRÉDITO DIARIO,
    FECFINCREDIA    UNKNOWN  -- FIN VIGENCIA LÍMITE TEMPORAL CRÉDITO DIARIO,
    LIMDEBDIA       DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DIARIO.,
    LIMDEBDIATEM    DECIMAL(17, 2)  -- LÍMITE DE DÉBITO TEMPORAL DIARIO
);

-- Tabla111: Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’:
CREATE TABLE Tabla111 (
    FECINIDEBDIA    UNKNOWN  -- INICIO VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    FECFINDEBDIA    UNKNOWN  -- FIN VIGENCIA LÍMITE TEMPORAL DÉBITO MENSUAL,
    SALAUTCREMES    DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO MENSUAL,
    SALAUTDEBMES    DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO MENSUAL,
    SALAUTCRED      DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO DIARIO,
    SALAUTDEBD      DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO DIARIO,
    SIG__SALAUTPRE  VARCHAR(1)  -- SIGNO SALDO AUTORIZADO EN PREPAGO,
    SALAUTPRE       DECIMAL(17, 2)  -- SALDO AUTORIZADO EN PREPAGO,
    SIG__SALDISPRE  VARCHAR(1)  -- SIGNO SALDO DISPUESTO EN PREPAGO,
    SALDISPRE       DECIMAL(17, 2)  -- SALDO DISPUESTO EN PREPAGO,
    IBAN            VARCHAR(4)  -- CÓDIGO IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    TIPCLIEN        VARCHAR(2)  -- TIPO DE CLIENTE,
    SUBTIPCLI       VARCHAR(2)  -- SUBTIPO DE CLIENTE,
    FILLER          VARCHAR(75)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla112: Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla112 (
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA DE TARJETA
);

-- Tabla113: Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla113 (
    TIPRESTRIC      VARCHAR(2)  -- TIPO DE RESTRICCIÓN,
    DESTIPRESTRIC   VARCHAR(20)  -- DESCRIPCIÓN TIPO DE RESTRICCIÓN: CO – COMERCIO GC – GRUPO DE COMERCIO CA – CÓDIGO DE ACTIVIDAD TF – TIPO DE FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO / GRUPO DE COMERCIO,
    DESCODCOM       VARCHAR(30)  -- DESCRIPCIÓN DEL GRUPO DE COMERCIO /COMERCIO (SOLO SI ES PROPIO) (GRUPO T003 Y COMERCIO T001),
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    DESCODACT       VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE ACTIVIDAD,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    SIGNO           VARCHAR(1)  -- SIGNO DEL TIPO DE FACTURA,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    LIMCREMES       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    LIMCREMESTEM    DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    FECINICREMES    UNKNOWN  -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    FECFINCREMES    UNKNOWN  -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO MENSUAL PARA LA RESTRICCION DE LA TARJETA
);

-- Tabla114: Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla114 (
    SALAUTCREMES    DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO MENSUAL PARA LA RESTRICCION DE TARJETA,
    LIMDEBMES       DECIMAL(17, 2)  -- LÍMITE DE DÉBITO EN EL MES NATURAL PARA LA RESTRICCION DE LA TARJETA,
    LIMDEBMESTEM    DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE DÉBITO EN EL MES NATURAL PARA LA RESTRICCION DE LA TARJETA,
    FECINIDEBMES    UNKNOWN  -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    FECFINDEBMES    UNKNOWN  -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO MENSUAL PARA LA RESTRICCION DE LA TARJETA,
    SALAUTDEBMES    DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO EN EL MES NATURAL PARA LA RESTRICCION DE LA TARJETA,
    MAXOPER         INT  -- NÚMERO MÁXIMO DE OPERACIONES PERMITIDAS EN EL MES PARA LA RESTRICCION DE LA TARJETA,
    NUMOPER         INT  -- NÚMERO DE OPERACIONES REALIZADAS EN EL MES PARA LA RESTRICCION DE LA TARJETA,
    FECAUTDIA       UNKNOWN  -- FECHA DE AUTORIZACIÓN DIARIA,
    LIMCREDIA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    LIMCREDIATEM    DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECINICREDIA    UNKNOWN  -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECFINCREDIA    UNKNOWN  -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE CRÉDITO DIARIO PARA LA RESTRICCION DE LA TARJETA
);

-- Tabla115: Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla115 (
    SALAUTCRED      DECIMAL(17, 2)  -- SALDO AUTORIZADO A CRÉDITO EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    LIMDEBDIA       DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    LIMDEBDIATEM    DECIMAL(17, 2)  -- LÍMITE TEMPORAL DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECINIDEBDIA    UNKNOWN  -- FECHA DE INICIO DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    FECFINDEBDIA    UNKNOWN  -- FECHA DE FIN DE VIGENCIA DEL LÍMITE TEMPORAL DE DÉBITO DIARIO PARA LA RESTRICCION DE LA TARJETA,
    SALAUTDEBD      DECIMAL(17, 2)  -- SALDO AUTORIZADO A DÉBITO EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    MAXODIA         INT  -- NÚMERO MÁXIMO DE OPERACIONES PERMITIDAS EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    NUMODIA         INT  -- NÚMERO DE OPERACIONES REALIZADAS EN EL DÍA PARA LA RESTRICCION DE LA TARJETA,
    FILLER          VARCHAR(354)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla116: Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’:
CREATE TABLE Tabla116 (
    NUMPLASTICO     NUMERIC(12)  -- NÚMERO DE PLÁSTICO,
    FECENVEST       UNKNOWN  -- FECHA DE ENVÍO A ESTAMPACIÓN,
    FECRECEST       UNKNOWN  -- FECHA DE RECHAZO DE ESTAMPACIÓN,
    FECACUSER       UNKNOWN  -- FECHA ACUSE DE RECIBO,
    FECULTREN       UNKNOWN  -- FECHA ÚLTIMA RENOVACIÓN
);

-- Tabla117: Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’:
CREATE TABLE Tabla117 (
    FECRECTAR       UNKNOWN  -- FECHA DE RECUPERACIÓN PLÁSTICO,
    FCORETTAR       UNKNOWN  -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR       UNKNOWN  -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    CONDEST         VARCHAR(3)  -- CONDICIONES DE ESTAMPACIÓN,
    DESCONEST       VARCHAR(30)  -- DESCRIPCIÓN DE LA CONDICIÓN DE ESTAMPACIÓN (T662),
    FILLER          VARCHAR(733)  -- ESPACIO DISPONIBLE DEL REGISTRO.
);

-- Tabla118: Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Estructura de datos a nivel de desglose por línea de último recibo: Tipo de registro ‘DR’:
CREATE TABLE Tabla118 (
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO,
    SITUAREC        INT  -- INDICADOR DE SITUACIÓN DEL RECIBO,
    DESSITUAC       VARCHAR(30)  -- DESCRIPCIÓN INDICADOR DE SITUACIÓN DEL RECIBO: 0 - PENDIENTE 1 - ENVIADO A PASIVO 2 - PAGADO 3 - DOMICILIACIÓN ERRÓNEA 4 - RECLAMADO 5 - NO PAGO 6 - ENVIADO A DOMICILIACIÓN AJENA 7 - ENVIADO A CHEQUES (SÓLO PARA ABONOS) 8 - REENVIADO (POR 2ª CÁMARA) 9 - PENDIENTE REENVÍO 10 - TRASPASADO A MONEDA PRINCIPAL,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA,
    FECEMIMOV       UNKNOWN  -- FECHA DE CARGO DEL RECIBO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO MOVIMIENTO,
    FECIMPMOV       UNKNOWN  -- FECHA DE IMPAGO (A PARTIR DE ESTA FECHA SIN COBRAR PASA A SITUACIÓN DE IMPAGADO),
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN DE LA LÍNEA,
    TIPIMP01        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 01),
    DESIMP01        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 01 - CAPITAL,
    SIG_IMPINI01    VARCHAR(1)  -- SIGNO IMPORTE INICIAL CAPITAL DEL EXTRACTO,
    IMPINI01        DECIMAL(17, 2)  -- IMPORTE INICIAL CAPITAL DEL EXTRACTO
);

-- Tabla119: Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Estructura de datos a nivel de desglose por línea de último recibo: Tipo de registro ‘DR’:
CREATE TABLE Tabla119 (
    IMPREC01        DECIMAL(17, 2)  -- IMPORTE DE RECIBO CAPITAL,
    IMPMIN01        DECIMAL(17, 2)  -- IMPORTE MÍNIMO CAPITAL,
    IMPAPL01        DECIMAL(17, 2)  -- IMPORTE APLICADO CAPITAL,
    TIPIMP02        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 02),
    DESIMP02        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 02 - COMISIONES,
    SIG_IMPINI02    VARCHAR(1)  -- SIGNO IMPORTE INICIAL COMISIÓN DEL EXTRACTO,
    IMPINI02        DECIMAL(17, 2)  -- IMPORTE INICIAL DEL EXTRACTO COMISIÓN,
    IMPREC02        DECIMAL(17, 2)  -- IMPORTE DE RECIBO COMISIÓN,
    IMPMIN02        DECIMAL(17, 2)  -- IMPORTE MÍNIMO COMISIÓN,
    IMPAPL02        DECIMAL(17, 2)  -- IMPORTE APLICADO COMISIÓN,
    TIPIMP03        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 03),
    DESIMP03        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 03 - INTERESES,
    SIG_IMPINI03    VARCHAR(1)  -- SIGNO IMPORTE INICIAL INTERÉS DEL EXTRACTO,
    IMPINI03        DECIMAL(17, 2)  -- IMPORTE INICIAL DEL EXTRACTO INTERÉS,
    IMPREC03        DECIMAL(17, 2)  -- IMPORTE DE RECIBO INTERÉS,
    IMPMIN03        DECIMAL(17, 2)  -- IMPORTE MÍNIMO INTERÉS,
    IMPAPL03        DECIMAL(17, 2)  -- IMPORTE APLICADO INTERÉS,
    TIPIMP04        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 04),
    DESIMP04        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 04 - IMPUESTOS,
    SIG_IMPINI04    VARCHAR(1)  -- SIGNO IMPORTE INICIAL IMPUESTO DEL EXTRACTO,
    IMPINI04        DECIMAL(17, 2)  -- IMPORTE INICIAL IMPUESTO DEL EXTRACTO
);

-- Tabla120: Estructura de datos a nivel de desglose por línea de último recibo: Tipo de registro ‘DR’:
CREATE TABLE Tabla120 (
    IMPREC04        DECIMAL(17, 2)  -- IMPORTE DE RECIBO IMPUESTO,
    IMPMIN04        DECIMAL(17, 2)  -- IMPORTE MÍNIMO IMPUESTO,
    IMPAPL04        DECIMAL(17, 2)  -- IMPORTE APLICADO IMPUESTO,
    TIPIMP05        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 05),
    DESIMP05        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 05 - COMISIONES MOROSIDAD,
    SIG_IMPINI05    VARCHAR(1)  -- SIGNO IMPORTE INICIAL COMISIÓN MORA DEL EXTRACTO,
    IMPINI05        DECIMAL(17, 2)  -- IMPORTE INICIAL COMISIÓN MORA DEL EXTRACTO,
    IMPREC05        DECIMAL(17, 2)  -- IMPORTE DE RECIBO COMISIÓN MORA,
    IMPMIN05        DECIMAL(17, 2)  -- IMPORTE MÍNIMO COMISIÓN MORA,
    IMPAPL05        DECIMAL(17, 2)  -- IMPORTE APLICADO COMISIÓN MORA,
    TIPIMP06        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 06),
    DESIMP06        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 06 - INTERESES MOROSIDAD,
    SIG_IMPINI06    VARCHAR(1)  -- SIGNO IMPORTE INICIAL INTERÉS MORA DEL EXTRACTO,
    IMPINI06        DECIMAL(17, 2)  -- IMPORTE INICIAL INTERÉS MORA DEL EXTRACTO,
    IMPREC06        DECIMAL(17, 2)  -- IMPORTE DE RECIBO INTERÉS MORA,
    IMPMIN06        DECIMAL(17, 2)  -- IMPORTE MÍNIMO INTERÉS MORA,
    IMPAPL06        DECIMAL(17, 2)  -- IMPORTE APLICADO INTERÉS MORA,
    TIPIMP07        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 07),
    DESIMP07        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 07 - IMPUESTOS MOROSIDAD,
    SIG_IMPINI07    VARCHAR(1)  -- SIGNO IMPORTE INICIAL IMPUESTO MORA DEL EXTRACTO
);

-- Tabla121: Estructura de datos a nivel de desglose por línea de último recibo: Tipo de registro ‘DR’:
CREATE TABLE Tabla121 (
    IMPINI07        DECIMAL(17, 2)  -- IMPORTE INICIAL IMPUESTO MORA DEL EXTRACTO,
    IMPREC07        DECIMAL(17, 2)  -- IMPORTE DE RECIBO IMPUESTO MORA,
    IMPMIN07        DECIMAL(17, 2)  -- IMPORTE MÍNIMO IMPUESTO MORA,
    IMPAPL07        DECIMAL(17, 2)  -- IMPORTE APLICADO IMPUESTO MORA,
    TIPIMP08        INT  -- TIPO DE IMPORTE ( SIEMPRE VALOR 08),
    DESIMP08        VARCHAR(10)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 08 - VALOR PARA USO FUTURO,
    SIG_IMPINI08    VARCHAR(1)  -- SIGNO IMPORTE INICIAL USO FUTURO DEL EXTRACTO,
    IMPINI08        DECIMAL(17, 2)  -- IMPORTE INICIAL USO FUTURO DEL EXTRACTO,
    IMPREC08        DECIMAL(17, 2)  -- IMPORTE DE RECIBO USO FUTURO,
    IMPMIN08        DECIMAL(17, 2)  -- IMPORTE MÍNIMO USO FUTURO,
    IMPAPL08        DECIMAL(17, 2)  -- IMPORTE APLICADO USO FUTURO,
    FILLER          VARCHAR(54)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla122: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla122 (
    LINREF          INT  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN DE LA LÍNEA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOMRED    VARCHAR(10)  -- DESCRIPCIÓN DE LA CAMPAÑA COMERCIAL REDUCIDA,
    INDTIPOPE       VARCHAR(1)  -- INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA
);

-- Tabla123: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla123 (
    DESTIPOPE       VARCHAR(15)  -- DESCRIPCIÓN INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA: R: REVOLVING C: COMPRA CUOTAS M: MIXTAS,
    TIPOLIM         VARCHAR(1)  -- INDICADOR DE TIPO DE LÍMITE DE LA LÍNEA,
    DESTIPOLIM      VARCHAR(20)  -- DESCRIPCIÓN INDICADOR DE TIPO DE LÍMITE DE LA LÍNEA: A: LÍMITE ADICIONAL C: LÍMITE COMPARTIDO,
    FECINI          UNKNOWN  -- FECHA DE INICIO,
    FECFIN          UNKNOWN  -- FECHA DE FIN,
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    DESBLQ          VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE BLOQUEO,
    FECBLQ          UNKNOWN  -- FECHA DE ÚLTIMO BLOQUEO,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    CLAMON1         INT  -- MONEDA1 DE LA LÍNEA,
    DESCLAMON1      VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA1,
    INDPORLIM1      VARCHAR(1)  -- INDICADOR DE TIPO DE LÍMITE MONEDA1,
    DESPORLIM1      VARCHAR(30)  -- DESCRIPCIÓN DE INDICADOR DE TIPO DE LIMITE MONEDA1 I: IMPORTE P: PORCENTAJE,
    PORLIM1         INT  -- PORCENTAJE DE LÍMITE DEL CONTRATO DE LA LÍNEA MONEDA1,
    LIMCRELIN1      DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA MONEDA1,
    SIG_SALAUTLIN1  VARCHAR(1)  -- SIGNO SALDO AUTORIZADO DE LA LÍNEA MONEDA1,
    SALAUTLIN1      DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA MONEDA1
);

-- Tabla124: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla124 (
    SIG_SALDISLIN1  VARCHAR(1)  -- SIGNO SALDO DISPUESTO DE LA LÍNEA MONEDA1,
    SALDISLIN1      DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA MONEDA1,
    CLAMON2         INT  -- MONEDA2 DE LA LÍNEA,
    DESCLAMON2      VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA2,
    INDPORLIM2      VARCHAR(1)  -- INDICADOR DE TIPO DE LÍMITE MONEDA2,
    DESPORLIM2      VARCHAR(30)  -- DESCRIPCIÓN DE INDICADOR DE TIPO DE LIMITE MONEDA2 I: IMPORTE P: PORCENTAJE,
    PORLIM2         INT  -- PORCENTAJE DE LÍMITE DEL CONTRATO DE LA LÍNEA MONEDA2,
    LIMCRELIN2      DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA MONEDA2,
    SIG_SALAUTLIN2  VARCHAR(1)  -- SIGNO SALDO AUTORIZADO DE LA LÍNEA MONEDA2,
    SALAUTLIN2      DECIMAL(17, 2)  -- SALDO AUTORIZADO DE LA LÍNEA MONEDA2,
    SIG_SALDISLIN2  VARCHAR(1)  -- SIGNO SALDO DISPUESTO DE LA LÍNEA MONEDA2,
    SALDISLIN2      DECIMAL(17, 2)  -- SALDO DISPUESTO DE LA LÍNEA MONEDA2,
    FILLER          VARCHAR(421)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla125: Detalle de campos de los registros de impagados. Este grupo de estructura de datos está diferenciado en dos subestructuras: el impagado en sí y el detalle por tipo de línea – tipo de importe. Ambos irán precedidos por la parte común comentada previamente. Estructura tipo de registro datos contrato Impagado. Tipo ‘IC’:
CREATE TABLE Tabla125 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE MONEDA,
    SITUACION       INT  -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION    VARCHAR(20)  -- DESCRIPCIÓN SITUACIÓN DEL CONTRATO,
    IMPCONT         DECIMAL(17, 2)  -- IMPORTE TOTAL DE IMPAGO DEL CONTRATO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL EN IMPAGO, INCLUYE INTERESES Y COMISIONES DE MORA,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECULTAPL       UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB       UNKNOWN  -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    NUMRECIMP       INT  -- NÚMERO DE RECIBOS IMPAGADOS,
    FECVENMOV       UNKNOWN  -- FECHA VENCIMIENTO PRIMER RECIBO,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    NDIASIMPAG      INT  -- NUMERO DE DIAS DE IMPAGO,
    FILLER          VARCHAR(694)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla126: Este grupo de estructura de datos está diferenciado en dos subestructuras: el impagado en sí y el detalle por tipo de línea – tipo de importe. Ambos irán precedidos por la parte común comentada previamente. Estructura tipo de registro datos contrato Impagado. Tipo ‘IC’: Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’:
CREATE TABLE Tabla126 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA
);

-- Tabla127: Estructura tipo de registro datos contrato Impagado. Tipo ‘IC’: Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’:
CREATE TABLE Tabla127 (
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LINEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 - IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    SIG__IMPRECUP   VARCHAR(1)  -- SIGNO IMPORTE CONDONACIONES/RECUPERACIONES,
    IMPRECUP        DECIMAL(17, 2)  -- IMPORTE CONDONACIONES/RECUPERACIONES,
    SIG__IMPINCORP  VARCHAR(1)  -- SIGNO IMPORTE INCORPORADO EN RESTO DE OPERACIONES,
    IMPINCORP       DECIMAL(17, 2)  -- IMPORTE INCORPORADO EN RESTO DE OPERACIONES,
    FILLER          VARCHAR(677)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla128: Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’: Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’:
CREATE TABLE Tabla128 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE LA MONEDA,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DEL RECIBO IMPAGADO
);

-- Tabla129: Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’: Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’:
CREATE TABLE Tabla129 (
    FECEMIMOV       UNKNOWN  -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL       UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB       UNKNOWN  -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER          VARCHAR(682)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla130: Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla130 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO LINEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCION TIPO DE IMPORTE 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 - IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE
);

-- Tabla131: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla131 (
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER          VARCHAR(731)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla132: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla132 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LINEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LINEA,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN TIPO DE FACTURA,
    FECFAC          UNKNOWN  -- FECHA DEL MOVIMIENTO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE DEL MOVIMIENTO,
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO DEL MOVIMIENTO,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE DEL MOVIMIENTO,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN OPERACIÓN,
    TIPDOCPAG       INT  -- TIPO DE DOCUMENTO DE PAGO (SÓLO PARA PAGOS),
    DESCDOCPAG      VARCHAR(15)  -- DESCRIPCIÓN TIPO DE DOCUMENTO DE PAGO,
    REFDOCPAG       VARCHAR(20)  -- REFERENCIA DEL TIPO DE DOCUMENTO (SÓLO PAGOS),
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE AMORTIZADO (SÓLO PARA PAGOS),
    TIPDEVOL        INT  -- TIPOS DE IMPAGO,
    DESTIPDEVOL     VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE IMPAGO
);

-- Tabla133: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla133 (
    FEC2PRES        UNKNOWN  -- FECHA VENCIMIENTO DE 2ª PRESENTACIÓN,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    FILLER          VARCHAR(558)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla134: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla134 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN TIPO DE IMPORTE 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE DE BONIFICACIÓN CALCULADO POR EL CONCEPTO ECONÓMICO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    IMPCONSOL       DECIMAL(17, 2)  -- IMPORTE CONSOLIDADO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO
);

-- Tabla135: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla135 (
    INDPERCON       VARCHAR(1)  -- INDICADOR DE CONCEPTO PERDONADO,
    DESPERCON       VARCHAR(30)  -- DESCRIPCIÓN DE INDICADOR DE CONCEPTO PERDONADO,
    FILLER          VARCHAR(635)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla136: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Este tipo de registro lleva la información del extracto pendiente de un contrato, con los totales de los movimientos y conceptos económicos existentes en el extracto en el momento de generación de la interfase, y agrupados por los campos: CODENT,CENTALTA,CUENTA,NUMEXTCTA,CLAMON,TIPOLIN,TIPIMP.
CREATE TABLE Tabla136 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    FECEXT          UNKNOWN  -- FECHA DE EXTRACTO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESTIPIMP       VARCHAR(30)  -- DESCRIPCIÓN TIPO DE IMPORTE 00 – PAGOS 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO
);

-- Tabla137: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Este tipo de registro lleva la información del extracto pendiente de un contrato, con los totales de los movimientos y conceptos económicos existentes en el extracto en el momento de generación de la interfase, y agrupados por los campos: CODENT,CENTALTA,CUENTA,NUMEXTCTA,CLAMON,TIPOLIN,TIPIMP.
CREATE TABLE Tabla137 (
    SIGNOIMPORTE_CA VARCHAR(1)  -- CARGOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE_CA      DECIMAL(17, 2)  -- CARGOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL_CA    VARCHAR(1)  -- CARGOS: SIGNO IMPORTE APLICADO,
    IMPAPL_CA       DECIMAL(17, 2)  -- CARGOS: IMPORTE APLICADO O AMORTIZADO,
    SIGIMPBON_CA    VARCHAR(1)  -- CARGOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBON_CA       DECIMAL(17, 2)  -- CARGOS: IMPORTE BONIFICABLE,
    SIGNOIMPORTE_AB VARCHAR(1)  -- ABONOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE__AB     DECIMAL(17, 2)  -- ABONOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL__AB   VARCHAR(1)  -- ABONOS: SIGNO IMPORTE APLICADO,
    IMPAPL__AB      DECIMAL(17, 2)  -- ABONOS: IMPORTE APLICADO O AMORTIZADO
);

-- Tabla138: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Este tipo de registro lleva la información del extracto pendiente de un contrato, con los totales de los movimientos y conceptos económicos existentes en el extracto en el momento de generación de la interfase, y agrupados por los campos: CODENT,CENTALTA,CUENTA,NUMEXTCTA,CLAMON,TIPOLIN,TIPIMP.
CREATE TABLE Tabla138 (
    SIGIMPBON__AB   VARCHAR(1)  -- ABONOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBON__AB      DECIMAL(17, 2)  -- ABONOS: IMPORTE BONIFICABLE,
    FILLER          VARCHAR(626)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla139: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATENVPO2):
CREATE TABLE Tabla139 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla140

-- Tabla141: Detalle de campos de los registros de titulares. Este grupo de datos está diferenciado en dos subtipos de registros: Por cuenta y por tarjeta. Describe la situación de los límites y el dispuesto realizado en el nivel de cuenta y de tarjeta. Todos ellos irán precedidos por la parte común explicada previamente. Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘CU’:
CREATE TABLE Tabla141 (
    FECULTCAR       UNKNOWN  -- FECHA ÚLTIMO PAGO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO
);

-- ERROR: No se pudieron procesar las columnas de Tabla142

-- ERROR: No se pudieron procesar las columnas de Tabla143

-- ERROR: No se pudieron procesar las columnas de Tabla144

-- ERROR: No se pudieron procesar las columnas de Tabla145

-- ERROR: No se pudieron procesar las columnas de Tabla146

-- Tabla147: Estructura de datos a nivel de direcciones de personas por contrato. Tipo de registro ‘DC’
CREATE TABLE Tabla147 (
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    TIPDIREC        VARCHAR(2)  -- TIPO DE MEDIO,
    DESTIPDIREC     VARCHAR(30)  -- DESCRIPCIÓN TIPO DE MEDIO DP: DIRECCIÓN POSTAL EM: EMAIL,
    NUMSEC          INT  -- NÚMERO SECUENCIAL DEL REGISTRO
);

-- ERROR: No se pudieron procesar las columnas de Tabla148

-- ERROR: No se pudieron procesar las columnas de Tabla149

-- Tabla150: Estructura de datos a nivel de direcciones de personas por contrato. Tipo de registro ‘DC’ Estructura de datos a nivel de límites de la cuenta. Tipo de registro ‘LC’:
CREATE TABLE Tabla150 (
    CLAMON1         INT  -- CLAVE DE MONEDA,
    DESCLAMON1      VARCHAR(30)  -- DESCRIPCIÓN DE LA DIVISA,
    LIMCRECTA1      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    LIMCRECTATEM1   DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA. TEMPORAL,
    FECINITEM1      UNKNOWN  -- INICIO VIGENCIA DE LÍMITES TEMPORALES,
    FECFINTEM1      UNKNOWN  -- FIN VIGENCIA DE LÍMITES TEMPORALES,
    SIG__SALAUTCRE1 VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO AUTORIZADO,
    SALAUTCRE1      DECIMAL(17, 2)  -- SALDO DE CRÉDITO AUTORIZADO,
    SIG_SALDISCRE1  VARCHAR(1)  -- SIGNO SALDO DE CRÉDITO DISPUESTO
);

-- ERROR: No se pudieron procesar las columnas de Tabla151

-- ERROR: No se pudieron procesar las columnas de Tabla152

-- Tabla153: Estructura de datos a nivel de cartera congelada. Tipo de registro ‘CC’:
CREATE TABLE Tabla153 (
    NUMSECIMP1      NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO DE MONEDA1
);

-- ERROR: No se pudieron procesar las columnas de Tabla154

-- ERROR: No se pudieron procesar las columnas de Tabla155

-- Tabla156: Estructura de datos a nivel de Tarjetas: Tipo de registro ‘MP’: Para este tipo de Registro se ofusca el campo PAN, por tanto, se expondrán un máximo de 10 dígitos (es decir, los primeros seis y cualquier otros cuatro, que en este caso serán los 4 últimos dígitos del PAN. Se añade al final el TOKENNEGOCIO que está formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO (total 37 posiciones).
CREATE TABLE Tabla156 (
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DE CLIENTE EN EL SISTEMA CORPORATIVO DE LA ENTIDAD,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN.,
    DESCALPART      VARCHAR(15)  -- DESCRIPCIÓN DE CALIDAD DE PARTICIPACIÓN: TI – TITULAR BE – BENEFICIARIO,
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    DESMAR          VARCHAR(30)  -- DESCRIPCIÓN DE LA MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT         VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE TARJETA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE LA TARJETA,
    FECULTUSO       UNKNOWN  -- FECHA DE ÚLTIMO USO DE LA TARJETA,
    INDSITTAR       INT  -- INDICADOR DE SITUACIÓN,
    DESSITTAR       VARCHAR(30)  -- DESCRIPCIÓN DE LA SITUACIÓN DE LA TARJETA – SELECCIONADA ESTAMPACIÓN ALTA – PENDIENTE DE ACUSE DE RECIBO POR ALTA.
);

-- ERROR: No se pudieron procesar las columnas de Tabla157

-- ERROR: No se pudieron procesar las columnas de Tabla158

-- ERROR: No se pudieron procesar las columnas de Tabla159

-- ERROR: No se pudieron procesar las columnas de Tabla160

-- Tabla161: Estructura de datos a nivel de restricciones de tarjeta: Tipo de registro ‘RT’:
CREATE TABLE Tabla161 (
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA DE TARJETA,
    TIPRESTRIC      VARCHAR(2)  -- TIPO DE RESTRICCIÓN,
    DESTIPRESTRIC   VARCHAR(20)  -- DESCRIPCIÓN TIPO DE RESTRICCIÓN: CO – COMERCIO GC – GRUPO DE COMERCIO CA – CÓDIGO DE ACTIVIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla162

-- ERROR: No se pudieron procesar las columnas de Tabla163

-- ERROR: No se pudieron procesar las columnas de Tabla164

-- Tabla165: Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’:
CREATE TABLE Tabla165 (
    NUMPLASTICO     NUMERIC(12)  -- NÚMERO DE PLÁSTICO,
    FECENVEST       UNKNOWN  -- FECHA DE ENVÍO A ESTAMPACIÓN,
    FECRECEST       UNKNOWN  -- FECHA DE RECHAZO DE ESTAMPACIÓN,
    FECACUSER       UNKNOWN  -- FECHA ACUSE DE RECIBO,
    FECULTREN       UNKNOWN  -- FECHA ÚLTIMA RENOVACIÓN,
    FECRECTAR       UNKNOWN  -- FECHA DE RECUPERACIÓN PLÁSTICO,
    FCORETTAR       UNKNOWN  -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR       UNKNOWN  -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    CONDEST         VARCHAR(3)  -- CONDICIONES DE ESTAMPACIÓN,
    DESCONEST       VARCHAR(30)  -- DESCRIPCIÓN DE LA CONDICIÓN DE ESTAMPACIÓN (T662),
    FILLER          VARCHAR(733)  -- ESPACIO DISPONIBLE DEL REGISTRO.
);

-- Tabla166: Estructura de datos a nivel de plásticos de la cuenta: Tipo de registro ‘PC’: Estructura de datos a nivel de desglose por línea de último recibo: Tipo de registro ‘DR’:
CREATE TABLE Tabla166 (
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO
);

-- ERROR: No se pudieron procesar las columnas de Tabla167

-- ERROR: No se pudieron procesar las columnas de Tabla168

-- ERROR: No se pudieron procesar las columnas de Tabla169

-- ERROR: No se pudieron procesar las columnas de Tabla170

-- Tabla171: Estructura tipo de registro de cabecera de cuentas. Tipo de registro ‘LI’:
CREATE TABLE Tabla171 (
    LINREF          INT  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN DE LA LÍNEA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA A LA CUAL ESTÁ ASOCIADA LA LÍNEA,
    DESCAMCOMRED    VARCHAR(10)  -- DESCRIPCIÓN DE LA CAMPAÑA COMERCIAL REDUCIDA,
    INDTIPOPE       VARCHAR(1)  -- INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA,
    DESTIPOPE       VARCHAR(15)  -- DESCRIPCIÓN INDICADOR DE TIPO DE OPERATIVA DE LA LÍNEA:
);

-- ERROR: No se pudieron procesar las columnas de Tabla172

-- ERROR: No se pudieron procesar las columnas de Tabla173

-- Tabla174: Detalle de campos de los registros de impagados. Este grupo de estructura de datos está diferenciado en dos subestructuras: el impagado en sí y el detalle por tipo de línea – tipo de importe. Ambos irán precedidos por la parte común comentada previamente. Estructura tipo de registro datos contrato Impagado. Tipo ‘IC’:
CREATE TABLE Tabla174 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE MONEDA,
    SITUACION       INT  -- SITUACIÓN DEL CONTRATO IMPAGADO,
    DESSITUACION    VARCHAR(20)  -- DESCRIPCIÓN SITUACIÓN DEL CONTRATO,
    IMPCONT         DECIMAL(17, 2)  -- IMPORTE TOTAL DE IMPAGO DEL CONTRATO
);

-- ERROR: No se pudieron procesar las columnas de Tabla175

-- Tabla176: Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’:
CREATE TABLE Tabla176 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LINEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE IMPORTE 01 – CAPITAL – COMISIONES – INTERESES - IMPUESTOS – COMISIONES MOROSIDAD – INTERESES MOROSIDAD – IMPUESTOS MOROSIDAD – VALOR PARA USO FUTURO
);

-- ERROR: No se pudieron procesar las columnas de Tabla177

-- Tabla178: Estructura tipo de registro desglose contrato impagado: Tipo de registro ‘IL’: Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’:
CREATE TABLE Tabla178 (
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE LA MONEDA,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO ORIGINAL,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DEL RECIBO IMPAGADO,
    FECEMIMOV       UNKNOWN  -- FECHA EMISIÓN DEL RECIBO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO DEL RECIBO,
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DEL RECIBO IMPAGADO,
    IMPAGO          DECIMAL(17, 2)  -- IMPORTE TOTAL DEL IMPAGO. (INCLUYE INTERESES Y COMISIONES DE MORA),
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECULTAPL       UNKNOWN  -- FECHA DE ÚLTIMA APLICACIÓN,
    FECENVCOB       UNKNOWN  -- FECHA DE ENVÍO A LA APLICACIÓN DE COBRANZAS,
    FILLER          VARCHAR(682)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla179: Estructura tipo de registro recibo impagado: Tipo de registro ‘RI’: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’:
CREATE TABLE Tabla179 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO LINEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCION TIPO DE IMPORTE 01 – CAPITAL – COMISIONES – INTERESES - IMPUESTOS – COMISIONES MOROSIDAD – INTERESES MOROSIDAD – IMPUESTOS MOROSIDAD – VALOR PARA USO FUTURO,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE CORRESPONDIENTE AL TIPO DE IMPORTE,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO AL TIPO DE IMPORTE,
    FILLER          VARCHAR(731)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla180: Estructura tipo de registro desglose recibo impagado: Tipo de registro ‘RL’: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’:
CREATE TABLE Tabla180 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CLAMON          INT  -- MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE DE MONEDA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LINEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LINEA
);

-- ERROR: No se pudieron procesar las columnas de Tabla181

-- Tabla182: Estructura tipo de registro movimiento recibo impagado: Tipo de registro ‘MI’: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’:
CREATE TABLE Tabla182 (
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA RECIBO IMPAGADO,
    NUMMOVIMP       INT  -- NÚMERO DE MOVIMIENTO DEL RECIBO IMPAGADO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE CONCEPTO ECONÓMICO
);

-- ERROR: No se pudieron procesar las columnas de Tabla183

-- Tabla184: Estructura de datos correspondiente a conceptos económicos de cada movimiento del recibo impagado. Tipo de registro: ’CI’: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Este tipo de registro lleva la información del extracto pendiente de un contrato, con los totales de los movimientos y conceptos económicos existentes en el extracto en el momento de generación de la interfase, y agrupados por los campos: CODENT,CENTALTA,CUENTA,NUMEXTCTA,CLAMON,TIPOLIN,TIPIMP.
CREATE TABLE Tabla184 (
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    CLAMON          INT  -- CLAVE DE MONEDA
);

-- Tabla185: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Este tipo de registro lleva la información del extracto pendiente de un contrato, con los totales de los movimientos y conceptos económicos existentes en el extracto en el momento de generación de la interfase, y agrupados por los campos: CODENT,CENTALTA,CUENTA,NUMEXTCTA,CLAMON,TIPOLIN,TIPIMP.
CREATE TABLE Tabla185 (
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAVE DE MONEDA,
    FECEXT          UNKNOWN  -- FECHA DE EXTRACTO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN TIPO DE LÍNEA,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESTIPIMP       VARCHAR(30)  -- DESCRIPCIÓN TIPO DE IMPORTE 00 – PAGOS 01 – CAPITAL 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS 05 – COMISIONES MOROSIDAD 06 – INTERESES MOROSIDAD 07 – IMPUESTOS MOROSIDAD 08 – VALOR PARA USO FUTURO,
    SIGNOIMPORTE_CA VARCHAR(1)  -- CARGOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE_CA      DECIMAL(17, 2)  -- CARGOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL_CA    VARCHAR(1)  -- CARGOS: SIGNO IMPORTE APLICADO,
    IMPAPL_CA       DECIMAL(17, 2)  -- CARGOS: IMPORTE APLICADO O AMORTIZADO,
    SIGIMPBON_CA    VARCHAR(1)  -- CARGOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-)
);

-- Tabla186: Estructura de datos correspondiente a los datos por extracto-tipo de línea-tipos de importe: ’TX’: Este tipo de registro lleva la información del extracto pendiente de un contrato, con los totales de los movimientos y conceptos económicos existentes en el extracto en el momento de generación de la interfase, y agrupados por los campos: CODENT,CENTALTA,CUENTA,NUMEXTCTA,CLAMON,TIPOLIN,TIPIMP.
CREATE TABLE Tabla186 (
    IMPBON_CA       DECIMAL(17, 2)  -- CARGOS: IMPORTE BONIFICABLE,
    SIGNOIMPORTE_AB VARCHAR(1)  -- ABONOS: SIGNO DEL TOTAL DEL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO (+/-),
    IMPORTE__AB     DECIMAL(17, 2)  -- ABONOS: TOTAL IMPORTE DE LA FACTURA / IMPORTE BRUTO DEL CONCEPTO ECONÓMICO,
    SIGIMPAPL__AB   VARCHAR(1)  -- ABONOS: SIGNO IMPORTE APLICADO,
    IMPAPL__AB      DECIMAL(17, 2)  -- ABONOS: IMPORTE APLICADO O AMORTIZADO,
    SIGIMPBON__AB   VARCHAR(1)  -- ABONOS: SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBON__AB      DECIMAL(17, 2)  -- ABONOS: IMPORTE BONIFICABLE,
    FILLER          VARCHAR(626)  -- ESPACIO DISPONIBLE DEL REGISTRO
);

-- Tabla187: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATFCOIMP):
CREATE TABLE Tabla187 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODHOLDING      VARCHAR(4)  -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA       VARCHAR(3)  -- CÓDIGO DE LA CADENA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA COMERCIO,
    CUENTA          VARCHAR(12)  -- CUENTA DE COMERCIO,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CP’ – CONTRATO DE COMERCIO ‘EC’ – CABECERA DE EXTRACTO ‘EM’ – MOVIMIENTOS DE EXTRACTO
);

-- Tabla188: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATFCOIMP):
CREATE TABLE Tabla188 (
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN,
    DATOS           VARCHAR(327)  -- DATOS,
    FILLER          VARCHAR(17)
);

-- Tabla189: Detalle de campos de los registros de Comercios. Este grupo de datos está diferenciado en cinco subtipos de registros: Por cuenta, por producto, por descuentos por producto, por terminal y un tipo de restricción. Todos ellos están precedidos por la parte común explicada previamente. Estructura tipo de registro de cabecera de Cuenta de Comercio. Tipo de registro ‘CP’ (ATFCOCOM):
CREATE TABLE Tabla189 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODHOLDING      VARCHAR(4)  -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA       VARCHAR(3)  -- CÓDIGO DE CADENA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    TIPBON          VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    TIPOPROV        VARCHAR(1)  -- TIPO DE PROVEEDOR. ESTABLECIMIENTO, OFICINA O CAJERO,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DE CLIENTE,
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO,
    CLAMON          INT  -- CLAVE DE MONEDA DE CUENTA CARGO,
    INDTIPCTA       VARCHAR(2)  -- INDICADOR DE TIPO DE CUENTA CARGO
);

-- Tabla190: Detalle de campos de los registros de Comercios. Este grupo de datos está diferenciado en cinco subtipos de registros: Por cuenta, por producto, por descuentos por producto, por terminal y un tipo de restricción. Todos ellos están precedidos por la parte común explicada previamente. Estructura tipo de registro de cabecera de Cuenta de Comercio. Tipo de registro ‘CP’ (ATFCOCOM):
CREATE TABLE Tabla190 (
    INDAJENA        VARCHAR(1)  -- INDICADOR DE CUENTA DE DOMICILIACIÓN AJENA(S/N),
    CODCAM          VARCHAR(6)  -- CÓDIGO CAMPAÑA,
    NUMMAQ          INT  -- NÚMERO DE MÁQUINAS MANUALES,
    NUMTPV          INT  -- NÚMERO DE TPVS,
    FECALTA         UNKNOWN  -- FECHA DE ALTA COMERCIO,
    FECBAJA         UNKNOWN  -- FECHA DE BAJA,
    MOTBAJA         VARCHAR(2)  -- MOTIVO DE BAJA,
    FECREACT        UNKNOWN  -- FECHA REACTIVACIÓN DEL COMERCIO,
    CODRIE          INT  -- CÓDIGO DE RIESGO,
    FECULTRIE       UNKNOWN  -- FECHA ÚLTIMA CLASIFICACIÓN RIESGO,
    NUMEXTCOM       INT  -- NÚMERO DE EXTRACTO DE COMERCIO,
    FECULTREM       UNKNOWN  -- FECHA ÚLTIMA REMESA,
    CODFUC          VARCHAR(15)  -- CÓDIGO DE FUC,
    INDCONT         VARCHAR(1)  -- INDICADOR COMERCIO CONTRATADO/CAPTADO,
    CODTERDEF       VARCHAR(16)  -- CÓDIGO DE TERMINAL POR DEFECTO,
    CODPROCESO      INT  -- CÓDIGO DE PROCESO,
    CODGRUPO        INT  -- CÓDIGO DE GRUPO DE PROCESO,
    INDENVEXT       VARCHAR(1)  -- INDICADOR DE ENVÍO DIARIO DEL EXTRACTO DE MOVIMIENTOS (S/N),
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    CODREGIMEN      INT  -- CÓDIGO DE RÉGIMEN FISCAL,
    FILLER          VARCHAR(14)
);

-- Tabla191: Detalle de campos de los registros de extractos. Este grupo de datos está diferenciado en dos subtipos de registros, todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EC’ (ATFCOEXT):
CREATE TABLE Tabla191 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODHOLDING      VARCHAR(4)  -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA       VARCHAR(3)  -- CÓDIGO DE CADENA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NUMEXTCOM       INT  -- NÚMERO DE EXTRACTOS DE COMERCIO,
    FECEXTCOM       UNKNOWN  -- FECHA DE EXTRACTO COMERCIO,
    INDSITEXTCOM    INT  -- INDICADOR SITUACIÓN DEL EXTRACTO. VALORES: PENDIENTE LIQUIDADO CARGADO,
    NUMULTMOV       INT  -- NÚMERO DE ÚLTIMO MOVIMIENTO,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    FECEXT          UNKNOWN  -- FECHA DE EXTRACTO,
    FECVALCAR       UNKNOWN  -- FECHA VALOR APUNTE,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN,
    FECCAREXT       UNKNOWN  -- FECHA CARGO EXTRACTO,
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO,
    FILLER          VARCHAR(18)
);

-- Tabla192: Este grupo de datos está diferenciado en dos subtipos de registros, todos ellos están precedidos por la parte común explicada previamente. Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EC’ (ATFCOEXT): Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’EM’ (ATFCOMVE):
CREATE TABLE Tabla192 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODHOLDING      VARCHAR(4)  -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA       VARCHAR(3)  -- CÓDIGO DE CADENA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NUMEXTCOM       INT  -- NÚMERO DE EXTRACTOS DE COMERCIO,
    FECMOVEXTC      UNKNOWN  -- FECHA DE MOVIMIENTO EXTRACTO COMERCIO,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE,
    NUMMOVEXTCO     INT  -- NÚMERO DE MOVIMIENTOS DE EXTRACTO DE COMERCIOS,
    INDTIPO         VARCHAR(1)  -- INDICADOR DE REMESA O CONCEPTO: DOMINIOS: R – FACTURA C – COMISIÓN A- AJUSTE D-DESCUENTO,
    NUMREFREM       INT  -- NÚMERO REFERENCIA DE LA REMESA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESMOVEXTCO     VARCHAR(30)  -- DESCRIPCIÓN DEL MOVIMIENTO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL IMPORTE,
    INDNORCOR       VARCHAR(1)  -- INDICADOR DE NORMAL O CORRECTORA: 0 – NORMAL 1 – CORRECTORA,
    IMPMVTEXCO      DECIMAL(17, 2)  -- IMPORTE
);

-- Tabla193: Estructura del tipo de registro de datos del extracto. Tipo de registro ‘EC’ (ATFCOEXT): Estructura de datos correspondiente a los movimientos de extracto. Tipo de registro: ’EM’ (ATFCOMVE):
CREATE TABLE Tabla193 (
    IMPIMPSTO       DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDANULMOV      INT  -- INDICADOR DE MOVIMIENTO ANULADO,
    INDENVPAS       VARCHAR(1)  -- INDICADOR DE MOVIMIENTO ENVIADO (S/N),
    DEPARTAMENTO    VARCHAR(4)  -- CÓDIGO DE DEPARTAMENTO,
    IMPIMPSTO_2     DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO (IMPUESTO EXTERNO 2),
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONOMICO,
    PRAPLECO        DECIMAL(7, 4)  -- PORCENTAJE DEL CONCEPTO APLICADO,
    FILLER          VARCHAR(71)
);

-- Tabla194: Programa ATC505: Cruza movimientos de operaciones diarias con los datos generados TIPOREG = ‘OP’ cruzada con los movimientos con los registros de operaciones diarias TIPOREG = ‘DA’
CREATE TABLE Tabla194 (
    DATOS_COMUNES   UNKNOWN  -- DATOS COMUNES,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA
);

-- Tabla195
CREATE TABLE Tabla195 (
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘OP’ – OPERACIÓN ‘CE’ – CONCEPTOS ECONÓMICOS ‘AU’ – AUTORIZACIONES ‘CG’– CUENTA CONGELADA ‘DA’ – DATOS ADICIONALES,
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN,
    REGISTRO__OP___REGISTRO_DE_MOVIMIENTOS_DE_CR_DITO__PREPAGO__PREPAGO_REGALO__D_BITO_Y_COMPRA_EN_CUOTAS_DIARIOS UNKNOWN  -- REGISTRO ‘OP’- REGISTRO DE MOVIMIENTOS DE CRÉDITO, PREPAGO, PREPAGO REGALO, DÉBITO Y COMPRA EN CUOTAS DIARIOS,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN CLAVE MONEDA,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA,
    DESNORC         VARCHAR(15)  -- DESCRIPCIÓN NORMAL/CORRECTORA: 0 - NORMAL 1 - CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN TIPO FACTURA,
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMOND      VARCHAR(30)  -- DESCRIPCIÓN MONEDA,
    SIGNODIV        VARCHAR(1)  -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-),
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOFAC        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA FACTURA(+/-),
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI         DECIMAL(9, 4)  -- FACTOR DE CAMBIO APLICADO (SOLO TIENE SENTIDO PARA OPERACIONES EN EXTRANJERO)
);

-- Tabla196
CREATE TABLE Tabla196 (
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    DESACT          VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO ACTIVIDAD(MPDT039),
    SIGNOLIQ        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LIQUIDACIÓN (+/-),
    IMPLIQ          DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    CLAMONLIQ       INT  -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONL      VARCHAR(30)  -- DESCRIPCIÓN MONEDA,
    SIGNOIMPTO      VARCHAR(1)  -- SIGNO DE IMPORTE DE IMPUESTO(+/-),
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPAIS         VARCHAR(30)  -- NOMBRE DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN OPERACIÓN,
    DESORIG         VARCHAR(20)  -- DESCRIPCIÓN ORIGEN,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    DESFRA          VARCHAR(20)  -- DESCRIPCIÓN DEL TIPO DE FRANQUICIA
);

-- Tabla197
CREATE TABLE Tabla197 (
    SECOPE          NUMERIC(12)  -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC       NUMERIC(15)  -- NÚMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SOLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED       VARCHAR(12)  -- SESIÓN DE LA RED,
    SIAIDCD         VARCHAR(19)  -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    CALFRAUDE       VARCHAR(3)  -- SIN USO.,
    TIPDOCPAG       INT  -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A CEROS),
    DESTIPDOC       VARCHAR(20)  -- DESCRIPCIÓN TIPO DOCUMENTO,
    REFDOCPAG       VARCHAR(20)  -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A BLANCOS),
    SIGNOAMORT      VARCHAR(1)  -- SIGNO DEL IMPORTE AMORTIZADO (+/-),
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE AMORTIZADO (SÓLO VENDRÁ INFORMADO PARA MOVIMIENTOS DE CRÉDITO, PARA DÉBITO VENDRÁ A BLANCOS),
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN,
    NUMMOVDEB       INT  -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    IDENTCLI        VARCHAR(8)  -- NÚMERO ÚNICO DE PERSONA
);

-- Tabla198
CREATE TABLE Tabla198 (
    INDINCEST       VARCHAR(1)  -- INDICADOR DE INCIDENCIA EN ESTUDIO ‘S’ – SI ‘N’ – NO,
    INDMOVANU       INT  -- INDICADOR DE MOVIMIENTO ANULADO,
    DESMOVANU       VARCHAR(10)  -- DESCRIPCIÓN DEL INDICADOR DE MOVIMIENTO ANULADO: 0 – NORMAL 1 – ANULADO,
    INDRET          INT  -- INDICADOR DE MOVIMIENTO RETENIDO,
    DESINDRET       VARCHAR(22)  -- DESCRIPCIÓN DEL INDICADOR DE MOVIMIENTO RETENIDO: 0 – NORMAL 1 – RETENIDO,
    INDMOVEXT       INT  -- INDICADOR DE MOVIMIENTO EXTRACTADO,
    DESMOVEXT       VARCHAR(20)  -- DESCRIPCIÓN DEL INDICADOR DE MOVIMIENTO EXTRACTADO: 0 – PENDIENTE 1 – EXTRACTADO,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(25)  -- DESCRIPCIÓN COMPRA EN CUOTAS,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    NUMOPECUO       INT  -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    SIGNOCUO        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA(+/-),
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    INDDEBCRE       INT  -- INDICADOR DE DÉBITO O CRÉDITO.
);

-- Tabla199
CREATE TABLE Tabla199 (
    DESDEBCRE       VARCHAR(10)  -- DESCRIPCIÓN INDICADOR DE DÉBITO Ó CRÉDITO: 1 – CRÉDITO 2 – DÉBITO 6 - PREPAGO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(20)  -- DESCRIPCIÓN DE LA LÍNEA,
    FORPAGO         INT  -- FORMA DE PAGO DE LA OPERACIÓN,
    DESFORPAG       VARCHAR(20)  -- DESCRIPCIÓN FORMA DE PAGO,
    LINREF          VARCHAR(8)  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    INDTOK          VARCHAR(1)  -- INDICADOR OPERACIÓN REALIZADA CON TOKEN(s/n),
    INDFACINF       VARCHAR(1)  -- INDICADOR FACTURA INFORMATIVA (S/N),
    INDDATADI       INT  -- INDICADOR DATOS ADICIONALES,
    FILLER          VARCHAR(1),
    REGISTRO__CE___REGISTRO_DE_CONCEPTOS_ECON_MICOS_ASOCIADOS_A_MOVIMIENTOS_DE_OPERACIONES_DIARIAS_DE_CR_DITO_Y_D_BITO_ UNKNOWN  -- REGISTRO ‘CE’- REGISTRO DE CONCEPTOS ECONÓMICOS ASOCIADOS A MOVIMIENTOS DE OPERACIONES DIARIAS DE CRÉDITO Y DÉBITO.,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    SIGNOAPL        VARCHAR(1)  -- SIGNO DEL IMPORTE APLICADO,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO,
    SIGNOLIQUI      VARCHAR(1)  -- SIGNO DEL IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO,
    IMPLIQUI        DECIMAL(17, 2)  -- IMPORTE LIQUIDADO DEL CONCEPTO ECONÓMICO
);

-- Tabla200
CREATE TABLE Tabla200 (
    FECULTCAL       UNKNOWN  -- ÚLTIMA FECHA EN LA QUE SE HA REALIZADO EL CÁLCULO DE INTERESES,
    ESTCONECO       VARCHAR(1)  -- ESTADO DEL CONCEPTO ECONÓMICO,
    DESESTCONECO    VARCHAR(30)  -- DESCRIPCIÓN DEL ESTADO DEL CONCEPTO ECONÓMICO: – PENDIENTE – LIQUIDADO – AMORTIZADO – ANULADO – RETENIDO,
    NUMMOVDEB       INT  -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    NUMOPECUO       INT  -- NÚMERO DE MOVIMIENTO,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN TIPO DE IMPORTE: 02 – COMISIONES 03 – INTERESES 04 – IMPUESTOS,
    SIGNOAPLECO     VARCHAR(1)  -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-),
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGNOBRU        VARCHAR(1)  -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO (+/-)
);

-- Tabla201
CREATE TABLE Tabla201 (
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGNOBON        VARCHAR(1)  -- SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGNOIMPTO      VARCHAR(1)  -- SIGNO DEL IMPORTE DE IMPUESTO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FILLER          VARCHAR(565),
    REGISTRO__AU___REGISTRO_DE_AUTORIZACIONES_PENDIENTES_DE_CRUCE UNKNOWN  -- REGISTRO ‘AU’- REGISTRO DE AUTORIZACIONES PENDIENTES DE CRUCE,
    CLAMON1         INT  -- CLAVE DE MONEDA,
    DESCLAMON1      VARCHAR(30)  -- DESCRIPCIÓN CLAVE MONEDA,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA,
    DESNORC         VARCHAR(30)  -- DESCRIPCIÓN DEL INDICADOR DE NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC1        INT  -- TIPO DE FACTURA,
    DESTIPFAC1      VARCHAR(30)  -- DESCRIPCIÓN TIPO FACTURA,
    FECTRN          UNKNOWN  -- FECHA DE LA TRANSACCIÓN,
    HORTRN          UNKNOWN  -- HORA DE LA TRANSACCIÓN,
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMOND      VARCHAR(30)  -- DESCRIPCIÓN MONEDA DIVISA,
    SIGNODIV        VARCHAR(1)  -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-),
    IMPDIV          VARCHAR(17)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOAUT        VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL AUTORIZADO (+/-)
);

-- Tabla202
CREATE TABLE Tabla202 (
    IMPAUTCON       VARCHAR(17)  -- IMPORTE TOTAL AUTORIZADO MONEDA CONTRATO,
    CMBAPLI         DECIMAL(9, 4)  -- FACTOR DE CAMBIO APLICADO (SOLO TIENE SENTIDO PARA OPERACIONES EN EXTRANJERO),
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODACT1         INT  -- CÓDIGO DE ACTIVIDAD,
    DESACT1         VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO ACTIVIDAD,
    SIGNOCCA        VARCHAR(1)  -- SIGNO DE IMPORTE DE CONCILIACIÓN (+/-),
    IMPCCA          DECIMAL(17, 2)  -- IMPORTE DE CONCILIACIÓN,
    CLAMONCCA       INT  -- CÓDIGO DE MONEDA DE CONCILIACIÓN,
    DESCLAMOCCA     VARCHAR(30)  -- DESCRIPCIÓN MONEDA CONCILIACIÓN,
    SIAIDCD         VARCHAR(19)  -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    FILLER          VARCHAR(497),
    REGISTRO__CG___REGISTRO_DE_OPERACIONES_DE_CUENTAS_EN_CARTERA_CONGELADA_ UNKNOWN  -- REGISTRO ‘CG’- REGISTRO DE OPERACIONES DE CUENTAS EN CARTERA CONGELADA.,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO IMPAGADO CON FORMATO AAAAMMDDNNNNNNN,
    NUMMOV          INT  -- NÚMERO DE MOVIMIENTO,
    CLAMON2         INT  -- CLAVE DE MONEDA,
    DESCLAMON2      VARCHAR(30)  -- DESCRIPCIÓN CLAVE MONEDA
);

-- Tabla203
CREATE TABLE Tabla203 (
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA: – NORMAL – CORRECTORA,
    DESNORC         VARCHAR(30)  -- DESCRIPCIÓN DEL INDICADOR DE NORMAL O CORRECTORA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC2        INT  -- TIPO DE FACTURA,
    DESTIPFAC2      VARCHAR(30)  -- DESCRIPCIÓN TIPO FACTURA,
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    CLAMONDIV2      INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMOND2     VARCHAR(30)  -- DESCRIPCIÓN CLAVE MONEDA,
    SIGNODIV        VARCHAR(1)  -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL,
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOFAC        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA FACTURA,
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI         DECIMAL(9, 4)  -- FACTOR DE CAMBIO APLICADO (SÓLO TIENE SENTIDO PARA OPERACIONES EN EL EXTRANJERO),
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE REDUCIDO DEL COMERCIO,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    DESACT2         VARCHAR(30)  -- DESCRIPCIÓN CÓDIGO DE ACTIVIDAD
);

-- Tabla204
CREATE TABLE Tabla204 (
    SIGNOLIQ        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    IMPLIQ          DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    CLAMONLIQ2      INT  -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONL2     VARCHAR(30)  -- DESCRIPCIÓN CLAVE MONEDA,
    SIGNOIMPTO      VARCHAR(1)  -- SIGNO DEL IMPORTE DE IMPUESTO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPAIS         VARCHAR(30)  -- NOMBRE DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN DE LA OPERACIÓN,
    DESORIG         VARCHAR(30)  -- DESCRIPCIÓN DE ORIGEN DE LA OPERACIÓN,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    DESFRA          VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FRANQUICIA,
    SECOPE          NUMERIC(12)  -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC       NUMERIC(15)  -- NUMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SÓLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED       VARCHAR(12)  -- SESIÓN DE LA RED
);

-- Tabla205
CREATE TABLE Tabla205 (
    SIAIDCD         VARCHAR(19)  -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    TIPDOCPAG       INT  -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO,
    DESTIPDOC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO,
    REFDOCPAG       VARCHAR(20)  -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO,
    CALFRAUDE       VARCHAR(3)  -- SIN USO.,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN A LA RED,
    SIGNOAMORT      VARCHAR(1)  -- SIGNO DEL IMPORTE EN AMORTIZADO,
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE AMORTIZADO,
    IDENTCLI        VARCHAR(8)  -- NÚMERO ÚNICO DE PERSONA,
    FILLER          VARCHAR(146),
    REGISTRO__DA___REGISTRO_DE_DATOS_ADICIONALES_A_LA_OPERACI_N UNKNOWN  -- REGISTRO ‘DA’- REGISTRO DE DATOS ADICIONALES A LA OPERACIÓN,
    NUMEXTCTA       INT  -- NÚMERO EXTRACTO DE CRÉDITO,
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO DEL EXTRACTO,
    NUMMOVDEB       INT  -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    TIPFRAN         INT  -- FRANQUICIA,
    DESTIPFRAN      VARCHAR(20)  -- DESCRIPCIÓN FRANQUICIA,
    SECOPE          NUMERIC(12)  -- NUMERO SECUENCIAL DE OPERACIÓN,
    SIAIDCD         VARCHAR(19)  -- CÓDIGO IDENTIFICACIÓN SIA,
    TOKNUMTOK       VARCHAR(22)  -- TOKEN,
    TOKFECEXP       VARCHAR(4)  -- FECHA EXPIRACIÓN DEL TOKEN
);

-- Tabla206
CREATE TABLE Tabla206 (
    CODTOK          VARCHAR(4)  -- CÓDIGO DE TOKENIZADOR,
    DESTOK          VARCHAR(30)  -- DESCRIP. CÓDIGO DE TOKENIZADOR,
    CODWALL         VARCHAR(4)  -- CÓDIGO DE TOKEN REQUESTOR,
    DESWALL         VARCHAR(30)  -- DESCRIPCIÓN DEL TOKEN REQUESTOR,
    TOKENQX         VARCHAR(15)  -- CÓDIGO DE TOKEN QX,
    CLAMON          INT  -- MONEDA,
    CICLOVIDA       VARCHAR(15)  -- CICLOVIDA,
    TIPTRANS        VARCHAR(1)  -- TIPO TRANSACCIÓN,
    PRIMTRAN        VARCHAR(1)  -- PRIMERA TRANSACCIÓN,
    FILLER          VARCHAR(4)  -- RELLENO,
    NUMCUOTA        INT  -- NÚMERO CUOTA,
    TEXTO_CANJE     VARCHAR(40)  -- TEXTO CANJEAR,
    FILLER          VARCHAR(568)  -- RELLENO
);

-- Tabla207: Programa ATC505: Cruza movimientos de operaciones diarias con los datos generados TIPOREG = ‘OP’ cruzada con los movimientos con los registros de operaciones diarias TIPOREG = ‘DA’ Para cada uno de los registros ‘OP’ mostramos el PAN con las 22 posiciones rellenas, con los campos NUMBENCTA y NUMPLASTICO recuperados de la MPDT009, un asterisco y las 5 últimas posiciones del pan.
CREATE TABLE Tabla207 (
    DATOS_COMUNES   UNKNOWN  -- DATOS COMUNES,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA
);

-- ERROR: No se pudieron procesar las columnas de Tabla208

-- ERROR: No se pudieron procesar las columnas de Tabla209

-- ERROR: No se pudieron procesar las columnas de Tabla210

-- ERROR: No se pudieron procesar las columnas de Tabla211

-- ERROR: No se pudieron procesar las columnas de Tabla212

-- ERROR: No se pudieron procesar las columnas de Tabla213

-- ERROR: No se pudieron procesar las columnas de Tabla214

-- ERROR: No se pudieron procesar las columnas de Tabla215

-- ERROR: No se pudieron procesar las columnas de Tabla216

-- ERROR: No se pudieron procesar las columnas de Tabla217

-- ERROR: No se pudieron procesar las columnas de Tabla218

-- ERROR: No se pudieron procesar las columnas de Tabla219

-- Tabla220: El formato que corresponde al registro del fichero de salida sería (ATINTVTO):
CREATE TABLE Tabla220 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE CONTRATO,
    CALPART         VARCHAR(2)  -- CALIDA DE PARTICIPACIÓN,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    TIPBON          VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE LA TARJETA,
    FECCADTAR       INT  -- FECHA DE CADUCIDAD DE LA TARJETA (AAAAMM),
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO
);

-- Tabla221: Programa ATBT86: Obtiene el campo Tokennegocio y ofusca el PAN Programa ATBT87: Formatea la cinta. El formato que corresponde al registro del fichero de salida sería (ATINTVT2):
CREATE TABLE Tabla221 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE CONTRATO,
    CALPART         VARCHAR(2)  -- CALIDA DE PARTICIPACIÓN,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    TIPBON          VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA – OFUSCADO --,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE LA TARJETA,
    FECCADTAR       INT  -- FECHA DE CADUCIDAD DE LA TARJETA (AAAAMM),
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    TOKENNEGOCIO    VARCHAR(37)  -- Formado por CODENT, CENTALTA,
);

-- Tabla222: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla222 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    NUMSECREC       NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO
);

-- Tabla223: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla223 (
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO,
    NUMREFREM       INT  -- NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCIA MANUAL TARJETA CRÉDITO),
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA (SÓLO PARA TARJETAS),
    ORIGEN          VARCHAR(2)  -- ORIGEN DEL RECIBO: TC – TARJETAS DE COMPRA TD – TARJETAS DE DÉBITO CC – CADENA COMERCIAL VE – VENDEDOR,
    SITUAREC        INT  -- INDICADOR DE SITUACIÓN DEL RECIBO: 0 – PENDIENTE 1 – ENVIADO 2 – PAGADO 3 – DOMICILIACIÓN ERRÓNEA (PENDIENTE) 4 – VENCIDO PENDIENTE DE PAGO 5 – NO PAGO 6 – DOMICILIACIÓN AJENA 7 – ENVÍO A CHEQUES 8 – REENVIADO (POR 2ª CÁMARA) 9 – PENDIENTE DE REENVÍO 10 – TRASPASO A MONEDA PRINCIPAL,
    CODRECHPAS      INT  -- CÓDIGO DE RECHAZO DE PASIVO,
    DESCRECH        VARCHAR(30)  -- DESCRIPCIÓN DEL RECHAZO DE PASIVO,
    FECRECHPAS      UNKNOWN  -- FECHA DE RECHAZO PASIVO,
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO
);

-- Tabla224: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla224 (
    CLAMONCTACAR    INT  -- MONEDA DE LA CUENTA DE CARGO,
    INDENVPAS       VARCHAR(1)  -- INDICADOR DE ENVIAR A CUENTAS DE PASIVO (S/N),
    NUMENVPAS       INT  -- NÚMERO DE ENVÍOS A CUENTAS DE PASIVO (SE ARRASTRA EN SUCESIVOS ENVÍOS),
    CODMOV          VARCHAR(1)  -- CÓDIGO DE MOVIMIENTO: C – CARGO A - ABONO,
    CODPROCED       INT  -- CÓDIGO DE PROCEDENCIA (VER COPY ATCODPRO),
    FECEMIMOV       UNKNOWN  -- FECHA EMISIÓN MOVIMIENTO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO MOVIMIENTO,
    FECIMPMOV       UNKNOWN  -- FECHA DE IMPAGO (A PARTIR DE ESTA FECHA SIN COBRAR PASA A SITUACIÓN DE IMPAGADO),
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DEL RECIBO,
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO PARA NO ENTRAR EN IMPAGO,
    IMPRECENV       DECIMAL(17, 2)  -- IMPORTE ENVIADO A PASIVO,
    TIPOAPLI        VARCHAR(1)  -- TIPO DE IMPORTE APLICADO: P-PAGO D-DEVOLUCIÓN,
    IMPAPLICADO     DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    CLAMON          INT  -- CLAVE DE MONEDA DEL RECIBO,
    INDRETSAL       VARCHAR(1)  -- INDICADOR DE RETENCIÓN DE SALDO (S/N),
    NUMRETSAL       INT  -- NÚMERO DE RETENCIÓN DE SALDO ASIGNADO POR EL SISTEMA CORPORATIVO,
    IMPRETSAL       DECIMAL(17, 2)  -- IMPORTE RETENIDO EN PASIVO
);

-- Tabla225: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla225 (
    CLAMONRET       INT  -- CLAVE DE MONEDA DE LA RETENCIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE,
    CICLOVIDA       VARCHAR(15)  -- CICLO DE VIDA,
    INDPREINC       VARCHAR(1)  -- INDICADOR PREAUTORIZACIÓN INCREMENTAL VALORES POSIBLES: Espacios – Pre-autorización o autorización normal. I – Pre-autorización Incremental O – Pre-autorización original de las pre- autorizaciones incrementales
);

-- Tabla226: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla226 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    NUMSECREC       NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO,
    NUMREFREM       INT  -- NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCIA MANUAL TARJETA CRÉDITO),
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA (SÓLO PARA TARJETAS),
    ORIGEN          VARCHAR(2)  -- ORIGEN DEL RECIBO: TC - TARJETAS DE COMPRA TD - TARJETAS DE DÉBITO CO – COMERCIOS,
    SITUAREC        INT  -- INDICADOR DE SITUACIÓN DEL RECIBO: – PENDIENTE - ENVIADO – PAGADO – DOMICILIACIÓN ERRÓNEA (PENDIENTE) – VENCIDO PENDIENTE DE PAGO - NO PAGO - DOMICILIACIÓN AJENA – ENVÍO A CHEQUES – REENVIADO (POR 2ª CÁMARA) – RECOBRADO – PENDIENTE REENVÍO,
    CODRECHPAS      INT  -- CÓDIGO DE RECHAZO DE PASIVO,
    DESCRECH        VARCHAR(30)  -- DESCRIPCIÓN DEL RECHAZO DE PASIVO,
    FECRECHPAS      UNKNOWN  -- FECHA DE RECHAZO PASIVO
);

-- Tabla227: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla227 (
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO,
    CLAMONCTACAR    INT  -- MONEDA DE LA CUENTA DE CARGO,
    INDENVPAS       VARCHAR(1)  -- INDICADOR DE ENVIAR A CUENTAS DE PASIVO (S/N),
    NUMENVPAS       INT  -- NÚMERO DE ENVÍOS A CUENTAS DE PASIVO (SE ARRASTRA EN SUCESIVOS ENVÍOS),
    CODMOV          VARCHAR(1)  -- CÓDIGO DE MOVIMIENTO: C – CARGO A - ABONO,
    CODPROCED       INT  -- CÓDIGO DE PROCEDENCIA (VER COPY ATCODPRO),
    FECEMIMOV       UNKNOWN  -- FECHA EMISIÓN MOVIMIENTO,
    FECVENMOV       UNKNOWN  -- FECHA DE VENCIMIENTO MOVIMIENTO,
    FECIMPMOV       UNKNOWN  -- FECHA DE IMPAGO (A PARTIR DE ESTA FECHA SIN COBRAR PASA A SITUACIÓN DE IMPAGADO),
    IMPREC          DECIMAL(17, 2)  -- IMPORTE DEL RECIBO,
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO PARA NO ENTRAR EN IMPAGO,
    IMPRECENV       DECIMAL(17, 2)  -- IMPORTE ENVIADO A PASIVO,
    TIPOAPLI        VARCHAR(1)  -- TIPO DE IMPORTE APLICADO: P-PAGO D-DEVOLUCIÓN,
    IMPAPLICADO     DECIMAL(17, 2)  -- IMPORTE APLICADO,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    CLAMON          INT  -- CLAVE DE MONEDA DEL RECIBO,
    INDRETSAL       VARCHAR(1)  -- INDICADOR DE RETENCIÓN DE SALDO (S/N),
    NUMRETSAL       INT  -- NÚMERO DE RETENCIÓN DE SALDO ASIGNADO POR EL SISTEMA CORPORATIVO,
    IMPRETSAL       DECIMAL(17, 2)  -- IMPORTE RETENIDO EN PASIVO
);

-- Tabla228: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMREC):
CREATE TABLE Tabla228 (
    CLAMONRET       INT  -- CLAVE DE MONEDA DE LA RETENCIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE,
    CICLOVIDA       VARCHAR(15)  -- CICLO DE VIDA,
    INDPREINC       VARCHAR(1)  -- INDICADOR PREAUTORIZACIÓN INCREMENTAL
);

-- Tabla229: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMRE2):
CREATE TABLE Tabla229 (
    CODENT          UNKNOWN  -- CÓDIGO DE ENTIDAD,
    NUMSECREC       NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM          UNKNOWN  -- CÓDIGO DE COMERCIO,
    CENTALTA        UNKNOWN  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          UNKNOWN  -- CUENTA DE TARJETA,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO,
    NUMREFREM       INT  -- NÚMERO DE REFERENCIA QUE ORIGINÓ EL RECIBO: NUMREFREM (COMERCIOS) NUMMOVDED (TARJETA DÉBITO) NUMMOVEXT(TRANSFERENCI A MANUAL TARJETA CRÉDITO),
    PAN             UNKNOWN  -- NÚMERO DE LA TARJETA (SÓLO PARA TARJETAS) --- OFUSCADO ---,
    ORIGEN          UNKNOWN  -- ORIGEN DEL RECIBO: TC – TARJETAS DE COMPRA TD – TARJETAS DE DÉBITO CO – COMERCIOS,
    SITUAREC        INT  -- INDICADOR DE SITUACIÓN DEL RECIBO: 0 – PENDIENTE 1 – ENVIADO 2 – PAGADO 3 – DOMICILIACIÓN ERRÓNEA (PENDIENTE) 4 – VENCIDO PENDIENTE DE PAGO 5 – NO PAGO
);

-- ERROR: No se pudieron procesar las columnas de Tabla230

-- ERROR: No se pudieron procesar las columnas de Tabla231

-- Tabla232: La Interfaz utiliza una única estructura de datos tanto para el envío como para la recepción de respuesta, aunque existirán datos específicos para el tratamiento de la respuesta (ATDOMRE2):
CREATE TABLE Tabla232 (
    CODENT          UNKNOWN  -- CÓDIGO DE ENTIDAD,
    NUMSECREC       NUMERIC(15)  -- NÚMERO DE SECUENCIA DEL RECIBO CON FORMATO AAAAMMDDNNNNNNN,
    CODCOM          UNKNOWN  -- CÓDIGO DE COMERCIO,
    CENTALTA        UNKNOWN  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          UNKNOWN  -- CUENTA DE TARJETA,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO DE COMERCIO O DE CRÉDITO
);

-- ERROR: No se pudieron procesar las columnas de Tabla233

-- ERROR: No se pudieron procesar las columnas de Tabla234

-- ERROR: No se pudieron procesar las columnas de Tabla235

-- Tabla236: El fichero de envío constará de una parte fija llamada cabecera y pie, se diferenciarán por el campo TIPO DE REGISTRO, ambos tendrán el siguiente formato:
CREATE TABLE Tabla236 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    NSECFIC         INT  -- NÚMERO DE SECUENCIA DE LA CINTA,
    TIPOCINTA       INT  -- TIPO DE LA CINTA - 12 ENVÍO / RESPUESTA ESTAMPACIÓN,
    TIPOREG         VARCHAR(1)  -- TIPO DE REGISTRO C = CABECERA P = PIE,
    FECENVIO        UNKNOWN  -- FECHA DE ENVÍO DE LA CINTA,
    HORAENVIO       VARCHAR(8)  -- HORA ENVÍO DE LA CINTA,
    NUMREGTOT       NUMERIC(12)  -- NÚMERO TOTAL DE REGISTROS,
    OTROSDATOSCAB   VARCHAR(951)  -- DATOS NO REPETITIVOS PROPIOS DE CADA INTERFAZ.
);

-- Tabla237: El fichero de envío constará de una parte fija llamada cabecera y pie, se diferenciarán por el campo TIPO DE REGISTRO, ambos tendrán el siguiente formato:
CREATE TABLE Tabla237 (
    ESTADOCINTA     VARCHAR(1)  -- ESTADO DE LA CINTA - 4 – CINTA ENVIADA,
    VALIDACION      VARCHAR(1)  -- VALIDACIÓN DE LA CINTA S = SI N = NO,
    FILLER          VARCHAR(8346)
);

-- Tabla238: Datos magnéticos: Sólo para aquellos plásticos que llevan banda. Dentro de estos datos existen datos comunes a cualquier formato y datos que varían en función del formato de estampación, como son las pistas de la banda magnética. La estructura de estas pistas para los diferentes formatos se especifica en el anexo 1. Estructura de datos: Utiliza la copy ATFOREST que divide los datos en los siguientes grupos. Registro de detalle (ATINTDE3):
CREATE TABLE Tabla238 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    NSECFIC         INT  -- NÚMERO DE SECUENCIA DE LA CINTA,
    TIPOCINTA       INT  -- TIPO DE LA CINTA
);

-- Tabla239: Datos magnéticos: Sólo para aquellos plásticos que llevan banda. Dentro de estos datos existen datos comunes a cualquier formato y datos que varían en función del formato de estampación, como son las pistas de la banda magnética. La estructura de estas pistas para los diferentes formatos se especifica en el anexo 1. Estructura de datos: Utiliza la copy ATFOREST que divide los datos en los siguientes grupos. Registro de detalle (ATINTDE3):
CREATE TABLE Tabla239 (
    TIPOREG         VARCHAR(1)  -- TIPO DE REGISTRO - D = DETALLE,
    FILLER          VARCHAR(91),
    NUMREGPROC      NUMERIC(12)  -- NÚMERO DE REGISTRO PROCESADO,
    RESTO_DE_CAMPOS VARCHAR(9226)  -- PROPIOS DE CADA INTERFAZ.
);

-- Tabla240: Estructura de datos: Utiliza la copy ATFOREST que divide los datos en los siguientes grupos. Registro de detalle (ATINTDE3):
CREATE TABLE Tabla240 (
    CODENT_ORD      VARCHAR(4)  -- CÓDIGO DE ENTIDAD PARA LA ORDENACIÓN,
    MOTEST_ORD      VARCHAR(2)  -- MOTIVO DE ESTAMPACIÓN PARA LA ORDENACIÓN,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CUENTA,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN. IDENTIFICADOR DE CLIENTE,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DEL CLIENTE,
    CONDEST         VARCHAR(3)  -- CONDICIÓN DE ESTAMPACIÓN,
    ESTPLAS1        VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO,
    ESTPLAS2        VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO,
    CODDISTRIB      VARCHAR(23)  -- CÓDIGO DE DISTRIBUCIÓN,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    NOMBREEMP       VARCHAR(30)  -- NOMBRE DE EMPRESA PARA ESTAMPACIÓN,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE LA TARJETA
);

-- Tabla241: Registro de detalle (ATINTDE3):
CREATE TABLE Tabla241 (
    LIMCRECTA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA DE TARJETA
);

-- Tabla242
CREATE TABLE Tabla242 (
    PISTA1          VARCHAR(79)  -- DATOS DE LA PISTA 1,
    PISTA2          VARCHAR(40)  -- DATOS DE LA PISTA 2,
    PISTA3          VARCHAR(104)  -- DATOS DE LA PISTA 3,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    INDDEBCRE       VARCHAR(1)  -- TIPO DE TARJETA,
    FECCADTAR       INT  -- FECHA DE CADUCIDAD (formato MMAA),
    CVV2            INT  -- VALOR DE VERIFICACIÓN DE TARJETA,
    VISAPHONE       INT  -- CÓDIGO DE VISAPHONE,
    NOMBENRED       VARCHAR(35)  -- NOMBRE DE ESTAMPACIÓN, FORMATO: NOMBRE*APELLIDO,
    INDFOTO         VARCHAR(1)  -- INDICADOR DE FOTO (S/N),
    REFFOTO         VARCHAR(30)  -- REFERENCIA DE LA FOTO,
    CODBARR         NUMERIC(14)  -- CÓDIGO DE BARRAS
);

-- Tabla243
CREATE TABLE Tabla243 (
    PAN_MND         VARCHAR(22)  -- NÚMERO DE TARJETA MONEDERO,
    INDDEBCRE__MND  VARCHAR(1)  -- TIPO DE TARJETA MONEDERO
);

-- Tabla244
CREATE TABLE Tabla244 (
    FECCADTAR__MND  INT  -- FECHA DE CADUCIDAD MONEDERO (formato MMAA),
    NOMBENRED__MND  VARCHAR(35)  -- NOMBRE DE ESTAMPACIÓN MONEDERO, FORMATO: NOMBRE*APELLIDO,
    INDFOTO_MND     VARCHAR(1)  -- INDICADOR DE FOTO MONEDERO (S/N),
    REFFOTO_MND     VARCHAR(30)  -- REFERENCIA DE LA FOTO MONEDERO,
    CODBARR_MND     NUMERIC(14)  -- CÓDIGO DE BARRAS MONEDERO,
    DATOS_MND       VARCHAR(1400)  -- DATOS DEL CHIP MONEDERO
);

-- Tabla245: Dentro de la parte de datos de monedero, la estructura de los campos varía dependiendo de la tecnología del monedero y de la aplicación a implantar en el Chip.
CREATE TABLE Tabla245 (
    CENTALTA__SEC   VARCHAR(4)  -- CENTRO DE ALTA DE LA TARJETA DUAL SECUNDARIA,
    CUENTA_SEC      VARCHAR(12)  -- CUENTA DE LA TARJETA DUAL SECUNDARIA,
    CALPART__SEC    VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN. IDENTIFICADOR DE CLIENTE DE LA TARJETA DUAL SECUNDARIA,
    IDENTCLI__SEC   VARCHAR(8)  -- IDENTIFICACIÓN DEL CLIENTE DE LA TARJETA DUAL SECUNDARIA,
    ESTPLAS1__SEC   VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO DE LA TARJETA DUAL SECUNDARIA,
    ESTPLAS2__SEC   VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD, POR PLÁSTICO DE LA TARJETA DUAL SECUNDARIA,
    PRODUCTO__SEC   VARCHAR(2)  -- CÓDIGO DE PRODUCTO DE LA TARJETA DUAL SECUNDARIA
);

-- Tabla246: Dentro de la parte de datos de monedero, la estructura de los campos varía dependiendo de la tecnología del monedero y de la aplicación a implantar en el Chip.
CREATE TABLE Tabla246 (
    SUBPRODU__SEC   VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO DE LA TARJETAL DUAL SECUNDARIA,
    FECALTA__SEC    UNKNOWN  -- FECHA DE ALTA DE LA TARJETA DUAL SECUNDARIA,
    LIMCRECTA__SEC  DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA DE TARJETA DUAL SECUNDARIA,
    PISTA1_SEC      VARCHAR(79)  -- DATOS DE LA PISTA 1 DE LA TARJETA DUAL SECUNDARIA,
    PISTA2_SEC      VARCHAR(40)  -- DATOS DE LA PISTA 2 DE LA TARJETA DUAL SECUNDARIA,
    PISTA3_SEC      VARCHAR(104)  -- DATOS DE LA PISTA 3 DE LA TARJETA DUAL SECUNDARIA,
    PAN_SEC         VARCHAR(22)  -- NÚMERO DE TARJETA DUAL SECUNDARIA,
    INDDEBCRE__SEC  VARCHAR(1)  -- TIPO DE TARJETA DUAL SECUNDARIA,
    CVV2_SEC        INT  -- VALOR DE VERIFICACIÓN DE TARJETA DUAL SECUNDARIA,
    NOMBENRED__SEC  VARCHAR(35)  -- NOMBRE DE ESTAMPACIÓN DE LA TARJETA DUAL SECUNDARIA, FORMATO:NOMBRE*APELLIDO,
    INDFOTO__SEC    VARCHAR(1)  -- INDICADOR DE FOTO (S/N) DE LA TARJETA DUAL SECUNDARIA,
    REFFOTO__SEC    VARCHAR(30)  -- REFERENCIA DE LA FOTO DE LA TARJETA DUAL SECUNDARIA,
    CODBARR__SEC    NUMERIC(14)  -- CÓDIGO DE BARRAS DE LA TARJETA DUAL SECUNDARIA,
    CODMAR_SEC      INT  -- CÓDIGO DE MARCA DE LA TARJETA DUAL SECUNDARIA,
    INDTIPT_SEC     INT  -- INDICADOR DE TIPO DE TARJETA DUAL SECUNDARIA,
    NUMBENCTA__SEC  INT  -- NÚMERO DE BENEFICIARIO DE LA CUENTA DE LA TARJETA DUAL SECUNDARIA,
    IBAN_SEC        VARCHAR(4)  -- CÓDIGO IBAN DE LA CUENTA DE CARGO DE LA TARJETA DUAL SECUNDARIA
);

-- Tabla247: Dentro de la parte de datos de monedero, la estructura de los campos varía dependiendo de la tecnología del monedero y de la aplicación a implantar en el Chip.
CREATE TABLE Tabla247 (
    CTA_CARGO__SEC  VARCHAR(30)  -- CUENTA DE CARGO DE LA TARJETA DUAL SECUNDARIA,
    PINBLOCK__SEC   VARCHAR(16)  -- PIN BLOCK DE LA TARJETA DUAL SECUNDARIA
);

-- Tabla248
CREATE TABLE Tabla248 (
    DATOS_EMV       VARCHAR(2500)  -- DATOS DE LA TECNOLOGÍA EMV
);

-- ERROR: No se pudieron procesar las columnas de Tabla249

-- ERROR: No se pudieron procesar las columnas de Tabla250

-- ERROR: No se pudieron procesar las columnas de Tabla251

-- ERROR: No se pudieron procesar las columnas de Tabla252

-- ERROR: No se pudieron procesar las columnas de Tabla253

-- ERROR: No se pudieron procesar las columnas de Tabla254

-- ERROR: No se pudieron procesar las columnas de Tabla255

-- ERROR: No se pudieron procesar las columnas de Tabla256

-- Tabla257
CREATE TABLE Tabla257 (
    TIPOCLAVE       VARCHAR(10)  -- TIPO DE CLAVE: OFFSET1 OFFSET2 PVV CVV KEK: CLAVE DE INTERCAMBIO DE CLAVES KTC: CLAVE DE TRANSPORTE DE CLAVES KTP: CLAVE DE TRANSPORTE DE PIN,
    ETIQUETA        VARCHAR(32)  -- CLAVE CIFRADA
);

-- Tabla258
CREATE TABLE Tabla258 (
    CODMAR          INT  -- CÓDIGO DE MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO DENTRO DE LA CUENTA DE TARJETA,
    OFIENVIO        VARCHAR(4)  -- OFICINA DE ENVÍO,
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO
);

-- Tabla259
CREATE TABLE Tabla259 (
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    INDTAREMV       INT  -- INDICADOR DE TARJETA EMV,
    CODSERV         INT  -- CÓDIGO DE SERVICIO,
    OFFSET          VARCHAR(12)  -- OFFSET,
    PVV             INT  -- PVV,
    INDOFFPVV       VARCHAR(1)  -- INDICADOR OFFSET PVV,
    PSN             INT  -- NÚMERO DE SECUENCIA DEL PAN,
    ICVV            VARCHAR(3)  -- CVV DEL CHIP EMV. SÓLO PARA TARJETAS EMV CON ESTAMPACIÓN EXTERNA.,
    PINOFFLINE      VARCHAR(16)  -- PINBLOCK OFFLINE DEL CHIP EMV. SÓLO PARA TARJETAS EMV CON ESTAMPACIÓN EXTERNA.,
    FECORIG         VARCHAR(10)  -- FECHA DE ALTA DEL BENEFICIARO,
    FILLER          VARCHAR(13)
);

-- Tabla260
CREATE TABLE Tabla260 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    IDENTESTAMP     VARCHAR(2)  -- IDENTIFICACIÓN DE ESTAMPADORA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICACIÓN DEL CLIENTE,
    DATLIBRE        VARCHAR(80)  -- DATOS LIBRES, ERRORES Y AVISOS,
    NUMSEFICH       INT  -- NÚMERO DE SECUENCIA DEL FICHERO ENVIADO,
    CODRESP         VARCHAR(2)  -- CÓDIGO DE RESPUESTA (‘00’ OK, RESTO VALORES NO OK)),
    MOTEST          VARCHAR(2)  -- MOTIVO DE ESTAMPACIÓN
);

-- ERROR: No se pudieron procesar las columnas de Tabla261

-- ERROR: No se pudieron procesar las columnas de Tabla262

-- ERROR: No se pudieron procesar las columnas de Tabla263

-- ERROR: No se pudieron procesar las columnas de Tabla264

-- ERROR: No se pudieron procesar las columnas de Tabla265

-- ERROR: No se pudieron procesar las columnas de Tabla266

-- Tabla267
CREATE TABLE Tabla267 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    INDNORCOR       INT  -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CLAMON          INT  -- CLAVE DE MONEDA,
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN
);

-- Tabla268
CREATE TABLE Tabla268 (
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    INDDEBCRE       VARCHAR(1)  -- INDICADOR DE DÉBITO / CRÉDITO,
    INDCOMPCUO      VARCHAR(1)  -- INDICADOR DE COMPRA EN CUOTAS,
    CODTIPC         VARCHAR(4)  -- TIPO DE CUOTA,
    NUMCUOTA        INT  -- NÚMERO DE CUOTAS,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE CUOTA,
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL,
    MESCARCUO       INT  -- MESES DE CARENCIA,
    LINREF          INT  -- REFERENCIA DE LÍNEA,
    FORPAGO         INT  -- FORMA DE PAGO,
    INDICA_TASA_0   INT  -- INDICADOR DE TASA CON VALOR 0 0 – LA TASA SE DEBE CALCULAR 1 – LA TASA ES 0
);

-- Tabla269
CREATE TABLE Tabla269 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN --OFUSCADO--,
    INDNORCOR       INT  -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla270

-- Tabla271: Esta interfaz no sigue las características generales que comparten el resto de interfaces de entrada. Esta interfaz no tiene registros de cabecera ni de pie, ni los registros de detalle poseen los datos comunes iniciales.
CREATE TABLE Tabla271 (
    CODENTID        VARCHAR(8)  -- Código de Entidad. Identifica la entidad fidelizadora que ha generado las acciones del Evento.,
    CODPROGR        VARCHAR(8)  -- Código del programa al cual pertenece la cuenta.,
    CODCUENT        VARCHAR(20)  -- Código de la cuenta.,
    TIPIDCLI        VARCHAR(2)  -- Tipo Identificador de Cliente.,
    IDCLIENT        VARCHAR(20)  -- Código identificador de cliente,
    NUMSOLIC        INT  -- Número de Solicitud de Canje.,
    NUMAUTOR        VARCHAR(12)  -- Número de autorización. No obligatorio y de uso reservado a solicitudes de canje realizadas externamente.,
    FECHENVI        VARCHAR(8)  -- Fecha de Envío. Formato AAAAMMDD.,
    IMPOCASH        DECIMAL(15, 2)  -- Importe del premio cuando el tipo de este es CASHBACK,
    INDANULA        VARCHAR(1)  -- Indicador de anulación NO ANULACIÓN ANULACIÓN,
    CODRETOR        VARCHAR(2)  -- Código de retorno.,
    DESCERRO        VARCHAR(120)  -- Descripción de error.
);

-- Tabla272
CREATE TABLE Tabla272 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    TIPEVENTO       VARCHAR(2)  -- TIPO DE EVENTO A BONIFICAR CE - CUOTA EMISIÓN CR - CUOTA RENOVACIÓN o MANTENIMIENTO CS - CUOTA SUSTITUCIÓN,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    PORBON          DECIMAL(7, 4)  -- PORCENTAJE DE BONIFICACIÓN INFORMADO,
    FECINI          UNKNOWN  -- FECHA DE INICIO VIGENCIA,
    FECFIN          UNKNOWN  -- FECHA DE FIN
);

-- Tabla273
CREATE TABLE Tabla273 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    TIPEVENTO       VARCHAR(2)  -- TIPO DE EVENTO A BONIFICAR CE - CUOTA EMISIÓN CR - CUOTA RENOVACIÓN CS - CUOTA SUSTITUCIÓN,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    PORBON          DECIMAL(7, 4)  -- PORCENTAJE DE BONIFICACIÓN INFORMADO,
    FECINI          UNKNOWN  -- FECHA DE INICIO VIGENCIA,
    FECFIN          UNKNOWN  -- FECHA DE FIN
);

-- Tabla274
CREATE TABLE Tabla274 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    TIPDOC          VARCHAR(2)  -- TIPO DE DOCUMENTO U ORIGEN DEL PAGO 01-CHEQUE 02-GIRO 03-METÁLICO (NO HAY DOCUMENTO) 04-INTERNET 05-OTROS,
    NUMDOC          VARCHAR(20)  -- NÚMERO DEL DOCUMENTO,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA.,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECAPL          UNKNOWN  -- FECHA DE APLICACIÓN,
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDANUL         VARCHAR(1)  -- INDICADOR DE ANULACIÓN,
    LINREF          INT  -- REFERENCIA DE LÍNEA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    CENTALTA        VARCHAR(4)  -- OFICINA DE ALTA DE CUENTA,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    FILLER          VARCHAR(28)
);

-- Tabla275
CREATE TABLE Tabla275 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    TIPDOC          VARCHAR(2)  -- TIPO DE DOCUMENTO U ORIGEN DEL PAGO 01-CHEQUE 02-GIRO 03-METÁLICO (NO HAY DOCUMENTO) 04-INTERNET 05-OTROS,
    NUMDOC          VARCHAR(20)  -- NÚMERO DEL DOCUMENTO,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    PAN             VARCHAR(22)  -- NÚMERO DE LA TARJETA. – OFUSCADO --,
    IMPAPL          DECIMAL(17, 2)  -- IMPORTE APLICADO (COBRADO),
    FECAPL          UNKNOWN  -- FECHA DE APLICACIÓN,
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDANUL         VARCHAR(1)  -- INDICADOR DE ANULACIÓN,
    LINREF          INT  -- REFERENCIA DE LÍNEA,
    TIPOFAC         INT  -- TIPO DE FACTURA
);

-- ERROR: No se pudieron procesar las columnas de Tabla276

-- Tabla277: Se consideran cumplimentados como se describe en Consideraciones Generales de Interfaces Batch. Un servicio será activado si los campos que se consideran como obligatorios han sido cumplimentados. La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla277 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA
);

-- Tabla278: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla278 (
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ       VARCHAR(1)  -- INDICADOR DE DESBLOQUEO DE LA CUENTA,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    INDMODLIMT      VARCHAR(2)  -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    INDSITCTA       VARCHAR(1)  -- SITUACIÓN DE CUENTA,
    PORCVARLIM_1    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1
);

-- Tabla279: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla279 (
    IMPVARLIMCUE_1  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    SIGNOVARLIMCU_E_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    CLAMON_1        INT  -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN,
    PORCVARLIM_2    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    SIGNOVARLIMCU_E_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    CLAMON_2        INT  -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN,
    FORPAGO         INT  -- FORMA DE PAGO SOLO PARA EL CRÉDITO,
    IMPFPAGOA       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    FORPAGOTEM      INT  -- FORMA DE PAGO TEMPORAL (SOLO PARA EL CRÉDITO),
    FIFORPAGT       UNKNOWN  -- FECHA INICIO FORMA PAGO TEMPORAL,
    FFFORPAGT       UNKNOWN  -- FECHA FIN FORMA PAGO TEMPORAL,
    IMPFPATEM       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL,
    CLAMONPAG       INT  -- CLAVE DE MONEDA DEL IMPORTE TEMPORAL,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO,
    PORPATEM        DECIMAL(7, 4)  -- PORCENTAJE PAGO TEMPORAL
);

-- Tabla280: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla280 (
    INDDOMCARCRE    VARCHAR(1)  -- INDICADOR DE DOMICILIACIÓN DEL CARGO DE CRÉDITO,
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO,
    CLAMONCAR       INT  -- CLAVE DE MONEDA,
    CONPROD         VARCHAR(3)  -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    CODCAM          VARCHAR(6)  -- CÓDIGO DE CAMPAÑA,
    OFIGESTORA      VARCHAR(4)  -- CÓDIGO DE OFICINA GESTORA,
    GRUPOLIQ        INT  -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO        INT  -- GRUPO DE PROCESO DE CUOTA,
    TIPOBON         VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    INDPERCUO       VARCHAR(1)  -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT       INT  -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    CODREGIMEN      INT  -- CÓDIGO DE RÉGIMEN FISCAL,
    RESEMIEXT       VARCHAR(12)  -- RESTRICCIÓN DE MESES EMISIÓN DE EXTRACTO,
    CODPROMO        VARCHAR(3)  -- CÓDIGO DE PROMOCIÓN,
    CODFORMATO      VARCHAR(10)  -- CÓDIGO DE FORMATO,
    TRASALACR       VARCHAR(1)  -- TRATAMIENTO DE SALDO ACREEDOR,
    PORCVARLIM_C_1  INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1
);

-- Tabla281
CREATE TABLE Tabla281 (
    SIGNOPORCEN__C_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 1,
    IMPVARLIMCUE__C_1 DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    SIGNOVARLIMCU_E_C_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    PORCVARLIM_C_2  INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOPORCEN__C_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 2,
    IMPVARLIMCUE__C_2 DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOVARLIMCU_E_C_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    FILLER          VARCHAR(41)  -- ESPACIO DISPONIBLE DEL REGISTRO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    CLAMONLIN_1     INT  -- CLAVE DE MONEDA 1 DE LA LÍNEA,
    LIMLIN_1        DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    PORLIM_1        INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 1
);

-- Tabla282
CREATE TABLE Tabla282 (
    INDPORLIM_1     UNKNOWN  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 1. VALORES: I: IMPORTE P: PORCENTAJE,
    CLAMONLIN_2     INT  -- CLAVE DE MONEDA 2 DE LA LÍNEA,
    LIMLIN_2        DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    PORLIM_2        INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    INDPORLIM_2     VARCHAR(1)  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 2. VALORES: I: IMPORTE P: PORCENTAJE,
    CODBLQLIN       INT  -- CÓDIGO DE BLOQUEO DE LA LÍNEA,
    TEXBLQLIN       VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    TIPOLINBLQ      VARCHAR(4)  -- TIPO DE LÍNEA A BLOQUEAR,
    IMPFPAGOA1      DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO SEGUNDA MONEDA,
    IMPFPATEM1      DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL SEGUNDA MONEDA,
    CLAMONPAG1      INT  -- CLAVE DE MONEDA DEL IMPORTE TEMPORAL SEGUNDA MONEDA,
    PORPAGOA1       DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO SEGUNDA MONEDA,
    PORPATEM1       DECIMAL(7, 4)  -- PORCENTAJE PAGO TEMPORAL SEGUNDA MONEDA,
    IBAN1           VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO SEGUNDA MONEDA,
    CTACARGO1       VARCHAR(30)  -- CUENTA DE CARGO SEGUNDA MONEDA,
    CLAMONCAR1      INT  -- SEGUNDA MONEDA
);

-- Tabla283
CREATE TABLE Tabla283 (
    CONPRODP        VARCHAR(3)  -- CONDICION ECONÓMICA DEL NUEVO PRODUCTO,
    INDCASTAUT      VARCHAR(1)  -- INDICADOR DE CASTIGO AUTOMÁTICO. POSIBLES VALORES: E-Exento N-No aplica
);

-- Tabla284: Acceso a la tabla de tarjetas o a la tabla de tarjetas monedero. Este acceso solo se realizará en el caso de no venir informados el centro de alta y la cuenta de tarjeta y sí venir informado el pan de la tarjeta. Se accederá primero a la tabla de tarjetas, mediante el código de entidad y el pan de la tarjeta de los datos de entrada, y en caso de no encontrar el registro se accederá a la tabla de tarjetas monedero con la misma clave de acceso. Una vez obtenido el registro se accederá a la tabla de cuenta de tarjeta de la misma forma que se ha indicado anteriormente. En caso de no encontrar ningún registro se devolverá un error y se continuará con el siguiente registro del fichero de entrada.
CREATE TABLE Tabla284 (
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ       VARCHAR(1)  -- INDICADOR DE DESBLOQUEO DE LA CUENTA
);

-- Tabla285: Acceso a la tabla de tarjetas o a la tabla de tarjetas monedero. Este acceso solo se realizará en el caso de no venir informados el centro de alta y la cuenta de tarjeta y sí venir informado el pan de la tarjeta. Se accederá primero a la tabla de tarjetas, mediante el código de entidad y el pan de la tarjeta de los datos de entrada, y en caso de no encontrar el registro se accederá a la tabla de tarjetas monedero con la misma clave de acceso. Una vez obtenido el registro se accederá a la tabla de cuenta de tarjeta de la misma forma que se ha indicado anteriormente. En caso de no encontrar ningún registro se devolverá un error y se continuará con el siguiente registro del fichero de entrada.
CREATE TABLE Tabla285 (
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO
);

-- Tabla286: Se realizarán todos los puntos anteriormente citados por cada registro del fichero de entrada. Cualquier validación errónea implicará generar un error y continuar con el siguiente registro. Únicamente los errores en base de datos podrán obligar a una finalización incorrecta del programa.
CREATE TABLE Tabla286 (
    INDSITCTA       VARCHAR(1)  -- SITUACIÓN DE CUENTA
);

-- Tabla287
CREATE TABLE Tabla287 (
    INDMODLIMT      VARCHAR(2)  -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1,
    IMPVARLIMCUE_1  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    SIGNOVARLIMCUE_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 1,
    CLAMON_1        INT  -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN
);

-- Tabla288
CREATE TABLE Tabla288 (
    PORCVARLIM_2    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    SIGNOVARLIMCUE_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE CUENTA EN LA MONEDA 2,
    CLAMON_2        INT  -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN,
    PORCVARLIM_C_1  INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    SIGNOPORCEN_C_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 1,
    IMPVARLIMCUE_C_1 DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    SIGNOVARLIMCUE_C__1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 1,
    PORCVARLIM_C_2  INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOPORCEN_C_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE SOBRE EL LÍMITE DE COMPRA EN CUOTAS EN LA MONEDA 2
);

-- Tabla289
CREATE TABLE Tabla289 (
    IMPVARLIMCUE_C_2 DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2,
    SIGNOVARLIMCUE_C__2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES DE COMPRA EN CUOTAS EN LA MONEDA 2
);

-- Tabla290
CREATE TABLE Tabla290 (
    INDMODLIMT      VARCHAR(2)  -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1,
    IMPVARLIMCUE_1  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1,
    SIGNOVARLIMCUE_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1
);

-- Tabla291
CREATE TABLE Tabla291 (
    CLAMON_1        INT  -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN,
    PORCVARLIM_2    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    SIGNOVARLIMCUE_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    CLAMON_2        INT  -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN
);

-- Tabla292: El proceso de cambio de forma de pago permite modificar los campos asociados a la forma de pago y forma de pago temporal. Este proceso es Batch y tendrá los siguientes tratamientos: Como todos estos procesos graba registros en el histórico de modificaciones con identificador de tarea específico, que puede usarse para una eventual confirmación hacia la aplicación que comunica el cambio.
CREATE TABLE Tabla292 (
    FORPAGO         INT  -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    IMPFPAGOA       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    FORPAGOTEM      INT  -- FORMA DE PAGO TEMPORAL (SOLO PARA EL CRÉDITO),
    FIFORPAGT       UNKNOWN  -- FECHA INICIO FORMA PAGO TEMPORAL,
    FFFORPAGT       UNKNOWN  -- FECHA FIN FORMA PAGO TEMPORAL,
    IMPFPATEM       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL,
    CLAMONPAG       INT  -- CLAVE MONEDA,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE DE PAGO APLAZADO,
    PORPATEM        DECIMAL(7, 4)  -- PORCENTAJE PAGO TEMPORAL,
    IMPFPAGOA1      DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO SEGUNDA MONEDA,
    IMPFPATEM1      DECIMAL(17, 2)  -- IMPORTE FIJO PAGO TEMPORAL SEGUNDA MONEDA,
    CLAMONPAG1      INT  -- CLAVE MONEDA SEGUNDA MONEDA,
    PORPAGOA1       DECIMAL(7, 4)  -- PORCENTAJE DE PAGO APLAZADO SEGUNDA MONEDA
);

-- Tabla293: El proceso de cambio de forma de pago permite modificar los campos asociados a la forma de pago y forma de pago temporal. Este proceso es Batch y tendrá los siguientes tratamientos: Como todos estos procesos graba registros en el histórico de modificaciones con identificador de tarea específico, que puede usarse para una eventual confirmación hacia la aplicación que comunica el cambio.
CREATE TABLE Tabla293 (
    PORPATEM1       DECIMAL(7, 4)  -- PORCENTAJE PAGO TEMPORAL SEGUNDA MONEDA
);

-- Tabla294: El proceso de cambio del indicador de domiciliación del cargo de crédito permite modificar los campos asociados al indicador e insertar la cuenta de cargo que nos informen siempre y cuando no exista en la base de datos. Este proceso es Batch y tendrá los siguientes tratamientos: Como todos estos procesos graba registros en el histórico de modificaciones con identificador de tarea específico, que puede usarse para una eventual confirmación hacia la aplicación que comunica el cambio.
CREATE TABLE Tabla294 (
    INDDOMCARCRE    VARCHAR(1)  -- INDICADOR DE DOMICILIACIÓN DEL CARGO DE CRÉDITO (S/N),
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO,
    CLAMONCAR       INT  -- CLAVE DE MONEDA,
    IBAN1           VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO SEGUNDA MONEDA,
    CTACARGO1       VARCHAR(30)  -- CUENTA DE CARGO SEGUNDA MONEDA,
    CLAMONCAR1      INT  -- CLAVE DE MONEDA SEGUNDA MONEDA
);

-- Tabla295
CREATE TABLE Tabla295 (
    CONPROD         VARCHAR(3)  -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    CODCAM          VARCHAR(6)  -- CÓDIGO DE CAMPAÑA,
    OFIGESTORA      VARCHAR(4)  -- CÓDIGO OFICINA GESTORA,
    GRUPOLIQ        INT  -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO        INT  -- GRUPO DE PROCESO DE CUOTA,
    TIPOBON         VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    INDPERCUO       VARCHAR(1)  -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT       INT  -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    CODREGIMEN      INT  -- CÓDIGO DE RÉGIMEN FISCAL,
    RESEMIEXT       VARCHAR(12)  -- RESTRICCIÓN DE MESES EMISIÓN DE EXTRACTO,
    CODPROMO        VARCHAR(3)  -- CÓDIGO DE PROMOCIÓN,
    CODFORMATO      VARCHAR(10)  -- CÓDIGO DE FORMATO,
    TRASALACR       VARCHAR(1)  -- TRATAMIENTO DE SALDO ACREEDOR,
    INDCASTAUT      VARCHAR(1)  -- INDICADOR DE CASTIGO AUTOMÁTICO. POSIBLES VALORES: E-Exento N-No aplica
);

-- Tabla296
CREATE TABLE Tabla296 (
    PRODUCTO        VARCHAR(2)  -- PRODUCTO A ASIGNAR AL CONTRATO,
    SUBPRODUCTO     VARCHAR(4)  -- SUBPRODUCTO A ASIGNAR AL CONTRATO,
    CONPRODP        VARCHAR(3)  -- CONDICION ECONOMICA DEL NUEVO PRODUCTO
);

-- Tabla297: Todos los campos son obligatorios. Este proceso se realizará en un entorno Batch y se enviará en un registro independiente al resto de las modificaciones de contrato, y tendrá los siguientes tratamientos:
CREATE TABLE Tabla297 (
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    CLAMONLIN_1     INT  -- CLAVE DE MONEDA 1 DE LA LÍNEA,
    LIMLIN_1        DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    PORLIM_1        INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    INDPORLIM_1     VARCHAR(1)  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 1. VALORES: I: IMPORTE P: PORCENTAJE,
    CLAMONLIN_2     INT  -- CLAVE DE MONEDA 2 DE LA LÍNEA,
    LIMLIN_2        DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 2
);

-- Tabla298: Todos los campos son obligatorios. Este proceso se realizará en un entorno Batch y se enviará en un registro independiente al resto de las modificaciones de contrato, y tendrá los siguientes tratamientos:
CREATE TABLE Tabla298 (
    PORLIM_2        INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    INDPORLIM_2     VARCHAR(1)  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 2. VALORES: I: IMPORTE P: PORCENTAJE
);

-- Tabla299
CREATE TABLE Tabla299 (
    CODBLQLIN       INT  -- CÓDIGO DE BLOQUEO DE LA LÍNEA,
    TEXBLQLIN       VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    TIPOLINBLQ      VARCHAR(4)  -- TIPO DE LÍNEA A BLOQUEAR
);

-- Tabla300: Si se cumplimentan dos registros sobre el mismo servicio se ejecutarán ambos consecutivamente, sólo en el caso de informar dos panes del mismo contrato. Se consideran cumplimentados como se describe en Consideraciones Generales de Interfaces Batch. Un servicio será activado si los campos que se consideran como obligatorios han sido cumplimentados. La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla300 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA (ofuscado)
);

-- Tabla301: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla301 (
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ       VARCHAR(1)  -- INDICADOR DE DESBLOQUEO DE LA CUENTA,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    INDMODLIMT      VARCHAR(2)  -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    INDSITCTA       VARCHAR(1)  -- SITUACIÓN DE CUENTA,
    PORCVARLIM_1    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.
);

-- ERROR: No se pudieron procesar las columnas de Tabla302

-- ERROR: No se pudieron procesar las columnas de Tabla303

-- ERROR: No se pudieron procesar las columnas de Tabla304

-- ERROR: No se pudieron procesar las columnas de Tabla305

-- ERROR: No se pudieron procesar las columnas de Tabla306

-- Tabla307: Acceso a la tabla de tarjetas o a la tabla de tarjetas monedero. Este acceso solo se realizará en el caso de no venir informados el centro de alta y la cuenta de tarjeta y sí venir informado el pan de la tarjeta. Se accederá primero a la tabla de tarjetas, mediante el código de entidad y el pan de la tarjeta de los datos de entrada, y en caso de no encontrar el registro se accederá a la tabla de tarjetas monedero con la misma clave de acceso. Una vez obtenido el registro se accederá a la tabla de cuenta de tarjeta de la misma forma que se ha indicado anteriormente. En caso de no encontrar ningún registro se devolverá un error y se continuará con el siguiente registro del fichero de entrada.
CREATE TABLE Tabla307 (
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO DE LA CUENTA,
    INDDESBLQ       VARCHAR(1)  -- INDICADOR DE DESBLOQUEO DE LA CUENTA,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO
);

-- Tabla308: Se realizarán todos los puntos anteriormente citados por cada registro del fichero de entrada. Cualquier validación errónea implicará generar un error y continuar con el siguiente registro. Únicamente los errores en base de datos podrán obligar a una finalización incorrecta del programa.
CREATE TABLE Tabla308 (
    INDSITCTA       VARCHAR(1)  -- SITUACIÓN DE CUENTA
);

-- Tabla309
CREATE TABLE Tabla309 (
    INDMODLIMT      VARCHAR(2)  -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.
);

-- ERROR: No se pudieron procesar las columnas de Tabla310

-- ERROR: No se pudieron procesar las columnas de Tabla311

-- Tabla312
CREATE TABLE Tabla312 (
    INDMODLIMT      VARCHAR(2)  -- INDICADOR DE CAMBIO DE LÍMITE DE TARJETAS,
    PORCVARLIM_1    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 1.,
    SIGNOPORCEN_1   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 1,
    IMPVARLIMCUE_1  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1,
    SIGNOVARLIMCUE_1 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 1,
    CLAMON_1        INT  -- CLAVE DE MONEDA 1 DEL IMP. VARIACIÓN,
    PORCVARLIM_2    INT  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO TODOS LOS LÍMITES EN LA MONEDA 2.,
    SIGNOPORCEN_2   VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE EN LA MONEDA 2,
    IMPVARLIMCUE_2  DECIMAL(17, 2)  -- IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    SIGNOVARLIMCUE_2 VARCHAR(1)  -- SIGNO DE APLICACIÓN DE IMPORTE VARIACIÓN LÍMITES EN LA MONEDA 2,
    CLAMON_2        INT  -- CLAVE DE MONEDA 2 DEL IMP. VARIACIÓN
);

-- Tabla313: El proceso de cambio de forma de pago permite modificar los campos asociados a la forma de pago y forma de pago temporal. Este proceso es Batch y tendrá los siguientes tratamientos: Como todos estos procesos graba registros en el histórico de modificaciones con identificador de tarea específico, que puede usarse para una eventual confirmación hacia la aplicación que comunica el cambio.
CREATE TABLE Tabla313 (
    FORPAGO         INT  -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    IMPFPAGOA       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    FORPAGOTEM      INT  -- FORMA DE PAGO TEMPORAL (SOLO PARA EL CRÉDITO),
    FIFORPAGT       UNKNOWN  -- FECHA INICIO FORMA PAGO TEMPORAL
);

-- ERROR: No se pudieron procesar las columnas de Tabla314

-- Tabla315: El proceso de cambio del indicador de domiciliación del cargo de crédito permite modificar los campos asociados al indicador e insertar la cuenta de cargo que nos informen siempre y cuando no exista en la base de datos. Este proceso es Batch y tendrá los siguientes tratamientos: Como todos estos procesos graba registros en el histórico de modificaciones con identificador de tarea específico, que puede usarse para una eventual confirmación hacia la aplicación que comunica el cambio.
CREATE TABLE Tabla315 (
    INDDOMCARCRE    VARCHAR(1)  -- INDICADOR DE DOMICILIACIÓN DEL CARGO DE CRÉDITO (S/N),
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO,
    CLAMONCAR       INT  -- CLAVE DE MONEDA,
    IBAN1           VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO SEGUNDA MONEDA,
    CTACARGO1       VARCHAR(30)  -- CUENTA DE CARGO SEGUNDA MONEDA,
    CLAMONCAR1      INT  -- CLAVE DE MONEDA SEGUNDA MONEDA
);

-- Tabla316
CREATE TABLE Tabla316 (
    CONPROD         VARCHAR(3)  -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    CODCAM          VARCHAR(6)  -- CÓDIGO DE CAMPAÑA,
    FILLER          VARCHAR(4)  -- ESPACIO DISPONIBLE DEL REGISTRO,
    GRUPOLIQ        INT  -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO        INT  -- GRUPO DE PROCESO DE CUOTA,
    TIPOBON         VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    INDPERCUO       VARCHAR(1)  -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT       INT  -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO)
);

-- ERROR: No se pudieron procesar las columnas de Tabla317

-- Tabla318
CREATE TABLE Tabla318 (
    PRODUCTO        VARCHAR(2)  -- PRODUCTO A ASIGNAR AL CONTRATO,
    SUBPRODUCTO     VARCHAR(4)  -- SUBPRODUCTO A ASIGNAR AL CONTRATO,
    CONPRODP        VARCHAR(3)  -- CONDICION ECONOMICA DEL NUEVO PRODUCTO
);

-- Tabla319: Todos los campos son obligatorios. Este proceso se realizará en un entorno Batch y se enviará en un registro independiente al resto de las modificaciones de contrato, y tendrá los siguientes tratamientos:
CREATE TABLE Tabla319 (
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    CLAMONLIN_1     INT  -- CLAVE DE MONEDA 1 DE LA LÍNEA,
    LIMLIN_1        DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    PORLIM_1        INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 1,
    INDPORLIM_1     VARCHAR(1)  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 1. VALORES: I: IMPORTE P: PORCENTAJE,
    CLAMONLIN_2     INT  -- CLAVE DE MONEDA 2 DE LA LÍNEA,
    LIMLIN_2        DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    PORLIM_2        INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA EN LA MONEDA 2,
    INDPORLIM_2     VARCHAR(1)  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE EN LA MONEDA 2. VALORES: I: IMPORTE P: PORCENTAJE
);

-- Tabla320
CREATE TABLE Tabla320 (
    CODBLQLIN       INT  -- CÓDIGO DE BLOQUEO DE LA LÍNEA,
    TEXBLQLIN       VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    TIPOLINBLQ      VARCHAR(4)  -- TIPO DE LÍNEA A BLOQUEAR
);

-- Tabla321: Un servicio será activado si se han cumplimentado todos aquellos campos que considere obligatorios. Si el servicio es incompatible con otros servicios se devolverá mensaje de error. Se detecta debido al chequeo de campos informados para otro servicio. La Interfaz consta de dos grupos de campos: obligatorios y opcionales, a continuación, se describen los
CREATE TABLE Tabla321 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA
);

-- Tabla322: La Interfaz consta de dos grupos de campos: obligatorios y opcionales, a continuación, se describen los Los campos opcionales, que se desglosan más adelante, son los siguientes:
CREATE TABLE Tabla322 (
    INDNOREN        VARCHAR(1)  -- INDICADOR DE NO RENOVACIÓN,
    MOTBAJA         VARCHAR(2)  -- MOTIVOS DE BAJA,
    INDRECOG        VARCHAR(1)  -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N),
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO,
    INDACUSE        VARCHAR(1)  -- INDICADOR DE ACUSE DE RECIBO,
    FCORETTAR       UNKNOWN  -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO
);

-- Tabla323: La Interfaz consta de dos grupos de campos: obligatorios y opcionales, a continuación, se describen los Los campos opcionales, que se desglosan más adelante, son los siguientes:
CREATE TABLE Tabla323 (
    HCORETTAR       UNKNOWN  -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    PORCVARLIM      DECIMAL(7, 4)  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR LIMITES DE TARJETA,
    SIGNOPORCEN     VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE,
    CLAMON          INT  -- CLAVE DE MONEDA A LA QUE SE APLICA LA VARIACIÓN LÍMITE,
    CONDEST         VARCHAR(3)  -- CONDICION DE ESTAMPACION,
    FILLER          VARCHAR(2)
);

-- Tabla324
CREATE TABLE Tabla324 (
    INDNOREN        VARCHAR(1)  -- INDICADOR DE NO RENOVACIÓN 0 – SI RENOVAR 1 – NO RENOVAR
);

-- Tabla325: Se realizarán todos los puntos anteriormente citados por cada registro del fichero de entrada. Cualquier validación errónea implicará generar un error y continuar con el siguiente registro. Únicamente los errores a bases de datos podrán realizar una finalización incorrecta del programa.
CREATE TABLE Tabla325 (
    MOTBAJA         VARCHAR(2)  -- MOTIVOS DE BAJA,
    INDRECOG        VARCHAR(1)  -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N)
);

-- Tabla326
CREATE TABLE Tabla326 (
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO
);

-- Tabla327: Se realizarán todos los puntos anteriormente citados por cada registro del fichero de entrada. Cualquier validación errónea implicará generar un error y continuar con el siguiente registro. Únicamente los errores a bases de datos podrán realizar una finalización incorrecta del programa.
CREATE TABLE Tabla327 (
    INDACUSE        VARCHAR(1)  -- INDICADOR DE ACUSE DE RECIBO,
    CONDEST         VARCHAR(3)  -- CONDICION DE ESTAMPACION
);

-- Tabla328
CREATE TABLE Tabla328 (
    FCORETTAR       UNKNOWN  -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR       UNKNOWN  -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO
);

-- Tabla329
CREATE TABLE Tabla329 (
    PORCVARLIM      DECIMAL(7, 4)  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES.,
    SIGNOPORCEN     VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE
);

-- Tabla330
CREATE TABLE Tabla330 (
    CLAMON          INT  -- CLAVE DE MONEDA DEL IMP. VARIACIÓN,
    IMPVARLIMCUE    DECIMAL(15, 2)  -- IMPORTE A INCREMENTAR O DECREMENTAR EN FUNCION DEL SIGNO DE LOS LIMITES,
    SIGNOVARLIMCUE  VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL IMPORTE LIMITE,
    FILLER          VARCHAR(2)
);

-- Tabla331: Un servicio será activado si se han cumplimentado todos aquellos campos que considere obligatorios. Si el servicio es incompatible con otros servicios se devolverá mensaje de error. Se detecta debido al chequeo de campos informados para otro servicio. La Interfaz consta de dos grupos de campos: obligatorios y opcionales, a continuación, se describen los
CREATE TABLE Tabla331 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA (Ofuscado)
);

-- Tabla332: La Interfaz consta de dos grupos de campos: obligatorios y opcionales, a continuación, se describen los Los campos opcionales, que se desglosan más adelante, son los siguientes:
CREATE TABLE Tabla332 (
    INDNOREN        VARCHAR(1)  -- INDICADOR DE NO RENOVACIÓN,
    MOTBAJA         VARCHAR(2)  -- MOTIVOS DE BAJA,
    INDRECOG        VARCHAR(1)  -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N),
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO
);

-- ERROR: No se pudieron procesar las columnas de Tabla333

-- Tabla334
CREATE TABLE Tabla334 (
    INDNOREN        VARCHAR(1)  -- INDICADOR DE NO RENOVACIÓN 0 – SI RENOVAR 1 – NO RENOVAR
);

-- Tabla335: Se realizarán todos los puntos anteriormente citados por cada registro del fichero de entrada. Cualquier validación errónea implicará generar un error y continuar con el siguiente registro. Únicamente los errores a bases de datos podrán realizar una finalización incorrecta del programa.
CREATE TABLE Tabla335 (
    MOTBAJA         VARCHAR(2)  -- MOTIVOS DE BAJA,
    INDRECOG        VARCHAR(1)  -- INDICADOR DE RECOGIDA DE PLÁSTICO (S/N)
);

-- Tabla336
CREATE TABLE Tabla336 (
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO,
    TEXBLQ          VARCHAR(30)  -- COMENTARIO DE BLOQUEO
);

-- Tabla337: Se realizarán todos los puntos anteriormente citados por cada registro del fichero de entrada. Cualquier validación errónea implicará generar un error y continuar con el siguiente registro. Únicamente los errores a bases de datos podrán realizar una finalización incorrecta del programa.
CREATE TABLE Tabla337 (
    INDACUSE        VARCHAR(1)  -- INDICADOR DE ACUSE DE RECIBO
);

-- Tabla338
CREATE TABLE Tabla338 (
    FCORETTAR       UNKNOWN  -- FECHA DE COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO,
    HCORETTAR       UNKNOWN  -- HORA COMUNICACIÓN DE RETENCIÓN DEL PLÁSTICO
);

-- Tabla339
CREATE TABLE Tabla339 (
    PORCVARLIM      DECIMAL(7, 4)  -- PORCENTAJE PARA INCREMENTAR O DECREMENTAR EN FUNCIÓN DEL SIGNO LOS LÍMITES.,
    SIGNOPORCEN     VARCHAR(1)  -- SIGNO DE APLICACIÓN DEL PORCENTAJE
);

-- ERROR: No se pudieron procesar las columnas de Tabla340

-- Tabla341: Si la cabecera estaba marcada como incorrecta, escribe todos los registros del bloque como registro de rechazo, y al final del bloque un registro de error de rechazo con el siguiente error: ‘Rechazamos todo el bloque ya que algún registro no pasa las validaciones’. Por otro lado, los datos que se reciben están constituidos por múltiples tipos de registro, tiene un orden lógico de los registros que componen el conjunto de datos de un contrato determinado, si se rompe este orden se rechaza el conjunto completo de registros del mismo contrato. La Interfaz realiza las validaciones del nivel de registro, pero si hay errores en cualquiera de ellos también rechaza la totalidad, por tanto, por cada contrato “acumula” la información al tiempo que la chequea y cuando está verificada, la progresa llamando a los módulos de alta o de modificación. La Interfaz consta de dos grupos de campos: Parte fija y común para todos los tipos de registros y parte variable según el tipo de registro a continuación se describen los comunes.
CREATE TABLE Tabla341 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- OFICINA DE ALTA DE CUENTA,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘C1’– CUENTA DE MEDIOS DE PAGO ‘C2’– LÍMITES DE CUENTA POR MONEDA ‘C3’– CUENTAS DE CARGO (OPCIONAL) ‘T1’ – TARJETA (BANDA O MONEDERO) ‘T2’ – LÍMITES DE TARJETA POR MONEDA ‘T4’ – CUENTA CARGO DE TARJETA DE DÉBITO (OPCIONAL) ‘T5’ – SALDOS DE TARJETAS PREPAGO REGALO POR MONEDA,
    RESTO__DATOS    VARCHAR(858)  -- DATOS VARIABLES
);

-- Tabla342: Centalta, centro de alta es parte del contrato. Campo de obligatorio cumplimiento. Cuenta, campo opcional, dependiendo de si se trata de altas de contratos, (el contrato no existe) o de altas de tarjetas para contratos ya existentes. Parte variable del registro correspondiente a datos de cabecera de cuenta C1 (ATMPAMC1):
CREATE TABLE Tabla342 (
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CONDICIONES ECONÓMICAS ASOCIADAS AL PRODUCTO,
    NUMPER          VARCHAR(8)  -- NÚMERO DE PERSONA,
    CODCAM          VARCHAR(6)  -- INDICADOR DE CAMPAÑAS ASOCIADAS,
    CODPROMO        VARCHAR(3)  -- CÓDIGO DE PROMOCIÓN,
    CODCONVEN       VARCHAR(4)  -- CÓDIGO DE CONVENIO,
    FORPAGO         INT  -- FORMA DE PAGO (TOTAL, FIJO, MÍNIMO),
    TIPOBON         VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    INDCTAEMP       INT  -- INDICADOR DE CUENTA DE EMPRESA,
    INDNOMEMP       INT  -- INDICADOR DE ESTAMPACIÓN DE NOMBRE DE EMPRESA EN PLÁSTICO, SOLO SI EL CLIENTE TITULAR DEL CONTRATO ES EMPRESA O ESTRUCTURA BUSINESS,
    NOMBREEMP       VARCHAR(30)  -- NOMBRE DE EMPRESA PARA ESTAMPACIÓN,
    GRUPOLIQ        INT  -- GRUPO DE LIQUIDACIÓN,
    GRUPOCUO        INT  -- GRUPO DE PROCESO DE CUOTA,
    RESEMIEXT       VARCHAR(12)  -- RESTRICCIÓN DE MESES DE EMISIÓN DE EXTRACTO (EN LA GENERACIÓN INICIAL DEBE CONTENER UNICAMENTE EL VALOR ‘N’, POR LO QUE SE CARGARA POR DEFECTO A ‘N’)
);

-- Tabla343: Centalta, centro de alta es parte del contrato. Campo de obligatorio cumplimiento. Cuenta, campo opcional, dependiendo de si se trata de altas de contratos, (el contrato no existe) o de altas de tarjetas para contratos ya existentes. Parte variable del registro correspondiente a datos de cabecera de cuenta C1 (ATMPAMC1):
CREATE TABLE Tabla343 (
    INDSITCTA       INT  -- INDICADOR DE SITUACIÓN DE CUENTA 0 - ACTIVA 1 – EN ESPERA RESOLUCIÓN O PRECONTRATO (NO EMITIDA LA TARJETA) 3 – EN ESPERA DE CONFIRMAR POR CLIENTE. TARJETA EMITIDA 4 - CONTRATO SIN TARJETA (SOLO CONTRATOS DE EMPRESA O ESTRUCTURA BUSINESS),
    INDPERCUO       VARCHAR(1)  -- INDICADOR DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESTOT       INT  -- NÚMERO TOTAL DE MESES PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SOLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    CODREGIMEN      INT  -- CÓDIGO DE RÉGIMEN FISCAL,
    NUMFACSC        INT  -- CONTADOR DE FACTURACIONES CONSECUTIVAS SIN EMITIR CARGO,
    INDDOMCARCRE    VARCHAR(1)  -- INDICADOR DE DOMICILIACIÓN DEL CARGO EN CRÉDITO,
    CODFORMATO      VARCHAR(10)  -- CÓDIGO DE FORMATO IMPRESIÓN DE EXTRACTO,
    CODBUS          INT  -- Código de Estructura Business,
    CODELEMENTO     INT  -- Código de Elemento dentro de la Estructura Business,
    TIPROLCUENTA    VARCHAR(1)  -- Tipo de rol de la cuenta en la estructura business: U = Cuenta de control de cuotas o actividad (única) E = Cuenta de empleado
);

-- Tabla344: Centalta, centro de alta es parte del contrato. Campo de obligatorio cumplimiento. Cuenta, campo opcional, dependiendo de si se trata de altas de contratos, (el contrato no existe) o de altas de tarjetas para contratos ya existentes. Parte variable del registro correspondiente a datos de cabecera de cuenta C1 (ATMPAMC1):
CREATE TABLE Tabla344 (
    NUMSEC          INT  -- NUMERO DE SECUENCIA
);

-- Tabla345: Código de Elemento dentro de la Estructura Business, opcional cuando INDCTAEMP = 2 (Estructura Buisness), en caso contrario no debe aceptar valores pues la funcionalidad no aplica. Tipo de rol de la cuenta en la estructura business, opcional cuando INDCTAEMP = 2 (Estructura Buisness) admitiendo solo los valores: Parte variable de registro de límites en múltiples monedas C2 (ATMPAMC2):
CREATE TABLE Tabla345 (
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDMONPRIN      VARCHAR(1)  -- INDICADOR DE MONEDA PRINCIPAL DEL CONTRATO (S / N),
    LIMCRECTA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO CUENTA TARJETA,
    IMPFPAGOA       DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO,
    LIMCRECTAC      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE COMPRA EN CUOTAS,
    LIMCRECTAG      DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO GLOBAL
);

-- Tabla346: Tipo de rol de la cuenta en la estructura business, opcional cuando INDCTAEMP = 2 (Estructura Buisness) admitiendo solo los valores: Parte variable de registro de límites en múltiples monedas C2 (ATMPAMC2):
CREATE TABLE Tabla346 (
    LIMCRECTACG     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO GLOBAL DE COMPRA EN CUOTAS,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE PAGO APLAZADO
);

-- Tabla347: Importe fijo de pago aplazado. Campo obligatorio si forma de pago es pago aplazado. Porcentaje de pago aplazado. Campo Obligatorio si la forma de pago es aplazado por porcentaje. Se valida contra la tabla de Porcentajes definidos por Producto. Parte variable de registro de cuentas de cargo C3 (ATMPAMC3):
CREATE TABLE Tabla347 (
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    INDAJENA        VARCHAR(1)  -- INDICADOR DE CUENTA DE DOMICILIACIÓN AJENA (S/N),
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDTIPCTA       VARCHAR(2)  -- INDICADOR DE TIPO DE CUENTA DE CARGO
);

-- Tabla348: Si el contrato tiene el indicador de cuenta de domiciliación del cargo de crédito a ‘S’, para crédito, debe tener una o más cuentas de cargo definidas (bien en el registro de cabecera, bien en los registros C3). Si la cuenta se define como débito o prepago regalo, es decir el indicador de riesgo es débito o prepago, no debe de recibirse ningún registro de éste tipo. (La cuenta se informará en el registro de tarjetas). Parte variable del registro correspondiente a datos de tarjetas T1 (ATMPAMT1):
CREATE TABLE Tabla348 (
    SEQPLASTICO     INT  -- SECUENCIAL DE IDENTIFICACIÓN DEL PLÁSTICO,
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    CALPART         VARCHAR(2)  -- CALIDAD DE PARTICIPACIÓN,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DEL CLIENTE
);

-- Tabla349: Si el contrato tiene el indicador de cuenta de domiciliación del cargo de crédito a ‘S’, para crédito, debe tener una o más cuentas de cargo definidas (bien en el registro de cabecera, bien en los registros C3). Si la cuenta se define como débito o prepago regalo, es decir el indicador de riesgo es débito o prepago, no debe de recibirse ningún registro de éste tipo. (La cuenta se informará en el registro de tarjetas). Parte variable del registro correspondiente a datos de tarjetas T1 (ATMPAMT1):
CREATE TABLE Tabla349 (
    TIPOBON         VARCHAR(6)  -- TIPO DE BONIFICACIÓN,
    INDACTLIM       VARCHAR(1)  -- INDICADOR DE ACTUALIZACIÓN DE LÍMITES DE TARJETA Y USO CON MOVIMIENTOS DE ABONO 0 - LAS RESTRICCIONES NO SE VEN AFECTADAS POR PAGOS NI POR SALDO INGRESO EN CUENTA O SALDO ACREEDOR. 1 - LOS PAGOS AFECTAN A LAS RESTRICCIONES. 2 - EL SALDO ACREEDOR AFECTA A LAS RESTRICCIONES. 3 - LOS PAGOS Y EL SALDO ACREEDOR AFECTAN A LAS RESTRICCIONES.,
    INDCAMLIM       VARCHAR(1)  -- INDICADOR DE SI AFECTA EL CAMBIO DE LÍMITES MASIVO,
    VISAPHONE       INT  -- CÓDIGO VISAPHONE,
    IDEMPLEADO      VARCHAR(20)  -- IDENTIFICADOR DE EMPLEADO,
    NOMBENRED       VARCHAR(35)  -- NOMBRE DE ESTAMPACIÓN, FORMATO:NOMBRE*APELLIDO,
    CODPROMO        VARCHAR(3)  -- CÓDIGO DE PROMOCIÓN DE LA TARJETA,
    INDFOTO         VARCHAR(1)  -- INDICADOR DE FOTO EN PLÁSTICO (S/N),
    REFFOTO         VARCHAR(30)  -- REFERENCIA DE LA FOTO, SOLO SI EL CAMPO ANTERIOR ESTÁ ACTIVO,
    CODBARR         NUMERIC(14)  -- CÓDIGO DE BARRAS ENVIADO DESDE ENTIDAD PROMOTORA,
    ESTPLAS1        VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD,
    ESTPLAS2        VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD,
    CONDEST         VARCHAR(3)  -- CÓDIGO DE ESTAMPACIÓN,
    INDENVEST       VARCHAR(1)  -- INDICADOR DE ENVÍO DE LA TARJETA A CENTRO (S/N)
);

-- Tabla350: Si el contrato tiene el indicador de cuenta de domiciliación del cargo de crédito a ‘S’, para crédito, debe tener una o más cuentas de cargo definidas (bien en el registro de cabecera, bien en los registros C3). Si la cuenta se define como débito o prepago regalo, es decir el indicador de riesgo es débito o prepago, no debe de recibirse ningún registro de éste tipo. (La cuenta se informará en el registro de tarjetas). Parte variable del registro correspondiente a datos de tarjetas T1 (ATMPAMT1):
CREATE TABLE Tabla350 (
    INDENVPIN       VARCHAR(1)  -- INDICADOR DE ENVÍO DE LA CARTA DE PIN A CENTRO (S/N),
    CENTPIN         VARCHAR(4)  -- CENTRO DE ENVÍO SI LOS INDICADORES INDENVEST O INDENVPIN ESTÁN ACTIVOS,
    INDNIVSEG       VARCHAR(1)  -- INDICADOR DE NIVEL DE SEGURIDAD USUARIO,
    INDEXECUO       VARCHAR(1)  -- INDICADOR DE EXENCIÓN DE COMPRA EN CUOTAS,
    INDTAREMV       INT  -- INDICADOR DE TARJETA EMV: 0: TARJETA NO EMV 1: TARJETA EMV CON ESTAMPACIÓN INTERNA 2: TARJETA EMV CON ESTAMPACIÓN EXTERNA,
    CODPERFIL       VARCHAR(11)  -- PERFIL A ASOCIAR A LA TARJETA EMV,
    PANTAREXT       VARCHAR(22)  -- PAN DE LA TARJETA.,
    FECCADTAREXT    VARCHAR(6)  -- FECHA DE CADUCIDAD DE LA TARJETA. Formato AAAAMM.,
    INDESTTAREXT    VARCHAR(1)  -- INDICADOR DE ESTAMPACIÓN DE LA TARJETA (S/N).,
    NUMSEC          INT  -- NUMERO DE SECUENCIA,
    FILLER          VARCHAR(8)
);

-- Tabla351: S: La tarjeta se estampa. Si no viene relleno el campo PAN de la Tarjeta, siempre debe tener este valor. Número secuencial. Es el número del registro de la dirección postal del cliente. Parte variable del registro correspondiente a límites por moneda y tarjeta ‘T2’ (ATMPAMT2):
CREATE TABLE Tabla351 (
    CLAMON          INT  -- CLAVE DE MONEDA,
    LIMCRETAR       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE TARJETA LÍMITE GLOBAL DE LA TARJETA,
    PORLIM          INT  -- PORCENTAJE DE LÍMITE Del DISPONIBLE DE CRÉDITO DEL CONTRATO,
    INDPORLIM       VARCHAR(1)  -- INDICADOR DE LIÍMITE DE CRÉDITO POR PORCENTAJE O IMPORTE. VALORES: I: IMPORTE P: PORCENTAJE,
    LIMCREMES       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO MENSUAL,
    LIMDEBMES       DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DE LA TARJETA EN EL MES NATURAL,
    LIMCREDIA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DIARIO,
    LIMDEBDIA       DECIMAL(17, 2)  -- LÍMITE DE DÉBITO DIARIO,
    LIMDIACAJ       DECIMAL(17, 2)  -- LÍMITE DIARIO EN CAJERO,
    MAXOPER         INT  -- MÁXIMO NÚMERO DE OPERACIONES POR PERIODO,
    MAXODIA         INT  -- MÁXIMO NÚMERO DE OPERACIONES DIARIA,
    MAXDIACAJ       INT  -- MÁXIMO NÚMERO DE OPERACIONES EN CAJERO
);

-- Tabla352: Parte variable de registro de cuentas de cargo de tarjetas de débito T4 (ATMPAMT4):
CREATE TABLE Tabla352 (
    IBAN            VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO,
    CTACARGO        VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN,
    INDAJENA        VARCHAR(1)  -- INDICADOR DE CUENTA DE DOMICILIACIÓN AJENA (S/N),
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDTIPCTA       VARCHAR(2)  -- INDICADOR DE TIPO DE CUENTA DE CARGO
);

-- Tabla353: Si se está tratando con una tarjeta prepago regalo, este registro no se debe recibir. Se generan informes con la “validación de las altas masivas”, y los registros que no superan las validaciones. Parte variable de registro de saldos prepago regalo T5 (ATMPAMT5):
CREATE TABLE Tabla353 (
    CLAMON          INT  -- CLAVE DE MONEDA PRINCIPAL,
    SALDISPRE       DECIMAL(17, 2)  -- SALDO INICIAL A ASOCIAR A LA MONEDA PRINCIPAL,
    CLAMONSEC       INT  -- CLAVE DE MONEDA SECUNDARIA
);

-- Tabla354: Si se está tratando con una tarjeta prepago regalo, este registro no se debe recibir. Se generan informes con la “validación de las altas masivas”, y los registros que no superan las validaciones. Parte variable de registro de saldos prepago regalo T5 (ATMPAMT5):
CREATE TABLE Tabla354 (
    SALDISPRESEC    DECIMAL(17, 2)  -- SALDO INICIAL A ASOCIAR A LA MONEDA SECUNDARIA
);

-- Tabla355
CREATE TABLE Tabla355 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- INDICADOR DE TIPO,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CUENTA,
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO,
    NUMPLASTICO     NUMERIC(12)  -- NÚMERO DE PLÁSTICO,
    FECCADTAR       INT  -- FECHA DE CADUCIDAD,
    PAN             VARCHAR(22)  -- PAN,
    INDNOREN        INT  -- INDICADOR DE NO RENOVACIÓN 0 – SI RENOVAR 1 – NO RENOVAR,
    CODBLQ          INT  -- CÓDIGO DE BLOQUEO
);

-- Tabla356
CREATE TABLE Tabla356 (
    CENTRO          VARCHAR(4)  -- CÓDIGO DE OFICINA (PARA ESTAM Y CARP) (Opcional),
    PANNUE          VARCHAR(22)  -- NUMERO DE PAN ASIGNADO PARA REEMISION (Opcional),
    FECCADTARNUE    INT  -- FECHA DE CADUCIDAD DE LA NUEVA TJT (Opcional),
    INDESTAMPA      VARCHAR(1)  -- INDICADOR ESTAMPACION S – Se estampa en proceso Batch N – No se estampa, tarjeta estampada externamente
);

-- Tabla357
CREATE TABLE Tabla357 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CUENTA,
    CODCAMCOM       VARCHAR(4)  -- CÓDIGO DE CAMPAÑA COMERCIAL,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    FECINI          UNKNOWN  -- FECHA DE INICIO,
    FECFIN          UNKNOWN  -- FECHA DE FIN (SE EMPLEARÁ EXCLUSIVAMENTE SI LLEGA INFORMADO EL TIPO DE LÍNEA),
    CLAMON          INT  -- CÓDIGO DE MONEDA,
    L_MITE          DECIMAL(17, 2)  -- LÍMITE DE LA LÍNEA,
    PORLIM          INT  -- PORCENTAJE DE LÍMITE DE LA LÍNEA,
    INDPORLIM       VARCHAR(1)  -- INDICADOR DE LIÍMITE POR PORCENTAJE O IMPORTE. VALORES: I: IMPORTE P: PORCENTAJE
);

-- Tabla358
CREATE TABLE Tabla358 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE LA ENTIDAD DE LA FACTURA,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    FEC_OPER        UNKNOWN  -- FECHA DE LA OPERACIÓN,
    IMP_OPER        DECIMAL(17, 2)  -- IMPORTE DE LA OPERACIÓN,
    CLAMON          INT  -- CLAVE DE MONEDA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE DE COMERCIO REDUCIDO,
    INDDEBCRE       INT  -- INDICADOR DÉBITO CRÉDITO 1 – CRÉDITO 2 – DÉBITO 5 – PREPAGO REGALO 6 – PREPAGO,
    INDNORCOR       VARCHAR(1)  -- INDICADOR DE OPERACIÓN 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    SESIONRED       VARCHAR(12)  -- SESIÓN DE LA RED,
    PAIS            INT  -- CÓDIGO DE PAÍS,
    INDCOMPCUO      VARCHAR(1)  -- INDICADOR DE COMPRA EN CUOTAS,
    NUMCUOTA        INT  -- NÚMERO DE CUOTAS
);

-- Tabla359
CREATE TABLE Tabla359 (
    MESCARCUO       INT  -- MESES DE CARENCIA,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    PORINT          DECIMAL(7, 4)  -- TASA DE INTERÉS APLICADA,
    ID_TERMINAL     VARCHAR(16)  -- CÓDIGO DE TERMINAL,
    LINREF          INT  -- REFERENCIA DE TIPO DE LÍNEA,
    NUMAUT          VARCHAR(6)  -- NUMERO DE AUTORIZACION,
    PROPINA         DECIMAL(17, 2)  -- PROPINA DE LA OPERACIÓN,
    IMPUESTO        DECIMAL(17, 2)  -- IMPUESTO DE LA OPERACION,
    CODOFI          VARCHAR(4)  -- CODIGO DE OFICINA,
    IMPCALIMP       DECIMAL(17, 2)  -- IMPORTE BASE DE CALCULO DEL IMPUESTO EXTERNO,
    INDPAGO         INT  -- INDICADOR DE PAGO,
    NUMCOMPRO       VARCHAR(23)  -- NUMERO DE COMPROBANTE,
    IMPUESTO__EXT   DECIMAL(17, 2)  -- IMPUESTO EXTERNO,
    FILLER          VARCHAR(11)
);

-- Tabla360: Recibo: Será un campo opcional de tal forma que: Estructura común inicial para todos los tipos de registro (ATRECSEG).
CREATE TABLE Tabla360 (
    ENTIDAD         VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    OFICINA         VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CONTRATO        VARCHAR(12)  -- Nº DE CONTRATO (PARA TODOS LOS IMPAGADOS DEL CONTRATO),
    RECIBO          NUMERIC(15)  -- NÚMERO DEL RECIBO SOBRE EL QUE HACER LA NUEVA PRESENTACIÓN,
    TIPRODUC        VARCHAR(2)  -- TIPO DE CONTRATO (TC – TARJETA),
    FECHPROC        UNKNOWN  -- FECHA DE PROCESO,
    FECCOBRO        UNKNOWN  -- FECHA DE COBRO DE LA NUEVA PRESENTACIÓN,
    XGASTOS         VARCHAR(1)  -- INDICADOR DE CÁLCULO DE COMISIONES A LA 2ª CÁMARA: S – INCLUIR COMISIONES N – NO INCLUIR COMISIONES,
    XINTERES        VARCHAR(1)  -- INDICADOR DE CÁLCULO DE INTERESES A LA 2ª CÁMARA: S – INCLUIR INTERESES N – NO INCLUIR INTERESES
);

-- Tabla361
CREATE TABLE Tabla361 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    CLAMON          INT  -- CODIGO DE MONEDA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA,
    TIPREF          VARCHAR(2)  -- TIPO DE REFERENCIA DEL PAGO EX – Se especifica número de extracto IM – Se especifica número de impago DO – Se especifica tipo y referencia de documento de pago,
    NUMEXTPG        NUMERIC(15)  -- NÚMERO DE EXTRACTO DEL PAGO - Se corresponderá con el número de extracto si TIPREF = EX o el número de secuencia del impago si TIPREF = IM. Valdrá ceros si TIPREF = DO.,
    NUMMOVPG        INT  -- NÚMERO DE MOVIMIENTO DEL EXTRACTO SI TIPREF = EX. CEROS EN EL RESTO.,
    TIPDOCPAG       INT  -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO SI TIPREF = DO 1-Cheque 2-Giro 3-Metálico 4-Internet
);

-- Tabla362
CREATE TABLE Tabla362 (
    REFDOCPAG       VARCHAR(20)  -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO SI TIPREF = DO.
);

-- Tabla363
CREATE TABLE Tabla363 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- DEL,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    CLAMON          INT  -- CODIGO DE MONEDA,
    PAN             VARCHAR(22)  -- --,
    TIPREF          VARCHAR(2)  -- Tipo de referencia del pago EX – Se especifica número de extracto IM – Se especifica número de impago DO – Se especifica tipo y referencia de documento de pago,
    NUMEXTPG        NUMERIC(15)  -- Número de extracto del pago - Se corresponderá con el número de extracto si TIPREF = EX o el número de secuencia del impago si TIPREF = IM. Valdrá ceros si TIPREF = DO.,
    NUMMOVPG        INT  -- Número de movimiento del extracto si TIPREF = EX. Ceros en el resto.,
    TIPDOCPAG       INT  -- Tipo de documento para movimientos de pago si TIPREF = DO 1-Cheque 2-Giro
);

-- ERROR: No se pudieron procesar las columnas de Tabla364

-- Tabla365
CREATE TABLE Tabla365 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA Se corresponderá con el número de contrato si TIPORECLAS = CO. Valdrá espacios si TIPORECLAS = CL.,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    TIPORECLAS      VARCHAR(2)  -- TIPO DE RECLASIFICACIÓN. VALORES: CO – Contrato. CL – Cliente.
);

-- Tabla366: En los apartados siguientes se describe la asociación entre qué conjuntos de campos cumplimentados y qué procesos se desencadenan. Si se cumplimentan en un mismo registro datos que cumplen por completo más de un servicio, se ejecutarán ambos servicios. Si se cumplimentan dos registros sobre el mismo servicio se ejecutarán ambos consecutivamente. Se consideran cumplimentados como se describe en Consideraciones Generales de Interfaces Batch. Un servicio será activado si los campos que se consideran como obligatorios han sido cumplimentados. La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla366 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA
);

-- Tabla367: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla367 (
    DATOS_PARA_CAMBIO_PRODUCTO UNKNOWN  -- DATOS PARA CAMBIO PRODUCTO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON_SEC      INT  -- CLAVE DE MONEDA SECUNDARIA,
    INDMODLIM_REV   VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTA_1     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL
);

-- Tabla368: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla368 (
    LIMCRECTA_2     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    INDMODLIM_CC    VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM C.CUOTAS CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTAC_1    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTAC_2    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    FORPAGO         INT  -- FORMA DE PAGO,
    CODFORMATO      VARCHAR(10)  -- CODIGO DE FORMATO DE IMPRESION DE EXTRACTO,
    PORPAGOA_1      INT  -- PORCENTAJE PAGO APLAZADO MONEDA PRINCIPAL,
    PORPAGOA_2      INT  -- PORCENTAJE PAGO APLAZADO MONEDA SECUNDARIA,
    IMPFPAGOA_1     DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA PRINCIPAL,
    IMPFPAGOA_2     DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA SECUNDARIA,
    INDMODCTACAR    VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN DE LAS CUENTAS DE CARGO CON LOS VALORES DE LA INTERFAZ.,
    IBAN_1          VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO MONEDA PRINCIPAL,
    CTACARGO_1      VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA PRINCIPAL,
    IBAN_2          VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA,
    CTACARGO_2      VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA SECUNDARIA,
    DATOS_PARA_CAMBIO_MARCA_TIPO_TARJETA_DEL_TITULAR UNKNOWN  -- DATOS PARA CAMBIO MARCA/TIPO TARJETA DEL TITULAR
);

-- Tabla369: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla369 (
    CODMAR_TIT      INT  -- CÓDIGO DE MARCA DE LA TARJETA DEL TITULAR,
    INDTIPT_TIT     INT  -- TIPO DE TARJETA DEL TITULAR,
    CENTENVEST__TIT VARCHAR(4)  -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL TITULAR,
    TABLA_MAR_TIP   UNKNOWN  -- TABLA DE MARCAS/TIPO PARA MODIFICACIÓN DE TARJETAS DE BENEFICIARIOS ( Máx. 10 OCURRENCIAS).,
    CODMAR_BANT     INT  -- CÓDIGO DE MARCA DE LAS TARJETAS A CAMBIAR,
    INDTIPT_BANT    INT  -- TIPO DE LAS TARJETAS A CAMBIAR,
    CODMAR_BNUE     INT  -- NUEVA MARCA DE LAS TARJETAS,
    INDTIPT_BNUE    INT  -- NUEVO TIPO DE LAS TARJETAS,
    CENTENVEST__BEN VARCHAR(4)  -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL BENEFICIARIO,
    OTROS_DATOS_PARA_CAMBIO_MARCA_TIPO_TARJETA_DEL_TITULAR UNKNOWN  -- OTROS DATOS PARA CAMBIO MARCA/TIPO TARJETA DEL TITULAR,
    CONDEST_TIT     INT  -- CÓDIGO DE ESTAMPACION DE LA TARJETA DEL TITULAR,
    TABLA_COND__EST UNKNOWN  -- TABLA DE CODIGO DE ESTMAPACION PARA MODIFICACIÓN DE TARJETAS DE BENEFICIARIOS ( Máx. 10 OCURRENCIAS).,
    CONDEST_BANT    INT  -- CODIGO DE ESTAMPACION DE LAS TARJETAS A CAMBIAR,
    CONDEST_BNUE    INT  -- NUEVO CODIGO DE ESTAMPACION DE LAS TARJETAS
);

-- Tabla370
CREATE TABLE Tabla370 (
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON_SEC      INT  -- CLAVE DE MONEDA SECUNDARIA
);

-- Tabla371
CREATE TABLE Tabla371 (
    INDMODLIM_REV   VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTA_1     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTA_2     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    INDMODLIM_CC    VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM C.CUOTAS CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S,
    LIMCRECTAC_1    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTAC_2    DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA
);

-- Tabla372: Se genera un fichero para contabilidad que refleja las modificaciones de los límites, escribiéndose un registro con el concepto contable correspondiente a la baja del límite original y otro correspondiente al alta del nuevo límite. Campos específicos en el fichero de entrada:
CREATE TABLE Tabla372 (
    FORPAGO         INT  -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    PORPAGOA_1      INT  -- PORCENTAJE PAGO APLAZADO MONEDA PRINCIPAL,
    PORPAGOA_2      INT  -- PORCENTAJE PAGO APLAZADO MONEDA SECUNDARIA,
    IMPFPAGOA_1     DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA PRINCIPAL,
    IMPFPAGOA_2     DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA SECUNDARIA
);

-- Tabla373: Campo específico en el fichero de entrada:
CREATE TABLE Tabla373 (
    CODFORMATO      VARCHAR(10)  -- CODIGO DE FORMATO DE IMPRESION DE EXTRACTO
);

-- Tabla374: Si el campo viene informado se validará que esté asociado al nuevo producto. Campo específico en el fichero de entrada. Los datos adicionales a cumplimentar además de los generales son los siguientes:
CREATE TABLE Tabla374 (
    INDMODCTACAR    VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN DE LAS CUENTAS DE CARGO CON LOS VALORES DE LA INTERFAZ.,
    IBAN_1          VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO MONEDA PRINCIPAL,
    CTACARGO_1      VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA PRINCIPAL,
    IBAN_2          VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA,
    CTACARGO_2      VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA SECUNDARIA
);

-- Tabla375: Es obligatorio informar las cuentas de cargo para cada una de las monedas del contrato si el indicador está activo. Si una de las dos monedas no tiene informada la cuenta de cargo el registro se rechaza. Si la cuenta es ajena y el producto no lo permite se rechaza el registro.
CREATE TABLE Tabla375 (
    CODMAR_TIT      INT  -- CÓDIGO DE MARCA DE LA TARJETA DEL TITULAR,
    INDTIPT_TIT     INT  -- TIPO DE TARJETA DEL TITULAR,
    CENTENVEST__TIT VARCHAR(4)  -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL TITULAR,
    CONDEST_TIT     INT  -- CONDICION DE ESTAMPACION DEL TITULAR
);

-- Tabla376
CREATE TABLE Tabla376 (
    CODMAR_BANT     INT  -- CÓDIGO DE MARCA DE LAS TARJETAS A CAMBIAR,
    INDTIPT_BANT    INT  -- TIPO DE LAS TARJETAS A CAMBIAR,
    CODMAR_BNUE     INT  -- NUEVA MARCA DE LAS TARJETAS,
    INDTIPT_BNUE    INT  -- NUEVO TIPO DE LAS TARJETAS,
    CENTENVEST_BEN  VARCHAR(4)  -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL BENEFICIARIO
);

-- Tabla377
CREATE TABLE Tabla377 (
    CONDEST__BANT   INT  -- CÓDIGO DE ESTAMPACION DE LAS TARJETAS A CAMBIAR,
    CONDEST__BNUE   INT  -- NUEVO CÓDIGO DE ESTAMPACION DE LAS TARJETAS
);

-- Tabla378: En los apartados siguientes se describe la asociación entre qué conjuntos de campos cumplimentados y qué procesos se desencadenan. Si se cumplimentan en un mismo registro datos que cumplen por completo más de un servicio, se ejecutarán ambos servicios. Si se cumplimentan dos registros sobre el mismo servicio se ejecutarán ambos consecutivamente. Se consideran cumplimentados como se describe en Consideraciones Generales de Interfaces Batch. Un servicio será activado si los campos que se consideran como obligatorios han sido cumplimentados. La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla378 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA – OFUSCADO - -
);

-- Tabla379: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla379 (
    DATOS_PARA_CAMBIO_PRODUCTO UNKNOWN  -- DATOS PARA CAMBIO PRODUCTO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON_SEC      INT  -- CLAVE DE MONEDA SECUNDARIA,
    INDMODLIM_REV   VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S)
);

-- ERROR: No se pudieron procesar las columnas de Tabla380

-- ERROR: No se pudieron procesar las columnas de Tabla381

-- Tabla382
CREATE TABLE Tabla382 (
    DATOS_PARA_EL_TOKEN_DE_NEGOCIO UNKNOWN  -- DATOS PARA EL TOKEN DE NEGOCIO,
    TOKENNEGOCIO    VARCHAR(37)  -- formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
);

-- Tabla383
CREATE TABLE Tabla383 (
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    CONPROD         VARCHAR(3)  -- CÓDIGO DE CONDICIÓN ECONÓMICA,
    CLAMON__SEC     INT  -- CLAVE DE MONEDA SECUNDARIA
);

-- Tabla384
CREATE TABLE Tabla384 (
    INDMODLIM__REV  VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM REVOLVING CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S),
    LIMCRECTA_1     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTA_2     DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA,
    INDMODLIM__CC   VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN LIM C.CUOTAS CON EL VALOR INCLUIDO EN LA INTERFAZ(N/S,
    LIMCRECTAC__1   DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA PRINCIPAL,
    LIMCRECTAC__2   DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO COMPRA EN CUOTAS DE LA CUENTA O CONTRATO DE TARJETA MONEDA SECUNDARIA
);

-- Tabla385: Se genera un fichero para contabilidad que refleja las modificaciones de los límites, escribiéndose un registro con el concepto contable correspondiente a la baja del límite original y otro correspondiente al alta del nuevo límite. Campos específicos en el fichero de entrada:
CREATE TABLE Tabla385 (
    FORPAGO         INT  -- FORMA DE PAGO SOLO PARA EL CRÉDITO 1 – PAGO TOTAL 2 – FIJO 3 - PAGO MÍNIMO O APLAZADO,
    PORPAGOA__1     INT  -- PORCENTAJE PAGO APLAZADO MONEDA PRINCIPAL,
    PORPAGOA__2     INT  -- PORCENTAJE PAGO APLAZADO MONEDA SECUNDARIA,
    IMPFPAGOA__1    DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA PRINCIPAL,
    IMPFPAGOA__2    DECIMAL(17, 2)  -- IMPORTE FIJO PAGO APLAZADO MONEDA SECUNDARIA
);

-- Tabla386: Campo específico en el fichero de entrada:
CREATE TABLE Tabla386 (
    CODFORMATO      VARCHAR(10)  -- CODIGO DE FORMATO DE IMPRESION DE EXTRACTO
);

-- Tabla387: Si el campo viene informado se validará que esté asociado al nuevo producto. Campo específico en el fichero de entrada. Los datos adicionales a cumplimentar además de los generales son los siguientes:
CREATE TABLE Tabla387 (
    INDMODCTACAR    VARCHAR(1)  -- INDICADOR DE MODIFICACIÓN DE LAS CUENTAS DE CARGO CON LOS VALORES DE LA INTERFAZ.,
    IBAN_1          VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO MONEDA PRINCIPAL,
    CTACARGO_1      VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA PRINCIPAL,
    IBAN_2          VARCHAR(4)  -- IBAN DE LA CUENTA DE CARGO MONEDA SECUNDARIA,
    CTACARGO_2      VARCHAR(30)  -- CUENTA DE CARGO O DOMICILIACIÓN MONEDA SECUNDARIA
);

-- Tabla388: Es obligatorio informar las cuentas de cargo para cada una de las monedas del contrato si el indicador está activo. Si una de las dos monedas no tiene informada la cuenta de cargo el registro se rechaza. Si la cuenta es ajena y el producto no lo permite se rechaza el registro.
CREATE TABLE Tabla388 (
    CODMAR_TIT      INT  -- CÓDIGO DE MARCA DE LA TARJETA DEL TITULAR,
    INDTIPT_TIT     INT  -- TIPO DE TARJETA DEL TITULAR,
    CENTENVEST__TIT VARCHAR(4)  -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL TITULAR
);

-- Tabla389
CREATE TABLE Tabla389 (
    CODMAR__BANT    INT  -- CÓDIGO DE MARCA DE LAS TARJETAS A CAMBIAR,
    INDTIPT_BANT    INT  -- TIPO DE LAS TARJETAS A CAMBIAR,
    CODMAR__BNUE    INT  -- NUEVA MARCA DE LAS TARJETAS,
    INDTIPT_BNUE    INT  -- NUEVO TIPO DE LAS TARJETAS,
    CENTENVEST__BEN VARCHAR(4)  -- CENTRO DE ENVÍO DE ESTAMPACIÓN DEL BENEFICIARIO
);

-- Tabla390
CREATE TABLE Tabla390 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    INDNORCOR       INT  -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CLAMON          INT  -- CLAVE DE MONEDA,
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN,
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA
);

-- Tabla391
CREATE TABLE Tabla391 (
    INDDEBCRE       INT  -- INDICADOR DE DÉBITO / CRÉDITO,
    INDCOMPCUO      VARCHAR(1)  -- INDICADOR DE COMPRA EN CUOTAS,
    CODTIPC         VARCHAR(4)  -- TIPO DE CUOTA,
    NUMCUOTA        INT  -- NÚMERO DE CUOTAS,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE CUOTA,
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL,
    MESCARCUO       INT  -- MESES DE CARENCIA,
    LINREF          INT  -- REFERENCIA DE LÍNEA,
    FORPAGO         INT  -- FORMA DE PAGO,
    Ajustes_de_conceptos_econ_micos_ UNKNOWN  -- Ajustes de conceptos económicos:,
    SIGNO__INTERES  VARCHAR(1)  -- SIGNO DE INTERÉS A REGULARIZAR (+/-),
    AJU_INTERES     DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO INTERÉS,
    SIGNO__COMISION VARCHAR(1)  -- SIGNO DE COMISIÓN A REGULARIZAR (+/-),
    AJU__COMISION   DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO COMISIÓN,
    SIGNO__IMPUESTO VARCHAR(1)  -- SIGNO DE IMPUESTO A REGULARIZAR (+/-),
    AJU__IMPUESTO   DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO IMPUESTO,
    SIGNO__INTMORA  VARCHAR(1)  -- SIGNO DE INTERÉS DE MORA A REGULARIZAR (+/-),
    AJU_INTMORA     DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO INTERÉS DE MORA,
    SIGNO__COMMORA  VARCHAR(1)  -- SIGNO DE COMISIÓN DE MORA A REGULARIZAR (+/-)
);

-- Tabla392
CREATE TABLE Tabla392 (
    AJU__COMMORA    DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO COMISIÓN DE MORA,
    SIGNO__IMPUMORA VARCHAR(1)  -- SIGNO DE IMPUESTO DE MORA A REGULARIZAR (+/-),
    AJU__IMPUMORA   DECIMAL(17, 2)  -- IMPORTE A REGULARIZAR COMO IMPUESTO DE MORA,
    M_s_informaci_n_sobre_el_ajuste_del_movimiento_ UNKNOWN  -- Más información sobre el ajuste del movimiento:,
    INDICA_TASA_0   INT  -- INDICADOR DE TASA CON VALOR 0 0 – LA TASA SE DEBE CALCULAR 1 – LA TASA ES 0
);

-- Tabla393
CREATE TABLE Tabla393 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZO LA OPERACIÓN,
    INDNORCOR       INT  -- INDICADOR DE TIPO DE FACTURA 0 – NORMAL 1 – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZO LA OPERACIÓN,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD
);

-- ERROR: No se pudieron procesar las columnas de Tabla394

-- ERROR: No se pudieron procesar las columnas de Tabla395

-- Tabla396
CREATE TABLE Tabla396 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    LONGPAN         INT  -- LONGITUD DE LA TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA
);

-- Tabla397
CREATE TABLE Tabla397 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    PAN1            VARCHAR(22)  -- PAN DE LA TARJETA PRINCIPAL,
    PAN2            VARCHAR(22)  -- PAN DE LA TARJETA SECUNDARIA,
    CENTALTA1       VARCHAR(4)  -- OFICINA DE ALTA DE CUENTA PRINCIPAL,
    CUENTA1         VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO PRINCIPAL,
    NUMBENTCA1      INT  -- NÚMERO DE BENEFICIARIOS DE LA CUENTA PRINCIPAL,
    NUMPLASTICO1    NUMERIC(12)  -- NÚMERO DE PLÁSTICO PRINCIPAL,
    CENTALTA2       VARCHAR(4)  -- OFICINA DE ALTA DE CUENTA SECUNDARIA,
    CUENTA2         VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO SECUNDARIA,
    NUMBENCTA2      INT  -- NÚMERO DE BENEFICIARIOS DE LA CUENTA SECUNDARIA,
    NUMPLASTICO2    NUMERIC(12)  -- NÚMERO DE PLÁSTICO SECUNDARIA,
    NOMBENRED       VARCHAR(35)  -- NOMBRE Y APELLIDOS PARA ESTAMPACIÓN, FORMATO:NOMBRE*APELLIDO,
    ESTPLAS1        VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD
);

-- Tabla398
CREATE TABLE Tabla398 (
    ESTPLAS2        VARCHAR(40)  -- DATOS DE ESTAMPACIÓN A VOLUNTAD,
    CONDEST         VARCHAR(3)  -- CONDICIONES DE ESTAMPACIÓN,
    CENTROEST       VARCHAR(4)  -- CENTRO DE ESTAMPACIÓN,
    INDENVPIN       VARCHAR(1)  -- INDICADOR DE ENVÍO DE LA CARTA DE PIN A CENTRO (S/N),
    CENTPIN         VARCHAR(4)  -- CENTRO DE ENVÍO SI EL INDICADOR O INDENVPIN ESTÁ ACTIVO,
    INDFOTO         VARCHAR(1)  -- INDICADOR DE FOTO EN PLÁSTICO (S/N),
    REFFOTO         VARCHAR(30)  -- REFERENCIA DE LA FOTO, SOLO SI EL CAMPO ANTERIOR ESTÁ ACTIVO
);

-- Tabla399: El formato que corresponde al registro de detalle del fichero de salida sería (ATCON001):
CREATE TABLE Tabla399 (
    DATOS_GENERALES_OBLIGATORIOS UNKNOWN  -- DATOS GENERALES OBLIGATORIOS,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD
);

-- Tabla400: El formato que corresponde al registro de detalle del fichero de salida sería (ATCON001):
CREATE TABLE Tabla400 (
    CODGRU          INT  -- CÓDIGO DE GRUPO CONTABLE 01 = FRANQUICIAS. ENTRADA 02 = INCOMING 03 = COMERCIOS 04 = INCIDENCIAS 05 = TITULARES 06 = OPERACIONES DIARIAS 07 = COMPRA EN CUOTAS 08 = IMPAGADOS 09 = LIQUIDACIÓN 10 = MAESTRO DE RECIBOS 11 = OUTGOING 12 = FRANQUICIAS. SALIDA,
    CODCCN          INT  -- CONCEPTO CONTABLE,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE,
    CLAMON          INT  -- CLAVE DE MONEDA,
    FECALTA         UNKNOWN  -- FECHA GRABACIÓN DEL REGISTRO,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE (AAAA-MM- DD),
    FECOPER         UNKNOWN  -- FECHA DE LA OPERACIÓN (AAAA-MM-DD),
    DATOS_GENERALES_NO_OBLIGATORIOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_ UNKNOWN  -- DATOS GENERALES NO OBLIGATORIOS (INFORMAR SI EL PGM DISPONE DE ELLOS),
    IMPORI          DECIMAL(17, 2)  -- IMPORTE ORIGINAL DE LA OPERACIÓN,
    CLAMONORI       INT  -- CLAVE MONEDA ORIGINAL,
    CMBAPLIORI      DECIMAL(9, 4)  -- CAMBIO APLICADO PASO DE MONEDA,
    IMPEMI          DECIMAL(17, 2)  -- IMPORTE RECEPCIÓN DE LA OPERACIÓN,
    CLAMONEMI       INT  -- CLAVE MONEDA EMISOR,
    CMBAPLIEMI      DECIMAL(9, 4)  -- CAMBIO APLICADO PASO DE MONEDA EMISOR,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA: NORMAL CORRECTORA
);

-- Tabla401: El formato que corresponde al registro de detalle del fichero de salida sería (ATCON001):
CREATE TABLE Tabla401 (
    TIPOFAC         INT  -- TIPO DE FACTURA,
    INDAPLDEBCRE    INT  -- INDICADOR DE OPERATIVIDAD DE LA TARJETA 1 – Crédito 2 – Débito 3 – Mixta 4- Monedero 5- Prepago banda,
    CODACT          INT  -- CÓDIGO ACTIVIDAD ISO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    SECOPE          NUMERIC(12)  -- SECUENCIA DE LA OPERACIÓN,
    OFIOPE          VARCHAR(4)  -- OFICINA QUE GENERA LA OPERACIÓN,
    IDTERM          VARCHAR(16)  -- IDENTIFICADOR DE TERMINAL,
    IDENTIFICADOR_DE_LA_OPERACI_N__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_SEG_N_SUBSISTEMA_ UNKNOWN  -- IDENTIFICADOR DE LA OPERACIÓN (INFORMAR SI EL PGM DISPONE DE ELLOS SEGÚN SUBSISTEMA),
    SIAIDCD         VARCHAR(19)  -- CÓDIGO IDENTIFICACIÓN DE SIA,
    NUMCINTA        NUMERIC(17)  -- NÚMERO DE CINTA,
    SECLOTE         INT  -- LOTE DENTRO DE LA CINTA,
    CENTALTA        VARCHAR(4)  -- CENTRO ALTA CUENTA TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO DE CRÉDITO,
    NUMMOV          INT  -- NÚMERO MOVIMIENTO CRÉDITO O DÉBITO,
    NUMOPECUO       INT  -- NÚMERO OPERACIÓN EN CUOTAS,
    FECINI          UNKNOWN  -- FECHA INICIO,
    FECFIN          UNKNOWN  -- FECHA FIN
);

-- Tabla402: El formato que corresponde al registro de detalle del fichero de salida sería (ATCON001):
CREATE TABLE Tabla402 (
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    CENTALTACOM     VARCHAR(4)  -- ALTA CONTRATO COMERCIO,
    CUENTACOM       VARCHAR(12)  -- CONTRATO COMERCIO,
    NUMEXTCOM       INT  -- NÚMERO EXTRACTO COMERCIO,
    NUMMOVEXTCO     INT  -- NÚMERO MOVIMIENTO EXTRACTO COMERCIO,
    NUMREFREM       INT  -- NÚMERO REFERENCIA REMESA,
    NUMREFFACREM    INT  -- NÚMERO REFERENCIA DE LA FACTURA,
    NUMINC          INT  -- NÚMERO INCIDENCIA,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA DE RECIBO,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA DE RECIBO IMPAGADO,
    DATOS_DE_TRAMA_CONTABLE_Y_ESTAD_STICOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS__CONTABILIDAD_INFORMAR__LOS_NECESARIOS_PARA_TRADUCCI_N_CONTABLE_ UNKNOWN  -- DATOS DE TRAMA CONTABLE Y ESTADÍSTICOS (INFORMAR SI EL PGM DISPONE DE ELLOS. CONTABILIDAD INFORMARÁ LOS NECESARIOS PARA TRADUCCIÓN CONTABLE),
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR TIPO DE TARJETA,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE,
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    CODRAZON        INT  -- CÓDIGO DE RAZÓN,
    TIPOREM         VARCHAR(1)  -- TIPO DE REMESA,
    CODESTCTA       INT  -- CÓDIGO ESTADO DE CUENTA DE TARJETA,
    CODPAIS         INT  -- CÓDIGO DE PAÍS,
    TIPOCLI         VARCHAR(4)  -- TIPO DE CLIENTE
);

-- Tabla403: El formato que corresponde al registro de detalle del fichero de salida sería (ATCON001):
CREATE TABLE Tabla403 (
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN DE OPERACIÓN,
    PROGRAMA        VARCHAR(8)  -- NOMBRE DE PROGRAMA,
    DATOS_CONTABLES__SE_INFORMARAN_EN_LOS_PROCESOS_CONTABLES_ UNKNOWN  -- DATOS CONTABLES (SE INFORMARAN EN LOS PROCESOS CONTABLES),
    IMPCON          DECIMAL(17, 2)  -- IMPORTE EN MONEDA CONTABLE,
    CLAMONCON       INT  -- CLAVE MONEDA CONTABLE,
    CMBAPLI         DECIMAL(9, 4)  -- CAMBIO APLICADO,
    CUENTADEBE      INT  -- CUENTA SAT DEBE,
    CUENTAHABER     INT  -- CUENTA SAT HABER,
    OFIIMPDEB       VARCHAR(4)  -- OFICINA IMPUTACIÓN DEBE,
    OFIIMPHAB       VARCHAR(4)  -- OFICINA IMPUTACIÓN HABER,
    INDNACINT       INT  -- INDICADOR OPERADOR NACIONAL INTERNACIONAL,
    NUMOPER         INT  -- NÚMERO DE REGISTROS QUE COMPONEN LA TOTALIZACIÓN DE CONCEPTOS,
    SIGNO           VARCHAR(1)  -- SIGNO DEL REGISTRO CONTABLE (SIGNO DEL TIPO DE FACTURA O INDICADOR DE NORMAL / CORRECTORA),
    DATOS_DE_L_NEA  UNKNOWN  -- DATOS DE LÍNEA,
    LINREF          INT  -- REFERENCIA DE TIPO DE LÍNEA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    CLASIFEXT       VARCHAR(1)  -- CLASIFICACIÓN EXTERNA,
    FILLER          VARCHAR(4)
);

-- Tabla404: La interfaz incluye el nuevo campo tokennegocio univoco para cada tarjeta. El formato que corresponde al registro de detalle del fichero de salida sería (ATCON002):
CREATE TABLE Tabla404 (
    DATOS_GENERALES_OBLIGATORIOS UNKNOWN  -- DATOS GENERALES OBLIGATORIOS,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODGRU          INT  -- CÓDIGO DE GRUPO CONTABLE - 01 = FRANQUICIAS. ENTRADA 02 = INCOMING 03 = COMERCIOS 04 = INCIDENCIAS 05 = TITULARES
);

-- ERROR: No se pudieron procesar las columnas de Tabla405

-- ERROR: No se pudieron procesar las columnas de Tabla406

-- ERROR: No se pudieron procesar las columnas de Tabla407

-- ERROR: No se pudieron procesar las columnas de Tabla408

-- ERROR: No se pudieron procesar las columnas de Tabla409

-- Tabla410: Programa ATB547: Formatea los registros de detalle de los conceptos económicos asociados a las compras en cuotas canceladas o amortizadas en el proceso diario. Programa ATB548: Formatea los registros de detalle de las financiaciones y de los detalles de las cuotas de las compras en cuotas canceladas o amortizadas en el proceso diario.
CREATE TABLE Tabla410 (
    DATOS_COMUNES   UNKNOWN  -- DATOS COMUNES,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    CLAMON          INT  -- CÓDIGO DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA,
    NUMOPECUO       INT  -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN ACTUAL
);

-- Tabla411
CREATE TABLE Tabla411 (
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO: CC – COMPRA EN CUOTA FI – PLAN DE FINANCIACIÓN CU – DETALLE DE LA CUOTA CE – CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTAS,
    REGISTRO        VARCHAR(736),
    REGISTRO_CC___REGISTRO_DE_COMPRA_EN_CUOTAS UNKNOWN  -- REGISTRO CC – REGISTRO DE COMPRA EN CUOTAS,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    FECALTCOMP      UNKNOWN  -- FECHA DE ALTA DE LA COMPRA EN CUOTAS,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA: – NORMAL – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZÓ LA OPERACIÓN. EL VALOR DE ESTE CAMPO DEBERÁ ALMACENARSE JUSTIFICADO A LA IZQUIERDA,
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA
);

-- Tabla412
CREATE TABLE Tabla412 (
    DESCLAMONDIV    VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    SIGIMPDIV       VARCHAR(1)  -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL (+/-),
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGIMPFAC       VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA FACTURA (+/-),
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI         DECIMAL(9, 4)  -- FACTOR DE CAMBIO APLICADO (SÓLO TIENE SENTIDO PARA OPERACIONES EN EL EXTRANJERO),
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE REDUCIDO DEL COMERCIO,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    DESACT          VARCHAR(30)  -- DESCRIPCIÓN DE LA ACTIVIDAD,
    SIGIMPLIQ       VARCHAR(1)  -- SIGNO DEL IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO (+/-),
    IMPLIQ          DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO,
    CLAMONLIQ       INT  -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONLIQ    VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO
);

-- Tabla413
CREATE TABLE Tabla413 (
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPAIS         VARCHAR(30)  -- NOMBRE DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN OPERACIÓN (VER ATORIGEN),
    DESORIGENOPE    VARCHAR(30)  -- DESCRIPCIÓN DEL ORIGEN DE LA OPERACIÓN,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    DESFRA          VARCHAR(30)  -- DESCRIPCIÓN DE LA FRANQUICIA,
    SECOPE          NUMERIC(12)  -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC       NUMERIC(15)  -- NUMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SÓLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED       VARCHAR(12)  -- SESIÓN DE LA RED,
    SIAIDCD         VARCHAR(19)  -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    ESTCOMPRA       INT  -- ESTADO DE LA COMPRA
);

-- Tabla414
CREATE TABLE Tabla414 (
    DESESTCOMPRA    VARCHAR(30)  -- DESCRIPCIÓN DEL ESTADO DE LA COMPRA: - VIGENTE - CANCELADA - AMORTIZADA O FINALIZADA - FUSIÓN N COMPRAS - CANCELADA CARTERA-VENCIDA – INCIDENCIA EN ESTUDIO - REFINANCIADA – ACELERADA – CANCELADA CARTERA- CONGELADA – RETENIDA POR INCIDENCIA – INCIDENCIA ABONADA – REVERSADA – LIQUIDACIÓN DE COMPRA EN CUOTA VIGENTE – LIQUIDACIÓN DE COMPRA EN CUOTA EN ESTUDIO,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN A LA RED,
    SIGIMPCAP2      VARCHAR(1)  -- SIGNO DEL IMPORTE CAPITAL 2 (+/-),
    IMPCAP2         DECIMAL(17, 2)  -- IMPORTE CAPITAL 2,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN DE LA LÍNEA,
    PORINTORIG      DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS ORIGINAL,
    PORBONORIG      DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS VIGENTE,
    FILLER          VARCHAR(78)
);

-- Tabla415
CREATE TABLE Tabla415 (
    REGISTRO_FI___INFORMACION_SOBRE_EL_PLAN_DE_FINANCIACION UNKNOWN  -- REGISTRO FI – INFORMACION SOBRE EL PLAN DE FINANCIACION,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    SIGIMPCUOTA     VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    NUMCUOPAG       INT  -- NÚMERO DE CUOTAS PAGADAS,
    NUMMESFIN       VARCHAR(12)  -- MESES DE FINANCIACIÓN,
    SIGIMPTOTAL     VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL A PAGAR (+/-),
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPINTTOTAL  VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERESES TOTAL A PAGAR (+/-),
    IMPINTTOTAL     DECIMAL(17, 2)  -- IMPORTE DE INTERESES TOTAL A PAGAR,
    SIGIMPAMORT     VARCHAR(1)  -- SIGNO DEL IMPORTE DE CAPITAL AMORTIZADO,
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE DE CAPITAL AMORTIZADO,
    SIGIMPINTAMORT  VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERESES AMORTIZADO (+/-),
    IMPINTAMORT     DECIMAL(17, 2)  -- IMPORTE DE INTERESES AMORTIZADO,
    FECULTLIQ       UNKNOWN  -- FECHA DE ÚLTIMA LIQUIDACIÓN,
    FECALTA         UNKNOWN  -- FECHA DE ALTA
);

-- Tabla416
CREATE TABLE Tabla416 (
    FECBAJA         UNKNOWN  -- FECHA DE BAJA,
    MOTBAJA         VARCHAR(2)  -- MOTIVO DE BAJA DEL NÚMERO DE FINANCIACIÓN,
    DESMOT          VARCHAR(30)  -- DESCRIPCIÓN DEL MOTIVO DE BAJA: - AMORTIZACIÓN ANTICIPADA - MODIFICACIÓN DEL NÚMERO DE CUOTAS - CANCELACIÓN DE COMPRA EN CUOTAS - FUSIÓN DE N COMPRAS EN CUOTAS - CANCELADA POR CARTERA-VENCIDA - GENERADA INCIDENCIA – REFINANCIADA – ACELERADA – USO SOFTWARE REGIONAL. 10 – USO SOFTWARE REGIONAL. 11 – ANULACIÓN DE COMPRA EN CUOTAS. 12 - REVERSADA 20 A 30 - RESERVADO PARA USO DEL CLIENTE.,
    NUMULTCUO       INT  -- NÚMERO DE ÚLTIMA CUOTA,
    SIGINTCARPTE    VARCHAR(1)  -- SIGNO DE INTERESES DE CARENCIA PENDIENTES (+/-),
    INTCARPTE       DECIMAL(17, 2)  -- INTERESES DE CARENCIA PENDIENTES,
    FILLER          VARCHAR(486)
);

-- Tabla417
CREATE TABLE Tabla417 (
    REGISTRO_CU___INFORMACION_DE_LOS_DETALLES_DE_LA_CUOTA UNKNOWN  -- REGISTRO CU – INFORMACION DE LOS DETALLES DE LA CUOTA,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    FECPROCUO       UNKNOWN  -- FECHA DE COBRO DE LA CUOTA,
    SIGIMPCUOTA     VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA (+/-),
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPCAPITAL   VARCHAR(1)  -- SIGNO DEL IMPORTE CAPITAL (+/-),
    IMPCAPITAL      DECIMAL(17, 2)  -- IMPORTE CAPITAL,
    SIGIMPINTERESES VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERÉS (+/-),
    IMPINTERESES    DECIMAL(17, 2)  -- IMPORTE INTERÉS,
    SIGIMPIMPTO     VARCHAR(1)  -- SIGNO DEL IMPORTE DEL IMPUESTO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    ESTCUO          INT  -- ESTADO DE LA CUOTA,
    DESESTCUO       VARCHAR(30)  -- DESCRIPCIÓN DEL ESTADO DE LA CUOTA: – PENDIENTE – LIQUIDADA – CANCELADA – VENCIDA – ANTICIPADA,
    FECLIQ          UNKNOWN  -- FECHA LIQUIDACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE,
    FILLER          VARCHAR(593),
    REGISTRO_CE___INFORMACION_DE_LOS_CONCEPTOS_ECON_MICOS_ASOCIADOS_A_LA_COMPRA_EN_CUOTA UNKNOWN  -- REGISTRO CE – INFORMACION DE LOS CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTA,
    SIGNUMCUOTA     VARCHAR(1)  -- SIGNO DEL NÚMERO DE CUOTA,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA
);

-- Tabla418
CREATE TABLE Tabla418 (
    DESNUMCUOTA     VARCHAR(30)  -- DESCRIPCIÓN DEL NÚMERO DE CUOTA,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DEL CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE IMPORTE – COMISIONES – INTERESES – IMPUESTOS 08 - VALOR PARA USO FUTURO,
    SIGIMPAPLECO    VARCHAR(1)  -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-),
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO    VARCHAR(1)  -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO (+/-),
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPBONECO    VARCHAR(1)  -- SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-),
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGIMPIMPTO     VARCHAR(1)  -- SIGNO DEL IMPORTE DE IMPUESTO (+/-),
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FILLER          VARCHAR(558)
);

-- Tabla419: La Interfaz gestiona el envío de la información a un proceso genérico en un formato único. Se cargará un fichero secuencial con las operaciones extraídas de compras en cuotas en estado vigente y compras en cuotas que han sido canceladas o amortizadas en el proceso diario. El PAN irá ofuscado e irá relleno el nuevo campo TOKENNEGOCIO, formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
CREATE TABLE Tabla419 (
    DATOS_COMUNES   UNKNOWN  -- DATOS COMUNES,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    CLAMON          INT  -- CÓDIGO DE MONEDA
);

-- Tabla420: La Interfaz gestiona el envío de la información a un proceso genérico en un formato único. Se cargará un fichero secuencial con las operaciones extraídas de compras en cuotas en estado vigente y compras en cuotas que han sido canceladas o amortizadas en el proceso diario. El PAN irá ofuscado e irá relleno el nuevo campo TOKENNEGOCIO, formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
CREATE TABLE Tabla420 (
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA,
    NUMOPECUO       INT  -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN ACTUAL,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO: CC – COMPRA EN CUOTA FI – PLAN DE FINANCIACIÓN CU – DETALLE DE LA CUOTA CE – CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTAS,
    REGISTRO        VARCHAR(736),
    REGISTRO_CC___REGISTRO_DE_COMPRA_EN_CUOTAS UNKNOWN  -- REGISTRO CC – REGISTRO DE COMPRA EN CUOTAS,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    FECALTCOMP      UNKNOWN  -- FECHA DE ALTA DE LA COMPRA EN CUOTAS,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA: – NORMAL – CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    DESTIPFAC       VARCHAR(30)  -- DESCRIPCIÓN DEL TIPO DE FACTURA,
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA
);

-- Tabla421: La Interfaz gestiona el envío de la información a un proceso genérico en un formato único. Se cargará un fichero secuencial con las operaciones extraídas de compras en cuotas en estado vigente y compras en cuotas que han sido canceladas o amortizadas en el proceso diario. El PAN irá ofuscado e irá relleno el nuevo campo TOKENNEGOCIO, formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO
CREATE TABLE Tabla421 (
    PAN             VARCHAR(22)  -- PAN DE LA TARJETA QUE REALIZÓ LA OPERACIÓN. EL VALOR DE ESTE CAMPO DEBERÁ ALMACENARSE JUSTIFICADO A LA IZQUIERDA OFUSCADO,
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    DESCLAMONDIV    VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    SIGIMPDIV       VARCHAR(1)  -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL (+/-),
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGIMPFAC       VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA FACTURA (+/-),
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CMBAPLI         DECIMAL(9, 4)  -- FACTOR DE CAMBIO APLICADO (SÓLO TIENE SENTIDO PARA OPERACIONES EN EL EXTRANJERO),
    NUMAUT          VARCHAR(6)  -- NÚMERO DE AUTORIZACIÓN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE REDUCIDO DEL COMERCIO,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    DESACT          VARCHAR(30)  -- DESCRIPCIÓN DE LA ACTIVIDAD,
    SIGIMPLIQ       VARCHAR(1)  -- SIGNO DEL IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO (+/-),
    IMPLIQ          DECIMAL(17, 2)  -- IMPORTE DE LIQUIDACIÓN DE LA OPERACIÓN CON EL INTERCAMBIO
);

-- Tabla422
CREATE TABLE Tabla422 (
    CLAMONLIQ       INT  -- CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    DESCLAMONLIQ    VARCHAR(30)  -- DESCRIPCIÓN DEL CÓDIGO DE MONEDA DE LIQUIDACIÓN CON EL INTERCAMBIO,
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPAIS         VARCHAR(30)  -- NOMBRE DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN OPERACIÓN (VER ATORIGEN),
    DESORIGENOPE    VARCHAR(30)  -- DESCRIPCIÓN DEL ORIGEN DE LA OPERACIÓN,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    DESFRA          VARCHAR(30)  -- DESCRIPCIÓN DE LA FRANQUICIA,
    SECOPE          NUMERIC(12)  -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    NUMSECREC       NUMERIC(15)  -- NUMERO DE SECUENCIA EN EL MAESTRO DE RECIBOS (SÓLO PARA MOVIMIENTOS DE PAGO),
    SESIONRED       VARCHAR(12)  -- SESIÓN DE LA RED,
    SIAIDCD         VARCHAR(19)  -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    ESTCOMPRA       INT  -- ESTADO DE LA COMPRA
);

-- Tabla423
CREATE TABLE Tabla423 (
    DESESTCOMPRA    VARCHAR(30)  -- DESCRIPCIÓN DEL ESTADO DE LA COMPRA: - VIGENTE - CANCELADA - AMORTIZADA O FINALIZADA - FUSIÓN N COMPRAS - CANCELADA CARTERA-VENCIDA – INCIDENCIA EN ESTUDIO - REFINANCIADA – ACELERADA – CANCELADA CARTERA- CONGELADA – RETENIDA POR INCIDENCIA – INCIDENCIA ABONADA – REVERSADA – LIQUIDACIÓN DE COMPRA EN CUOTA VIGENTE – LIQUIDACIÓN DE COMPRA EN CUOTA EN ESTUDIO,
    FECLIQ          UNKNOWN  -- FECHA DE LIQUIDACIÓN A LA RED,
    SIGIMPCAP2      VARCHAR(1)  -- SIGNO DEL IMPORTE CAPITAL 2 (+/-),
    IMPCAP2         DECIMAL(17, 2)  -- IMPORTE CAPITAL 2,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    DESTIPOLIN      VARCHAR(30)  -- DESCRIPCIÓN DE LA LÍNEA,
    PORINTORIG      DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS ORIGINAL,
    PORBONORIG      DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS VIGENTE
);

-- Tabla424
CREATE TABLE Tabla424 (
    TOKENNEGOCIO    VARCHAR(37)  -- Formado por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO,
    FILLER          VARCHAR(41),
    REGISTRO_FI___INFORMACION_SOBRE_EL_PLAN_DE_FINANCIACION UNKNOWN  -- REGISTRO FI – INFORMACION SOBRE EL PLAN DE FINANCIACION,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE COMPRA EN CUOTAS,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    SIGIMPCUOTA     VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    NUMCUOPAG       INT  -- NÚMERO DE CUOTAS PAGADAS,
    NUMMESFIN       VARCHAR(12)  -- MESES DE FINANCIACIÓN,
    SIGIMPTOTAL     VARCHAR(1)  -- SIGNO DEL IMPORTE TOTAL A PAGAR (+/-),
    IMPTOTAL        DECIMAL(17, 2)  -- IMPORTE TOTAL A PAGAR,
    SIGIMPINTTOTAL  VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERESES TOTAL A PAGAR (+/-),
    IMPINTTOTAL     DECIMAL(17, 2)  -- IMPORTE DE INTERESES TOTAL A PAGAR,
    SIGIMPAMORT     VARCHAR(1)  -- SIGNO DEL IMPORTE DE CAPITAL AMORTIZADO,
    IMPAMORT        DECIMAL(17, 2)  -- IMPORTE DE CAPITAL AMORTIZADO,
    SIGIMPINTAMORT  VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERESES AMORTIZADO (+/-)
);

-- Tabla425
CREATE TABLE Tabla425 (
    IMPINTAMORT     DECIMAL(17, 2)  -- IMPORTE DE INTERESES AMORTIZADO,
    FECULTLIQ       UNKNOWN  -- FECHA DE ÚLTIMA LIQUIDACIÓN,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    FECBAJA         UNKNOWN  -- FECHA DE BAJA,
    MOTBAJA         VARCHAR(2)  -- MOTIVO DE BAJA DEL NÚMERO DE FINANCIACIÓN,
    DESMOT          VARCHAR(30)  -- DESCRIPCIÓN DEL MOTIVO DE BAJA: - AMORTIZACIÓN ANTICIPADA - MODIFICACIÓN DEL NÚMERO DE CUOTAS - CANCELACIÓN DE COMPRA EN CUOTAS - FUSIÓN DE N COMPRAS EN CUOTAS - CANCELADA POR CARTERA-VENCIDA - GENERADA INCIDENCIA – REFINANCIADA – ACELERADA – USO SOFTWARE REGIONAL. 10 – USO SOFTWARE REGIONAL. 11 – ANULACIÓN DE COMPRA EN CUOTAS. 12 - REVERSADA 20 A 30 - RESERVADO PARA USO DEL CLIENTE.,
    NUMULTCUO       INT  -- NÚMERO DE ÚLTIMA CUOTA
);

-- Tabla426
CREATE TABLE Tabla426 (
    SIGINTCARPTE    VARCHAR(1)  -- SIGNO DE INTERESES DE CARENCIA PENDIENTES (+/-),
    INTCARPTE       DECIMAL(17, 2)  -- INTERESES DE CARENCIA PENDIENTES,
    FILLER          VARCHAR(486),
    REGISTRO_CU___INFORMACION_DE_LOS_DETALLES_DE_LA_CUOTA UNKNOWN  -- REGISTRO CU – INFORMACION DE LOS DETALLES DE LA CUOTA,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    FECPROCUO       UNKNOWN  -- FECHA DE COBRO DE LA CUOTA,
    SIGIMPCUOTA     VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA (+/-),
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    SIGIMPCAPITAL   VARCHAR(1)  -- SIGNO DEL IMPORTE CAPITAL (+/-),
    IMPCAPITAL      DECIMAL(17, 2)  -- IMPORTE CAPITAL,
    SIGIMPINTERESES VARCHAR(1)  -- SIGNO DEL IMPORTE DE INTERÉS (+/-),
    IMPINTERESES    DECIMAL(17, 2)  -- IMPORTE INTERÉS,
    SIGIMPIMPTO     VARCHAR(1)  -- SIGNO DEL IMPORTE DEL IMPUESTO,
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DEL IMPUESTO,
    ESTCUO          INT  -- ESTADO DE LA CUOTA,
    DESESTCUO       VARCHAR(30)  -- DESCRIPCIÓN DEL ESTADO DE LA CUOTA: – PENDIENTE – LIQUIDADA – CANCELADA – VENCIDA – ANTICIPADA,
    FECLIQ          UNKNOWN  -- FECHA LIQUIDACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE,
    FILLER          VARCHAR(593)
);

-- Tabla427
CREATE TABLE Tabla427 (
    REGISTRO_CE___INFORMACION_DE_LOS_CONCEPTOS_ECON_MICOS_ASOCIADOS_A_LA_COMPRA_EN_CUOTA UNKNOWN  -- REGISTRO CE – INFORMACION DE LOS CONCEPTOS ECONÓMICOS ASOCIADOS A LA COMPRA EN CUOTA,
    SIGNUMCUOTA     VARCHAR(1)  -- SIGNO DEL NÚMERO DE CUOTA,
    NUMCUOTA        INT  -- NÚMERO DE CUOTA,
    DESNUMCUOTA     VARCHAR(30)  -- DESCRIPCIÓN DEL NÚMERO DE CUOTA,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DEL CONCEPTO ECONÓMICO,
    TIPIMP          INT  -- TIPO DE IMPORTE,
    DESIMP          VARCHAR(30)  -- DESCRIPCIÓN DE TIPO DE IMPORTE – COMISIONES – INTERESES – IMPUESTOS 08 - VALOR PARA USO FUTURO,
    SIGIMPAPLECO    VARCHAR(1)  -- SIGNO DEL IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO (+/-),
    IMPAPLECO       DECIMAL(17, 2)  -- IMPORTE SOBRE EL QUE SE APLICA EL CONCEPTO ECONÓMICO,
    SIGIMPBRUECO    VARCHAR(1)  -- SIGNO DEL IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO (+/-),
    IMPBRUECO       DECIMAL(17, 2)  -- IMPORTE BRUTO CALCULADO POR EL CONCEPTO ECONÓMICO,
    SIGIMPBONECO    VARCHAR(1)  -- SIGNO DEL IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO (+/-)
);

-- Tabla428
CREATE TABLE Tabla428 (
    IMPBONECO       DECIMAL(17, 2)  -- IMPORTE BONIFICADO SOBRE EL CÁLCULO DEL CONCEPTO ECONÓMICO,
    SIGIMPIMPTO     VARCHAR(1)  -- SIGNO DEL IMPORTE DE IMPUESTO (+/-),
    IMPIMPTO        DECIMAL(17, 2)  -- IMPORTE DE IMPUESTO,
    FILLER          VARCHAR(558)
);

-- ERROR: No se pudieron procesar las columnas de Tabla429

-- Tabla430: Programa ATB689: Baja de contratos por cartera vencida formando los registros de detalle Programa ATB488: Genera la cinta. El formato que corresponde al registro del fichero de salida sería (ATVENBAJ):
CREATE TABLE Tabla430 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE CONTRATO,
    MOTBAJA         VARCHAR(2)  -- MOTIVO DE BAJA,
    DESMOT          VARCHAR(30)  -- DESCRIPCIÓN DEL MOTIVO
);

-- Tabla431: En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. La estructura común inicial para todos los tipos de registros de cabecera y pie es ATINTCAB, para los registros de detalle ATINTDE1. A continuación, detallamos la estructura propia de la interfaz (ATTARPRO): Campos comunes a todos los registros:
CREATE TABLE Tabla431 (
    SUBPRODU        VARCHAR(4)  -- DESCRIPCIÓN DE SUBPRODUCTO,
    DESPROD         VARCHAR(29)  -- DESCRIPCIÓN DE PRODUCTO- SUBPRODUCTO,
    VERTIENTE       VARCHAR(1)  -- VERTIENTE DEL PRODUCTO. POSIBLES VALORES: E-EMISOR M-MERCHANT,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTROS: PR- PRODUCTOS EMISOR PM- PRODUCTOS MERCHANT CE- CONDICIÓN ECONÓMICA CG-PRODUCTO-CONDICIÓN ECONÓMICA-CONCEPTO ECONÓMICO CT-PRODUCTO–CONDICIÓN ECONÓMICA – TIPO DE TARJETA – CONCEPTO ECONÓMICO TR- TRAMOS DE APLICACIÓN DE CONCEPTOS ECONÓMICOS CC - CONDICIÓN ECONÓMICA – TIPO DE CUOTA – CONCEPTO ECONÓMICO TT- TRAMOS DE APLICACIÓN DE CONCEPTOS ECONÓMICOS POR TIPO DE COMPRA EN CUOTAS TM- TRAMOS DE APLICACIÓN DE CONCEPTOS ECONÓMICOS POR TIPO DE COMPRA EN CUOTAS POR COEFICIENTE DE CÁLCULO Y NÚMERO DE MESES GA- GRUPOS DE ABONO DE PRODUCTO MERCHANT PA- PERIODO POR GRUPOS DE ABONO DE PRODUCTO MERCHANT GA- GRUPOS DE ABONO DE PRODUCTO MERCHANT RF-REGIMEN FISCAL,
    NUMORDEN        NUMERIC(12)  -- SECUENCIAL DE PROCESO DE GENERACIÓN DE LA INTERFAZ
);

-- Tabla432: En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. La estructura común inicial para todos los tipos de registros de cabecera y pie es ATINTCAB, para los registros de detalle ATINTDE1. A continuación, detallamos la estructura propia de la interfaz (ATTARPRO): Campos comunes a todos los registros:
CREATE TABLE Tabla432 (
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    FECALTA         VARCHAR(10)  -- FECHA DE ALTA DEL PRODUCTO,
    INDRIESGO       VARCHAR(2)  -- INDICADOR DE RIESGO.,
    DESRIESGO       VARCHAR(30)  -- DESCRIPCIÓN DE INDRIESGO: ‘00’ DEBITO ‘01’ CREDITO CUENTA TARJETA ‘02 CREDITO Y OPERA. FINAN. ‘03 PREPAGO REGALO ‘05’ FINANCIACION AL CONSUMO ‘06’ PREPAGO,
    LIMCRECTAMIN    DECIMAL(17, 2)  -- LÍMITE MÍNIMO CRÉDITO CUENTA TARJETA,
    LIMCRECTAMAX    DECIMAL(17, 2)  -- LÍMITE MAXIMO CRÉDITO CUENTA TARJETA,
    LIMCRECOMPMIN   DECIMAL(17, 2)  -- LÍMITE MÍNIMO CRÉDITO PARA COMPRA EN CUOTAS,
    LIMCRECOMPMAX   DECIMAL(17, 2)  -- LÍMITE MÁXIMO CRÉDITO PARA COMPRA EN CUOTAS,
    INDGARAN        VARCHAR(1)  -- INDICADOR DE GARANTÍA (S/N),
    INDCTADOMCRE    VARCHAR(1)  -- INDICADOR DE CUENTA DE DOMICILIACIÓN OBLIGATORIA PARA CRÉDITO (S/N),
    CLASEG          VARCHAR(3)  -- CAMPO PARA USO FUTURO,
    TIPSEG          VARCHAR(3)  -- CAMPO PARA USO FUTURO,
    FECINI          UNKNOWN  -- FECHA DE INICIO,
    FECFIN          UNKNOWN  -- FECHA FIN DE PRODUCTO
);

-- Tabla433: La estructura común inicial para todos los tipos de registros de cabecera y pie es ATINTCAB, para los registros de detalle ATINTDE1. A continuación, detallamos la estructura propia de la interfaz (ATTARPRO): Campos comunes a todos los registros:
CREATE TABLE Tabla433 (
    INDCTATIP       VARCHAR(1)  -- INDICADOR DE ADMISIÓN DE UN SOLO TIPO DE TARJETA POR CUENTA (S/N),
    IMPEXCLIMTOL    DECIMAL(17, 2)  -- IMPORTE TOLERADO DE EXCESO DE LÍMITE,
    INDEXCLIM       VARCHAR(1)  -- INDICADOR DE SI EL EXCESO DE LÍMITE SE INCORPORA AL PAGO MÍNIMO.,
    DESINDEXCLIM    VARCHAR(30)  -- DESCRIPCIÓN DE INDEXCLIM S- EL EXCESO DE LIMITE DE INCORPORA AL PAGO MÍNIMO N- EL EXCESO DE LÍMITE NO SE INCORPORA EL PAGO MÍNIMO F- EL EXCESO DE LÍMITE SE INCORPORA AL PAGO MÍNIMO, Y TANTO EL EXCESO DE LÍMITE COMO EL IMPAGADO SE INCREMENTAN A LA CUOTA FIJA.,
    INDTRAFECCAD    VARCHAR(1)  -- INDICADOR DE NIVEL DE TRATAMIENTO DE LA FECHA DE CADUCIDAD.,
    DESINDTRAFECCA  VARCHAR(30)  -- DESCRIPCIÓN DE INDTRAFECCAD: C – CUENTA DE TARJETA T – TARJETA,
    APLICUOTA       VARCHAR(1)  -- APLICACIÓN DE LA CUOTA DE TARJETA.,
    DESAPLICUOTA    VARCHAR(30)  -- DESCRIPCIÓN DE APLICUOTA P – CUENTA DE PASIVO L – LIQUIDACIÓN DE EXTRACTO,
    TRASALACR       VARCHAR(1)  -- APLICACIÓN DE LA CUOTA DE TARJETA.,
    DESTRASALACR    VARCHAR(30)  -- DESCRIPCIÓN DE TRASALACR: P – CUENTA DE PASIVO L – LIQUIDACIÓN DE EXTRACTO,
    NUMDIADEVACR    INT  -- MÁXIMO NÚMERO DE DÍAS PARA RETENER SALDO ACREEDOR
);

-- Tabla434: A continuación, detallamos la estructura propia de la interfaz (ATTARPRO): Campos comunes a todos los registros:
CREATE TABLE Tabla434 (
    TRASALDIS       VARCHAR(1)  -- TRATAMIENTO SALDO DISPUESTO.,
    DESTRASALDIS    VARCHAR(30)  -- DESCRIPCIÓN DE TRASALDIS: C – SÓLO CAPITAL I – TODO (CAPITAL + CONCEPTOS ECONÓMICOS),
    INDCUOUSO       INT  -- INDICATIVO DE COBRO CUOTA DE EMISIÓN.,
    DESINDCUOUSO    VARCHAR(30)  -- DESCRIPCIÓN DE INDCUOUSO: 1 – ALTA DE TARJETA 2 – A LA PRIMERA OPERACIÓN 3 – ACUSE RECIBO DE TARJETA,
    NUMMESDEMORA    INT  -- NÚMERO DE MESES DE DEMORA EN EL COBRO DE CUOTA,
    INDPERCUO       VARCHAR(1)  -- INDICADOR DE ADMISIÓN DE PERIODIFICACIÓN DE CUOTA (S/N),
    NUMMESMAX       INT  -- NÚMERO MÁXIMO DE PLAZOS PARA DISTRIBUCIÓN DEL COBRO DE CUOTA (SÓLO SI EL CAMPO ANTERIOR ESTA ACTIVO),
    NUMDIARESOL     INT  -- NÚMERO DE DÍAS MÁXIMO PARA RESOLUCIÓN,
    INDLIMUNI       VARCHAR(1)  -- INDICADOR DE LÍMITE ÚNICO PARA DOS MONEDAS. SI EL INDICADOR DE MONEDA ÚNICA ES “S”, ESTE CAMPO DEBE TENER VALOR “N”,
    DESINDLIMUNI    VARCHAR(30)  -- DESCRIPCIÓN DE INDLIMUNI N-NO EXISTE UN ÚNICO LÍMITE PARA LAS DOS MONEDAS S-LIMITE ÚNICO PARA LAS DOS MONEDAS A NIVEL DE CONTRATO T-LÍMITE ÚNICO PARA LAS DOS MONEDAS A NIVEL DE CONTRATO, TARJETA Y LÍNEA.
);

-- Tabla435
CREATE TABLE Tabla435 (
    INDMONUNI       VARCHAR(1)  -- INDICADOR DE MONEDA ÚNICA POR CONTRATO (S/N). SI EL INDICADOR DE ADMISIÓN DE EXTRACTOS INDEXTMON INDICA UNA ÚNICA MONEDA (VALOR “N”), EL INDICADOR DE MONEDA ÚNICA SOLO PUEDE VALER “S”.,
    INDLIMITEU      VARCHAR(1)  -- INDICADOR DE LÍMITE ÚNICO LÍNEA REVOLVING Y COMPRA CUOTAS (S/N),
    PORIMPAGA       DECIMAL(7, 4)  -- PORCENTAJE DE TOLERANCIA PARA ENTRADA EN IMPAGO,
    IMPMINMOR       DECIMAL(17, 2)  -- IMPORTE MÍNIMO PARA ENTRADA EN IMPAGO,
    IMPMINMIN       DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO MÍNIMO,
    PORTOLTOT       DECIMAL(7, 4)  -- PORCENTAJE DE TOLERANCIA PARA CUBRIR PAGO TOTAL POR TIPO DE LÍNEA Y NO APLICAR SALDO APLAZADO,
    IMPTOLTOT       DECIMAL(17, 2)  -- IMPORTE MÁXIMO DE TOLERANCIA PARA CUBRIR PAGO POR TIPO DE LÍNEA Y NO APLICAR SALDO APLAZADO,
    IMPMAILING      DECIMAL(17, 2)  -- IMPORTE PARA GENERAR MAILING,
    NUMMESCAMGLIQ   INT  -- NÚMERO MÍNIMO DE MESES QUE DEBEN TRANSCURRIR ENTRE DOS CAMBIOS DE GRUPO DE LIQUIDACIÓN,
    INDCTADOM       VARCHAR(1)  -- INDICADOR DE ADMISIÓN DE CUENTA DE DOMICILIACIÓN AJENA,
    IMPMINSALACRTR  DECIMAL(17, 2)  -- IMPORTE MÍNIMO POR OPERACIÓN DE SALDO ACREEDOR PARA TRASPASAR
);

-- Tabla436
CREATE TABLE Tabla436 (
    IMPMAXSALACRTR  DECIMAL(17, 2)  -- IMPORTE MÁXIMO POR OPERACIÓN SALDO ACREEDOR PARA TRASPASAR,
    NDIAPENDEVO     INT  -- RESERVADO PARA USO FUTURO.,
    GRUPOLIQ        INT  -- GRUPO DE LIQUIDACIÓN POR DEFECTO PARA EL PRODUCTO,
    DESGRUPOLIQ     VARCHAR(30)  -- DESCRIPCIÓN DE GRUPOLIQ,
    FORPAGO         INT  -- FORMA DE PAGO POR DEFECTO PARA EL PRODUCTO,
    DESFORPAGO      VARCHAR(30)  -- DESCRIPCIÓN DE LA FORMA DE PAGO 00 – PAGO DÉBITO CONTADO 01 – PAGO TOTAL 02 – PAGO FIJO 03 – PAGO APLAZADO 04 – PAGO FIJO CON OP. FINANCIADAS,
    PORLIMAUTCRE    DECIMAL(7, 4)  -- % AMPLIACIÓN DE DISPONIBLE PARA AUTORIZACIÓN DE OPERACIONES,
    NUMMESCOBCUO    INT  -- NÚMERO DE MESES PARA LA GENERACIÓN DE LA CUOTA DE ADMINISTRACIÓN.,
    DESPRODRED      VARCHAR(10)  -- DESCRIPCIÓN REDUCIDA DEL PRODUCTO
);

-- Tabla437
CREATE TABLE Tabla437 (
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE - E – EMISOR,
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE LA CONDICIÓN ECONÓMICA,
    FECINI          UNKNOWN  -- FECHA DE INICIO DE LA CONDICIÓN ECONÓMICA,
    FECFIN          UNKNOWN  -- FECHA DE FIN DE LA CONDICIÓN ECONÓMICA
);

-- Tabla438
CREATE TABLE Tabla438 (
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE - E – EMISOR,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONECO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    IMPFIJO         DECIMAL(17, 2)  -- IMPORTE FIJO
);

-- Tabla439
CREATE TABLE Tabla439 (
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    IMPMAX          DECIMAL(17, 2)  -- IMPORTE MÁXIMO,
    PORUF           DECIMAL(7, 4)  -- PORCENTAJE DE APLICACIÓN DE UNIDAD FICTICIA SOBRE EL IMPORTE CALCULADO DE LA APLICACIÓN DEL CONCEPTO ECONÓMICO, SE TRATA DE UN IMPORTE FIJO DEFINIDO COMO UN PORCENTAJE, SE DEBE DIVIDIR POR 100 PARA OBTENER EL VALOR REAL. SOLAMENTE APLICA A COMISIONES.,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    SIGN_REDONDEO   VARCHAR(1)  -- SIGNO DEL REDONDEO (+/-),
    REDONDEO        INT  -- REDONDEO A APLICAR AL IMPORTE RESULTANTE DE APLICAR EL CONCEPTO ECONÓMICO.,
    DESREDONDEO     VARCHAR(30)  -- DESCRIPCIÓN DE REDONDEO: -2 – CENTÉSIMA -1 – DÉCIMA 0 – UNIDAD 1 – DECENA 2 – CENTENA,
    INDPORTRAMO     VARCHAR(1)  -- INDICADOR DE FORMA DE UTILIZACIÓN DEL CAMPO PORTRAMO DE LA TABLA DE TRAMOS.,
    DESINDPORTRAMO  VARCHAR(30)  -- DESCRIPCIÓN DE INDPORTRAMO: P – PORCENTAJE D – DIVISOR F – FIJO (SOLAMENTE PAGO APLAZADO),
    PORREF          DECIMAL(7, 4)  -- PORCENTAJE O DIVISOR DE REFERENCIA PARA CAMBIOS MASIVOS EN TODOS LOS TRAMOS DONDE APAREZCA ESTE CONCEPTO ECONÓMICO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL IMPORTE (+/-)
);

-- Tabla440
CREATE TABLE Tabla440 (
    INDBONOPE       VARCHAR(1)  -- INDICADOR DE BONIFICACIÓN POR NÚMERO DE OPERACIONES (S/N),
    INDAPLICA       VARCHAR(1)  -- INDICADOR DE APLICACIÓN DEL CONCEPTO ECONÓMICO:,
    DESINDAPLICA    VARCHAR(30)  -- DESCRIPCIÓN DE INDAPLICA H – HORIZONTAL (SÓLO EL TRAMO) V – VERTICAL (TODOS LOS TRAMOS) N – SIN TRAMOS,
    CODIMPTO        INT  -- TIPO DE IMPUESTO APLICADO,
    DESIMPTO        VARCHAR(30)  -- DESCRIPCIÓN DE CODIMPTO,
    NIVAPLICA       VARCHAR(2)  -- NIVEL DE APLICACIÓN:,
    DESNIVAPLICA    VARCHAR(30)  -- DESCRIPCIÓN DE NIVAPLICA: CO – CONTRATO TA – TARJETA,
    PROCESO         VARCHAR(10)  -- RESERVADO PARA USO FUTURO.,
    IDEIMPAPL       VARCHAR(10)  -- RESERVADO PARA USO FUTURO.,
    FECALTACE       UNKNOWN  -- FECHA DE ALTA CONCEPTO ECONOMICO,
    FECINICE        UNKNOWN  -- FECHA DE INICIO CONCEPTO ECONOMICO,
    FECFINCE        UNKNOWN  -- FECHA DE FIN CONCEPTO ECONOMICO,
    INDCONFIN       VARCHAR(1)  -- INDICADOR DE CONCEPTO FINANCIABLE (S/N),
    INDAPLACR       VARCHAR(1)  -- INDICA SI SE SIGUEN APLICANDO LOS CONCEPTOS CON SALDO ACREEDOR (S/N). (ÚNICAMENTE PARA OPERACIONES REVOLVING).,
    INDAPLIMP       VARCHAR(1)  -- INDICA SI EL CONCEPTO TIENE IMPUESTOS ASOCIADOS,
    TIPCONECO       VARCHAR(1)  -- TIPO DE CONCEPTO ECONÓMICO.
);

-- Tabla441
CREATE TABLE Tabla441 (
    DESTIPCONECO    VARCHAR(30)  -- DESCRIPCIÓN DE TIPCONECO: C – COMISIÓN I – INTERÉS Y- INTERESES SOBRE COMISIONES,
    CODCONCEP       VARCHAR(4)  -- CÓDIGO DE CONCEPTO INTERÉS ASOCIADO AL CONCEPTO DE COMISIÓN,
    DESCONCEP       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONCEP
);

-- Tabla442
CREATE TABLE Tabla442 (
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    CODMAR          INT  -- CÓDIGO DE MARCA DE TARJETA,
    DESMAR          VARCHAR(30)  -- DESCRIPCIÓN DE CODMAR,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT         VARCHAR(30)  -- DESCRIPCIÓN DE INDTIPT,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONECO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    IMPFIJO         DECIMAL(17, 2)  -- IMPORTE FIJO
);

-- Tabla443
CREATE TABLE Tabla443 (
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    IMPMAX          DECIMAL(17, 2)  -- IMPORTE MÁXIMO,
    FECALTA         UNKNOWN  -- FECHA DE ALTA,
    PORUF           DECIMAL(7, 4)  -- PORCENTAJE DE APLICACIÓN DE UNIDAD FICTICIA SOBRE EL IMPORTE CALCULADO DE LA APLICACIÓN DEL CONCEPTO ECONÓMICO, SE TRATA DE UN IMPORTE FIJO DEFINIDO COMO UN PORCENTAJE, SE DEBE DIVIDIR POR 100 PARA OBTENER EL VALOR REAL. SOLAMENTE APLICA A COMISIONES.,
    SIGN_REDONDEO   VARCHAR(1)  -- SIGNO DEL REDONDEO (+/-),
    REDONDEO        INT  -- REDONDEO A APLICAR AL IMPORTE RESULTANTE DE APLICAR EL CONCEPTO ECONÓMICO.,
    DESREDONDEO     VARCHAR(30)  -- DESCRIPCIÓN DE REDONDEO: -2 – CENTÉSIMA -1 – DÉCIMA 0 – UNIDAD 1 – DECENA 2 – CENTENA,
    INDPORTRAMO     VARCHAR(1)  -- INDICADOR DE FORMA DE UTILIZACIÓN DEL CAMPO PORTRAMO DE LA TABLA DE TRAMOS.,
    DESINDPORTRAMO  VARCHAR(30)  -- DESCRIPCIÓN DE INDPORTRAMO: P – PORCENTAJE D – DIVISOR F – FIJO (SOLAMENTE PAGO APLAZADO),
    PORREF          DECIMAL(7, 4)  -- PORCENTAJE O DIVISOR DE REFERENCIA PARA CAMBIOS MASIVOS EN TODOS LOS TRAMOS DONDE APAREZCA ESTE CONCEPTO ECONÓMICO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL IMPORTE (+/-)
);

-- Tabla444
CREATE TABLE Tabla444 (
    INDBONOPE       VARCHAR(1)  -- INDICADOR DE BONIFICACIÓN POR NÚMERO DE OPERACIONES (S/N),
    INDAPLICA       VARCHAR(1)  -- INDICADOR DE APLICACIÓN DEL CONCEPTO ECONÓMICO.,
    DESINDAPLICA    VARCHAR(30)  -- DESCRIPCIÓN DE INDAPLICA: H – HORIZONTAL (SÓLO EL TRAMO) V – VERTICAL (TODOS LOS TRAMOS) N – SIN TRAMOS,
    CODIMPTO        INT  -- TIPO DE IMPUESTO APLICADO,
    DESIMPTO        VARCHAR(30)  -- DESCRIPCIÓN DE CODIMPTO,
    NIVAPLICA       VARCHAR(2)  -- NIVEL DE APLICACIÓN.,
    DESNIVAPLICA    VARCHAR(30)  -- DESCRIPCIÓN DE NIVAPLICA CO – CONTRATO TA – TARJETA,
    PROCESO         VARCHAR(10)  -- RESERVADO PARA USO FUTURO.,
    IDEIMPAPL       VARCHAR(10)  -- RESERVADO PARA USO FUTURO.,
    FECALTACE       UNKNOWN  -- FECHA DE ALTA CONCEPTO ECONOMICO,
    FECINICE        UNKNOWN  -- FECHA DE INICIO CONCEPTO ECONOMICO,
    FECFINCE        UNKNOWN  -- FECHA DE FIN CONCEPTO ECONOMICO,
    INDCONFIN       VARCHAR(1)  -- INDICADOR DE CONCEPTO FINANCIABLE (S/N),
    INDAPLACR       VARCHAR(1)  -- INDICA SI SE SIGUEN APLICANDO LOS CONCEPTOS CON SALDO ACREEDOR (S/N). (ÚNICAMENTE PARA OPERACIONES REVOLVING).,
    INDAPLIMP       VARCHAR(1)  -- INDICA SI EL CONCEPTO TIENE IMPUESTOS ASOCIADOS,
    TIPCONECO       VARCHAR(1)  -- TIPO DE CONCEPTO ECONÓMICO.
);

-- Tabla445
CREATE TABLE Tabla445 (
    DESTIPCONECO    VARCHAR(30)  -- DESCRIPCIÓN DE TIPCONECO: C – COMISIÓN I – INTERÉS Y- INTERESES SOBRE COMISIONES,
    CODCONCEP       VARCHAR(4)  -- CÓDIGO DE CONCEPTO INTERÉS ASOCIADO AL CONCEPTO DE COMISIÓN,
    DESCONCEP       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONCEP
);

-- Tabla446
CREATE TABLE Tabla446 (
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CODMAR          INT  -- CÓDIGO DE MARCA DE TARJETA,
    DESMAR          VARCHAR(30)  -- DESCRIPCIÓN DE CODMAR,
    INDTIPT         INT  -- INDICADOR DE TIPO DE TARJETA,
    DESTIPT         VARCHAR(30)  -- DESCRIPCIÓN DE INDTIPT,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONECO,
    TIPOACCESO      VARCHAR(1)  -- TIPO DE ACCESO.,
    DESACCESO       VARCHAR(30)  -- DESCRIPCIÓN DE TIPOACCESO: I – IMPORTE M – MESES E IMPORTE,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE LA MONEDA
);

-- Tabla447
CREATE TABLE Tabla447 (
    TRAMOFIN        DECIMAL(17, 2)  -- VALOR FINAL DE APLICACIÓN DEL CONCEPTO ECONÓMICO,
    PORTRAMO        DECIMAL(13, 4)  -- PORCENTAJE, DIVISOR O FIJO A APLICAR AL IMPORTE PARA EL TRAMO
);

-- Tabla448
CREATE TABLE Tabla448 (
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(30)  -- DESCRIPCIÓN DE CODTIPC,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONECO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE: E – EMISOR,
    IMPFIJO         DECIMAL(17, 2)  -- IMPORTE FIJO,
    IMPMIN          DECIMAL(17, 2)  -- IMPORTE MÍNIMO,
    IMPMAX          DECIMAL(17, 2)  -- IMPORTE MÁXIMO,
    FECALTA         UNKNOWN  -- FECHA DE ALTA
);

-- Tabla449
CREATE TABLE Tabla449 (
    PORUF           DECIMAL(7, 4)  -- PORCENTAJE DE APLICACIÓN DE UNIDAD FICTICIA SOBRE EL IMPORTE CALCULADO DE LA APLICACIÓN DEL CONCEPTO ECONÓMICO, SE TRATA DE UN IMPORTE FIJO DEFINIDO COMO UN PORCENTAJE, SE DEBE DIVIDIR POR 100 PARA OBTENER EL VALOR REAL. SOLAMENTE APLICA A COMISIONES.,
    SIGN_REDONDEO   VARCHAR(1)  -- SIGNO DEL CAMPO REDONDEO(+/-),
    REDONDEO        INT  -- REDONDEO A APLICAR AL IMPORTE RESULTANTE DE APLICAR EL CONCEPTO ECONÓMICO.,
    DESREDONDEO     VARCHAR(30)  -- DESCRIPCIÓN DE REDONDEO -2 – CENTÉSIMA -1 – DÉCIMA 0 – UNIDAD 1 – DECENA 2 – CENTENA,
    TIPOACCESO      VARCHAR(1)  -- TIPO DE ACCESO,
    DESACCESO       VARCHAR(30)  -- DESCRIPCIÓN DE TIPOACCESO: I – IMPORTE M – MESES E IMPORTE,
    INDCAPINTC      VARCHAR(1)  -- INDICADOR DE CAPITALIZACIÓN DE CONCEPTO.,
    DESCAPINTC      VARCHAR(30)  -- DESCRIPCIÓN DE INDCAPINTC: – CARGAR EN EL ALTA DE LA COMPRA EN CUOTAS. – PRORRATEAR. – CARGAR CON LA PRIMERA CUOTA – FINANCIAR.,
    INDPORTRAMO     VARCHAR(1)  -- INDICADOR DE FORMA DE UTILIZACIÓN DEL CAMPO PORTRAMO DE LA TABLA DE TRAMOS.,
    DESINDPORTRAMO  VARCHAR(30)  -- DESCRIPCIÓN DE INDPORTRAMO: P – PORCENTAJE D – DIVISOR F–FIJO (SOLAMENTE PAGO APLAZADO)
);

-- Tabla450
CREATE TABLE Tabla450 (
    PORREF          DECIMAL(7, 4)  -- PORCENTAJE O DIVISOR DE REFERENCIA PARA CAMBIOS MASIVOS EN TODOS LOS TRAMOS DONDE APAREZCA ESTE CONCEPTO ECONÓMICO,
    SIGNO           VARCHAR(1)  -- SIGNO DEL IMPORTE (+/-),
    INDBONOPE       VARCHAR(1)  -- INDICADOR DE BONIFICACIÓN POR NÚMERO DE OPERACIONES (S/N),
    INDAPLICA       VARCHAR(1)  -- INDICADOR DE APLICACIÓN DEL CONCEPTO ECONÓMICO.,
    DESINDAPLICA    VARCHAR(30)  -- DESCRIPCIÓN DE INDAPLICA H – HORIZONTAL (SÓLO EL TRAMO) V – VERTICAL (TODOS LOS TRAMOS) N – SIN TRAMOS,
    CODIMPTO        INT  -- TIPO DE IMPUESTO APLICADO,
    DESIMPTO        VARCHAR(30)  -- DESCRIPCIÓN DE CODIMPTO,
    NIVAPLICA       VARCHAR(2)  -- NIVEL DE APLICACIÓN.,
    DESNIVAPLICA    VARCHAR(30)  -- DESCRIPCIÓN DE NIVAPLICA CO – CONTRATO TA – TARJETA,
    PROCESO         VARCHAR(10)  -- RESERVADO PARA USO FUTURO.,
    IDEIMPAPL       VARCHAR(10)  -- RESERVADO PARA USO FUTURO.,
    FECALTACE       UNKNOWN  -- FECHA DE ALTA CONCEPTO ECONOMICO,
    FECINICE        UNKNOWN  -- FECHA DE INICIO CONCEPTO ECONOMICO,
    FECFINCE        UNKNOWN  -- FECHA DE FIN CONCEPTO ECONOMICO,
    INDCONFIN       VARCHAR(1)  -- INDICADOR DE CONCEPTO FINANCIABLE (S/N),
    INDAPLACR       VARCHAR(1)  -- INDICA SI SE SIGUEN APLICANDO LOS CONCEPTOS CON SALDO ACREEDOR (S/N). (ÚNICAMENTE PARA OPERACIONES REVOLVING).
);

-- Tabla451
CREATE TABLE Tabla451 (
    INDAPLIMP       VARCHAR(1)  -- INDICA SI EL CONCEPTO TIENE IMPUESTOS ASOCIADOS,
    TIPCONECO       VARCHAR(1)  -- TIPO DE CONCEPTO ECONÓMICO.,
    DESTIPCONECO    VARCHAR(30)  -- DESCRIPCIÓN DE TIPCONECO: C – COMISIÓN I – INTERÉS Y- INTERESES SOBRE COMISIONES,
    CODCONCEP       VARCHAR(4)  -- CÓDIGO DE CONCEPTO INTERÉS ASOCIADO AL CONCEPTO DE COMISIÓN,
    DESCONCEP       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONCEP
);

-- Tabla452
CREATE TABLE Tabla452 (
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    TRAMOFIN        DECIMAL(17, 2)  -- VALOR FINAL DEL TRAMO DE APLICACIÓN DEL CONCEPTO ECONÓMICO,
    PORTRAMO        DECIMAL(7, 4)  -- PORCENTAJE/DIVISOR A APLICAR AL IMPORTE DEL TRAMO
);

-- Tabla453
CREATE TABLE Tabla453 (
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    DESTIPC         VARCHAR(30)  -- DESCRIPCIÓN DE CODTIPC,
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE: E – EMISOR,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONECO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    COECALIMP       INT  -- COEFICIENTE DE CÁLCULO POR IMPORTE,
    TRAMOFIN        DECIMAL(17, 2)  -- VALOR FINAL DEL TRAMO DE APLICACIÓN DEL CONCEPTO ECONÓMICO,
    PORTRAMO        DECIMAL(7, 4)  -- PORCENTAJE O DIVISOR A APLICAR AL IMPORTE DEL TRAMO
);

-- Tabla454
CREATE TABLE Tabla454 (
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE,
    DESVERTIENTE    VARCHAR(30)  -- DESCRIPCIÓN DE VERTIENTE: - E – EMISOR,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    INDREMUNIC      VARCHAR(1)  -- Indicador de remesado factura a factura. Posibles valores S/N,
    IDCRIREM        VARCHAR(8)  -- Id criterio de remesado (este criterio marca la estructura de VALTIREM),
    INDFORZAR       VARCHAR(1)  -- Campo reservado para uso futuro.,
    DESINDFORZAR    VARCHAR(30)  -- DESCRIPCION DE INDFORZAR,
    TIPENVPASCOM    VARCHAR(2)  -- Indicador de envío a pasivo comercios: ND – Nominal y descuento NE – Neto NI - Nominal y descuentos independientes,
    DESTIPENVPASCOM VARCHAR(30),
    FECALTA         UNKNOWN  -- Fecha de alta,
    FECINI          UNKNOWN  -- Fecha de inicio para asignar producto,
    FECFIN          UNKNOWN  -- Fecha de fin para asignar producto,
    INDPROACT       VARCHAR(1)  -- Indicador de restricción de productos a códigos de actividad: I – Por inclusión: solo se permite asociar comercios que pertenezcan a sectores de actividad parametrizados en la tabla Producto Merchant por Actividad E – Por exclusión: no se permite asociar comercios que pertenezcan a sectores de actividad parametrizados en la tabla Producto Merchant por Actividad T – Todas: No se restringe.,
    DESINDPROACT    VARCHAR(30)  -- DESCRIPCION DE INDPROACT
);

-- Tabla455
CREATE TABLE Tabla455 (
    INDCTADOMCOM    VARCHAR(1)  -- Indicador de cuenta de domiciliación obligatoria para comercios,
    INDCTAAJECOM    VARCHAR(1)  -- Indicador de cuenta de domiciliación ajena permitida para comercios,
    INDRETDESC      VARCHAR(1)  -- Indicador de retención de descuento “S” = el abono se realiza con anterioridad a la aplicación del descuento. “N” = el abono y el descuento se aplican el mismo día.,
    LIMCONSUL       DECIMAL(17, 2)  -- Límite de consulta para remesas automáticas,
    LIMCONSULM      DECIMAL(17, 2)  -- Límite de consulta para remesas manuales (origen bacaladeras…),
    NUMDIALIQ       INT  -- Días de carencia de liquidación a partir de fecha de remesa.,
    DIAFIJSEM       VARCHAR(1)  -- Día fijo de la semana para abonar/cargar la remesa,
    DIAFIJMES       INT  -- Día fijo del mes para abonar/cargar la remesa,
    DIAFIJQUINC     INT  -- Día fijo de la quincena para abonar/cargar la remesa,
    TIPCOMER        INT  -- Tipo de comercio – NO APLICA – COMERCIO FISICO – COMERCIO VIRTUAL – FINANCIERA,
    DESTIPCOMER     VARCHAR(30)  -- DESCRIPCION TIPCOMER,
    INDTIPLIQ       VARCHAR(1)  -- Indicador de tipo de liquidación B – Batch O - Online,
    DESINDTIPLIQ    VARCHAR(30)  -- DESCRIPCIÓN DE INDTIPLIQ
);

-- Tabla456
CREATE TABLE Tabla456 (
    GRFECABO        INT  -- Grupo fecha abono,
    TIPOCALEND      VARCHAR(1)  -- Tipo de calendario: S: Estándar P: Promoción,
    DESTIPOCALEN    VARCHAR(30)  -- Descripción Tipo de Calendario,
    CALFABONO       VARCHAR(1)  -- Periodicidad de pago: D: Pago N días S: Pago día semana M: Pago día mes (n periodos) F: Fecha fija promoción,
    DESCALFABONO    VARCHAR(30)  -- Descripción Periodicidad del pago,
    TOTPERIO        INT  -- Número total de periodos,
    NUMABONOS       INT  -- Numero de plazos de abono de la operación,
    FECINI          UNKNOWN  -- Fecha inicio promoción,
    FECFIN          UNKNOWN  -- Fecha fin promoción,
    FECHAFIJA       UNKNOWN  -- Fecha de la promoción,
    FECEMISOR       UNKNOWN  -- Fecha de cargo de la primera cuota al emisor,
    TIPFECHA        VARCHAR(1)  -- Indicador de fecha de cálculo para la promoción: O: Fecha Operación P: Fecha de proceso,
    FILLER          VARCHAR(768)  -- Relleno
);

-- Tabla457
CREATE TABLE Tabla457 (
    GRFECABO        INT  -- Grupo fecha abono,
    NUMPERIO        INT  -- Número de periodo,
    CARLIQ          INT  -- Carencia del abono a partir de fecha de remesa, con la misma periodicidad del calendario: días, semanas y meses,
    DIAFIJSEM       VARCHAR(1)  -- Día fijo de la semana para abonar/cargar la remesa,
    DIAINISEM       VARCHAR(1)  -- Día de inicio de cálculo de la semana para el periodo,
    DIAFINSEM       VARCHAR(1)  -- Día de fin de cálculo de la semana para el periodo
);

-- Tabla458
CREATE TABLE Tabla458 (
    DIAFIJMES       INT  -- Día fijo del mes para abonar/cargar la remesa,
    DIADESMES       INT  -- Día desde del mes para el periodo,
    DIAHASMES       INT  -- Día hasta del mes para el periodo,
    FILLER          VARCHAR(863)  -- Relleno
);

-- Tabla459
CREATE TABLE Tabla459 (
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    DESCON          VARCHAR(50)  -- DESCRIPCIÓN DE LA CONDICIÓN ECONÓMICA,
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE.,
    DESVERTIENTE    VARCHAR(30)  -- ESCRIPCIÓN DE VERTIENTE E – EMISOR,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    DESCONECO       VARCHAR(30)  -- DESCRIPCIÓN DE CODCONECO,
    CLAMON          INT  -- CLAVE DE MONEDA,
    DESCLAMON       VARCHAR(30)  -- DESCRIPCIÓN DE CLAMON,
    CODREGIMEN      INT  -- Código de régimen fiscal,
    DESREGIMEN      VARCHAR(30)  -- Descripción del régimen fiscal,
    CODIMPTO        INT  -- Código del tipo de impuesto,
    DESIMPTO        VARCHAR(30)  -- Descripción del tipo de impuesto,
    PORIMPGRAV      DECIMAL(7, 4)  -- Porcentaje de importe gravable por el impuesto,
    PORIMPTO        DECIMAL(7, 4)  -- Porcentaje de aplicación del impuesto,
    SIGN_REDONDEO   VARCHAR(1)  -- SIGNO DEL REDONDEO (+/-),
    REDONDEO        INT  -- Redondeo a aplicar al importe resultante de aplicar el impuesto: -9 – redondeo externo -2 – centésima -1 – décima 0 – unidad 1 – decena 2 – centena,
    FILLER          VARCHAR(763)  -- Relleno
);

-- Tabla460: Programa ATBT47: Formatea los registros de detalle. Programa ATBT48: Validación registros bloqueos y desbloqueos del mismo cliente en fichero. Programa ATBT49: Genera la cinta. El formato que corresponde al registro del fichero de salida sería ATBLQDBQ.
CREATE TABLE Tabla460 (
    TIPOREGI        VARCHAR(1)  -- Identifica el tipo de registro para que sea tratado por los procesos. En este caso llevará el valor fijo D. (C=Cabecera y D=Detalle),
    CODENTID        VARCHAR(8)  -- Código de Entidad.,
    CODCINTA        VARCHAR(2)  -- Código de Cinta. Código reservado que identifica la cinta relacionada con el proceso que la trata o genera. En este caso llevará el valor fijo ‘60’,
    NUMSECUE        INT  -- Número de secuencia de cinta.,
    CODPROGR        VARCHAR(8)  -- Código del programa.,
    CODCUENT        VARCHAR(20)  -- Código de la Cuenta a bloquear/desbloquear.,
    TIPOOPER        VARCHAR(1)  -- Indica si se trata de una operación de bloqueo o de desbloqueo. Los posibles valores son B/D.,
    INDBLQAC        VARCHAR(1)  -- Indica si se trata de un bloqueo de acumulación. (S/N),
    INDLIBER        VARCHAR(1)  -- Sólo aplica si para TIPOOPER=D y INDBLQAC= S. 1, Liberar los posibles puntos que se encuentran retenidos para bloqueo de acumulación.,
    INDBLQRD        VARCHAR(1)  -- Indica si se trata de un bloqueo de redención. (S/N),
    TXTBLQACUM      VARCHAR(120)  -- SI INDBLQAC = N, irá a espacios. SI INDBLQAC = S, (bloqueo de acumulación) permite indicar el texto asociado a dicho bloqueo.,
    TXTBLQCJE       VARCHAR(120)  -- SI INDBLQRD = N, irá a espacios. SI INDBLQRD = S, (bloqueo de redención)
);

-- Tabla461: Programa ATBT47: Formatea los registros de detalle. Programa ATBT48: Validación registros bloqueos y desbloqueos del mismo cliente en fichero. Programa ATBT49: Genera la cinta. El formato que corresponde al registro del fichero de salida sería ATBLQDBQ.
CREATE TABLE Tabla461 (
    MODALIDAD       VARCHAR(1)  -- Indica el tipo de tratamiento a realizar. ‘2’-. Identificador de cliente y tipo de cliente,
    TIPIDCLI        VARCHAR(2)  -- Tipo de identificador de cliente. Informado solo si informado en la entrada.,
    IDCLIENT        VARCHAR(20)  -- Identificador de cliente. Informado solo si informado en la entrada.
);

-- ERROR: No se pudieron procesar las columnas de Tabla462

-- Tabla463: Se consideran cumplimentados como se describe en Consideraciones Generales de Interfaces Batch. Un servicio será activado si los campos que se consideran como obligatorios han sido cumplimentados. La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla463 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA DEL CONTRATO,
    CUENTA          VARCHAR(12)  -- CUENTA DE MEDIOS DE PAGO,
    CODCOM          VARCHAR(15)  -- CODIGO DE COMERCIO
);

-- Tabla464: La Interfaz consta de dos grupos de campos: generales y opcionales, a continuación, se describen los
CREATE TABLE Tabla464 (
    OFIGESTORA      VARCHAR(4)  -- CODIGO DE OFICINA GESTORA,
    FILLER          VARCHAR(529)  -- ESPACIO RESERVADO PARA USO FUTURO
);

-- Tabla465: En el caso de no estar informados el centro de Alta y el Contrato de Comercios y si venir el código de Comercio, se realizará un acceso a la tabla de Comercios por este último campo. Una vez obtenido el registro se accederá a la tabla de cuenta de tarjeta de la misma forma que se ha indicado anteriormente. En caso de no encontrar ningún registro se devolverá un error y se continuará con el siguiente registro del fichero de entrada.
CREATE TABLE Tabla465 (
    OFIGESTORA      VARCHAR(4)  -- OFICINA GESTORA
);

-- Tabla466
CREATE TABLE Tabla466 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- Código de la cuenta.,
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO,
    IDENTCLI        INT  -- Codigo identificador de cliente,
    FECEST          INT  -- FECHA DE ESTADO,
    ESTPER          VARCHAR(1)  -- SITUACIÓN DEL CIENTE,
    SECTOR          VARCHAR(3)  -- SECTOR ECONÓMICO DE LA PERSONA,
    CNAE            VARCHAR(6)  -- CÓDIGO CNAE,
    NOPRSNA         VARCHAR(30)  -- NOMBRE DEL CLIENTE,
    NOPRLARG        VARCHAR(63)  -- NOMBRE LARGO DEL CLIENTE,
    NOMBRE          VARCHAR(30)  -- NOMBRE DEL CLIENTE,
    APELLIDO1       VARCHAR(30)  -- PRIMER APELLIDO,
    APELLIDO2       VARCHAR(30)  -- SEGUNDO APELLIDO,
    CTIPPERS        VARCHAR(1)  -- TIPO DE PERSONA,
    FORJUR          VARCHAR(3)  -- FORMA JURÍDICA,
    CTIDOCID        VARCHAR(2)  -- TIPO DE DOCUMENTO IDENTIFICATIVO,
    NUDOCIDE        VARCHAR(12)  -- NÚMERO DE DOCUMENTO IDENTIFICATIVO,
    TPRETLFI        VARCHAR(4)  -- PREFIJO TELEFÓNICO,
    NUTLFNO         INT  -- NÚMERO DE TELÉFONO,
    TELEMOVIL       INT  -- TLÉFONO MÓVIL,
    CIDIOMA         VARCHAR(2)  -- CÓDIGO DE IDIOMA,
    CPOSTAL         VARCHAR(5)  -- CÓDIGO POSTAL
);

-- Tabla467
CREATE TABLE Tabla467 (
    DOMICILIO_FISCAL UNKNOWN  -- DOMICILIO FISCAL,
    NOPOBLAC_FIS    VARCHAR(30)  -- POBLACION,
    NOPROVIN_FIS    VARCHAR(30)  -- PROVINCIA,
    CODPAISDIR_FIS  INT  -- CÓDIGO DE PAÍS,
    NOPAIS_FIS      VARCHAR(20)  -- NOMBRE DEL PAÍS,
    CTICALLE_FIS    VARCHAR(6)  -- TIPO DE DOMICILIO,
    NUPAIS_FIS      INT  -- NÚUMERO DE PAÍS,
    NOMCALLE_FIS    VARCHAR(40)  -- NOMBRE DE CALLE,
    NUMDOMI_FIS     INT  -- NÚMERO,
    TBLOCDOM_FIS    VARCHAR(2)  -- BLOQUE,
    TPTALDOM_FIS    VARCHAR(3)  -- PORTAL,
    TPISODOM_FIS    VARCHAR(2)  -- PISO,
    TPRTADOM_FIS    VARCHAR(2)  -- PUERTA,
    TESCADOM_FIS    VARCHAR(2)  -- ESCALERA,
    RESTODIR_FIS    VARCHAR(40)  -- RESTO DE DIRECCIÓN,
    CPROVINC_FIS    INT  -- CÓDIGO DE PROVINCIA,
    DOMICILIO_VENTANILLA UNKNOWN  -- DOMICILIO VENTANILLA,
    CPOSTAL_VTA     INT  -- CÓDIGO POSTAL,
    NOPOBLAC_VTA    VARCHAR(30)  -- POBLACION,
    NOPROVIN_VTA    VARCHAR(30)  -- PROVINCIA,
    CODPAISDIR_VTA  INT  -- CÓDIGO DE PAÍS,
    NOPAIS_VTA      VARCHAR(20)  -- NOMBRE DEL PAÍS,
    CTICALLE_VTA    VARCHAR(6)  -- TIPO DE DOMICILIO,
    NUPAIS_VTA      INT  -- NÚUMERO DE PAÍS,
    NOMCALLE_VTA    VARCHAR(40)  -- NOMBRE DE CALLE,
    NUMDOMI_VTA     INT  -- NÚMERO,
    TBLOCDOM_VTA    VARCHAR(2)  -- BLOQUE
);

-- Tabla468
CREATE TABLE Tabla468 (
    TPTALDOM_VTA    VARCHAR(3)  -- PORTAL,
    TPISODOM_VTA    VARCHAR(2)  -- PISO,
    TPRTADOM_VTA    VARCHAR(2)  -- PUERTA,
    TESCADOM_VTA    VARCHAR(2)  -- ESCALERA,
    RESTODIR_VTA    VARCHAR(40)  -- RESTO DE DIRECCIÓN,
    CPROVINC_VTA    INT  -- CÓDIGO DE PROVINCIA,
    TELEMOVIL_VTA   INT  -- TELÉFONO MOVIL,
    CTIPCLIEN       VARCHAR(2)  -- TIPO DE CLIENTE,
    CSUBTIPCLI      VARCHAR(2)  -- SUBTIPO DE CLIENTE,
    MAIL            VARCHAR(100)  -- CORREO ELECTRÓNICO,
    CODPAISNCT      INT  -- PAIS DE NACIMIENTO,
    FECNAC          VARCHAR(8)  -- FECHA DE NACIMIENTO,
    CODPAISNAC      INT  -- PAÍS DE NACIONALIDAD,
    SEXO            VARCHAR(2)  -- SEXO,
    INDESTCIV       VARCHAR(2)  -- ESTADO CIVIL,
    REGECON         VARCHAR(2)  -- RÉGIMEN ECONÓMICO
);

-- Tabla469: El formato que corresponde al registro del fichero de salida sería (ATRNOTIF):
CREATE TABLE Tabla469 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CÓDIGO DE LA CUENTA,
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA (OFUSCADO),
    FECCADTAR       INT  -- FECHA DE CADUCIDAD,
    FECTRN          VARCHAR(10)  -- FECHA LOCAL DE LA OPERACIÓN,
    HORTRN          VARCHAR(8)  -- HORA LOCAL DE LA OPERACIÓN,
    FECPROCES       VARCHAR(10)  -- FECHA DE PROCESO
);

-- Tabla470: El formato que corresponde al registro del fichero de salida sería (ATRNOTIF):
CREATE TABLE Tabla470 (
    HORAPROCESO     VARCHAR(8)  -- HORA DE PROCESO,
    IMPTRN          DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA TITULAR,
    CLAMONTRN       INT  -- CODIGO ISO DE LA MONEDA TITULAR,
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA ORIGINAL,
    CLAMONDIV       INT  -- CODIGO ISO DE LA MONEDA TITULAR,
    TIPMEDIO        VARCHAR(2)  -- MEDIO DE COMUNICACIÓN,
    TIPMEDIODES     VARCHAR(30)  -- DESCRIPCIÓN DEL MEDIO DE COMUNICACIÓN,
    CODEVENT        INT  -- CÓDIGO DE EVENTO DE NOTIFICACIÓN,
    DESEVENT        VARCHAR(30)  -- DESCRIPCIÓN DEL EVENETO,
    DESEVENTRED     VARCHAR(10)  -- DESCRIPCIÓN REDUCIDA DEL EVENTO,
    REFDOC          VARCHAR(20)  -- DOCUMENTO DE REFERENCIA,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    PORINT          DECIMAL(3, 4)  -- PORCENTAJE DE INTERÉS MENSUAL,
    TAE             DECIMAL(3, 4)  -- Tae/cae,
    IMPINTTOTAL     DECIMAL(17, 2)  -- IMPORTE TOTAL DE INTERESES,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    IMPCOMIS        DECIMAL(17, 2)  -- IMPORTE DE COMISIONES,
    FECALTCOMP      VARCHAR(10)  -- FECHA DE ALTA DE LA COMPRA A PLAZOS,
    FECPROCUO       VARCHAR(10)  -- FECHA DE PRÓXIMA CUOTA,
    IMPCOMAPE       DECIMAL(17, 2)  -- IMPORTE DE LA COMISIÓN DE APERTURA,
    LIMCRECTA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA,
    FORPAGO         INT  -- FORMA DE PAGO
);

-- Tabla471: El formato que corresponde al registro del fichero de salida sería (ATRNOTIF):
CREATE TABLE Tabla471 (
    IMPFPAGOA       DECIMAL(17, 2)  -- IMPORTE FIJO DE PAGO APLAZADO,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE DE PAGO APLAZADO,
    IMPMINPAGOA     DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO APLAZADO,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE DE COMERCIO,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DEL COMERCIO,
    CODPAIS         INT  -- PAÍS DEL COMERCIO,
    NUMSECHIS       NUMERIC(15)  -- SECUENCIAL DE NOTIFICACIÓN,
    CODPUBLI        VARCHAR(10)  -- CÓDIGO DE PUBLICIDAD,
    CODNOTIF        VARCHAR(10)  -- CÓDIGO DE NOTIFICACIÓN,
    FECCAR          VARCHAR(10)  -- FECHA DE CARGO,
    IMPCARGO        DECIMAL(17, 2)  -- IMPORTE DEL VARGO
);

-- Tabla472: El formato que corresponde al registro del fichero de salida sería (ATTKMBOK):
CREATE TABLE Tabla472 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CÓDIGO DE LA CUENTA,
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO,
    TOKEN           VARCHAR(22)  -- NÚMERO DE TOKEN ASOCIADO AL PAN
);

-- Tabla473: Registros de los traspasos al histórico de financiaciones. La Interfaz consta de campos debajo:
CREATE TABLE Tabla473 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- NUMERO DE TARJETA,
    TOKENNEGOCIO    VARCHAR(37)  -- FORMADO por CODENT, CENTALTA, CUENTA, NUMBENCTA y NUMPLASTICO,
    MOTIVO          VARCHAR(2)  -- MOTIVO DE BAJA
);

-- Tabla474: El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla474 (
    Tipo_de_registro VARCHAR(2)  -- Valor Fijo "HR",
    Fecha_de_Proceso INT  -- Fecha De Proceso de la interfaz con formato "AAAAMMDD",
    C_digo_de_organizaci_n INT  -- Código de organización,
    Glosa           VARCHAR(30)  -- Valor fijo "Informacion Iva Digital",
    FILLER          VARCHAR(242)
);

-- Tabla475: El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla475 (
    Tipo_de_registro VARCHAR(2)  -- Valor Fijo "DT",
    Producto_1      VARCHAR(22)  -- Corresponde el número de la Tarjeta del Cliente que realizó la Transacción internacional que generó el IVA,
    Producto_2      VARCHAR(20)  -- Corresponde al número de Contrato asociada a la Tarjeta que realizó la transacción internacional que generó el IVA Formado por: Código de entidad (alfanumérico de 4 posiciones) Centro de alta (alfanumérico de 4 posiciones) Cuenta (alfanumérico de 12 posiciones),
    RUT_Del_Cliente_Titular VARCHAR(22)  -- Corresponde al RUT asociado a la Cuenta informada,
    Signo_de_monto_de_TRX_en_d_lares VARCHAR(1)  -- Corresponde el signo del monto de la transacción internacional en dólar (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX_en_d_lares DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional en dólar,
    Signo_de_monto_de_TRX VARCHAR(1)  -- Corresponde el signo del monto de la transacción internacional (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX    DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional,
    Fecha_efectiva  INT  -- Corresponde a la fecha efectiva en la cual se realizó la transacción internacional,
    Fecha_posteo    INT  -- Corresponde a la fecha de proceso de la transacción internacional,
    C_digo_de_Comercio VARCHAR(15)  -- Corresponde al código de comercio, de largo 15, informado para la transacción internacional
);

-- Tabla476: El formato que corresponde al registro del fichero de salida sería (ATDESINI):
CREATE TABLE Tabla476 (
    Moneda_de_Origen INT  -- Corresponde al código de la Moneda de Origen informado para la transacción internacional (en formato ISO 4217 numérico),
    N_mero_o_c_digo_de_la_referencia_internacional NUMERIC(23)  -- N° referencia o microfilm de la transacción. Número único asociado a la transacción,
    Nombre_del_comercio VARCHAR(27)  -- Nombre del comercio, según la información enviada por SII para el correspondiente código de comercio en el listado : Contribuyentes IVA SD Afectos a Cambio de Sujeto,
    C_digo_pa_s_de_comercio VARCHAR(3)  -- Corresponde al código de país de origen informado para la transacción internacional. En formato ISO 3166-1, Alpha-3; o en su defecto Alpha-2,
    N_mero_o_c_digo_de_la_referencia_bancaria_internacional NUMERIC(23)  -- N° referencia o microfilm de la transacción. Número único asociado a la transacción internacional bancaria,
    MCC_Merchant_category_code_ INT  -- Código de rubro,
    FILLER          VARCHAR(65)
);

-- Tabla477
CREATE TABLE Tabla477 (
    Tipo_de_registro VARCHAR(2)  -- Valor Fijo "TR",
    Total_de_registros VARCHAR(7)  -- Suma todos los registros de la interfaz, incluye reg de Header y Trailer,
    Signo_de_monto_de_TRX_en_d_lares VARCHAR(1)  -- Corresponde el signo del monto de la transacción internacional en dólar (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX_en_d_lares DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional en dólar
);

-- Tabla478
CREATE TABLE Tabla478 (
    Signo_de_monto_de_TRX VARCHAR(1)  -- Corresponde el signo del monto de la transacción internacional (posibles valores ‘+’ o ‘-‘),
    Monto_de_TRX    DECIMAL(17, 2)  -- Corresponde el monto de la transacción internacional,
    Total_del_monto DECIMAL(17, 2)  -- Sumatoria del campo Monto de TRX en dólares,
    FILLER          VARCHAR(240)
);

-- Tabla479: Detalle de campos de los campos comunes. En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATENVPCO):
CREATE TABLE Tabla479 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO ‘CO’– DATOS DE COMERCIO ‘CR’– DATOS ADICIONALES DE COMERCIO ‘DC’ – PARTICULARIZACION DE COMERCIOS POR MARCA/TIPO ‘S1‘ – SALDOS PENDIENTES DE 1 A 6 MESES ‘S2’ – SALDOS PENDIENTES DE 6 A 12 MESES,
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN
);

-- Tabla480: En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATENVPCO): Estructura tipo de registro de Datos de Comercios. Tipo de registro ‘CO’:
CREATE TABLE Tabla480 (
    NOMCOMRED       VARCHAR(27)  -- Nombre reducido del comercio,
    CODCADENA       VARCHAR(3)  -- Código de cadena comercial,
    DESCADENA       VARCHAR(30)  -- Descripción de cadena comercial,
    CODHOLDING      VARCHAR(4)  -- Código de Holding al que pertenece,
    IDENTCLI        VARCHAR(8)  -- Identificación de cliente en el sistema corporativo de Clientes,
    TIPDOC          VARCHAR(3)  -- Tipo de documento identificativo,
    NUMDOC          VARCHAR(20)  -- Número de documento identificativo,
    PRODUCTO        VARCHAR(2)  -- Código de producto de comercios,
    SUBPRODU        VARCHAR(4)  -- Código de subproducto de comercios,
    DESPROD         VARCHAR(30)  -- Descripción del producto de comercios
);

-- Tabla481: En este apartado se describen los campos comunes que preceden al resto de estructuras de registro en todos y cada uno de los siguientes tipos de registro. Estructura común inicial para todos los tipos de registro (ATENVPCO): Estructura tipo de registro de Datos de Comercios. Tipo de registro ‘CO’:
CREATE TABLE Tabla481 (
    CONPROD         VARCHAR(3)  -- Código de condición económica,
    DESCONRED       VARCHAR(10)  -- Descripción de la condición económica,
    TIPBON          VARCHAR(6)  -- Tipo de bonificación,
    TIPOPROV        VARCHAR(1)  -- Tipo de proveedor: ‘E’ – Establecimiento ‘O’ - Oficina ‘C’ - Cajero,
    CODACT          INT  -- Código de actividad,
    DESACT          VARCHAR(30)  -- Descripción de la actividad,
    NIVAPLCG        VARCHAR(1)  -- Nivel de aplicación del cargo/abono – Comercio – Cadena comercial,
    IBAN            VARCHAR(4)  -- Código Iban de la Cuenta de Cargo,
    CTACARGO        VARCHAR(30)  -- Cuenta de cargo,
    CLAMON          INT  -- Clave de moneda de la cuenta de cargo,
    DESCLAMON       VARCHAR(30)  -- Descripción Moneda,
    INDTIPCTA       VARCHAR(2)  -- Indicador de tipo de cuenta de cargo,
    INDAJENA        VARCHAR(1)  -- Indicador de cuenta de domiciliación ajena (S/N),
    CODCAM          VARCHAR(6)  -- Código campaña,
    FECALTA         UNKNOWN  -- Fecha de alta comercio,
    FECBAJA         UNKNOWN  -- Fecha de baja,
    MOTBAJA         VARCHAR(2)  -- Motivo de baja,
    DESMOT          VARCHAR(30)  -- Descripción del motivo de baja,
    FECREACT        UNKNOWN  -- Fecha reactivación del comercio,
    CODRIE          INT  -- Código de riesgo,
    FECULTRIE       UNKNOWN  -- Fecha última clasificación riesgo,
    INDCONT         VARCHAR(1)  -- Indicador de comercio contratado/captado: ‘0’ – Contratado ‘1’ – Captado
);

-- Tabla482: Estructura común inicial para todos los tipos de registro (ATENVPCO): Estructura tipo de registro de Datos de Comercios. Tipo de registro ‘CO’:
CREATE TABLE Tabla482 (
    CODPROCESO      INT  -- Código de proceso,
    CODGRUPO        INT  -- Código de grupo de proceso,
    CODREGIMEN      INT  -- Código de régimen fiscal,
    DESREGIMEN      VARCHAR(30)  -- Descripción de régimen fiscal
);

-- Tabla483: Estructura tipo de registro de Datos de Comercios. Tipo de registro ‘CO’: Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de registro ‘CR’:
CREATE TABLE Tabla483 (
    NIVAPLCG        VARCHAR(1)  -- Nivel de aplicación del cargo – Comercio – Cadena comercial,
    PERSCOM         VARCHAR(40)  -- Persona de contacto,
    PREFINTT        VARCHAR(4)  -- Prefijo internacional teléfono de contacto,
    TELEFONO        VARCHAR(10)  -- Teléfono de contacto comercio,
    EMAILCOM        VARCHAR(55)  -- Email de contacto comercio,
    URLCOMER        VARCHAR(40)  -- Dirección electrónica del comercio,
    CODPAISDIR      INT  -- Código ISO de país de la dirección,
    DESCODPAISDIR   VARCHAR(30)  -- Descripción País de la dirección,
    POBLACION       VARCHAR(35)  -- Nombre de la población del comercio,
    TIPVIA          VARCHAR(2)  -- Tipo de vía del comercio,
    NOMVIA          VARCHAR(40)  -- Nombre de la vía del comercio,
    NUMVIA          VARCHAR(6)  -- Número de la vía del comercio,
    EDIFICIO        VARCHAR(4)  -- Edificio del comercio,
    ESCALERA        VARCHAR(4)  -- Escalera del comercio,
    PISO            VARCHAR(4)  -- Piso del comercio,
    PUERTA          VARCHAR(4)  -- Puerta del comercio,
    RESTODIR        VARCHAR(40)  -- Resto de la dirección del comercio
);

-- Tabla484: Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de registro ‘CR’:
CREATE TABLE Tabla484 (
    CODPOSTAL       VARCHAR(10)  -- Código postal del comercio,
    CODENTCOB       VARCHAR(10)  -- Código de entidad Cobranding,
    PDTOECOB        DECIMAL(7, 4)  -- Porcentaje de cesión del descuento de la entidad a entidad cobranding,
    PDTOCCOB        DECIMAL(7, 4)  -- Porcentaje de cesión del descuento del comercio a entidad cobranding
);

-- Tabla485: Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de registro ‘CR’: Estructura del tipo de registro de particularizaciones de comercio por marca/tipo. Tipo de registro ‘DC’:
CREATE TABLE Tabla485 (
    CODMAR          INT  -- Código de Marca de la Tarjeta,
    DESMAR          VARCHAR(30)  -- Descripción de Marca de la Tarjeta,
    INDTIPT         INT  -- Tipo de la Tarjeta,
    DESTIPT         VARCHAR(30)  -- Descripción del Tipo de la Tarjeta,
    CODCONECO       INT  -- Código de concepto económico,
    DESCONECO       VARCHAR(30)  -- Descripción del concepto económico,
    CLAMON          INT  -- Clave de la moneda,
    TRAMOFIN        DECIMAL(17, 2)  -- Valor final de aplic. de concp. económico,
    TIPOACCESO      VARCHAR(1)  -- Tipo de acceso,
    PORTRAMOPAR     DECIMAL(13, 4)  -- % Particularizado a aplicar en imp. De tramo,
    IMPMINPAR       DECIMAL(17, 2)  -- Imp. Min particularizado a aplicar en tramo,
    IMPMAXPAR       DECIMAL(17, 2)  -- Imp. Mxa. Particularizado a aplicar en tramo,
    FECALTA         VARCHAR(10)  -- Fecha alta tarifa particularizada,
    INDPORPAR       VARCHAR(1)  -- Ind. Porcentaje particularizado,
    INDMINPAR       VARCHAR(1)  -- Ind. Min particularizado,
    INDMAXPAR       VARCHAR(1)  -- Ind. Max particularizado
);

-- Tabla486: Estructura del tipo de registro de Datos Adicionales de Comercio. Tipo de registro ‘CR’: Estructura del tipo de registro de particularizaciones de comercio por marca/tipo. Tipo de registro ‘DC’:
CREATE TABLE Tabla486 (
    INDDEBCRE       INT  -- Indicador de Tipo Operación: 1 – Crédito 2 – Débito 4 – Prepago Monedero 5 – Prepago Regalo 6 – Prepago
);

-- Tabla487: Estructura del tipo de registro de particularizaciones de comercio por marca/tipo. Tipo de registro ‘DC’: Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla487 (
    CLAMON          INT  -- Clave de Moneda,
    DESCLAMON       VARCHAR(12)  -- Descripción moneda,
    Saldos_a_30_D_as UNKNOWN,
    SGN_IMPORTE_30  VARCHAR(1)  -- Signo Importe a 30 días,
    IMPORTE_30      DECIMAL(14, 2)  -- Importe a 30 días,
    SGN_IMPSTO_30   VARCHAR(1)  -- Signo Importe del impuesto a 30 días,
    IMPSTO_30       DECIMAL(14, 2)  -- Importe del impuesto a 30 días,
    SGN_IMPDES_30   VARCHAR(1)  -- Signo Importe del descuento a 30 días,
    IMPDES_30       DECIMAL(14, 2)  -- Importe del descuento a 30 días,
    SGN_IMPBON_30   VARCHAR(1)  -- Signo Importe bonificación del descuento a 30 días,
    IMPBON_30       DECIMAL(14, 2)  -- Importe bonificación del descuento a 30 días,
    SGN_IMPPROPINA__30 VARCHAR(1)  -- Signo Importe de la propina a 30 días,
    IMPPROPINA_30   DECIMAL(14, 2)  -- Importe de la propina a 30 días,
    SGN_IMPEXT_30   VARCHAR(1)  -- Signo Importe externo a 30 días,
    IMPEXT_30       DECIMAL(14, 2)  -- Importe externo a 30 días,
    SGN_IMPOTR1_30  VARCHAR(1)  -- Signo Otros importes1 a 30 días,
    IMPOTR1_30      DECIMAL(14, 2)  -- Otros importes1 a 30 días,
    SGN_IMPOTR2_30  VARCHAR(1)  -- Signo Otros importes2 a 30 días,
    IMPOTR2_30      DECIMAL(14, 2)  -- Otros importes2 a 30 días
);

-- Tabla488: Estructura del tipo de registro de particularizaciones de comercio por marca/tipo. Tipo de registro ‘DC’: Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla488 (
    Saldos_a_60_D_as UNKNOWN  -- Saldos a 60 Días,
    SGN_IMPORTE_60  VARCHAR(1)  -- Signo Importe de 31 a 60 días,
    IMPORTE_60      DECIMAL(14, 2)  -- Importe de 31 a 60 días,
    SGN_IMPSTO_60   VARCHAR(1)  -- Signo Importe del impuesto de 31 a 60 días,
    IMPSTO_60       DECIMAL(14, 2)  -- Importe del impuesto de 31 a 60 días,
    SGN_IMPDES_60   VARCHAR(1)  -- Signo Importe del descuento de 31 a 60 días,
    IMPDES_60       DECIMAL(14, 2)  -- Importe del descuento de 31 a 60 días,
    SGN_IMPBON_60   VARCHAR(1)  -- Signo Importe bonificación del descuento de 31 a 60 días,
    IMPBON_60       DECIMAL(14, 2)  -- Importe bonificación del descuento de 31 a 60 días,
    SGN_IMPPROPINA__60 VARCHAR(1)  -- Signo Importe de la propina de 31 a 60 días,
    IMPPROPINA_60   DECIMAL(14, 2)  -- Importe de la propina de 31 a 60 días,
    SGN_IMPEXT_60   VARCHAR(1)  -- Signo Importe externo de 31 a 60 días,
    IMPEXT_60       DECIMAL(14, 2)  -- Importe externo de 31 a 60 días,
    SGN_IMPOTR1_60  VARCHAR(1)  -- Signo Otros importes1 de 31 a 60 días,
    IMPOTR1_60      DECIMAL(14, 2)  -- Otros importes1 de 31 a 60 días,
    SGN_IMPOTR2_60  VARCHAR(1)  -- Signo Otros importes2 de 31 a 60 días,
    IMPOTR2_60      DECIMAL(14, 2)  -- Otros importes2 de 31 a 60 días,
    Saldos_a_90_D_as UNKNOWN  -- Saldos a 90 Días,
    SGN_IMPORTE_90  VARCHAR(1)  -- Signo Importe de 61 a 90 días,
    IMPORTE_90      DECIMAL(14, 2)  -- Importe de 61 a 90 días,
    SGN_IMPSTO_90   VARCHAR(1)  -- Signo Importe del impuesto de 61 a 90 días,
    IMPSTO_90       DECIMAL(14, 2)  -- Importe del impuesto de 61 a 90 días
);

-- Tabla489: Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla489 (
    SGN_IMPDES_90   VARCHAR(1)  -- Signo Importe del descuento de 61 a 90 días,
    IMPDES_90       DECIMAL(14, 2)  -- Importe del descuento de 61 a 90 días,
    SGN_IMPBON_90   VARCHAR(1)  -- Signo Importe bonificación del descuento de 61 a 90 días,
    IMPBON_90       DECIMAL(14, 2)  -- Importe bonificación del descuento de 61 a 90 días,
    SGN_IMPPROPINA__90 VARCHAR(1)  -- Signo Importe de la propina de 61 a 90 días,
    IMPPROPINA_90   DECIMAL(14, 2)  -- Importe de la propina de 61 a 90 días,
    SGN_IMPEXT_90   VARCHAR(1)  -- Signo Importe externo de 61 a 90 días,
    IMPEXT_90       DECIMAL(14, 2)  -- Importe externo de 61 a 90 días,
    SGN_IMPOTR1_90  VARCHAR(1)  -- Signo Otros importes1 de 61 a 90 días,
    IMPOTR1_90      DECIMAL(14, 2)  -- Otros importes1 de 61 a 90 días,
    SGN_IMPOTR2_90  VARCHAR(1)  -- Signo Otros importes2 de 61 a 90 días,
    IMPOTR2_90      DECIMAL(14, 2)  -- Otros importes2 de 61 a 90 días,
    Saldos_a_120_D_as UNKNOWN  -- Saldos a 120 Días,
    SGN_IMPORTE_120 VARCHAR(1)  -- Signo Importe de 91 a 120 días,
    IMPORTE_120     DECIMAL(14, 2)  -- Importe de 91 a 120 días,
    SGN_IMPSTO_120  VARCHAR(1)  -- Signo Importe del impuesto de 91 a 120 días,
    IMPSTO_120      DECIMAL(14, 2)  -- Importe del impuesto de 91 a 120 días,
    SGN_IMPDES_120  VARCHAR(1)  -- Signo Importe del descuento de 91 a 120 días,
    IMPDES_120      DECIMAL(14, 2)  -- Importe del descuento de 91 a 120 días,
    SGN_IMPBON_120  VARCHAR(1)  -- Signo Importe bonificación del descuento de 91 a 120 días,
    IMPBON_120      DECIMAL(14, 2)  -- Importe bonificación del descuento de 91 a 120 días
);

-- Tabla490: Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla490 (
    SGN_IMPPROPINA__120 VARCHAR(1)  -- Signo Importe de la propina de 91 a 120 días,
    IMPPROPINA_120  DECIMAL(14, 2)  -- Importe de la propina de 91 a 120 días,
    SGN_IMPEXT_120  VARCHAR(1)  -- Signo Importe externo de 91 a 120 días,
    IMPEXT_120      DECIMAL(14, 2)  -- Importe externo de 91 a 120 días,
    SGN_IMPOTR1_120 VARCHAR(1)  -- Signo Otros importes1 de 91 a 120 días,
    IMPOTR1_120     DECIMAL(14, 2)  -- Otros importes1 de 91 a 120 días,
    SGN_IMPOTR2_120 VARCHAR(1)  -- Signo Otros importes2 de 91 a 120 días,
    IMPOTR2_120     DECIMAL(14, 2)  -- Otros importes2 de 91 a 120 días,
    Saldos_a_150_D_as UNKNOWN  -- Saldos a 150 Días,
    SGN_IMPORTE_150 VARCHAR(1)  -- Signo Importe de 121 a 150 días,
    IMPORTE_150     DECIMAL(14, 2)  -- Importe de 121 a 150 días,
    SGN_IMPSTO_150  VARCHAR(1)  -- Signo Importe del impuesto de 121 a 150 días,
    IMPSTO_150      DECIMAL(14, 2)  -- Importe del impuesto de 121 a 150 días,
    SGN_IMPDES_150  VARCHAR(1)  -- Signo Importe del descuento de 121 a 150 días,
    IMPDES_150      DECIMAL(14, 2)  -- Importe del descuento de 121 a 150 días,
    SGN_IMPBON_150  VARCHAR(1)  -- Signo Importe bonificación del descuento de 121 a 150 días,
    IMPBON_150      DECIMAL(14, 2)  -- Importe bonificación del descuento de 121 a 150 días,
    SGN_IMPPROPINA__150 VARCHAR(1)  -- Signo Importe de la propina de 121 a 150 días,
    IMPPROPINA_150  DECIMAL(14, 2)  -- Importe de la propina de 121 a 150 días,
    SGN_IMPEXT_150  VARCHAR(1)  -- Signo Importe externo de 121 a 150 días
);

-- Tabla491: Estructura del tipo de registro de saldos pendientes de pagos de 1 a 6 meses. Tipo de registro ‘S1’:
CREATE TABLE Tabla491 (
    IMPEXT_150      DECIMAL(14, 2)  -- Importe externo de 121 a 150 días,
    SGN_IMPOTR1_150 VARCHAR(1)  -- Signo Otros importes1 de 121 a 150 días,
    IMPOTR1_150     DECIMAL(14, 2)  -- Otros importes1 de 121 a 150 días,
    SGN_IMPOTR2_150 VARCHAR(1)  -- Signo Otros importes2 de 121 a 150 días,
    IMPOTR2_150     DECIMAL(14, 2)  -- Otros importes2 de 121 a 150 días,
    Saldos_a_180_D_as UNKNOWN  -- Saldos a 180 Días,
    SGN_IMPORTE_180 VARCHAR(1)  -- Signo Importe de 151 a 180 días,
    IMPORTE_180     DECIMAL(14, 2)  -- Importe de 151 a 180 días,
    SGN_IMPSTO_180  VARCHAR(1)  -- Signo Importe del impuesto de 151 a 180 días,
    IMPSTO_180      DECIMAL(14, 2)  -- Importe del impuesto de 151 a 180 días,
    SGN_IMPDES_180  VARCHAR(1)  -- Signo Importe del descuento de 151 a 180 días,
    IMPDES_180      DECIMAL(14, 2)  -- Importe del descuento de 151 a 180 días,
    SGN_IMPBON_180  VARCHAR(1)  -- Signo Importe bonificación del descuento de 151 a 180 días,
    IMPBON_180      DECIMAL(14, 2)  -- Importe bonificación del descuento de 151 a 180 días,
    SGN_IMPPROPINA__180 VARCHAR(1)  -- Signo Importe de la propina de 151 a 180 días,
    IMPPROPINA_180  DECIMAL(14, 2)  -- Importe de la propina de 151 a 180 días,
    SGN_IMPEXT_180  VARCHAR(1)  -- Signo Importe externo de 151 a 180 días,
    IMPEXT_180      DECIMAL(14, 2)  -- Importe externo de 151 a 180 días,
    SGN_IMPOTR1_180 VARCHAR(1)  -- Signo Otros importes1 de 151 a 180 días,
    IMPOTR1_180     DECIMAL(14, 2)  -- Otros importes1 de 151 a 180 días
);

-- Tabla492
CREATE TABLE Tabla492 (
    SGN_IMPOTR2_180 VARCHAR(1)  -- Signo Otros importes2 de 151 a 180 días,
    IMPOTR2_180     DECIMAL(14, 2)  -- Otros importes2 de 151 a 180 días
);

-- Tabla493: Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. Tipo de registro ‘S2’:
CREATE TABLE Tabla493 (
    CLAMON          INT  -- Clave de Moneda,
    DESCLAMON       VARCHAR(12)  -- Descripción moneda,
    Saldos_a_210_D_as UNKNOWN  -- Saldos a 210 Días,
    SGN_IMPORTE_210 VARCHAR(1)  -- Signo Importe de 181 a 210 días,
    IMPORTE_210     DECIMAL(14, 2)  -- Importe de 181 a 210 días,
    SGN_IMPSTO_210  VARCHAR(1)  -- Signo Importe del impuesto de 181 a 210 días,
    IMPSTO_210      DECIMAL(14, 2)  -- Importe del impuesto de 181 a 210 días,
    SGN_IMPDES_210  VARCHAR(1)  -- Signo Importe del descuento de 181 a 210 días,
    IMPDES_210      DECIMAL(14, 2)  -- Importe del descuento de 181 a 210 días,
    SGN_IMPBON_210  VARCHAR(1)  -- Signo Importe bonificación del descuento de 181 a 210 días,
    IMPBON_210      DECIMAL(14, 2)  -- Importe bonificación del descuento de 181 a 210 días,
    SGN_IMPPROPINA__210 VARCHAR(1)  -- Signo Importe de la propina de 181 a 210 días,
    IMPPROPINA_210  DECIMAL(14, 2)  -- Importe de la propina de 181 a 210 días,
    SGN_IMPEXT_210  VARCHAR(1)  -- Signo Importe externo de 181 a 210 días,
    IMPEXT_201      DECIMAL(14, 2)  -- Importe externo de 151 a 210 días,
    SGN_IMPOTR1_210 VARCHAR(1)  -- Signo Otros importes1 de 151 a 210 días
);

-- Tabla494: Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. Tipo de registro ‘S2’:
CREATE TABLE Tabla494 (
    IMPOTR1_210     DECIMAL(14, 2)  -- Otros importes1 de 151 a 210 días,
    SGN_IMPOTR2_210 VARCHAR(1)  -- Signo Otros importes2 de 151 a 210 días,
    IMPOTR2_210     DECIMAL(14, 2)  -- Otros importes2 de 151 a 210 días,
    Saldos_a_240_D_as UNKNOWN  -- Saldos a 240 Días,
    SGN_IMPORTE_240 VARCHAR(1)  -- Signo Importe de 211 a 240 días,
    IMPORTE_240     DECIMAL(14, 2)  -- Importe de 211 a 240 días,
    SGN_IMPSTO_240  VARCHAR(1)  -- Signo Importe del impuesto de 211 a 240 días,
    IMPSTO_240      DECIMAL(14, 2)  -- Importe del impuesto de 211 a 240 días,
    SGN_IMPDES_240  VARCHAR(1)  -- Signo Importe del descuento de 211 a 240 días,
    IMPDES_240      DECIMAL(14, 2)  -- Importe del descuento de 211 a 240 días,
    SGN_IMPBON_240  VARCHAR(1)  -- Signo Importe bonificación del descuento de 211 a 240 días,
    IMPBON_240      DECIMAL(14, 2)  -- Importe bonificación del descuento de 211 a 240 días,
    SGN_IMPPROPINA__240 VARCHAR(1)  -- Signo Importe de la propina de 211 a 240 días,
    IMPPROPINA_240  DECIMAL(14, 2)  -- Importe de la propina de 211 a 240 días,
    SGN_IMPEXT_240  VARCHAR(1)  -- Signo Importe externo de 211 a 240 días,
    IMPEXT_240      DECIMAL(14, 2)  -- Importe externo de 211 a 240 días,
    SGN_IMPOTR1_240 VARCHAR(1)  -- Signo Otros importes1 de 211 a 240 días,
    IMPOTR1_240     DECIMAL(14, 2)  -- Otros importes1 de 211 a 240 días,
    SGN_IMPOTR2_240 VARCHAR(1)  -- Signo Otros importes2 de 211 a 240 días
);

-- Tabla495: Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. Tipo de registro ‘S2’:
CREATE TABLE Tabla495 (
    IMPOTR2_240     DECIMAL(14, 2)  -- Otros importes2 de 211 a 240 días,
    Saldos_a_270_D_as UNKNOWN  -- Saldos a 270 Días,
    SGN_IMPORTE_270 VARCHAR(1)  -- Signo Importe de 241 a 270 días,
    IMPORTE_270     DECIMAL(14, 2)  -- Importe de 241 a 270 días,
    SGN_IMPSTO_270  VARCHAR(1)  -- Signo Importe del impuesto de 241 a 270 días,
    IMPSTO_270      DECIMAL(14, 2)  -- Importe del impuesto de 241 a 270 días,
    SGN_IMPDES_270  VARCHAR(1)  -- Signo Importe del descuento de 241 a 270 días,
    IMPDES_270      DECIMAL(14, 2)  -- Importe del descuento de 241 a 270 días,
    SGN_IMPBON_270  VARCHAR(1)  -- Signo Importe bonificación del descuento de 241 a 270 días,
    IMPBON_270      DECIMAL(14, 2)  -- Importe bonificación del descuento de 241 a 270 días,
    SGN_IMPPROPINA__270 VARCHAR(1)  -- Signo Importe de la propina de 241 a 270 días,
    IMPPROPINA_270  DECIMAL(14, 2)  -- Importe de la propina de 241 a 270 días,
    SGN_IMPEXT_270  VARCHAR(1)  -- Signo Importe externo de 241 a 270 días,
    IMPEXT_270      DECIMAL(14, 2)  -- Importe externo de 241 a 270 días,
    SGN_IMPOTR1_270 VARCHAR(1)  -- Signo Otros importes1 de 241 a 270 días,
    IMPOTR1_270     DECIMAL(14, 2)  -- Otros importes1 de 241 a 270 días,
    SGN_IMPOTR2_270 VARCHAR(1)  -- Signo Otros importes2 de 241 a 270 días,
    IMPOTR2_270     DECIMAL(14, 2)  -- Otros importes2 de 241 a 270 días,
    Saldos_a_300_D_as UNKNOWN  -- Saldos a 300 Días,
    SGN_IMPORTE_300 VARCHAR(1)  -- Signo Importe de 271 a 300 días
);

-- Tabla496: Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. Tipo de registro ‘S2’:
CREATE TABLE Tabla496 (
    IMPORTE_300     DECIMAL(14, 2)  -- Importe de 271 a 300 días,
    SGN_IMPSTO_300  VARCHAR(1)  -- Signo Importe del impuesto de 271 a 300 días,
    IMPSTO_300      DECIMAL(14, 2)  -- Importe del impuesto de 271 a 300 días,
    SGN_IMPDES_300  VARCHAR(1)  -- Signo Importe del descuento de 271 a 300 días,
    IMPDES_300      DECIMAL(14, 2)  -- Importe del descuento de 271 a 300 días,
    SGN_IMPBON_300  VARCHAR(1)  -- Signo Importe bonificación del descuento de 271 a 300 días,
    IMPBON_300      DECIMAL(14, 2)  -- Importe bonificación del descuento de 271 a 300 días,
    SGN_IMPPROPINA__300 VARCHAR(1)  -- Signo Importe de la propina de 271 a 300 días,
    IMPPROPINA_300  DECIMAL(14, 2)  -- Importe de la propina de 271 a 300 días,
    SGN_IMPEXT_300  VARCHAR(1)  -- Signo Importe externo de 271 a 300 días,
    IMPEXT_300      DECIMAL(14, 2)  -- Importe externo de 271 a 300 días,
    SGN_IMPOTR1_300 VARCHAR(1)  -- Signo Otros importes1 de 271 a 300 días,
    IMPOTR1_300     DECIMAL(14, 2)  -- Otros importes1 de 271 a 300 días,
    SGN_IMPOTR2_300 VARCHAR(1)  -- Signo Otros importes2 de 271 a 300 días,
    IMPOTR2_300     DECIMAL(14, 2)  -- Otros importes2 de 271 a 300 días,
    Saldos_a_330_D_as UNKNOWN  -- Saldos a 330 Días,
    SGN_IMPORTE_330 VARCHAR(1)  -- Signo Importe de 301 a 330 días,
    IMPORTE_330     DECIMAL(14, 2)  -- Importe de 301 a 330 días,
    SGN_IMPSTO_330  VARCHAR(1)  -- Signo Importe del impuesto de 301 a 330 días
);

-- Tabla497: Estructura del tipo de registro de saldos pendientes de pagos de 6 a 12 meses. Tipo de registro ‘S2’:
CREATE TABLE Tabla497 (
    IMPSTO_330      DECIMAL(14, 2)  -- Importe del impuesto de 301 a 330 días,
    SGN_IMPDES_330  VARCHAR(1)  -- Signo Importe del descuento de 301 a 330 días,
    IMPDES_330      DECIMAL(14, 2)  -- Importe del descuento de 301 a 300 días,
    SGN_IMPBON_330  VARCHAR(1)  -- Signo Importe bonificación del descuento de 301 a 330 días,
    IMPBON_330      DECIMAL(14, 2)  -- Importe bonificación del descuento de 301 a 330 días,
    SGN_IMPPROPINA__330 VARCHAR(1)  -- Signo Importe de la propina de 301 a 330 días,
    IMPPROPINA_330  DECIMAL(14, 2)  -- Importe de la propina de 301 a 330 días,
    SGN_IMPEXT_330  VARCHAR(1)  -- Signo Importe externo de 301 a 330 días,
    IMPEXT_330      DECIMAL(14, 2)  -- Importe externo de 301 a 330 días,
    SGN_IMPOTR1_330 VARCHAR(1)  -- Signo Otros importes1 de 301 a 330 días,
    IMPOTR1_330     DECIMAL(14, 2)  -- Otros importes1 de 301 a 330 días,
    SGN_IMPOTR2_330 VARCHAR(1)  -- Signo Otros importes2 de 301 a 330 días,
    IMPOTR2_330     DECIMAL(14, 2)  -- Otros importes2 de 301 a 330 días,
    Saldos___360    UNKNOWN  -- Saldos > 360,
    SGN_IMPORTE_360 VARCHAR(1)  -- Signo Importe más de 360 días,
    IMPORTE_360     DECIMAL(14, 2)  -- Importe más de 360 días,
    SGN_IMPSTO_360  VARCHAR(1)  -- Signo Importe del impuesto más de 360 días,
    IMPSTO_360      DECIMAL(14, 2)  -- Importe del impuesto más de 360 días,
    SGN_IMPDES_360  VARCHAR(1)  -- Signo Importe del descuento más de 360 días
);

-- Tabla498
CREATE TABLE Tabla498 (
    IMPDES_360      DECIMAL(14, 2)  -- Importe del descuento más de 360 días,
    SGN_IMPBON_360  VARCHAR(1)  -- Signo Importe bonificación del descuento más de 360 días,
    IMPBON_360      DECIMAL(14, 2)  -- Importe bonificación del descuento más de 360 días,
    SGN_IMPPROPINA__360 VARCHAR(1)  -- Signo Importe de la propina más de 360 días,
    IMPPROPINA_360  DECIMAL(14, 2)  -- Importe de la propina más de 360 días,
    SGN_IMPEXT_360  VARCHAR(1)  -- Signo Importe externo más de 360 días,
    IMPEXT_360      DECIMAL(14, 2)  -- Importe externo más de 360 días,
    SGN_IMPOTR1_360 VARCHAR(1)  -- Signo Otros importes1 más de 360 días,
    IMPOTR1_360     DECIMAL(14, 2)  -- Otros importes1 más de 360 días,
    SGN_IMPOTR2_360 VARCHAR(1)  -- Signo Otros importes2 más de 360 días,
    IMPOTR2_360     DECIMAL(14, 2)  -- Otros importes2 más de 360 días
);

-- Tabla499: Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes recibidas en el día. Operaciones Pendientes de Pago al Comercio: Datos principales de las operaciones adquirentes que están pendientes de abonar a los comercios. Las operaciones diferidas que son abonadas al comercio cuota a cuota mostrarán un registro por cada cuota pendiente de abono con los valores correspondientes a esa cuota. El formato que corresponde al registro del fichero de salida sería (ATENVODC):
CREATE TABLE Tabla499 (
    DATOS_COMUNES   UNKNOWN,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CUENTA,
    CODCOM          VARCHAR(15)  -- CODIGO DE COMERCIO
);

-- Tabla500: Autorizaciones Recibidas en el Día: Detalle de las autorizaciones adquirentes recibidas en el día. Operaciones Pendientes de Pago al Comercio: Datos principales de las operaciones adquirentes que están pendientes de abonar a los comercios. Las operaciones diferidas que son abonadas al comercio cuota a cuota mostrarán un registro por cada cuota pendiente de abono con los valores correspondientes a esa cuota. El formato que corresponde al registro del fichero de salida sería (ATENVODC):
CREATE TABLE Tabla500 (
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO: ‘OP’ – OPERACIONES ‘CE’ – CONC ECO OPERACIONES ‘AU’ – AUTORIZACIONES PTES DE CRUCE Si INDPLAZOS = ‘S’ ‘PP’ – PLAZOS PENDIENTES ‘CP’ – CONCEPTOS ECONOMICOS PLAZOS PENDIENTES,
    NUMORDEN        NUMERIC(12)  -- NÚMERO DE ORDEN
);

-- Tabla501: Operaciones Pendientes de Pago al Comercio: Datos principales de las operaciones adquirentes que están pendientes de abonar a los comercios. Las operaciones diferidas que son abonadas al comercio cuota a cuota mostrarán un registro por cada cuota pendiente de abono con los valores correspondientes a esa cuota. El formato que corresponde al registro del fichero de salida sería (ATENVODC): Estructura del tipo de registro de operaciones recibidas en el día. Tipo de registro ‘OP’:
CREATE TABLE Tabla501 (
    CODCOM          VARCHAR(15)  -- Código de comercio,
    NOMCOMRED       VARCHAR(27)  -- Nombre reducido del comercio,
    CODCADENA       VARCHAR(3)  -- Código de cadena comercial,
    DESCADENA       VARCHAR(30)  -- Descripción de cadena comercial,
    CODHOLDING      VARCHAR(4)  -- Código de Holding al que pertenece,
    DESHOLDIG       VARCHAR(30)  -- Descripción de holding,
    NUMCOMPRO       VARCHAR(23)  -- Número de comprobante,
    NUMREFREM       INT  -- Número de referencia de la remesa,
    NUMREFFAC       VARCHAR(23)  -- Número referencia factura (universal),
    NUMREFFACREM    INT  -- Número referencia factura de la remesa,
    NUMEXTCOM       INT  -- Número de extracto de comercio,
    NUMMOVEXTCO     INT  -- Número de movimiento en el extracto de comercio,
    TIPFRAN         INT  -- Tipo de franquicia,
    DESTIPFRAN      VARCHAR(30)  -- Descripción tipo Franquicia,
    PAN             VARCHAR(22)  -- PAN de la tarjeta,
    INDNORCOR       INT  -- Indicador de normal o correctora: – Normal – Correctora,
    TIPOFAC         INT  -- Tipo de factura,
    DESTIPFAC       VARCHAR(30)  -- Descripción del tipo de factura,
    TIPOFACSIST     INT  -- Tipo de factura de sistema,
    SIGNO           VARCHAR(1)  -- Signo del importe (+/-),
    CLAMON          INT  -- Clave de moneda
);

-- Tabla502: El formato que corresponde al registro del fichero de salida sería (ATENVODC): Estructura del tipo de registro de operaciones recibidas en el día. Tipo de registro ‘OP’:
CREATE TABLE Tabla502 (
    DESCLAMON       VARCHAR(30)  -- Descripción de la moneda,
    CODTIPC         VARCHAR(4)  -- Código de operación en cuotas,
    DESTIPC         VARCHAR(30)  -- Descripción de tipo de compra en cuotas,
    TOTCUOTAS       INT  -- Número total de cuotas (abonos al comercio),
    NUMCUOTACT      INT  -- *campo para uso futuro*,
    NUMABONOS       INT  -- Numero de abonos,
    CODMAR          INT  -- Marca de la tarjeta,
    DESCODMAR       VARCHAR(30)  -- Descripción de la marca de la tarjeta,
    INDTIPT         INT  -- Tipo de la tarjeta,
    DESINDTIPT      VARCHAR(30)  -- Descripción del tipo de la tarjeta,
    INDDEBCRE       INT  -- Indicador de Tipo Operación: – Crédito – Débito – Prepago Monedero – Prepago Regalo – Prepago,
    INDPLAZOS       VARCHAR(1)  -- Indicador de plazos,
    TASADESC        DECIMAL(7, 4)  -- Tasa de Descuento Aplicada al Comercio,
    FECLIQ          UNKNOWN  -- Fecha de Liquidación/Fecha de proceso,
    FECPAGO         UNKNOWN  -- Fecha de Pago,
    FECFAC          UNKNOWN  -- Fecha de Factura,
    NUMAUT          VARCHAR(6)  -- Número de autorización,
    SECOPE          NUMERIC(12)  -- Secuencial Interno de operación,
    IMPDESFAC       DECIMAL(17, 2)  -- Importe descuento de la factura,
    IMPBONFAC       DECIMAL(17, 2)  -- Importe bonificado de la factura,
    IMPIMPTOFAC     DECIMAL(17, 2)  -- Impuesto de la factura,
    IMPPROPINAFAC   DECIMAL(17, 2)  -- Propina de la factura,
    IMPLIQFAC       DECIMAL(17, 2)  -- Importe intercambio de la factura,
    IMPCUOFAC       DECIMAL(17, 2)  -- Importe de la cuota de la factura,
    IMPEXTFAC       DECIMAL(17, 2)  -- Impuesto del extracto de la factura,
    IMPFACFAC       DECIMAL(17, 2)  -- Importe de la factura,
    IMPTASASFAC     DECIMAL(17, 6)  -- Importe de tasas de la factura,
    CODTERM         VARCHAR(16)  -- Código de Terminal,
    FECCONTA        UNKNOWN  -- Fecha Contable,
    SIAIDCD         VARCHAR(4)  -- Identificación de la Autorización,
    INDERROR        VARCHAR(16)  -- Indicador de error Tarjeta Ajena. Error de operatividad de la tarjeta Fecha de factura mayor o igual que la fecha de baja de tarjeta
);

-- Tabla503: Estructura del tipo de registro de operaciones recibidas en el día. Tipo de registro ‘OP’:
CREATE TABLE Tabla503 (
    INDANOM         VARCHAR(8)  -- Indicador de anomalía Excedido plazo de presentación Cuenta de tarjeta bloqueada ABONO Cuenta de tarjeta bloqueada pero la operación está autorizada Tarjeta propia caducada Tarjeta propia robada o perdida pero la operación es de ABONO Situación tarjeta No permitida pero la operación es de ABONO a 8 Libres,
    INDSITREM       VARCHAR(1)  -- Situación de la Remesa,
    DESSITREM       VARCHAR(30)  -- Descripción de la Situación de la Remesa,
    INDOPDCC        VARCHAR(1)  -- Indicador de si es operación DCC (S/N),
    FECBAJA         UNKNOWN  -- Fecha de Baja de las operaciones
);

-- Tabla504: Estructura del tipo de registro de operaciones recibidas en el día. Tipo de registro ‘OP’: Estructura del tipo de registro de conceptos económicos en el día. Tipo de registro ‘CE’:
CREATE TABLE Tabla504 (
    NUMEXTCOM       INT  -- Número de extracto de comercio,
    NUMMOVEXTCO     INT  -- Número de movimiento en el extracto de comercio,
    NUMREFREM       INT  -- Número de referencia de la remesa,
    NUMREFFACREM    INT  -- Número de referencia de la factura,
    CODCONECO       INT  -- Código de concepto económico
);

-- Tabla505: Estructura del tipo de registro de conceptos económicos en el día. Tipo de registro ‘CE’:
CREATE TABLE Tabla505 (
    DESCONECO       VARCHAR(30)  -- Descripción Concepto Económico,
    TIPIMP          INT  -- Tipo de importe: 02 – Comisiones 04 – Impuestos,
    SIGNO           VARCHAR(1)  -- Signo del importe,
    CLAMON          INT  -- Clave de Moneda,
    IMPAPLECO       DECIMAL(17, 2)  -- Importe base de calculo,
    PRAPLECO        DECIMAL(7, 2)  -- Porcentaje de calculo,
    IMPCONCEP       DECIMAL(17, 2)  -- Importe del concepto,
    IMPIMPTO        DECIMAL(17, 2)  -- Importe del impuesto,
    INDENVPAS       VARCHAR(1)  -- Indicador de enviado a pasivo S- Enviado N- No enviado T- Traspasado
);

-- Tabla506: Estructura del tipo de registro de conceptos económicos en el día. Tipo de registro ‘CE’: Estructura del tipo de registro de autorizaciones pendientes de cruce. Tipo de registro ‘AU’:
CREATE TABLE Tabla506 (
    TIPOMSGON       VARCHAR(4)  -- Código de mensaje on-line,
    CODPROON        INT  -- Código de proceso on-line,
    SIAIDCD         VARCHAR(19)  -- Código de identificación SIA compuesto de la sesión SIA y del identificador del mensaje,
    PAN             VARCHAR(22)  -- PAN de la tarjeta que realizó la operación,
    CODMAR          INT  -- Código de marca de tarjeta,
    DESCODMAR       VARCHAR(30)  -- Descripción de Marca,
    INDTIPT         INT  -- Indicador de tipo de tarjeta,
    DESINDTIPT      VARCHAR(30)  -- Descripción de Tipo de tarjeta,
    INDDEBCRE       INT  -- Indicador de operatividad de la operación: – Crédito – Débito – Prepago Regalo – Prepago,
    IMPTRN          DECIMAL(17, 2)  -- Importe de la transacción
);

-- Tabla507: Estructura del tipo de registro de autorizaciones pendientes de cruce. Tipo de registro ‘AU’:
CREATE TABLE Tabla507 (
    CLAMONTRN       INT  -- Código de moneda de la transacción,
    DESCLAMONTRN    VARCHAR(30)  -- Descripción moneda de la transacción,
    IMPCCA          DECIMAL(17, 2)  -- Importe de conciliación,
    CLAMONCCA       INT  -- Código de moneda de conciliación,
    DESCLAMONCCA    VARCHAR(30)  -- Descripción moneda de conciliación,
    IMPDIV          DECIMAL(17, 2)  -- Importe en divisa original,
    CLAMONDIV       INT  -- Código de moneda de la divisa original,
    DESCLAMONDIV    VARCHAR(30)  -- Descripción moneda de la divisa original,
    FECTRN          UNKNOWN  -- Fecha de la transacción,
    HORTRN          UNKNOWN  -- Hora de la transacción,
    CODACT          INT  -- Código de actividad,
    DESACT          VARCHAR(30)  -- Descripción de la actividad,
    CODPAIS         INT  -- Código del país,
    DESPAIS         VARCHAR(30)  -- Descripción del País,
    IDADQUIR        VARCHAR(11)  -- Identificador de adquirente,
    IDTERM          VARCHAR(16)  -- Identificador del terminal,
    CODCOM          VARCHAR(15)  -- Código de comercio,
    NOMCOM          VARCHAR(25)  -- Nombre del establecimiento,
    LOCALIDAD       VARCHAR(15)  -- Localidad del comercio,
    RTSITD          VARCHAR(40)  -- Clave de franquicia,
    DATORI          VARCHAR(30)  -- Datos del origen.,
    NUMAUT          VARCHAR(6)  -- Número de autorización,
    CODRESPU        VARCHAR(3)  -- Código respuesta,
    CODACCRED       INT  -- Código de acción de red,
    TIPFRAN         INT  -- Código de la franquicia,
    DESTIPFRAN      VARCHAR(30)  -- Descripción Franquicia,
    INDNORCOR       INT  -- Indicador de normal o correctora: 0 - Normal
);

-- Tabla508: Estructura del tipo de registro de autorizaciones pendientes de cruce. Tipo de registro ‘AU’:
CREATE TABLE Tabla508 (
    TIPOFAC         INT  -- Tipo de factura,
    DESTIPFAC       VARCHAR(30)  -- Descripción Factura,
    TIPOFACSIST     INT  -- Tipo de factura de sistema,
    SIGNO           VARCHAR(1)  -- Signo del importe (+/-),
    INDPREAUT       INT  -- Indicador de pre-autorización: 0 - Normal 1 - Pre-autorización 2 - Pre-autorización confirmada 3 - Confirmación de la pre-autorización,
    INDCRUCE        INT  -- Indicativo de cruce: – No cruzada – Cruzada – Expirada – Cruzada manual – Cruzada manual y cruzada – Cruzada manual y expirada – Contable – Comunicación contable errónea,
    INDANUL         INT  -- Indicativo de anulación - Transacción sin anular - Transacción anulada,
    IMPTRNCON       DECIMAL(17, 2)  -- Importe transacción en moneda del contrato,
    IMPAUTCON       DECIMAL(17, 2)  -- Importe total autorizado en moneda del contrato,
    CLAMONCON       INT  -- Clave de moneda del contrato,
    DESCLAMONCON    VARCHAR(30)  -- Descripción Moneda,
    FECCONTA        UNKNOWN  -- Fecha contable,
    IMPPROP         DECIMAL(17, 2)  -- Importe de la propina,
    ACCMERCH        VARCHAR(1)  -- Acción de evento Merchant: - No acción - Grabar operación en remesas + actualización saldos – Actualización de saldos del comercio 5 – Remesar en conciliación
);

-- Tabla509: Estructura del tipo de registro de autorizaciones pendientes de cruce. Tipo de registro ‘AU’:
CREATE TABLE Tabla509 (
    FECCADTAR       INT  -- Fecha de caducidad de la tarjeta,
    RESOLUTOR       VARCHAR(11)  -- Identificador de la red o elemento SWITCH que autorizó la operación.,
    IMPCOMISION     DECIMAL(17, 2)  -- Comisión de la operación,
    IMPUESTO        DECIMAL(17, 2)  -- Impuesto de la operación,
    MODENTDAT       VARCHAR(12)  -- Modo de Entrada de Datos,
    NUMCUOTA        INT  -- Numero de cuotas,
    CODTIPC         VARCHAR(4)  -- Tipo de compra en cuotas,
    DESTIPC         VARCHAR(30)  -- Descripción tipo de compra en cuotas
);

-- Tabla510: Estructura del tipo de registro de plazos pendientes. Tipo de registro ‘PP’:
CREATE TABLE Tabla510 (
    NUMREFREM       INT  -- Numero de referencia de la remesa,
    NUMREFFACREM    INT  -- Numero de referencia de la factura,
    NUMPLAZO        INT  -- Número de plazo,
    CLAMON          INT  -- Clave de moneda,
    SIGNO           VARCHAR(1)  -- Signo del importe de Liquidación. Valores ‘+’, ‘-‘,
    FECPROABO       VARCHAR(10)  -- Fecha próximo Abono,
    IMPLIQUID       DECIMAL(17, 2)  -- Importe liquidación,
    IMPFAC          DECIMAL(17, 2)  -- Importe total de la factura,
    IMPSTO          DECIMAL(17, 2)  -- Importe del impuesto,
    IMPDES          DECIMAL(17, 2)  -- Importe del descuento,
    IMPBON          DECIMAL(17, 2)  -- Importe bonificación del descuento,
    IMPPROPINA      DECIMAL(17, 2)  -- Importe de la propina,
    IMPEXT          DECIMAL(17, 2)  -- Impuesto externo,
    IMPTASA         DECIMAL(17, 2)  -- Importe de la tasa fija,
    ESTPLAZO        INT  -- Estado del plazo: 01 – Pendiente 02 – Abonado 04 – Acelerado
);

-- Tabla511: Estructura del tipo de registro de plazos pendientes. Tipo de registro ‘PP’: Estructura del tipo de registro de conceptos económicos de plazos pendientes. Tipo de registro ‘CP’:
CREATE TABLE Tabla511 (
    NUMREFREM       INT  -- Numero de referencia de la remesa,
    NUMREFFACREM    INT  -- Numero de referencia de la factura,
    NUMPLAZO        INT  -- Número de plazo,
    CODCONECO       INT  -- Código de concepto económico,
    DESCONECO       VARCHAR(30)  -- Descripción Concepto Económico,
    TIPIMP          INT  -- Tipo de importe: 02 – Comisiones 04 – Impuestos,
    SIGNO           VARCHAR(1)  -- Signo del importe,
    CLAMON          INT  -- Clave de Moneda,
    IMPAPLECO       DECIMAL(17, 2)  -- Importe sobre el que se aplica el concepto económico,
    PRAPLECO        DECIMAL(7, 4)  -- Porcentaje aplicado sobre el concepto económico,
    IMPCONCEP       DECIMAL(17, 2)  -- Importe del concepto,
    IMPIMPTO        DECIMAL(17, 2)  -- Importe de impuesto
);

-- Tabla512: El formato que corresponde al registro de detalle del fichero de salida sería (ATCONEXT):
CREATE TABLE Tabla512 (
    DATOS_GENERALES_OBLIGATORIOS UNKNOWN  -- DATOS GENERALES OBLIGATORIOS,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CODGRU          INT  -- CÓDIGO DE GRUPO CONTABLE 01 = FRANQUICIAS. ENTRADA 02 = INCOMING 03 = COMERCIOS 04 = INCIDENCIAS 05 = TITULARES 06 = OPERACIONES DIARIAS 07 = COMPRA EN CUOTAS 08 = IMPAGADOS 09 = LIQUIDACIÓN 10 = MAESTRO DE RECIBOS 11 = OUTGOING 12 = FRANQUICIAS. SALIDA 27 = Contabilidad Externa,
    CODCCN          INT  -- CONCEPTO CONTABLE,
    IMPORTE         DECIMAL(17, 2)  -- IMPORTE,
    CLAMON          INT  -- CLAVE DE MONEDA,
    FECALTA         UNKNOWN  -- FECHA GRABACIÓN DEL REGISTRO,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE (AAAA-MM- DD),
    FECOPER         UNKNOWN  -- FECHA DE LA OPERACIÓN (AAAA-MM-DD),
    DATOS_GENERALES_NO_OBLIGATORIOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_ UNKNOWN  -- DATOS GENERALES NO OBLIGATORIOS (INFORMAR SI EL PGM DISPONE DE ELLOS),
    IMPORI          DECIMAL(17, 2)  -- IMPORTE ORIGINAL DE LA OPERACIÓN,
    CLAMONORI       INT  -- CLAVE MONEDA ORIGINAL
);

-- Tabla513: El formato que corresponde al registro de detalle del fichero de salida sería (ATCONEXT):
CREATE TABLE Tabla513 (
    CMBAPLIORI      DECIMAL(9, 4)  -- CAMBIO APLICADO PASO DE MONEDA,
    IMPEMI          DECIMAL(17, 2)  -- IMPORTE RECEPCIÓN DE LA OPERACIÓN,
    CLAMONEMI       INT  -- CLAVE MONEDA EMISOR,
    CMBAPLIEMI      DECIMAL(9, 4)  -- CAMBIO APLICADO PASO DE MONEDA EMISOR,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA: NORMAL CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA,
    INDAPLDEBCRE    INT  -- INDICADOR DE OPERATIVIDAD DE LA TARJETA 1 – Crédito 2 – Débito 3 – Mixta 4- Monedero 5- Prepago banda,
    CODACT          INT  -- CÓDIGO ACTIVIDAD ISO,
    CODCONECO       INT  -- CÓDIGO DE CONCEPTO ECONÓMICO,
    SECOPE          NUMERIC(12)  -- SECUENCIA DE LA OPERACIÓN,
    OFIOPE          VARCHAR(4)  -- OFICINA QUE GENERA LA OPERACIÓN,
    IDTERM          VARCHAR(16)  -- IDENTIFICADOR DE TERMINAL,
    IDENTIFICADOR_DE_LA_OPERACI_N__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS_SEG_N_SUBSISTEMA_ UNKNOWN  -- IDENTIFICADOR DE LA OPERACIÓN (INFORMAR SI EL PGM DISPONE DE ELLOS SEGÚN SUBSISTEMA),
    SIAIDCD         VARCHAR(19)  -- CÓDIGO IDENTIFICACIÓN DE SIA,
    NUMCINTA        NUMERIC(17)  -- NÚMERO DE CINTA,
    SECLOTE         INT  -- LOTE DENTRO DE LA CINTA,
    CENTALTA        VARCHAR(4)  -- CENTRO ALTA CUENTA TARJETA
);

-- Tabla514: El formato que corresponde al registro de detalle del fichero de salida sería (ATCONEXT):
CREATE TABLE Tabla514 (
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO DE CRÉDITO,
    NUMMOV          INT  -- NÚMERO MOVIMIENTO CRÉDITO O DÉBITO,
    NUMOPECUO       INT  -- NÚMERO OPERACIÓN EN CUOTAS,
    FECINI          UNKNOWN  -- FECHA INICIO,
    FECFIN          UNKNOWN  -- FECHA FIN,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    CENTALTACOM     VARCHAR(4)  -- ALTA CONTRATO COMERCIO,
    CUENTACOM       VARCHAR(12)  -- CONTRATO COMERCIO,
    NUMEXTCOM       INT  -- NÚMERO EXTRACTO COMERCIO,
    NUMMOVEXTCO     INT  -- NÚMERO MOVIMIENTO EXTRACTO COMERCIO,
    NUMREFREM       INT  -- NÚMERO REFERENCIA REMESA,
    NUMREFFACREM    INT  -- NÚMERO REFERENCIA DE LA FACTURA,
    NUMINC          INT  -- NÚMERO INCIDENCIA,
    NUMSECREC       NUMERIC(15)  -- NÚMERO SECUENCIA DE RECIBO,
    NUMSECIMP       NUMERIC(15)  -- NÚMERO SECUENCIA DE RECIBO IMPAGADO,
    DATOS_DE_TRAMA_CONTABLE_Y_ESTAD_STICOS__INFORMAR_SI_EL_PGM_DISPONE_DE_ELLOS__CONTABILIDAD_INFORMAR__LOS_NECESARIOS_PARA_TRADUCCI_N_CONTABLE_ UNKNOWN  -- DATOS DE TRAMA CONTABLE Y ESTADÍSTICOS (INFORMAR SI EL PGM DISPONE DE ELLOS. CONTABILIDAD INFORMARÁ LOS NECESARIOS PARA TRADUCCIÓN CONTABLE),
    CODMAR          INT  -- CÓDIGO MARCA DE TARJETA,
    INDTIPT         INT  -- INDICADOR TIPO DE TARJETA,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO
);

-- Tabla515: El formato que corresponde al registro de detalle del fichero de salida sería (ATCONEXT):
CREATE TABLE Tabla515 (
    VERTIENTE       VARCHAR(1)  -- INDICADOR DE VERTIENTE,
    CONPROD         VARCHAR(3)  -- CONDICIÓN ECONÓMICA,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    CODRAZON        INT  -- CÓDIGO DE RAZÓN,
    TIPOREM         VARCHAR(1)  -- TIPO DE REMESA,
    CODESTCTA       INT  -- CÓDIGO ESTADO DE CUENTA DE TARJETA,
    CODPAIS         INT  -- CÓDIGO DE PAÍS,
    TIPOCLI         VARCHAR(4)  -- TIPO DE CLIENTE,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN DE OPERACIÓN,
    PROGRAMA        VARCHAR(8)  -- NOMBRE DE PROGRAMA,
    DATOS_CONTABLES__SE_INFORMARAN_EN_LOS_PROCESOS_CONTABLES_ UNKNOWN  -- DATOS CONTABLES (SE INFORMARAN EN LOS PROCESOS CONTABLES),
    IMPCON          DECIMAL(17, 2)  -- IMPORTE EN MONEDA CONTABLE,
    CLAMONCON       INT  -- CLAVE MONEDA CONTABLE,
    CMBAPLI         DECIMAL(9, 4)  -- CAMBIO APLICADO,
    CUENTADEBE      INT  -- CUENTA SAT DEBE,
    CUENTAHABER     INT  -- CUENTA SAT HABER,
    OFIIMPDEB       VARCHAR(4)  -- OFICINA IMPUTACIÓN DEBE,
    OFIIMPHAB       VARCHAR(4)  -- OFICINA IMPUTACIÓN HABER,
    INDNACINT       INT  -- INDICADOR OPERADOR NACIONAL INTERNACIONAL,
    NUMOPER         INT  -- NÚMERO DE REGISTROS QUE COMPONEN LA TOTALIZACIÓN DE CONCEPTOS,
    SIGNO           VARCHAR(1)  -- SIGNO DEL REGISTRO CONTABLE (SIGNO DEL TIPO DE FACTURA O INDICADOR DE NORMAL / CORRECTORA)
);

-- Tabla516
CREATE TABLE Tabla516 (
    DATOS_DE_L_NEA  UNKNOWN  -- DATOS DE LÍNEA,
    LINREF          INT  -- REFERENCIA DE TIPO DE LÍNEA,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    CLASIFEXT       VARCHAR(1)  -- CLASIFICACIÓN EXTERNA,
    FILLER          VARCHAR(4),
    DATOS_REGISTRO_ORIGINAL_RED_FRANQUICIA UNKNOWN  -- DATOS REGISTRO ORIGINAL RED-FRANQUICIA,
    REGORI          VARCHAR(2488)  -- REGISTRO ORIGINAL CON EL QUE SE GENERA EL CONCEPTO CONTABLE
);

-- Tabla517: Programa ATB116: Enriquecimiento de las operaciones de comercio propio con datos de la estructura comercial. Programa ATB110: Obtiene las autorizaciones expiradas de compra por puntos. Programa ATB117: Formatea los registros de detalle y genera la cinta.
CREATE TABLE Tabla517 (
    DATOS_COMUNES   UNKNOWN  -- DATOS COMUNES,
    TIPOREGI        VARCHAR(1)  -- Identifica el tipo de registro para que sea tratado por los procesos. En este caso llevará el valor fijo C. (C=Cabecera y D=Detalle),
    CODENTID        VARCHAR(8)  -- Código de Entidad.,
    CODCINTA        VARCHAR(2)  -- Código de Cinta. En este caso llevará el valor fijo ‘01’,
    NUMSECUE        INT  -- Número de secuencia de cinta.,
    REGISTRO_DE_CABECERA UNKNOWN  -- REGISTRO DE CABECERA,
    NUMTOTRE        INT  -- Número total de Registros recibidos en el Detalle.,
    FECENVIO        VARCHAR(8)  -- Fecha de Envío de la cinta. Formato AAAAMMDD,
    HORAENVI        VARCHAR(8)  -- Hora envío de la cinta. Formato HH:MM:SS,
    FILLER          VARCHAR(2048)  -- Campo libre,
    REGISTRO_DE_DETALLE UNKNOWN  -- REGISTRO DE DETALLE
);

-- Tabla518
CREATE TABLE Tabla518 (
    NUMSEREG        INT  -- Número secuencial de registros. El sistema entenderá que los registros con un número menor han sucedido antes en tiempo.,
    CODAPLIC        VARCHAR(8)  -- Código de Aplicación. Llevará el valor “SAT”,
    APLICPET        VARCHAR(8)  -- Código aplicación origen de la petición. Valor SAT (tiene que ser el mismo valor que van a enviar en la compra con puntos en línea.,
    CODTRANS        VARCHAR(19)  -- Código único de transacción.,
    INDANULAC       VARCHAR(2)  -- Indicador de anulación.,
    IDTRAORI        VARCHAR(19)  -- Identificador de transacción original.,
    CODEVENT        VARCHAR(8)  -- Código de Evento. Llevará el valor “OPDIARIA”,
    EDETALLE        VARCHAR(2000)  -- Registro compuesto por los campos de las operaciones. Detallado a continuación
);

-- Tabla519: El formato que corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla519 (
    CODENTID        VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CUENTA_SFC      UNKNOWN  -- CUENTA SFC,
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DE TARJETA,
    RESTO           UNKNOWN  -- RESTO,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA (Ofuscado),
    CLAMON          INT  -- CLAVE DE MONEDA,
    INDNORCOR       INT  -- INDICADOR DE NORMAL O CORRECTORA,
    TIPOFAC         INT  -- TIPO DE FACTURA
);

-- Tabla520: El formato que corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla520 (
    FECFAC          UNKNOWN  -- FECHA DE LA FACTURA,
    CLAMONDIV       INT  -- CÓDIGO DE MONEDA DE LA OPERACIÓN ORIGINAL O DIVISA,
    SIGNODIV        VARCHAR(1)  -- SIGNO DEL IMPORTE EN DIVISA ORIGINAL(+/-),
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE EN DIVISA ORIGINAL,
    SIGNOFAC        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA FACTURA(+/-),
    IMPFAC          DECIMAL(17, 2)  -- IMPORTE DE LA FACTURA,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE COMERCIO REDUCIDO,
    CODACT          INT  -- CÓDIGO DE ACTIVIDAD,
    FECPROCES       UNKNOWN  -- FECHA DE PROCESO O ENTRADA DE LA OPERACIÓN AL SISTEMA,
    CODPAIS         INT  -- CÓDIGO DEL PAÍS,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DONDE SE REALIZÓ LA OPERACIÓN,
    FECCONTA        UNKNOWN  -- FECHA CONTABLE OPERACIÓN,
    ORIGENOPE       VARCHAR(4)  -- ORIGEN OPERACIÓN,
    TIPFRAN         INT  -- TIPO DE FRANQUICIA,
    SESIONRED       VARCHAR(12)  -- SESIÓN DE LA RED,
    SECOPE          NUMERIC(12)  -- SECUENCIA DE OPERACIÓN DENTRO DE LA FRANQUICIA O RED,
    SIAIDCD         VARCHAR(19)  -- CÓDIGO DE IDENTIFICACIÓN SIA. ESTÁ COMPUESTO DE LA SESIÓN DE SIA Y DEL IDENTIFICADOR DEL MENSAJE.,
    TIPDOCPAG       INT  -- TIPO DE DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A CEROS)
);

-- Tabla521: El formato que corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla521 (
    REFDOCPAG       VARCHAR(20)  -- REFERENCIA DEL DOCUMENTO PARA MOVIMIENTOS DE PAGO (PARA MOVIMIENTOS DE DÉBITO IRA A BLANCOS),
    NUMMOVEXT       INT  -- NÚMERO DE MOVIMIENTO EN EL EXTRACTO,
    NUMEXTCTA       INT  -- NÚMERO DE EXTRACTO,
    NUMMOVDEB       INT  -- NÚMERO DE MOVIMIENTO DE DÉBITO,
    IDENTCLI        VARCHAR(8)  -- NÚMERO ÚNICO DE PERSONA,
    INDINCEST       VARCHAR(1)  -- INDICADOR DE INCIDENCIA EN ESTUDIO ‘S’ – SI ‘N’ – NO,
    INDMOVANU       INT  -- INDICADOR DE MOVIMIENTO ANULADO,
    INDRET          INT  -- INDICADOR DE MOVIMIENTO RETENIDO,
    INDMOVEXT       INT  -- INDICADOR DE MOVIMIENTO EXTRACTADO,
    CODTIPC         VARCHAR(4)  -- CÓDIGO DE TIPO DE COMPRA EN CUOTAS,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    PORINT          DECIMAL(7, 4)  -- PORCENTAJE DE INTERÉS APLICADO,
    NUMOPECUO       INT  -- NÚMERO DE OPERACIÓN EN COMPRA EN CUOTAS,
    SIGNOCUO        VARCHAR(1)  -- SIGNO DEL IMPORTE DE LA CUOTA(+/-),
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    INDDEBCRE       INT  -- INDICADOR DE DÉBITO O CRÉDITO.,
    TIPOLIN         VARCHAR(4)  -- TIPO DE LÍNEA,
    FORPAGO         INT  -- FORMA DE PAGO DE LA OPERACIÓN
);

-- Tabla522: El formato que corresponde al campo EDETALLE fichero de salida sería (ATOPDSFC):
CREATE TABLE Tabla522 (
    LINREF          VARCHAR(8)  -- REFERENCIA DE LÍNEA ASOCIADA A LA CUENTA,
    NUMREFFAC       VARCHAR(23)  -- NÚMERO REFERENCIA FACTURA,
    CODESTCTA       INT  -- CÓDIGO DE ESTADO DEL CONTRATO DE TARJETA,
    FORPAGOC        INT  -- FORMA DE PAGO,
    PRODUCTO        VARCHAR(2)  -- CÓDIGO DE PRODUCTO,
    SUBPRODU        VARCHAR(4)  -- CÓDIGO DE SUBPRODUCTO,
    INDEMPRESA      VARCHAR(1)  -- INDICADOR CUENTA EMPRESA,
    INDEMPLEADO     VARCHAR(1)  -- INDICADOR DE EMPLEADO,
    CODHOLDING      VARCHAR(4)  -- CÓDIGO DE HOLDING AL QUE PERTENECE,
    CODCADENA       VARCHAR(3)  -- CÓDIGO DE LA CADENA,
    CODMAR          INT  -- CÓDIGO DE MARCA,
    INDTIPT         INT  -- TIPO DE TARJETA,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DEL CONTRATO,
    CLVTOKEN        VARCHAR(37)  -- CLAVE TOKEN,
    FHORATRANS      VARCHAR(14)  -- FECHA Y HORA TRANSACCION,
    FILLER          VARCHAR(1532)
);

-- Tabla523: Detalle de campos de los campos comunes En este apartado se describen los campos que compone el registro de detalle de la interfaz. Estructura común inicial para todos los tipos de registro (CCCALIFI).
CREATE TABLE Tabla523 (
    CODENT          VARCHAR(4)  -- CODIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA CUENTA DE TARJETA,
    CUENTA          VARCHAR(12)  -- CUENTA DEL CONTRATO DE TARJETA,
    TIPOREG         VARCHAR(2)  -- TIPO DE REGISTRO A DAR DE ALTA ‘CG’,
    FECALTA         UNKNOWN  -- FECHA DE ALTA DE CALIFICACIÓN CONTABLE,
    CALIFICACI_N    VARCHAR(1)  -- CALIFICACIÓN CONTABLE INFORMADA
);

-- Tabla524: Detalle de campos de los campos comunes En este apartado se describen los campos que compone el registro de detalle de la interfaz. Estructura común inicial para todos los tipos de registro (ATRNOTIF).
CREATE TABLE Tabla524 (
    CODENT          VARCHAR(4)  -- CÓDIGO DE ENTIDAD,
    CENTALTA        VARCHAR(4)  -- CENTRO DE ALTA,
    CUENTA          VARCHAR(12)  -- CÓDIGO DE LA CUENTA,
    NUMBENCTA       INT  -- NÚMERO DE BENEFICIARIO,
    IDENTCLI        VARCHAR(8)  -- IDENTIFICADOR DE CLIENTE,
    PAN             VARCHAR(22)  -- NÚMERO DE TARJETA (OFUSCADO),
    FECCADTAR       INT  -- FECHA DE CADUCIDAD,
    FECTRN          VARCHAR(10)  -- FECHA LOCAL DE LA OPERACIÓN,
    HORTRN          VARCHAR(8)  -- HORA LOCAL DE LA OPERACIÓN,
    FECPROCES       VARCHAR(10)  -- FECHA DE PROCESO,
    HORAPROCESO     VARCHAR(8)  -- HORA DE PROCESO,
    IMPTRN          DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA TITULAR,
    CLAMONTRN       INT  -- CODIGO ISO DE LA MONEDA TITULAR,
    IMPDIV          DECIMAL(17, 2)  -- IMPORTE DE LA TRANSACCIÓN EN MONEDA ORIGINAL,
    CLAMONDIV       INT  -- CODIGO ISO DE LA MONEDA TITULAR,
    TIPMEDIO        VARCHAR(2)  -- MEDIO DE COMUNICACIÓN,
    TIPMEDIODES     VARCHAR(30)  -- DESCRIPCIÓN DEL MEDIO DE COMUNICACIÓN,
    CODEVENT        INT  -- CÓDIGO DE EVENTO DE NOTIFICACIÓN,
    DESEVENT        VARCHAR(30)  -- DESCRIPCIÓN DEL EVENETO,
    DESEVENTRED     VARCHAR(10)  -- DESCRIPCIÓN REDUCIDA DEL EVENTO,
    REFDOC          VARCHAR(20)  -- DOCUMENTO DE REFERENCIA,
    NUMFINAN        INT  -- NÚMERO DE FINANCIACIÓN,
    PORINT          DECIMAL(3, 4)  -- PORCENTAJE DE INTERÉS MENSUAL,
    TAE             DECIMAL(3, 4)  -- Tae/cae
);

-- Tabla525: Estructura común inicial para todos los tipos de registro (ATRNOTIF).
CREATE TABLE Tabla525 (
    IMPINTTOTAL     DECIMAL(17, 2)  -- IMPORTE TOTAL DE INTERESES,
    IMPCUOTA        DECIMAL(17, 2)  -- IMPORTE DE LA CUOTA,
    TOTCUOTAS       INT  -- NÚMERO TOTAL DE CUOTAS,
    IMPCOMIS        DECIMAL(17, 2)  -- IMPORTE DE COMISIONES,
    FECALTCOMP      VARCHAR(10)  -- FECHA DE ALTA DE LA COMPRA A PLAZOS,
    FECPROCUO       VARCHAR(10)  -- FECHA DE PRÓXIMA CUOTA,
    IMPCOMAPE       DECIMAL(17, 2)  -- IMPORTE DE LA COMISIÓN DE APERTURA,
    LIMCRECTA       DECIMAL(17, 2)  -- LÍMITE DE CRÉDITO DE LA CUENTA,
    FORPAGO         INT  -- FORMA DE PAGO,
    IMPFPAGOA       DECIMAL(17, 2)  -- IMPORTE FIJO DE PAGO APLAZADO,
    PORPAGOA        DECIMAL(7, 4)  -- PORCENTAJE DE PAGO APLAZADO,
    IMPMINPAGOA     DECIMAL(17, 2)  -- IMPORTE MÍNIMO DE PAGO APLAZADO,
    CODCOM          VARCHAR(15)  -- CÓDIGO DE COMERCIO,
    NOMCOMRED       VARCHAR(27)  -- NOMBRE DE COMERCIO,
    NOMPOB          VARCHAR(26)  -- POBLACIÓN DEL COMERCIO,
    CODPAIS         INT  -- PAÍS DEL COMERCIO,
    NUMSECHIS       NUMERIC(15)  -- SECUENCIAL DE NOTIFICACIÓN,
    CODPUBLI        VARCHAR(10)  -- CÓDIGO DE PUBLICIDAD,
    CODNOTIF        VARCHAR(10)  -- CÓDIGO DE NOTIFICACIÓN,
    FECCAR          VARCHAR(10)  -- FECHA DE CARGO,
    IMPCARGO        DECIMAL(17, 2)  -- IMPORTE DEL VARGO
);

-- Tabla526: A continuación, se muestran los valores posibles que puede tomar el campo ORIGEN y que serán utilizados en varias interfaces de la aplicación. Formato y valores del campo ORIGEN (ATORIGEN):
CREATE TABLE Tabla526 (
    ORIGEN__OPE     VARCHAR(4)  -- ORIGEN-CAPTURA VALOR 'TPVS'. ORIGEN-INCOMING VALOR 'INCO'.
);

-- Tabla527: A continuación, se muestran los valores posibles que puede tomar el campo ORIGEN y que serán utilizados en varias interfaces de la aplicación. Formato y valores del campo ORIGEN (ATORIGEN):
CREATE TABLE Tabla527 (
    VALOR__ORIGEN__OPE INT  -- VALOR-REMESAS VALOR 01. VALOR-INCOMING VALOR 04.
);

-- ERROR: No se pudieron procesar las columnas de Tabla528

-- ERROR: No se pudieron procesar las columnas de Tabla529

-- ERROR: No se pudieron procesar las columnas de Tabla530

-- ERROR: No se pudieron procesar las columnas de Tabla531

-- ERROR: No se pudieron procesar las columnas de Tabla532

-- ERROR: No se pudieron procesar las columnas de Tabla533

-- ERROR: No se pudieron procesar las columnas de Tabla534

-- ERROR: No se pudieron procesar las columnas de Tabla535

-- ERROR: No se pudieron procesar las columnas de Tabla536

-- ERROR: No se pudieron procesar las columnas de Tabla537

-- ERROR: No se pudieron procesar las columnas de Tabla538

-- ERROR: No se pudieron procesar las columnas de Tabla539

-- ERROR: No se pudieron procesar las columnas de Tabla540

-- ERROR: No se pudieron procesar las columnas de Tabla541

-- ERROR: No se pudieron procesar las columnas de Tabla542

-- ERROR: No se pudieron procesar las columnas de Tabla543

-- ERROR: No se pudieron procesar las columnas de Tabla544

-- ERROR: No se pudieron procesar las columnas de Tabla545

-- ERROR: No se pudieron procesar las columnas de Tabla546

-- ERROR: No se pudieron procesar las columnas de Tabla547

-- ERROR: No se pudieron procesar las columnas de Tabla548

-- ERROR: No se pudieron procesar las columnas de Tabla549

-- Tabla550: A continuación, se muestran los valores posibles que puede tomar el campo CODPRO (Código de procedencia SAT de los cargos / abonos para comunicar a cuentas de pasivo) y que serán utilizados en varias interfaces de la aplicación. Formato y valores del campo CODPRO (ATCODPRO):
CREATE TABLE Tabla550 (
    ATCODPRO__CODPRO INT  -- NOMINAL-REMESA VALOR 10. AJUS-AUTO-EXPI VALOR 15.
);

-- Tabla551: A continuación, se muestran los valores posibles que puede tomar el campo CODPRO (Código de procedencia SAT de los cargos / abonos para comunicar a cuentas de pasivo) y que serán utilizados en varias interfaces de la aplicación. Formato y valores del campo CODPRO (ATCODPRO):
CREATE TABLE Tabla551 (
    -- No se encontraron columnas válidas
);

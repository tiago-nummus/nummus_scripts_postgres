-- Dados do cliente: 3470773    1247    SANTO CONGELADO 3   ARLETE BARBO MICHALUAT  ARLETE BARBO MICHALUAT  ARLETE  05101845884 05101845884 11983352969 11983352969     arlete@uol.com.br   arlete@uol.com.br


-- AJUSTAR SALDO DE CLIENTE NA EMPRESA
SELECT reset_balance('', '');


-- CONSULTAR O VALOR CORRETO DO SALDO DO CLIENTE NA EMPRESA
SELECT amount_customer('', '', FALSE)


SELECT b.*
FROM balance b
WHERE idcompany = ''
AND idcustomer = ''


-- DADOS DA EMPRESA E INTEGRAÇÃO
SELECT *
FROM empresas e
WHERE e.fantasia ILIKE '%%'
OR e.id = '0'
ORDER BY
e.fantasia ASC;


SELECT ew.*
FROM empresas_webhooks ew
WHERE ew.empresa_id = '';


-- ENCONTRAR UM CUPOM
SELECT *
FROM cupom_ecommerce_cliente cec
WHERE cec.codigo_cupom ILIKE '%%';


-- CONSULTAR REGISTROS DE CUPONS DO CLIENTE
SELECT *
FROM cupom_ecommerce_cliente cec
WHERE cec.cliente_id = ''
ORDER BY cec.UPDATED_AT ASC; 

-- CADASTRO ECOM CLIENTE
SELECT *
FROM cliente_ecommerce ce
WHERE ce.cliente_id = '';


-- ENCONTRAR CADASTRO DO CLIENTE_ECOMMERCE NA NUMMUS
SELECT *
FROM cliente_ecommerce ce
WHERE ce.cliente_ecommerce_id = ''


-- PARA CONSULTA/EDIÇÃO DOS REGISTROS;
-- ENCONTRAR PEDIDO COM CASHBACK DO CLIENTE
SELECT c.*
FROM cashbacks c
WHERE c.empresa_id = ''
AND c.cliente_id = ''
AND c.ecommerce_pedido_id = encode(
''::bytea, 'base64'
)

SELECT ci.*
FROM cashback_items ci
WHERE ci.cashback_id IN (
SELECT c.id
FROM CASHBACKS C
WHERE c.empresa_id = ''
AND c.ecommerce_pedido_id = encode(
''::bytea, 'base64'
)
)
ORDER BY
ci.created_at DESC;


-- ENCONTRAR TODOS OS CASHBACK DO CLIENTE
SELECT c.*
FROM cashbacks c
WHERE c.empresa_id = ''
AND c.cliente_id = ''
AND c.id = ''
AND c.dh_lancamento::date = ''
ORDER BY
c.created_at DESC;


-- CONSULTA DE TODOS OS ITENS DE CASHBACK DO CLIENTE
SELECT ci.*
FROM cashback_items ci
WHERE ci.cashback_id IN (
SELECT c.id
FROM cashbacks c
WHERE c.empresa_id = ''
AND c.cliente_id = ''
AND c.id = ''
)
--AND ci.VALUE_RESGATADO > ci.VALOR_CASHBACK
ORDER BY
    ci.created_at DESC;


SELECT b.*
FROM balance b
WHERE b.idcustomer = ''


-- ENCONTRAR REGISTROS DE MARKETING DAS TRANSAÇÕES
SELECT cm.*
FROM cashback_marketing cm
WHERE cm.id_cashback IN (
SELECT c.id
FROM cashbacks c
WHERE c.empresa_id = ''
AND c.cliente_id = ''
ORDER BY
c.dh_lancamento DESC
)
;


-- ENCONTRAR RESGATES REALIZADOS
SELECT r.*
FROM resgates r
WHERE r.cashback_resgatado_id IN (
SELECT c.id
FROM cashbacks c
WHERE c.cliente_id = ''
AND c.empresa_id = ''
AND c.id = ''
ORDER BY
c.dh_lancamento ASC
)
OR r.cashback_origin_id IN (
SELECT c.id
FROM cashbacks c
WHERE c.cliente_id = ''
AND c.empresa_id = ''
AND c.id = ''
ORDER BY
c.dh_lancamento ASC
)
;
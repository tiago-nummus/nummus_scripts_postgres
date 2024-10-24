-- Dados do cliente:

-- DADOS DA EMPRESA E INTEGRAÇÃO
SELECT *
FROM empresas e
WHERE e.fantasia ilike '%%'
--    OR e.id = '0'
   or e.database = ''
ORDER BY e.fantasia;

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
ORDER BY cec.UPDATED_AT DESC;

-- ENCONTRAR CADASTRO DO CLIENTE_ECOMMERCE NA NUMMUS
SELECT *
FROM cliente_ecommerce ce
WHERE ce.cliente_id = '';

-- PARA CONSULTA/EDIÇÃO DOS REGISTROS;
-- ENCONTRAR PEDIDO PELO CÓDIGO ECOMMERCE
select c.*
from cashbacks c
where c.ecommerce_pedido_id = encode(
        ''::bytea, 'base64');


-- ENCONTRAR TODOS OS CASHBACK DO CLIENTE

SELECT c.*
FROM cashbacks c
WHERE c.empresa_id = ''
  AND c.cliente_id = ''
  and c.id = ''
ORDER BY c.created_at DESC;

-- CONSULTA DE TODOS OS ITENS DE CASHBACK DO CLIENTE
SELECT ci.*
FROM cashback_items ci
WHERE ci.cashback_id IN (SELECT c.id
                         FROM cashbacks c
                         WHERE c.empresa_id = ''
                           AND c.cliente_id = '')
ORDER BY ci.created_at DESC;

-- AJUSTAR SALDO DE CLIENTE NA EMPRESA
SELECT reset_balance('', '');

-- CONSULTAR O VALOR CORRETO DO SALDO DO CLIENTE NA EMPRESA
SELECT amount_customer('', '');

-- CONSULTAR OS ITENS DISPONÍVEIS EM BALANCE
SELECT b.*
FROM balance b
WHERE b.idcustomer = ''
  AND b.idcashback = ''
  AND b.idcompany = '';

-- ENCONTRAR REGISTROS DE MARKETING DAS TRANSAÇÕES
SELECT cm.*
FROM cashback_marketing cm
WHERE cm.id_cashback IN (SELECT c.id
                         FROM cashbacks c
                         WHERE c.empresa_id = ''
                           AND c.cliente_id = ''
                         ORDER BY c.dh_lancamento DESC)
;

-- ENCONTRAR RESGATES REALIZADOS
SELECT r.*
FROM resgates r
WHERE r.cashback_origin_id IN (SELECT c.id
                               FROM cashbacks c
                               WHERE c.empresa_id = ''
                                 AND c.cliente_id = ''
                                 AND c.id = ''
                               ORDER BY c.dh_lancamento DESC)
;

-- ENCONTRAR CADASTRO DO CONSUMIDOR
SELECT c.id AS "ID Cliente", ce.empresa_id AS "ID Empresa", e.fantasia AS "Fantasia Empresa", COUNT(c2.CLIENTE_ID) AS "Qtde Cashbacks",
--cec.codigo_cupom AS "Cupom",
--cec.dt_validade AS "Validade Cupom",
c.nome AS "Nome Clientes", ce.nome AS "Nome Empresas", ce.apelido AS "Apelido", c.cpf_cnpj AS "Doc Clientes", ce.cpf_cnpj AS "Doc Empresas", c.telefone AS "Fone Clientes", ce.telefone AS "Fone Empresas", c.dt_nasc AS "Nascimento", c.email AS "Email Clientes", ce.email AS "Email Empresas", amount_customer(c.id, e.id) AS "Saldo", CONVERT_FROM(DECODE(c.token_cadastro, 'BASE64'), 'UTF-8') AS "Token Cadastro", CONVERT_FROM(DECODE(c."token", 'BASE64'), 'UTF-8') AS "Token Recuperacao", c.created_at AS "Criado Em"
FROM clientes c
LEFT JOIN cliente_empresas ce ON
    ce.cliente_id = c.id
LEFT JOIN empresas e ON
    e.id = ce.empresa_id
LEFT JOIN CASHBACKS C2 ON
    c.ID = c2.CLIENTE_ID
--LEFT JOIN cupom_ecommerce_cliente cec ON
--c.id = cec.cliente_id
WHERE c.id IN ('0')
--OR c.nome ILIKE '%%'
--OR ce.apelido ILIKE '%%'
--OR c.cpf_cnpj = ''
--OR c.telefone = ''
--OR c.email = ''
--OR c.email IS NOT NULL
--OR e.id = ''
--AND e.fantasia ILIKE '%%'
--AND cec.SITUACAO = 'ATIVO'
GROUP BY
    e.id, c2.CLIENTE_ID, c.id, ce.empresa_id, e.fantasia, ce.apelido, ce.nome, ce.cpf_cnpj, ce.telefone, ce.email
--HAVING amount_customer(c.id, e.id) > 0
ORDER BY
    ce.EMPRESA_ID
--    cec.created_at ASC
--LIMIT 5
;

SELECT *
FROM empresas e
WHERE e."database" = '';


SELECT *
FROM clientes c
WHERE c.id = ''


UPDATE clientes c
SET
whatsapp = TRUE
WHERE c.telefone = '';


UPDATE clientes c
SET
telefone = NULL 
WHERE C.telefone IN ('')


SELECT *
FROM cliente_empresas ce
WHERE ce.empresa_id = ''
AND ce.cliente_id = '';


SELECT ce.*
FROM cliente_empresas ce
INNER JOIN clientes c ON
ce.cliente_id = c.id
WHERE c.id = '';


SELECT *
FROM cashbacks c
WHERE c.cliente_id = ''
AND empresa_id = ''
AND c.id = '';


SELECT *
FROM cashback_items ci
WHERE ci.cashback_id = '';



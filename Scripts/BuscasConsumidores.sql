-- ENCONTRAR CADASTRO DO CONSUMIDOR
SELECT 
    c.id AS "ID Cliente", 
    ce.empresa_id AS "ID Empresa", 
    e.fantasia AS "Fantasia Empresa", 
    COUNT(c2.CLIENTE_ID) AS "Qtde Cashbacks", 
    ce.nome AS "Nome Empresas", 
    ce.apelido AS "Apelido", 
    ce.cpf_cnpj AS "Doc Empresas", 
    ce.telefone AS "Fone Empresas", 
    ce.whatsapp AS "WPP Ativo?", 
    ce.email AS "Email Empresas", 
    amount_customer(c.id, e.id) AS "Saldo", 
    CONVERT_FROM(DECODE(c.token_cadastro, 'BASE64'), 'UTF-8') AS "Token Cadastro", 
    CONVERT_FROM(DECODE(c."token", 'BASE64'), 'UTF-8') AS "Token Recuperacao", 
    c.created_at AS "Criado Em"
FROM cliente_empresas ce
LEFT JOIN clientes c ON
    c.id = ce.cliente_id
LEFT JOIN empresas e ON
    e.id = ce.empresa_id
LEFT JOIN CASHBACKS C2 ON
    c.ID = c2.CLIENTE_ID
WHERE ce.id IN ('0')
--OR ce.nome ILIKE '%%'
OR ce.cpf_cnpj = ''
--OR c.telefone = ''
GROUP BY
e.id, c.id, ce.empresa_id, e.fantasia, ce.apelido, ce.nome, ce.cpf_cnpj, ce.telefone, ce.email, ce.whatsapp
ORDER BY
ce.EMPRESA_ID;

SELECT *
FROM empresas e
WHERE e."database" = '';


SELECT ce.*
FROM cliente_empresas ce
INNER JOIN 
WHERE ce.telefone = ''
ORDER BY ce.empresa_id;


SELECT *
FROM cliente_empresas ce
WHERE ce.id = ''


UPDATE clientes c, cliente_empresas ce
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



SELECT *
FROM empresas_config_automacao eca
WHERE eca.empresa_id = ''




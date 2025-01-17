-- ENCONTRAR CADASTRO DO CONSUMIDOR
SELECT c.id                                                      AS "ID Cliente",
       ce.empresa_id                                             AS "ID Empresa",
       e.fantasia                                                AS "Fantasia Empresa",
       COUNT(c2.CLIENTE_ID)                                      AS "Qtde Cashbacks",
       ce.nome                                                   AS "Nome Empresas",
       ce.apelido                                                AS "Apelido",
       ce.cpf_cnpj                                               AS "Doc",
       ce.telefone                                               AS "Fone",
       ce.whatsapp                                               AS "WPP Ativo?",
       ce.email                                                  AS "Email",
       amount_customer(c.id, e.id)                               AS "Saldo",
       CONVERT_FROM(DECODE(c.token_cadastro, 'BASE64'), 'UTF-8') AS "Token Cadastro",
       CONVERT_FROM(DECODE(c."token", 'BASE64'), 'UTF-8')        AS "Token Recuperacao",
       c.created_at                                              AS "Criado Em"
FROM cliente_empresas ce
         LEFT JOIN clientes c ON
    c.id = ce.cliente_id
         LEFT JOIN empresas e ON
    e.id = ce.empresa_id
         LEFT JOIN CASHBACKS C2 ON
    c.id = c2.cliente_id
WHERE c.id IN ('0')
--     AND ce.empresa_id = ''
--    OR ce.nome ILIKE '%%'
--    OR ce.cpf_cnpj ILIKE '%%'
   OR ce.telefone ILIKE '%%'
GROUP BY e.id, c.id, ce.empresa_id, e.fantasia, ce.apelido, ce.nome, ce.cpf_cnpj, ce.telefone, ce.email, ce.whatsapp
ORDER BY ce.EMPRESA_ID;

SELECT *
FROM empresas e
WHERE e."database" = '';

SELECT *
FROM empresas e
WHERE e.fantasia ilike '%%';

SELECT *
FROM cliente_empresas ce
WHERE ce.cliente_id = ''
   OR ce.cpf_cnpj ILIKE '%%'
   OR ce.telefone ILIKE '%%'
ORDER BY ce.empresa_id DESC;

SELECT c.*
FROM clientes c
WHERE c.id = '0'
--    OR c.telefone ILIKE '%%'
   OR c.cpf_cnpj ILIKE '%%'
ORDER BY c.id;

SELECT *
FROM cliente_empresas ce
WHERE ce.cliente_id in ('');


UPDATE cliente_empresas ce
SET telefone = NULL
WHERE ce.cliente_id IN ('');

DELETE
FROM cliente_empresas ce
WHERE ce.empresa_id IN ('')
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
WHERE eca.empresa_id = '';

-- AJUSTAR SALDO DE CLIENTE NA EMPRESA
SELECT reset_balance('', '');

-- CONSULTAR O VALOR CORRETO DO SALDO DO CLIENTE NA EMPRESA
SELECT amount_customer('', '');


select c.*
from cashbacks c
         inner join cashback_items ci on c.id = ci.cashback_id
where c.empresa_id = ''
  and c.cliente_id = ''
  and c.id not in ('', '')
order by c.created_at desc;

select *
from balance b
where idcashback in ('');



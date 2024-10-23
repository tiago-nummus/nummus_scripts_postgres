-- ENCONTRAR EMPRESA
SELECT e.*
FROM empresas e
WHERE e.fantasia ILIKE '%%';

-- LISTAR TODAS AS IMPORTAÇÕES
SELECT *
FROM auditoria_importacao ai
WHERE ai.id_empresa IN (SELECT e.id
                        FROM empresas e
                        WHERE e.id IN (''))
ORDER BY ai.dh_operacao DESC;


SELECT *
FROM auditoria_importacao ai
WHERE ai."uuid" IN ('')
ORDER BY ai.dh_operacao DESC;


-- ENCONTRAR A IMPORTAÇÃO
--CREATE TABLE tkxxxx_bpk_auditoria_importacao AS -- BACKUP
SELECT ai.*
FROM auditoria_importacao ai
WHERE ai."uuid" IN ('');


-- ENCONTRAR OS RESULTADOS DA IMPORTAÇÃO DE CLINTES
--CREATE TABLE tkxxxx_bpk_auditoria_importacao_log AS -- BACKUP
SELECT ail.CORPO -> 'name' AS "Nome", ail.CORPO -> 'phone' AS "Telefone", ail.CORPO -> 'document_number' AS "Documento"
FROM auditoria_importacao_log ail
WHERE ail.uuid_importacao = '';


-- ENCONTRAR OS RESULTADOS DA IMPORTAÇÃO DE LANÇAMENTOS
--CREATE TABLE tkxxxx_bpk_auditoria_importacao_log AS -- BACKUP
SELECT ail.corpo -> 'customer' ->> 'document_number'
FROM auditoria_importacao_log ail
WHERE ail.uuid_importacao = ''


-- ENCONTRAR OS CASHBACKS IMPORTADOS
--CREATE TABLE tkxxxx_bpk_cashbacks AS -- BACKUP
SELECT c.*
FROM cashbacks c
WHERE c.uuid_importacao IN ('');


-- ENCONTRAR OS CASHBACK ITEMS IMPORTADOS
--CREATE TABLE tkxxxx_bpk_cashback_items AS -- BACKUP
SELECT ci.*
FROM cashback_items ci
WHERE ci.cashback_id IN (SELECT c.id
                         FROM cashbacks c
                         WHERE c.uuid_importacao = '');


--ENCONTRAR OS MARKETINGS RELACIONADOS DOS CASHBACKS IMPORTADOS
--CREATE TABLE tkxxxx_bpk_cashback_marketing AS -- BACKUP
SELECT cm.*
FROM cashback_marketing cm
WHERE cm.id_cashback IN (SELECT c.id
                         FROM cashbacks c
                         WHERE c.uuid_importacao = '');


-- ENCONTRAR OS RESGATES RELACIONADOS DOS CASHBACKS IMPORTADOS
--CREATE TABLE tkxxxx_bpk_resgates AS -- BACKUP
SELECT r.*
FROM resgates r
WHERE r.cashback_origin_id IN (SELECT c.id
                               FROM cashbacks c
                               WHERE c.uuid_importacao = '');

-- ENCONTRAR OS BALANCES DOS CASHBACKS IMPORTADOS
--CREATE TABLE tkxxxx_bpk_resgates AS -- BACKUP
SELECT b.*
FROM balance b
WHERE b.idcashback IN (SELECT c.id
                       FROM cashbacks c
                       WHERE c.uuid_importacao = '');


-- ENCONTRAR OS CLIENTES EMPRESAS RELACIONADOS DOS CASHBACKS IMPORTADOS
--CREATE TABLE tkxxxx_bpk_cliente_empresas AS -- BACKUP
SELECT ce.*
FROM cliente_empresas ce
WHERE ce.empresa_id = ''
  AND ce.cliente_id IN (SELECT c.id
                        FROM clientes c
                        WHERE c.cpf_cnpj IN (SELECT ail.corpo -> 'customer' ->> 'document_number'
                                             FROM auditoria_importacao_log ail
                                             WHERE ail.uuid_importacao = ''));

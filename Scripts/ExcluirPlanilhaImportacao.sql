-- ENCONTRAR EMPRESA
SELECT e.*
FROM empresas e
WHERE e."database" = '';

-- LISTAR TODAS AS IMPORTAÇÕES
SELECT *
FROM AUDITORIA_IMPORTACAO AI
WHERE ai.ID_EMPRESA IN (
        SELECT e.id
FROM empresas e
WHERE e."database" = ''
    )
ORDER BY
    ai.DH_OPERACAO ASC;


-- ENCONTRAR A IMPORTAÇÃO
--CREATE TABLE tkXXXX_bpk_auditoria_importacao AS -- BACKUP
SELECT ai.*
FROM auditoria_importacao ai
WHERE ai."uuid" IN ('');
-- ENCONTRAR OS RESULTADOS DA IMPORTAÇÃO
--CREATE TABLE tkXXXX_bpk_auditoria_importacao_log AS -- BACKUP
SELECT ail.CORPO -> 'name' AS "Nome", ail.CORPO -> 'phone' AS "Telefone", ail.CORPO -> 'document_number' AS "Documento"
FROM auditoria_importacao_log ail
WHERE ail.uuid_importacao = '';


-- ENCONTRAR OS CASHBACKS IMPORTADOS
--CREATE TABLE tkXXXX_bpk_cashbacks AS -- BACKUP
SELECT *
FROM cashbacks c
WHERE c.uuid_importacao = '';

DELETE
FROM cashbacks c
WHERE c.uuid_importacao = '';


--ENCONTRAR OS MARKETINGS RELACIONADOS AOS CASHBACKS IMPORTADOS
--CREATE TABLE tkXXXX_bpk_cashback_marketing AS -- BACKUP
SELECT cm.*
FROM cashback_marketing cm
INNER JOIN cashbacks c ON
    c.id = cm.id_cashback
WHERE c.uuid_importacao = '';

DELETE
FROM cashback_marketing
WHERE EXISTS (
        SELECT 1
FROM cashbacks c
WHERE c.id = cashback_marketing.id_cashback
AND c.uuid_importacao = ''
    );


-- ENCONTRAR OS RESGATES RELACIONADOS AOS CASHBACKS IMPORTADOS
--CREATE TABLE tkXXXX_bpk_resgates AS -- BACKUP
SELECT r.*
FROM resgates r
INNER JOIN cashbacks c ON
    r.cashback_origin_id = c.id
OR r.cashback_resgatado_id = c.id
WHERE c.uuid_importacao = '';

SELECT c.*
FROM cashbacks c
WHERE c.uuid_importacao = '';

SELECT *
FROM CLIENTE_EMPRESAS CE
WHERE ce.CLIENTE_ID IN ();

SELECT *
FROM tkxxxx_bkp_cashbacks tbc;


--CREATE TABLE tkXXXX_bpk_cliente_empresas AS -- BACKUP
SELECT ce.*
--    DELETE 
FROM cliente_empresas ce
WHERE ce.uuid_importacao = '';

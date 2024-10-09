-- Dados do cliente: 

SELECT e.id, e."database", e.fantasia
FROM empresas e
WHERE e.fantasia ILIKE '%%';

SELECT lr.x_client_id                    AS "xClientID",
       lr.rota                           AS "Rota",
       lr.created_at                     AS "Data",
       (lr.requisicao ->> 'body')::jsonb AS "Requisição",
       lr.resposta                       AS "Resposta"
FROM log_requisicao lr
WHERE lr.x_client_id IN ('')
--   AND lr.created_at::date BETWEEN '2024-09-03' AND '2024-10-06'
--   AND lr.created_at::TEXT ilike '2024-10-05%'
-- AND lr.requisicao::TEXT ILIKE '%%'
-- AND lr.requisicao::TEXT NOT ILIKE '%"body": null,%'
-- AND lr.requisicao::TEXT ILIKE '%DIVERSOS%'
-- AND lr.requisicao::TEXT ILIKE '%must contain at least one of%'
-- AND lr.resposta::TEXT ILIKE '%Not Found%'
--   AND lr.requisicao::TEXT ILIKE '%%'
--   AND lr.resposta::TEXT ILIKE '%%'
-- AND lr.resposta::TEXT NOT ILIKE '%object.missing%'
-- AND lr.resposta::TEXT NOT ILIKE '%active%'
-- AND lr.resposta::TEXT ILIKE '%length must be less than or equal to 11%'
--   AND lr.rota = '/cashback'
-- AND lr.rota = '/ecommerce/v1/api/tray/start-process'
-- AND lr.rota = '/customer'
-- AND lr.rota = '/cashback/{id}/cancel'
--   AND lr.rota = '/cashback/amount'
-- AND lr.rota = '/cashback/cancel'
-- AND lr.rota = '/erp/v1/api/varejonline/start'
-- AND lr.rota = '/ecommerce/v1/api/loja-integrada/start-process'
ORDER BY lr.created_at DESC;

SELECT *
FROM empresas e
WHERE e."database" = '';

SELECT e.id, e."database", e.fantasia
FROM empresas e
WHERE e.cnpj_cpf = '';

SELECT *
FROM empresas_webhooks ew
WHERE ew.empresa_id = '';

SELECT *
FROM empresas_webhooks ew
WHERE ew.EMPRESA_ID = '';

SELECT *
FROM cashbacks c
WHERE c.id = '';

SELECT *
FROM empresas e
WHERE e."database" = '';

SELECT *
FROM empresas_webhooks ew
WHERE ew.empresa_id = ''

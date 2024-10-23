-- Dados do cliente: 1152,SILVER CROWN,40538359000131,bf8a5f48c1

SELECT lr.x_client_id                    AS "xClientID",
       lr.rota                           AS "Rota",
       lr.created_at                     AS "Data",
       (lr.requisicao ->> 'body')::jsonb AS "Requisição",
       lr.resposta                       AS "Resposta"
FROM log_requisicao lr
WHERE lr.x_client_id IN ('bf8a5f48c1')
--   AND lr.created_at::date BETWEEN '2024-10-15' AND '2024-10-21'
  AND lr.created_at::text ilike '2024-10-23%'
--   AND lr.requisicao::TEXT ILIKE '%%'
  AND lr.resposta::TEXT ILIKE '%%'
  AND lr.rota = '/cashback'
--   AND lr.rota = '/ecommerce/v1/api/nuvemshop/start-process'
--   AND lr.rota = '/customer'
--   AND lr.rota = '/cashback/{id}/cancel'
--   AND lr.rota = '/cashback/amount'
--   AND lr.rota = '/cashback/cancel'
--   AND lr.rota = '/erp/v1/api/varejonline/start'
--   AND lr.rota = '/ecommerce/v1/api/loja-integrada/start-process'
ORDER BY lr.created_at DESC;

select e.*
from empresas e
WHERE e.fantasia ilike '%%';

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
WHERE ew.empresa_id = '';

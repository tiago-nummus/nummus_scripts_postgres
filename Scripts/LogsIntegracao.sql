-- Dados do cliente:

SELECT lr.x_client_id                                AS "xClientID",
       lr.rota                                       AS "Rota",
       TO_CHAR(lr.created_at, 'DD/MM/YYYY HH:MM:SS') AS "Data",
       (lr.requisicao ->> 'body')::jsonb             AS "Requisição",
       lr.resposta                                   AS "Resposta"
FROM log_requisicao lr
WHERE lr.x_client_id IN (/*''*/select e.database from empresas e where e.fantasia ilike '%%')
--   AND lr.created_at::date BETWEEN '2024-10-22' AND '2024-10-23'
--   AND lr.created_at::text ilike '2024-10-19%'
  AND lr.requisicao::TEXT ILIKE '%%'
--   AND lr.resposta::TEXT ILIKE '%%'
--   AND lr.rota = '/cashback'
--   AND lr.rota ilike '/ecommerce/v1/api%'
--   AND lr.rota = '/customer'
--   AND lr.rota = '/cashback/amount'
--   AND lr.rota ilike '/cashback%cancel'
--   AND lr.rota ilke '/ecommerce/v1/api/%/generation-coupon'
--   AND lr.rota ilike '/erp/v1/api/%'
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

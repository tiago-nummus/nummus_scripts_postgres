SELECT *
FROM empresas e
WHERE e.fantasia ILIKE '%%';


SELECT count(c.created_at) AS created_at_count, c.empresa_id, c.created_at, c.valor_compra, c.cliente_id
FROM cashbacks c
WHERE c.empresa_id IN ('')
  AND c.dh_lancamento::date > ''
  AND c.tipo_cashback = ''
  AND c.cancelado IS NOT NULL
GROUP BY c.empresa_id, c.cliente_id, c.created_at, c.valor_compra
HAVING count(c.created_at) > 1
ORDER BY created_at_count DESC
;


SELECT c.*
FROM cashbacks c
WHERE c.empresa_id IN ('')
  AND c.created_at::date IN ('')
  AND c.valor_compra IN ('')
  AND c.cancelado IS NOT NULL
ORDER BY c.id ASC
;


SELECT cm.*
FROM cashback_marketing cm
WHERE cm.id_cashback IN (SELECT c.id
                         FROM cashbacks c
                         WHERE c.empresa_id IN ('')
                           AND c.created_at::date = ''
                           AND c.valor_compra = ''
                           AND c.cancelado IS NOT NULL);



SELECT r.*
FROM resgates r
WHERE r.cashback_origin_id IN (SELECT c.id
                               FROM cashbacks c
                               WHERE c.empresa_id IN ('')
                                 AND c.created_at::date = ''
                                 AND c.valor_compra = '');



SELECT count(*), c.*
FROM cashback_items ci
         INNER JOIN cashbacks c ON
    ci.cashback_id = c.id
         JOIN cliente_empresas ce ON
    c.cliente_id = ce.cliente_id
WHERE c.tipo_cashback = 'BONUS'
  AND (c.dh_lancamento + (
    ci.validade || 'days'
    )::INTERVAL
          )::date >= current_date
  AND ci.valor_compra = '0'
  AND ci.valor_cashback > '0'
  AND ci.value_resgatado = '0'
  AND c.tipo_bonus != 'NORMAL'
  AND c.empresa_id IN ()
GROUP BY c.cliente_id, c.id
ORDER BY c.created_at ASC, c.cliente_id ASC, count(*)
;

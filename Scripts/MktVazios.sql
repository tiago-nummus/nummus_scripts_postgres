-- ENCONTRAR O MARKETING 'PROCESSANDO'
SELECT *
FROM marketing m
WHERE m."uuid" = '';


-- VALIDAR QUE O MARKETING ESTÁ VAZIO
SELECT m."uuid", mc.id_cliente
FROM marketing m
         INNER JOIN marketing_cliente mc ON
    m."uuid" = mc.uuid_marketing
WHERE m."uuid" = '';


-- ENCONTRAR/DELETAR TODOS OS MARKETINGS VAZIOS DE UMA EMPRESA
--SELECT m.*
DELETE
FROM marketing m
--INNER JOIN marketing_cliente mc ON
--m."uuid" = mc.uuid_marketing
WHERE m.tipo_notificacao = 'MARKETING'
--AND m.id_empresa IN ('346')
  AND m.dh_operacao::date BETWEEN '2024-10-01' AND '2024-10-02'
  AND NOT EXISTS (SELECT 1
                  FROM marketing_cliente mc
                  WHERE mc.uuid_marketing = m."uuid")
--ORDER BY
--    dh_operacao ASC
;

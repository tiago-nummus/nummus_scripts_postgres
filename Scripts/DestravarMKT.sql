-- ENCONTRAR MARKETING PARADO (INICIANDO CAMPANHA)
SELECT mc.*
FROM marketing m
INNER JOIN marketing_cliente mc ON
    m."uuid" = mc.uuid_marketing
WHERE m.id_empresa = ''
ORDER BY
    m.dh_operacao DESC
;


SELECT mc.*
FROM marketing_cliente mc
WHERE mc.uuid_marketing = '';


SELECT m."uuid"
FROM MARKETING M
WHERE m.created_at::date = '2024-09-05'
AND m.id_empresa IN ('');


SELECT mc.*
FROM marketing_cliente mc
INNER JOIN marketing m ON
    mc.uuid_marketing = m."uuid"
WHERE m.id_empresa IN ('')
AND mc.uuid_marketing = ''
ORDER BY
    m.dh_operacao DESC;


-- ATUALIZAR STATUS DAS MENSAGENS TRAVADAS PARA SEREM REPROCESSADAS
UPDATE marketing_cliente AS mc
SET
    mensagem_erro = 'Reprocessar mensagem', situacao = 'PROCESSADO', mensagem_reprocessada = FALSE
WHERE mc.uuid_marketing IN (
SELECT m."uuid"
FROM MARKETING M
WHERE m.id_empresa IN ('')
    AND m."uuid" = ''
)
AND mc.situacao = 'PROCESSANDO'
AND mc.mensagem_reprocessada = FALSE
AND mc.mensagem_erro IS NULL
;


-- ALTERAR STATUS DAS MENSAGENS CANCELADAS PARA SEREM REPROCESSADAS
UPDATE marketing_cliente AS mc
SET
    mensagem_erro = 'Reprocessar mensagem', situacao = 'PROCESSADO', mensagem_reprocessada = FALSE
WHERE mc.uuid_marketing IN ('')
AND mc.situacao = 'CANCELADO'
AND mc.mensagem_erro IS NOT NULL
;

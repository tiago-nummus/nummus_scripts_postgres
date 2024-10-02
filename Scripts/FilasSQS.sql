/* Fila dos Whatsapp Sender */
SELECT ROW_NUMBER() OVER(PARTITION BY message_group_id
ORDER BY updated_at ASC) AS posicao, message_queue, message_group_id,*
FROM marketing_cliente mc
WHERE situacao = 'PROCESSANDO'
AND message_queue NOTNULL
AND message_group_id NOTNULL
GROUP BY message_queue, message_group_id, uuid
ORDER BY message_queue, message_group_id, updated_at ASC;


/* Fila do Find Customer/Processing Message */
SELECT ROW_NUMBER() OVER(PARTITION BY m.message_group_id
ORDER BY m.updated_at ASC) AS posicao, m.message_queue, m.message_group_id, m.*
FROM marketing m
LEFT JOIN marketing_cliente mc ON
mc.uuid_marketing = m."uuid"
WHERE m.message_queue NOTNULL
AND m.message_group_id NOTNULL
AND (mc.situacao = 'PROCESSANDO'
    OR mc.situacao IS NULL)
GROUP BY m.message_queue, m.message_group_id, m.uuid
ORDER BY message_queue, message_group_id, updated_at ASC

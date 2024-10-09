SELECT *
FROM marketing m
WHERE m.id_empresa = ''
  AND m.tipo_notificacao = ''
  AND m.tipo_mensagem = ''
  AND m.dh_operacao::date BETWEEN '2024-05-01' AND '2024-05-30'
;


SELECT count(*)
FROM marketing_cliente mc
         INNER JOIN marketing m ON
    mc.uuid_marketing = m."uuid"
WHERE m.id_empresa = ''
  AND m.tipo_notificacao = ''
  AND m.tipo_mensagem = ''
  AND m.dh_operacao::date BETWEEN '2024-09-01' AND '2024-09-30'
;


SELECT *
FROM metodo_envio_empresa mee
WHERE mee.id_empresa = ''

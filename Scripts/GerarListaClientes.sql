-- GERAR LISTAGEM DE CLIENTES PARA EXPORTAR
SELECT encode((c.id::TEXT)::bytea, 'base64') AS "ID NUMMUS", /*ce2.cliente_ecommerce_id AS "ID ECOM",*/
       c.nome                                AS "NOME CLIENTE",
       c.cpf_cnpj                            AS "DOCUMENTO",
       c.telefone                            AS "TELEFONE"
FROM cliente_empresas ce
         INNER JOIN clientes c ON
    ce.cliente_id = c.id
/*LEFT JOIN cliente_ecommerce ce2 ON
ce.cliente_id = ce2.cliente_id*/
WHERE ce.empresa_id = ''
ORDER BY c.nome

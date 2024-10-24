-- ENCONTRAR A EMPRESA PELO NOME
select *
from empresas e
where e.fantasia ilike '%TERRA DA ALEGRIA %';


-- GERAR LISTAGEM DE CLIENTES PARA EXPORTAR
SELECT encode((c.id::TEXT)::bytea, 'base64')                          AS "ID NUMMUS",
    /*encode((*/ce2.cliente_ecommerce_id/*::TEXT)::bytea, 'base64')*/ AS "ID ECOM",
       ce.nome                                                        AS "NOME CLIENTE",
       ce.cpf_cnpj                                                    AS "DOCUMENTO",
       ce.telefone                                                    AS "TELEFONE"
FROM cliente_empresas ce
         INNER JOIN clientes c ON
    ce.cliente_id = c.id
         LEFT JOIN cliente_ecommerce ce2 ON
    ce.cliente_id = ce2.cliente_id
WHERE ce.empresa_id = ''
ORDER BY ce.nome;


-- RELATÓRIO DE FAMILIARES
SELECT ce.nome                                        AS "NOME CLIENTE",
       ce.telefone                                    AS "TELEFONE",
       cgf.nome                                       AS "NOME FAMILIAR",
       cgf.telefone                                   AS "TELEFONE FAMILIAR",
       to_char(cgf.dt_nascimento::date, 'dd/mm/yyyy') AS "DATA NASCIMENTO",
       cgf.tipo_membro                                AS "TIPO FAMILIAR"
FROM cliente_empresas ce
         inner join clientes c on ce.cliente_id = c.id
         left join cliente_grupo_familia cgf on ce.cliente_id = cgf.id_cliente
WHERE ce.empresa_id = ''
  and cgf.nome is not null
ORDER BY ce.nome;

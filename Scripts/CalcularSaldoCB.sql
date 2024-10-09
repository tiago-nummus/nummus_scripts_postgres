-- CALCULAR SALDO DE CASHBACK
SELECT e.fantasia AS "Empresa", sum(ci.valor_cashback - ci.value_resgatado) AS "Saldo Cashback"
FROM cashbacks c
         INNER JOIN cashback_items ci ON
    c.id = ci.cashback_id
         INNER JOIN empresas e ON
    c.empresa_id = e.id
         INNER JOIN clientes cli ON
    c.cliente_id = cli.id
WHERE cli.id = '0'
--OR cli.nome ILIKE '%%'
--OR cli.cpf_cnpj = ''
--OR cli.telefone = ''
--OR cli.email = ''
--OR e."database" = ''
--OR e.fantasia ILIKE '%roque%'
--OR c.email IS NOT NULL
  AND ci.value_resgatado < ci.valor_cashback
  AND c.situacao_cashback != 'CANCELADO'
GROUP BY e.fantasia


-- CALCULAR SALDO EM TODAS AS EMPRESAS
SELECT c.nome     AS "Cliente",
       e.fantasia AS "Empresa",
       amount_customer(
               c.id,
               e.id
       )          AS "Saldo"
FROM clientes c
         INNER JOIN cliente_empresas ce ON
    ce.cliente_id = c.id
         INNER JOIN empresas e ON
    ce.empresa_id = e.id
WHERE c.id = '0'

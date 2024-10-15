-- Função para recalcular os saldos de vários clientes de uma empresa
DO
$$
    DECLARE
        id_customer_array integer[]; -- Array preenchido pela subquery
        id_customer       integer;
        id_company        integer := ''; -- Id fixo da empresa
    BEGIN
        -- A subquery seleciona apenas os clientes ativos
        id_customer_array := ARRAY(select ce.cliente_id
                                   from cliente_empresas ce
                                   WHERE ce.empresa_id = id_company);

        -- Itera sobre o array gerado pela subquery
        FOREACH id_customer IN ARRAY id_customer_array
            LOOP
                -- Chama a função reset_balance para cada id_customer
                PERFORM reset_balance(id_customer, id_company);
            END LOOP;
    END
$$;

DO
$$
    DECLARE
        id_customer_array integer[]; -- Array para armazenar os IDs dos clientes
        id_customer       integer;
        id_company_array  integer[]; -- Array para armazenar os IDs das empresas
        id_company        integer;
        company_name      varchar := ''; -- Nome da empresa a ser buscada
    BEGIN
        -- Preenche o array de empresas ativas com base no nome da empresa
        id_company_array := ARRAY(
                SELECT e.id
                FROM empresas e
                WHERE e.fantasia ILIKE '%' || company_name || '%');

        -- Itera sobre o array de empresas
        FOREACH id_company IN ARRAY id_company_array
            LOOP
                -- Preenche o array de clientes ativos para cada empresa
                id_customer_array := ARRAY(
                        SELECT ce.cliente_id
                        FROM cliente_empresas ce
                        WHERE ce.empresa_id = id_company);

                -- Itera sobre o array de clientes e recalcula o saldo
                FOREACH id_customer IN ARRAY id_customer_array
                    LOOP
                        -- Chama a função reset_balance para cada id_customer e id_company
                        PERFORM reset_balance(id_customer, id_company);
                    END LOOP;
            END LOOP;

    END
$$;

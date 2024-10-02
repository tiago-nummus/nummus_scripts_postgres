-- CONEXÃO DE UMA EMPRESA
SELECT whc.*
FROM WHATSAPP_HOST_CONEXAO WHC
WHERE WHC.SLUG_EMPRESA = '';

-- SESSÃO DE UMA EMPRESA
SELECT *
FROM sessao_whatsapp sw
WHERE SW.slug_empresa = ''

-- litas as conexões ativas de whatsapp
SELECT *
FROM whatsapp_host_conexao whc;
-- Quantidades de pods ocupadas por id da pod
SELECT count(whc.id_whatsapp_host) AS total_pod, wh.id AS id_pod, wh.server_url AS url_pod
FROM whatsapp_host wh
INNER JOIN whatsapp_host_conexao whc ON
    wh.id = whc.id_whatsapp_host
GROUP BY
    wh.id
ORDER BY
    total_pod ASC;

-- ENCONTRAR APENAS O ID DA POD COM MENOR QTDE DE CLIENTES
SELECT wh.id
FROM whatsapp_host wh
INNER JOIN whatsapp_host_conexao whc ON
    wh.id = whc.id_whatsapp_host
GROUP BY
    wh.id
ORDER BY
    COUNT(whc.id_whatsapp_host) ASC
LIMIT 1
    ;

-- Trocar pods de uma empresa
UPDATE whatsapp_host_conexao
SET
id_whatsapp_host = (
SELECT wh.id
FROM whatsapp_host wh
INNER JOIN whatsapp_host_conexao whc ON
wh.id = whc.id_whatsapp_host
GROUP BY
wh.id
ORDER BY
COUNT(whc.id_whatsapp_host) ASC
LIMIT 1
)
WHERE slug_empresa IN ('');

-- listar todas as empresas de uma pod
SELECT whc.slug_empresa, whc.status, wh.dh_operacao, wh.server_url, whc.updated_at
FROM whatsapp_host wh
INNER JOIN whatsapp_host_conexao whc ON
    wh.id = whc.id_whatsapp_host
WHERE wh.id IN ('');

SELECT w.*
FROM whatsappofficialconfigurationaccount w;

-- Identificar pods ativas
SELECT *
FROM whatsapp_host_conexao
WHERE NOT EXISTS (
        SELECT 1
FROM sessao_whatsapp
WHERE whatsapp_host_conexao.slug_empresa = sessao_whatsapp.slug_empresa
    );

-- quantidade de clientes conectados no momento
SELECT CASE
WHEN CURRENT_TIME BETWEEN '05:00:00' AND '23:00:00' THEN CEIL(
count(uuid)::decimal
)
ELSE 0
END
FROM sessao_whatsapp;

-- quantidade de clientes conectados por pod
SELECT count(1), wh.server_url, wh.id
FROM whatsapp_host_conexao whc
JOIN whatsapp_host wh ON
    wh.id = whc.id_whatsapp_host
GROUP BY
    wh.server_url, wh.id

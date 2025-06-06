CREATE MATERIALIZED VIEW territorio.vw_amazonia_legal AS
SELECT
    m.cod_municipio,
        EXISTS (
            SELECT 1
            FROM territorio.tb_amazonia_legal_2022 AS al
            WHERE al.cod_municipio = m.cod_municipio
        ) AS amazonia_legal
FROM territorio.tb_municipio AS m;

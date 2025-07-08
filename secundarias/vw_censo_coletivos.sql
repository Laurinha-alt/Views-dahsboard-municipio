DROP MATERIALIZED VIEW territorio.vw_censo_coletivos;
CREATE MATERIALIZED VIEW territorio.vw_censo_coletivos AS
SELECT
    *,
    (COALESCE(dccm, 0) + COALESCE(dcsm, 0)) AS domicilios_coletivos
FROM
    censo.tb_censo_2022_tabela_4711;

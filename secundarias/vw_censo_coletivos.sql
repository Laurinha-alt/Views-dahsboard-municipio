CREATE MATERIALIZED VIEW territorio.vw_censo_coletivos AS
SELECT
    *,
    (dccm + dcsm) AS domicilios_coletivos
FROM 
    censo.tb_censo_2022_tabela_4711;
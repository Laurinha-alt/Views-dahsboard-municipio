CREATE MATERIALIZED VIEW territorio.vw_censo_total AS
SELECT
    *,
    (COALESCE(dpi, 0) + COALESCE(dccm, 0) + COALESCE(dcsm, 0) + COALESCE(dppo_com_entrev, 0) + COALESCE(dppo_sem_entrev, 0) + COALESCE(dppv, 0) + COALESCE(dppuo, 0)) AS domicilios_total
FROM
    censo.tb_censo_2022_tabela_4711;
DROP MATERIALIZED VIEW territorio.vw_censo_total;
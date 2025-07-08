DROP MATERIALIZED VIEW territorio.vw_censo_particulares;
CREATE MATERIALIZED VIEW territorio.vw_censo_particulares AS
SELECT
    *,
    (COALESCE(dpi, 0) + COALESCE(dppo_com_entrev, 0) + COALESCE(dppo_sem_entrev, 0) + COALESCE(dppv, 0) + COALESCE(dppuo, 0)) AS domicilios_particulares
FROM
    censo.tb_censo_2022_tabela_4711;

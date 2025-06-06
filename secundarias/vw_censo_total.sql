CREATE MATERIALIZED VIEW territorio.vw_censo_total AS
SELECT
    *,
    (dpi + dccm + dcsm + dppo_com_entrev + dppo_sem_entrev + dppv + dppuo) AS domicilios_total
FROM 
    censo.tb_censo_2022_tabela_4711;
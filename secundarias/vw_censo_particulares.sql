CREATE MATERIALIZED VIEW territorio.vw_censo_particulares AS
SELECT
    *,
    (dpi + dppo_com_entrev + dppo_sem_entrev + dppv + dppuo) AS domicilios_particulares
FROM 
    censo.tb_censo_2022_tabela_4711;
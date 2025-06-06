CREATE MATERIALIZED VIEW territorio.vw_booleanos AS
SELECT
  CASE
    WHEN declarou_possuir_pmsb_elaboracao IS TRUE THEN 'sim'
    WHEN declarou_possuir_pmsb_elaboracao IS FALSE THEN 'sem resposta'
  END AS declarou_possuir_pmsb_elaboracao,
  COALESCE(componentes_abrangidos_pmsb, 'sem resposta') AS componentes_abrangidos_pmsb,
  COALESCE(area_abrangida_pmsb, 'sem resposta') AS area_abrangida_pmsb,
  CASE
    WHEN declarou_possuir_pmgirs IS TRUE THEN 'sim'
    WHEN declarou_possuir_pmgirs IS FALSE THEN 'sem resposta'
  END AS declarou_possuir_pmgirs
FROM territorio.vw_base_municipal;
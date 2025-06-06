DROP MATERIALIZED VIEW territorio.vw_categoria_metropolitana;
CREATE MATERIALIZED VIEW territorio.vw_categoria_metropolitana AS 
SELECT 
	smm.cod_municipio AS cod_municipio,
	bool_or (cm.prioritaria) AS rm_prioritaria ,
	string_agg (cm.nome_catmetropol , ', ') AS categoria_metropolitana
FROM territorio.tb_subcategoria_metropolitana AS sm
LEFT JOIN territorio.tb_subcategoria_metropolitana_municipio AS smm
	ON sm.cod_subcatmetropol = smm.cod_subcatmetropol
LEFT JOIN territorio.tb_categoria_metropolitana AS cm
	ON sm.cod_catmetropol = cm.cod_catmetropol
	GROUP BY smm.cod_municipio 
;



SELECT * FROM territorio.vw_categoria_metropolitana;
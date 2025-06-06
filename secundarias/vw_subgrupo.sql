DROP MATERIALIZED VIEW IF EXISTS territorio.vw_subgrupo;
CREATE MATERIALIZED VIEW territorio.vw_subgrupo AS
SELECT
    m.cod_municipio,
    m.nome_municipio,
    uf.sigla_uf,
    CASE
        WHEN cm.rm_prioritaria = TRUE THEN 'G1'
        WHEN c4714.populacao > 70000 AND uf.regiao IN ('Norte', 'Nordeste', 'Centro-Oeste') THEN 'G1'
        WHEN c4714.populacao > 100000 AND uf.regiao IN ('Sudeste', 'Sul') THEN 'G1'
        WHEN c4714.populacao BETWEEN 50000 AND 70000 AND uf.regiao IN ('Norte', 'Nordeste', 'Centro-Oeste') THEN 'G2'
        WHEN c4714.populacao BETWEEN 50000 AND 100000 AND uf.regiao IN ('Sudeste', 'Sul') THEN 'G2'
        WHEN c4714.populacao < 50000 THEN 'G3'
        ELSE NULL
    END AS subgrupo
FROM
    territorio.tb_municipio AS m
    LEFT JOIN territorio.vw_categoria_metropolitana AS cm
    	ON m.cod_municipio = cm.cod_municipio
    LEFT JOIN censo.tb_censo_2022_tabela_4714 AS c4714 
    	ON m.cod_municipio = c4714.cod_municipio
    LEFT JOIN territorio.tb_uf AS uf
    	ON m.cod_uf = uf.cod_uf;
    
   
   SELECT * FROM territorio.vw_subgrupo;
CREATE MATERIALIZED VIEW territorio.vw_prestadores_agua_esgoto AS
SELECT 
    m.cod_municipio,
    m.nome_municipio,
    string_agg(DISTINCT pa.cad0005, ', ') AS prestador_agua_sinisa,
    string_agg(DISTINCT pe.cad0005, ', ') AS prestador_esgoto_sinisa,
    string_agg(DISTINCT pa.cad0002, ', ') AS natureza_juridica_prestadores_agua,
    string_agg(DISTINCT pe.cad0002, ', ') AS natureza_juridica_prestadores_esgoto,
    string_agg(DISTINCT pa.cad2001, ', ') AS area_atuacao_prestadores_agua,
    string_agg(DISTINCT pe.cad2101, ', ') AS area_atuacao_prestadores_esgoto
FROM
    sinisa.tb_sinisa_prestador_agua AS pa
FULL JOIN 
    sinisa.tb_sinisa_prestador_esgoto AS pe
    ON pa.cod_municipio = pe.cod_municipio
FULL JOIN 
    territorio.tb_municipio AS m 
    ON COALESCE(pa.cod_municipio, pe.cod_municipio) = m.cod_municipio
GROUP BY 
    m.cod_municipio, m.nome_municipio;

   
SELECT * FROM territorio.vw_prestadores_agua_esgoto;
SELECT count(*) FROM territorio.vw_prestadores_agua_esgoto;
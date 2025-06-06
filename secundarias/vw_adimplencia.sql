DROP MATERIALIZED VIEW IF EXISTS territorio.vw_adimplencia;
CREATE MATERIALIZED VIEW territorio.vw_adimplencia AS
SELECT
    m.cod_municipio,
    m.nome_municipio,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM sinisa.tb_sinisa_adimplencia AS sa
            WHERE sa.cod_municipio = m.cod_municipio
              AND sa.tipo_servico = 'Gestão Municipal'
              AND sa.ano_referencia = 2023
        ) THEN 'adimplente'
        ELSE 'inadimplente'
    END AS adimplencia_gestao_municipal,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM sinisa.tb_sinisa_adimplencia AS sa
            WHERE sa.cod_municipio = m.cod_municipio
              AND sa.tipo_servico = 'Abastecimento de água'
              AND sa.ano_referencia = 2023
        ) THEN 'adimplente'
        ELSE 'inadimplente'
    END AS adimplencia_agua,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM sinisa.tb_sinisa_adimplencia AS sa
            WHERE sa.cod_municipio = m.cod_municipio
              AND sa.tipo_servico = 'Esgotamento Sanitário'
              AND sa.ano_referencia = 2023
        ) THEN 'adimplente'
        ELSE 'inadimplente'
    END AS adimplencia_esgoto,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM sinisa.tb_sinisa_adimplencia AS sa
            WHERE sa.cod_municipio = m.cod_municipio
              AND sa.tipo_servico = 'Resíduos Sólidos'
              AND sa.ano_referencia = 2023
        ) THEN 'adimplente'
        ELSE 'inadimplente'
    END AS adimplencia_residuos,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM sinisa.tb_sinisa_adimplencia AS sa
            WHERE sa.cod_municipio = m.cod_municipio
              AND sa.tipo_servico = 'Águas Pluviais'
              AND sa.ano_referencia = 2023
        ) THEN 'adimplente'
        ELSE 'inadimplente'
    END AS adimplencia_aguas_pluviais
FROM 
    territorio.tb_municipio AS m;


SELECT * FROM territorio.vw_adimplencia;
SELECT count(*) FROM territorio.vw_adimplencia;
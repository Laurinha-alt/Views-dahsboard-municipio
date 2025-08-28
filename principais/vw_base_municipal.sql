DROP MATERIALIZED VIEW territorio.vw_base_municipal;
CREATE MATERIALIZED VIEW territorio.vw_base_municipal AS 
SELECT
    m.cod_municipio,
    m.nome_municipio,
    uf.sigla_uf,
    uf.regiao,
    COALESCE(cm.categoria_metropolitana, 'Não Possui') AS categoria_metropolitana,
    cm.rm_prioritaria,
    sg.subgrupo,
    m.semiarido_2022,
    al.amazonia_legal,
    CASE
    	WHEN el.cod_municipio IS NOT NULL THEN TRUE
    	ELSE FALSE
    END AS elegivel_pac_rural_2025,
    i.idhm AS idhm_2010,
    f.ifdm_2016 AS  indice_firjan_2016,
    cap.capag AS  capag_municipal,
    m.latitude AS latitude_sede,
    m.longitude AS longitude_sede,
    c4714.populacao AS populacao_total_censo_2022,
    c9923.pop_urbana AS populacao_urbana_censo_2022,
    c9923.pop_rural AS populacao_rural_censo_2022,
    ct.domicilios_total,
    cc.domicilios_coletivos,
    cp.domicilios_particulares,
    c4712.dppo AS dppo_total,
    c9922.dppo_urbana,
    CASE WHEN m.cod_municipio = 5101837 THEN NULL ELSE COALESCE(c9922.dppo_rural, 0) END AS dppo_rural,
    COALESCE(c9956.dppo_agua_adequado_urbana, 0) AS dppo_agua_adequado_urbana,
    COALESCE(c9956.dppo_agua_adequado_rural, 0) AS dppo_agua_adequado_rural,
    COALESCE(c9956.dppo_agua_nao_adequado_urbana, 0) AS dppo_agua_nao_adequado_urbana,
    COALESCE(c9956.dppo_agua_nao_adequado_rural, 0) AS dppo_agua_nao_adequado_rural,
    COALESCE(c9956.dppo_esgoto_adequado_urbana, 0) AS dppo_esgoto_adequado_urbana,
    COALESCE(c9956.dppo_esgoto_adequado_rural, 0) AS dppo_esgoto_adequado_rural,
    COALESCE(c9956.dppo_esgoto_nao_adequado_urbana, 0) AS dppo_esgoto_nao_adequado_urbana,
    COALESCE(c9956.dppo_esgoto_nao_adequado_rural, 0) AS dppo_esgoto_nao_adequado_rural,
    COALESCE(c9956.dppo_residuos_adequado_urbana, 0) AS dppo_residuos_adequado_urbana,
    COALESCE(c9956.dppo_residuos_adequado_rural, 0) AS dppo_residuos_adequado_rural,
    COALESCE(c9956.dppo_residuos_nao_adequado_urbana, 0) AS dppo_residuos_nao_adequado_urbana,
    COALESCE(c9956.dppo_residuos_nao_adequado_rural, 0) AS dppo_residuos_nao_adequado_rural,
    COALESCE(b.dppo_com_banheiro_exclusivo_urbana, 0) AS dppo_com_banheiro_exclusivo_urbana,
    COALESCE(b.dppo_com_banheiro_exclusivo_rural, 0) AS dppo_com_banheiro_exclusivo_rural,
    COALESCE(b.dppo_sem_banheiro_exclusivo_urbana, 0) AS dppo_sem_banheiro_exclusivo_urbana,
    COALESCE(b.dppo_sem_banheiro_exclusivo_rural, 0) AS dppo_sem_banheiro_exclusivo_rural,
    c10103.dppo_agua_rede_urbana,
    c10103.dppo_agua_poco_prof_urbana,
    c10103.dppo_agua_poco_raso_urbana,
    c10103.dppo_agua_nascente_urbana,
    c10103.dppo_agua_pipa_urbana,
    c10103.dppo_agua_chuva_urbana,
    c10103.dppo_agua_rio_acude_urbana,
    c10103.dppo_agua_outra_urbana,
    c10103.dppo_agua_rede_rural,
    c10103.dppo_agua_poco_prof_rural,
    c10103.dppo_agua_poco_raso_rural,
    c10103.dppo_agua_nascente_rural,
    c10103.dppo_agua_pipa_rural,
    c10103.dppo_agua_chuva_rural,
    c10103.dppo_agua_rio_acude_rural,
    c10103.dppo_agua_outra_rural,
    c10105.dppo_esgoto_rede_urbana,
    c10105.dppo_esgoto_fossa_septica_lig_rede_urbana,
    c10105.dppo_esgoto_fossa_septica_nao_lig_rede_urbana,
    c10105.dppo_esgoto_fossa_rudimentar_urbana,
    c10105.dppo_esgoto_vala_urbana,
    c10105.dppo_esgoto_rio_lago_mar_urbana,
    c10105.dppo_esgoto_outra_forma_urbana,
    c10105.dppo_esgoto_sem_ban_nem_sanit_urbana,
    c10105.dppo_esgoto_rede_rural,
    c10105.dppo_esgoto_fossa_septica_lig_rede_rural ,
    c10105.dppo_esgoto_fossa_septica_nao_lig_rede_rural,
    c10105.dppo_esgoto_fossa_rudimentar_rural,
    c10105.dppo_esgoto_vala_rural,
    c10105.dppo_esgoto_rio_lago_mar_rural,
    c10105.dppo_esgoto_outra_forma_rural ,
    c10105.dppo_esgoto_sem_ban_nem_sanit_rural,
    c10109.dppo_lixo_coletado_domicilio_urbana,
    c10109.dppo_lixo_depositado_cacamba_urbana,
    c10109.dppo_lixo_queimado_urbana,
    c10109.dppo_lixo_enterrado_urbana,
    c10109.dppo_lixo_jogado_terreno_encosta_urbana,
    c10109.dppo_lixo_outro_destino_urbana,
    c10109.dppo_lixo_coletado_domicilio_rural,
    c10109.dppo_lixo_depositado_cacamba_rural,
    c10109.dppo_lixo_queimado_rural,
    c10109.dppo_lixo_enterrado_rural,
    c10109.dppo_lixo_jogado_terreno_encosta_rural,
    c10109.dppo_lixo_outro_destino_rural,
    c10107.dppo_1_ban_exclus_urbana,
    c10107.dppo_2_ban_exclus_urbana,
    c10107.dppo_3_ban_exclus_urbana,
    c10107.dppo_4_ban_exclus_urbana,
    c10107.dppo_ban_uso_comum_urbana,
    c10107.dppo_sanit_buraco_urbana,
    c10107.dppo_sem_ban_nem_sanit_urbana,
    c10107.dppo_1_ban_exclus_rural,
    c10107.dppo_2_ban_exclus_rural,
    c10107.dppo_3_ban_exclus_rural,
    c10107.dppo_4_ban_exclus_rural,
    c10107.dppo_ban_uso_comum_rural,
    c10107.dppo_sanit_buraco_rural,
    c10107.dppo_sem_ban_nem_sanit_rural,
    ROUND(COALESCE(c9956.dppo_agua_nao_adequado_rural, 0)::NUMERIC / c9922.dppo_rural::NUMERIC, 4) AS deficit_agua_rural_ibge,
    ROUND(COALESCE(c9956.dppo_esgoto_nao_adequado_rural, 0)::NUMERIC / c9922.dppo_rural::NUMERIC, 4) AS deficit_esgoto_rural_ibge,
    ROUND(COALESCE(c9956.dppo_residuos_nao_adequado_rural, 0)::NUMERIC / c9922.dppo_rural::NUMERIC, 4) AS deficit_residuo_rural_ibge,
    ROUND(COALESCE(b.dppo_sem_banheiro_exclusivo_rural, 0)::NUMERIC / c9922.dppo_rural::NUMERIC, 4) AS deficit_banheiro_rural_ibge,
    DENSE_RANK() OVER(ORDER BY COALESCE(c9956.dppo_agua_nao_adequado_rural::DOUBLE PRECISION / c9922.dppo_rural::DOUBLE PRECISION, 0) DESC, dppo_rural DESC) AS ranking_agua_nao_adequado_ibge,
    DENSE_RANK() OVER(ORDER BY COALESCE(c9956.dppo_esgoto_nao_adequado_rural::DOUBLE PRECISION / c9922.dppo_rural::DOUBLE PRECISION, 0) DESC, dppo_rural DESC) AS ranking_esgoto_nao_adequado_ibge,
    DENSE_RANK() OVER(ORDER BY COALESCE(c9956.dppo_residuos_nao_adequado_rural::DOUBLE PRECISION / c9922.dppo_rural::DOUBLE PRECISION, 0) DESC, dppo_rural DESC) AS ranking_residuos_nao_adequado_ibge,
    DENSE_RANK() OVER(ORDER BY COALESCE(b.dppo_sem_banheiro_exclusivo_rural::DOUBLE PRECISION / c9922.dppo_rural::DOUBLE PRECISION, 0) DESC, dppo_rural DESC) AS ranking_sem_banheiro_exclusivo_rural_ibge,
    sh.populacao_total AS snis_populacao_total_2022,
    sh.AG001 AS snis_populacao_adequada_agua,
    sh.ES001 AS snis_populacao_adequada_esgoto,
    sh.CO164 AS snis_populacao_coleta_regular,
    gm.dfe0001 AS sinisa_populacao_total_2023,
    gm.dfe0002 AS sinisa_populacao_urbana_residente,
    gm.dfe0003 AS sinisa_populacao_rural_residente,
    gm.ogm4006 AS sinisa_domicilios_totais_existentes,
    gm.ogm4004 AS sinisa_domicilios_urbanos,
    gm.ogm4005 AS sinisa_domicilios_rurais,
    sa.GTA0001 AS sinisa_populacao_rede_agua_urbana,
    sa.GTA0002 AS sinisa_populacao_rede_agua_rural,
    gm.OGM5007 AS sinisa_populacao_alternativa_agua_urbana,
    gm.OGM5025 AS sinisa_populacao_alternativa_agua_rural,
    ana.sinisa_agua_adequado_urbano,
   	ana.sinisa_agua_adequado_rural,
    ana.sinisa_agua_nao_adequado_urbano,
    ana.sinisa_agua_nao_adequado_rural,
    se.GTE0001 AS sinisa_populacao_rede_esgoto_urbana,
    se.GTE0002 AS sinisa_populacao_rede_esgoto_rural,
    gm.OGM5106 AS sinisa_populacao_alternativa_esgoto_urbana,
    gm.OGM5123 AS sinisa_populacao_alternativa_esgoto_rural,
    ana.sinisa_esgoto_adequado_urbano,
    ana.sinisa_esgoto_adequado_rural,
    ana.sinisa_esgoto_nao_adequado_urbano,
    ana.sinisa_esgoto_nao_adequado_rural,
	(sr.gtr0001 + sr.gtr0002) AS sinisa_domicilios_coleta_residuos_solidos_urbana,
	sr.gtr0003 AS sinisa_domicilios_coleta_residuos_solidos_rural,
	ana.sinisa_domicilios_coleta_residuos_solidos_urbana AS sinisa_residuo_adequado_urbana,
	ana.sinisa_domicilios_coleta_residuos_solidos_rural AS sinisa_residuo_adequado_rural,
	ana.sinisa_domicilios_sem_coleta_residuos_solidos_urbana AS sinisa_residuo_nao_adequado_urbana,
	ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural AS sinisa_residuo_nao_adequado_rural,
    sr.GTR0201 AS sinisa_populacao_coleta_regular,
    ROUND(ana.sinisa_agua_nao_adequado_rural::NUMERIC / (ana.sinisa_agua_adequado_rural::NUMERIC + ana.sinisa_agua_nao_adequado_rural::NUMERIC), 4) AS deficit_agua_rural_sinisa,
	ROUND(ana.sinisa_esgoto_nao_adequado_rural::NUMERIC / (ana.sinisa_esgoto_adequado_rural::NUMERIC + ana.sinisa_esgoto_nao_adequado_rural::NUMERIC), 4) AS deficit_esgoto_rural_sinisa,
	ROUND(ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural::NUMERIC / NULLIF((ana.sinisa_domicilios_coleta_residuos_solidos_rural::NUMERIC + ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural::NUMERIC), 0), 4) AS deficit_residuo_rural_sinisa,
    DENSE_RANK() OVER (ORDER BY COALESCE(ana.sinisa_agua_nao_adequado_rural::DOUBLE PRECISION / (ana.sinisa_agua_adequado_rural::DOUBLE PRECISION + ana.sinisa_agua_nao_adequado_rural::DOUBLE PRECISION),0) DESC) AS ranking_agua_nao_adequado_sinisa,
	DENSE_RANK() OVER (ORDER BY COALESCE(ana.sinisa_esgoto_nao_adequado_rural::DOUBLE PRECISION / (ana.sinisa_esgoto_adequado_rural::DOUBLE PRECISION + ana.sinisa_esgoto_nao_adequado_rural::DOUBLE PRECISION),0) DESC) AS ranking_esgoto_nao_adequado_sinisa,
	DENSE_RANK() OVER (ORDER BY COALESCE(ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural::DOUBLE PRECISION / NULLIF((ana.sinisa_domicilios_coleta_residuos_solidos_rural::DOUBLE PRECISION + ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural::DOUBLE PRECISION),0),0) DESC, ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural DESC) AS ranking_residuo_nao_adequado_sinisa,
    CASE
	    WHEN gm.OGM3004 IS TRUE THEN 'sim'
	    WHEN gm.OGM3004 IS FALSE OR gm.OGM3004 IS NULL THEN 'sem resposta'
  	END AS sinisa_declarou_possuir_pmsb,
    CASE
	    WHEN gm.OGM3012 IS TRUE THEN 'sim'
	    WHEN gm.OGM3012 IS FALSE OR gm.OGM3012 IS NULL THEN 'sem resposta'
  	END AS sinisa_declarou_possuir_pmsb_elaboracao,
    COALESCE(gm.OGM3008, 'sem resposta') AS componentes_abrangidos_pmsb,
    COALESCE(gm.OGM3010, 'sem resposta') AS area_abrangida_pmsb,
    CASE
	    WHEN gm.OGM3013 IS TRUE THEN 'sim'
	    WHEN gm.OGM3013 IS FALSE OR gm.OGM3013 IS NULL THEN 'sem resposta'
  	END AS sinisa_declarou_possuir_pmgirs,
    CASE
	    WHEN gm.OGM3014 IS TRUE THEN 'sim'
	    WHEN gm.OGM3014 IS FALSE OR gm.OGM3014 IS NULL THEN 'sem resposta'
  	END AS sinisa_declarou_possuir_plano_drenagem,
    pae.prestador_agua_sinisa AS sinisa_prestadores_servico_agua,
    pae.natureza_juridica_prestadores_agua,
    pae.area_atuacao_prestadores_agua,
    pae.prestador_esgoto_sinisa AS sinisa_prestadores_servico_esgoto,
    pae.natureza_juridica_prestadores_esgoto,
    pae.area_atuacao_prestadores_esgoto,
    CASE
	    WHEN gm.OGM2001 IS TRUE THEN 'Possui'
	    WHEN gm.OGM2001 IS FALSE OR gm.OGM2001 IS NULL THEN 'Não possui'
  	END AS sinisa_existencia_entidade_regulacao_agua,
    gm.OGM2003 AS sinisa_nome_entidade_regulacao_agua,
    CASE
	    WHEN gm.OGM2101 IS TRUE THEN 'Possui'
	    WHEN gm.OGM2101 IS FALSE OR gm.OGM2101 IS NULL THEN 'Não possui'
  	END AS sinisa_existencia_entidade_regulacao_esgoto,
    gm.OGM2103 AS sinisa_nome_entidade_regulacao_esgoto, 
    gm.OGM2201 AS sinisa_existencia_entidade_regulacao_residuos,
    gm.OGM2203 AS sinisa_nome_entidade_regulacao_residuos,
    gm.OGM2301 AS sinisa_existencia_entidade_regulacao_drenagem,
    gm.OGM2303 AS sinisa_nome_entidade_regulacao_drenagem,
    gm.OGM3201 AS sinisa_existencia_conselho_saneamento,
    gm.OGM3204 AS sinisa_existencia_conselho_afins_saneamento,
    gm.OGM3301 AS sinisa_participacao_consorcio_saneamento,
    gm.OGM3309 AS sinisa_existencia_plano_regional_atuacao_consorcio,
    gm.OGM3310 AS sinisa_servicos_prestados_consorcio,
    ad.adimplencia_gestao_municipal AS sinisa_adimplencia_gestao_municipal,
    ad.adimplencia_agua AS sinisa_adimplencia_agua,
    ad.adimplencia_esgoto AS sinisa_adimplencia_esgoto,
    ad.adimplencia_residuos AS sinisa_adimplencia_residuos,
    ad.adimplencia_aguas_pluviais AS sinisa_adimplencia_aguas_pluviais,
    vw.cod_municipio,
    vw.qtde_familias_baixa_renda_urbana,
    vw.qtde_familias_baixa_renda_rural,
    cu.referencia,
    cu.UF,
    cu.qtde_familias_nbf_rede,
    cu.qtde_familias_nbf_fossa_septica,
    cu.qtde_familias_nbf_fossa_rudimentar,
    cu.qtde_familias_nbf_vala,
    cu.qtde_familias_nbf_riolagomar,
    cu.qtde_familias_nbf_outras_formas,
    cu.qtde_familias_nbf_sem_info,
    cu.qtde_familias_bf_rede,
    cu.qtde_familias_bf_fossa_septica,
    cu.qtde_familias_bf_fossa_rudimentar,
    cu.qtde_familias_bf_vala,
    cu.qtde_familias_bf_riolagomar,
    cu.qtde_familias_bf_outras_formas,
    cu.qtde_familias_bf_sem_info,
    cu.qtde_familias_rede_geral,
    cu.qtde_familias_poco_nascente,
    cu.qtde_familias_cisterna,
    cu.qtde_familias_outras_formas,
    cu.qtde_familias_sem_info,
    cu.qtde_familias_pobreza_urbana,
    cu.qtde_familias_ate_meio_sm_urbana,
    cu.qtde_familias_acima_meio_sm_urbana,
    cu.qtde_familias_pobreza_rural,
    cu.qtde_familias_ate_meio_sm_rural,
    cu.qtde_familias_acima_meio_sm_rural,
    cu.percentual_familias_pobreza_baixa_renda_rural,
    cu.nome_municipio
FROM territorio.tb_municipio as m
    LEFT JOIN territorio.tb_uf AS uf 
		ON m.cod_uf = uf.cod_uf 
    LEFT JOIN territorio.vw_amazonia_legal AS al
		ON m.cod_municipio = al.cod_municipio 
    LEFT JOIN censo.tb_censo_2022_tabela_4714 AS c4714 
		ON m.cod_municipio = c4714.cod_municipio 
    LEFT JOIN territorio.vw_banheiros AS b 
		ON m.cod_municipio = b.cod_municipio 
    LEFT JOIN censo.tb_censo_2022_tabela_4711 AS c4711 
		ON m.cod_municipio = c4711.cod_municipio 
    LEFT JOIN censo.tb_censo_2022_tabela_4712 AS c4712 
		ON m.cod_municipio = c4712.cod_municipio 
    LEFT JOIN censo.tb_censo_2022_tabela_9922 AS c9922 
		ON m.cod_municipio = c9922.cod_municipio
  	LEFT JOIN censo.tb_censo_2022_tabela_9923 AS c9923 
		ON m.cod_municipio = c9923.cod_municipio
    LEFT JOIN censo.tb_censo_2022_tabela_9956 AS c9956 
		ON m.cod_municipio = c9956.cod_municipio 
    LEFT JOIN sinisa.tb_sinisa_gestao_municipal AS gm
		ON m.cod_municipio = gm.cod_municipio 
    LEFT JOIN sinisa.tb_sinisa_agua AS sa
		ON m.cod_municipio = sa.cod_municipio
	LEFT JOIN sinisa.tb_sinisa_residuo AS sr
		ON m.cod_municipio = sr.cod_municipio
    LEFT JOIN sinisa.tb_snis_serie_historica AS sh
		ON m.cod_municipio = sh.cod_municipio AND sh.ano_referencia = 2022
    LEFT JOIN sinisa.tb_sinisa_esgoto AS se
		ON m.cod_municipio = se.cod_municipio
	LEFT JOIN sinisa.vw_calculos_atendimento_adequado_nao_adequado_sinisa AS ana
		ON m.cod_municipio = ana.cod_municipio
    LEFT JOIN dados_gerais.tb_idhm AS i
		ON m.cod_municipio = i.cod_municipio 
    LEFT JOIN dados_gerais.tb_firjan AS f
		ON m.cod_municipio = f.cod_municipio 
    LEFT JOIN dados_gerais.tb_capag_municipal AS cap
		ON m.cod_municipio = cap.cod_municipio 
    LEFT JOIN territorio.vw_censo_total AS ct
    	ON m.cod_municipio = ct.cod_municipio
    LEFT JOIN territorio.vw_censo_coletivos AS cc
    	ON m.cod_municipio = cc.cod_municipio
    LEFT JOIN territorio.vw_censo_particulares AS cp
    	ON m.cod_municipio = cp.cod_municipio
    LEFT JOIN territorio.vw_categoria_metropolitana AS cm
    	ON m.cod_municipio = cm.cod_municipio
    LEFT JOIN territorio.vw_subgrupo AS sg
    	ON m.cod_municipio = sg.cod_municipio
    LEFT JOIN territorio.vw_adimplencia AS ad
    	ON m.cod_municipio = ad.cod_municipio
    LEFT JOIN territorio.vw_prestadores_agua_esgoto AS pae
    	ON m.cod_municipio = pae.cod_municipio
    LEFT JOIN censo.tb_censo_2022_tabela_10103 AS c10103
    	ON m.cod_municipio = c10103.cod_municipio
    LEFT JOIN censo.tb_censo_2022_tabela_10105 AS c10105
    	ON m.cod_municipio = c10105.cod_municipio
    LEFT JOIN censo.tb_censo_2022_tabela_10109 AS c10109
    	ON m.cod_municipio = c10109.cod_municipio
    LEFT JOIN censo.tb_censo_2022_tabela_10107 AS c10107
    	ON m.cod_municipio = c10107.cod_municipio
    LEFT JOIN instrumento.tb_municipio_elegivel_rural_2025 AS el
    	ON m.cod_municipio = el.cod_municipio
    LEFT JOIN temporario.vw_cadunico_cod7 AS vw
        ON m.cod_municipio = vw.cod_municipio
    LEFT JOIN dados_gerais.tb_cadunico AS cu
       ON m.cod_municipio = cu.cod_municipio
    WHERE cu.referencia = 'jun/25';

SELECT cod_municipio, 
	sinisa_domicilios_sem_coleta_residuos_solidos_rural, 
	sinisa_domicilios_coleta_residuos_solidos_rural 
	FROM sinisa.vw_calculos_atendimento_adequado_nao_adequado_sinisa 
	WHERE sinisa_domicilios_coleta_residuos_solidos_rural = 0;

SELECT cod_municipio, 
	sinisa_domicilios_sem_coleta_residuos_solidos_urbana, 
	sinisa_domicilios_coleta_residuos_solidos_urbana 
	FROM sinisa.vw_calculos_atendimento_adequado_nao_adequado_sinisa 
	WHERE sinisa_domicilios_sem_coleta_residuos_solidos_urbana = 0 AND sinisa_domicilios_coleta_residuos_solidos_urbana = 0;

SELECT cod_municipio,
	--COALESCE(ana.sinisa_agua_nao_adequado_rural::DOUBLE PRECISION / (ana.sinisa_agua_adequado_rural::DOUBLE PRECISION + ana.sinisa_agua_nao_adequado_rural::DOUBLE PRECISION),0) AS deficit_agua_rural_sinisa,
	--COALESCE(ana.sinisa_esgoto_nao_adequado_rural::DOUBLE PRECISION / (ana.sinisa_esgoto_adequado_rural::DOUBLE PRECISION + ana.sinisa_esgoto_nao_adequado_rural::DOUBLE PRECISION),0) AS deficit_esgoto_rural_sinisa,
	COALESCE(ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural::DOUBLE PRECISION / NULLIF((ana.sinisa_domicilios_coleta_residuos_solidos_rural::DOUBLE PRECISION + ana.sinisa_domicilios_sem_coleta_residuos_solidos_rural::DOUBLE PRECISION),0),0) AS deficit_residuo_rural_sinisa
	FROM sinisa.vw_calculos_atendimento_adequado_nao_adequado_sinisa AS ana;

SELECT cod_municipio, 
	nome_municipio, 
	sinisa_residuo_nao_adequado_rural, 
	sinisa_residuo_adequado_rural 
	FROM territorio.vw_base_municipal
	WHERE cod_municipio = 1504208;

SELECT count(cod_municipio)
	FROM territorio.vw_base_municipal
	WHERE deficit_agua_rural_sinisa IS NULL;

SELECT cod_municipio, nome_municipio, ranking_residuo_nao_adequado_sinisa, sinisa_residuo_nao_adequado_rural, sinisa_residuo_adequado_rural, deficit_residuo_rural_sinisa
	FROM territorio.vw_base_municipal 
	ORDER BY ranking_residuo_nao_adequado_sinisa ASC, deficit_residuo_rural_sinisa;

SELECT * FROM territorio.vw_base_municipal WHERE territorio.vw_base_municipal.nome_municipio = 'Brasília';

SELECT cod_municipio, dppo_rural, dppo_agua_nao_adequado_rural, dppo_agua_adequado_rural, deficit_agua_rural_ibge FROM territorio.vw_base_municipal WHERE deficit_agua_rural_ibge = 0;
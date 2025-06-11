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
    c4714.populacao AS populacao_total_censo_2022,
    c9923.pop_urbana AS populacao_urbana_censo_2022,
    c9923.pop_rural AS populacao_rural_censo_2022,
    ct.domicilios_total,
    cc.domicilios_coletivos,
    cp.domicilios_particulares,
    c4712.dppo AS dppo_total,
    c9922.dppo_urbana,
    c9922.dppo_rural,
    c9956.dppo_agua_adequado_urbana,
    c9956.dppo_agua_adequado_rural,
    c9956.dppo_agua_nao_adequado_urbana,
    c9956.dppo_agua_nao_adequado_rural,
    c9956.dppo_esgoto_adequado_urbana,
    c9956.dppo_esgoto_adequado_rural,
    c9956.dppo_esgoto_nao_adequado_urbana,
    c9956.dppo_esgoto_nao_adequado_rural,
    c9956.dppo_residuos_adequado_urbana,
    c9956.dppo_residuos_adequado_rural,
    c9956.dppo_residuos_nao_adequado_urbana,
    c9956.dppo_residuos_nao_adequado_rural,
    b.dppo_com_banheiro_exclusivo_urbana,
    b.dppo_com_banheiro_exclusivo_rural,
    b.dppo_sem_banheiro_exclusivo_urbana,
    b.dppo_sem_banheiro_exclusivo_rural,
    ad.adimplencia_gestao_municipal,
    ad.adimplencia_agua,
    ad.adimplencia_esgoto,
    ad.adimplencia_residuos,
    ad.adimplencia_aguas_pluviais,
    CASE
    WHEN gm.OGM3004 IS TRUE THEN 'sim'
    WHEN gm.OGM3004 IS FALSE OR gm.OGM3004 IS NULL THEN 'sem resposta'
  END AS declarou_possuir_pmsb,
    CASE
    WHEN gm.OGM3012 IS TRUE THEN 'sim'
    WHEN gm.OGM3012 IS FALSE OR gm.OGM3012 IS NULL THEN 'sem resposta'
  END AS declarou_possuir_pmsb_elaboracao,
    COALESCE(gm.OGM3008, 'sem resposta') AS componentes_abrangidos_pmsb,
    COALESCE(gm.OGM3010, 'sem resposta') AS area_abrangida_pmsb,
    CASE
    WHEN gm.OGM3013 IS TRUE THEN 'sim'
    WHEN gm.OGM3013 IS FALSE OR gm.OGM3013 IS NULL THEN 'sem resposta'
  END AS declarou_possuir_pmgirs,
    CASE
    WHEN gm.OGM3014 IS TRUE THEN 'sim'
    WHEN gm.OGM3014 IS FALSE OR gm.OGM3014 IS NULL THEN 'sem resposta'
  END AS declarou_possuir_plano_drenagem,
    pae.prestador_agua_sinisa AS prestadores_servico_agua,
    pae.natureza_juridica_prestadores_agua,
    pae.area_atuacao_prestadores_agua,
    pae.prestador_esgoto_sinisa AS prestadores_servico_esgoto,
    pae.natureza_juridica_prestadores_esgoto,
    pae.area_atuacao_prestadores_esgoto,
    CASE
    WHEN gm.OGM2001 IS TRUE THEN 'Possui'
    WHEN gm.OGM2001 IS FALSE OR gm.OGM2001 IS NULL THEN 'Não possui'
  END AS existencia_entidade_regulacao_agua,
    gm.OGM2003 AS nome_entidade_regulacao_agua,
      CASE
    WHEN gm.OGM2101 IS TRUE THEN 'Possui'
    WHEN gm.OGM2101 IS FALSE OR gm.OGM2101 IS NULL THEN 'Não possui'
  END AS existencia_entidade_regulacao_esgoto,
    gm.OGM2103 AS nome_entidade_regulacao_esgoto, 
    gm.OGM2201 AS existencia_entidade_regulacao_residuos,
    gm.OGM2203 AS nome_entidade_regulacao_residuos,
    gm.OGM2301 AS existencia_entidade_regulacao_drenagem,
    gm.OGM2303 AS nome_entidade_regulacao_drenagem,
    gm.OGM3201 AS existencia_conselho_saneamento,
    gm.OGM3204 AS existencia_conselho_afins_saneamento,
    gm.OGM3301 AS participacao_consorcio_saneamento,
    gm.OGM3309 AS existencia_plano_regional_atuacao_consorcio,
    gm.OGM3310 AS servicos_prestados_consorcio,
    sa.GTA0001 AS populacao_rede_agua_urbana,
    sa.GTA0002 AS populacao_rede_agua_rural,
    sh.ES001 AS snis_populacao_adequada_esgoto,
    sh.AG001 AS snis_populacao_adequada_agua,
    sh.CO164 AS snis_populacao_adequada_residuos,
    sh.populacao_total AS snis_populacao_total_2022,
    gm.OGM5007 AS sinisa_populacao_alternativa_agua_urbana,
    gm.OGM5025 AS sinisa_populacao_alternativa_agua_rural,
    gm.dfe0001 AS sinisa_populacao_total_2023,
    se.GTE0001 AS sinisa_populacao_rede_esgoto_urbana,
    se.GTE0002 AS sinisa_populacao_rede_esgoto_rural,
    sr.GTR0201 AS sinisa_populacao_adequada_residuos,
    gm.OGM5106 AS sinisa_populacao_alternativa_esgoto_urbana,
    gm.OGM5123 AS sinisa_populacao_alternativa_esgoto_rural,
    i.idhm AS idhm_2010,
    f.ifdm_2016 AS  indice_firjan_2016,
    cap.capag AS  capag_municipal,
    m.latitude AS latitude_sede,
    m.longitude AS longitude_sede,
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
    c10107.dppo_sem_ban_nem_sanit_rural
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
    ON m.cod_municipio = c10107.cod_municipio;

 
 SELECT 
 COUNT(*) FROM territorio.vw_base_municipal;

 --testando git
 --testando 2
5348981 (Adicionando dados do Censo 2022 sobre água, esgoto e lixo (urbano e rural))

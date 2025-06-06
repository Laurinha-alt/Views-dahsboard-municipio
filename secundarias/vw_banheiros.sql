CREATE MATERIALIZED VIEW territorio.vw_banheiros AS
SELECT
*,
    (dppo_1_ban_exclus_urbana + dppo_2_ban_exclus_urbana + dppo_3_ban_exclus_urbana + dppo_4_ban_exclus_urbana) AS dppo_com_banheiro_exclusivo_urbana,
	(dppo_1_ban_exclus_rural + dppo_2_ban_exclus_rural + dppo_3_ban_exclus_rural + dppo_4_ban_exclus_rural) AS dppo_com_banheiro_exclusivo_rural,
	(dppo_ban_uso_comum_urbana + dppo_sanit_buraco_urbana + dppo_sem_ban_nem_sanit_urbana ) AS dppo_sem_banheiro_exclusivo_urbana,
	(dppo_ban_uso_comum_rural + dppo_sanit_buraco_rural + dppo_sem_ban_nem_sanit_rural) AS dppo_sem_banheiro_exclusivo_rural
FROM 
    censo.tb_censo_2022_tabela_10107;
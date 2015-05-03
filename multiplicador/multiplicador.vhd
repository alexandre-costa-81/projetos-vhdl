library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity multiplicador is
	port (
		reg_md: in std_logic_vector(3 downto 0);
		reg_mr: in std_logic_vector(3 downto 0);
		reg_pr: out std_logic_vector(7 downto 0)
	);
end multiplicador;

architecture arq of multiplicador is
	signal controle_carga_md, mr_mux, controle_carga_mr, controle_desloca_mr, controle_limpa_pr, controle_desloca_pr: std_logic;
	signal md_mux, mux_somador, pr_somador: std_logic_vector(3 downto 0);
	signal somador_pr: std_logic_vector(4 downto 0);

	component md is
		port (
			d: in std_logic_vector(3 downto 0);
			carga: in std_logic;
			q: out std_logic_vector(3 downto 0)
		);
	end component;

	component multplexador2x1 is
		port (
			sel: in  std_logic;
			entrada1: in  std_logic_vector (3 downto 0);
			saida: out std_logic_vector (3 downto 0)
		);
	end component;

	component mr is
		port (
			d: in std_logic_vector(3 downto 0);
			carga, desloca: in std_logic;
			q: out std_logic
		);
	end component;

	component somador is
		port (
			operando_a: in std_logic_vector(3 downto 0);
			operando_b: in std_logic_vector(3 downto 0);
			soma: out std_logic_vector(4 downto 0)
		);
	end component;

	component pr is
		port (
			d: in std_logic_vector(4 downto 0);
			limpa, desloca: in std_logic;
			q_somador: out std_logic_vector(3 downto 0);
			q: out std_logic_vector(7 downto 0)
		);
	end component;

begin
	md_map : md port map(d => reg_md, carga => controle_carga_md, q => md_mux);
	mux    : multplexador2x1 port map (sel => mr_mux, entrada1 => md_mux, saida => mux_somador);
	mr_map : mr port map(d => reg_mr, carga => controle_carga_mr, desloca => controle_desloca_mr, q => mr_mux);
	somar  : somador port map(operando_a => mux_somador, operando_b => pr_somador, soma => somador_pr);
	pr_map : pr port map(d => somador_pr, limpa => controle_limpa_pr, desloca => controle_desloca_pr, q_somador => pr_somador, q => reg_pr);
end arq;
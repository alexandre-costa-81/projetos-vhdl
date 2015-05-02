library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity multiplicador is
	port (
		operador_a, operador_b: in std_logic_vector(3 downto 0);
		resultado: out std_logic_vector(7 downto 0)
	);
end multiplicador;

architecture arc of multiplicador is
begin
end arc;
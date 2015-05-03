library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity somador is
	port (
		operando_a: in std_logic_vector(3 downto 0);
		operando_b: in std_logic_vector(3 downto 0);
		soma: out std_logic_vector(4 downto 0)
	);
end somador;

architecture arq of somador is
begin
	soma <= '0'&(operando_a + operando_b);
end arq;
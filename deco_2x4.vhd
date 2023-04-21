library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_2_4_exp3 is -- deco 2x4
port (
A: in std_logic_vector (1 downto 0);         -- entrada
e: in std_logic;
y: out std_logic_vector (3 downto 0));

end decodificador_2_4_exp3;

architecture rtl of decodificador_2_4_exp3 is
signal eA: std_logic_vector (2 downto 0);

begin

eA <= e & A;            -- with e select
with eA select
y <= "0001" when "100", "0010" when "101", "0100" when "110", "1000" when "111", "0000" when others;

end rtl;

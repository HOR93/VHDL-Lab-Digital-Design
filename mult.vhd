library ieee;


use ieee.std_logic_1164.all;


entity multi_exp is port (

s_0_1:in std_logic_vector (1 downto 0);

d_0_1_2_3:in std_logic_vector (3 downto 0);

y_saida:out std_logic);

end multi_exp;

architecture rtl of multi_exp is

begin
y_saida <= (d_0_1_2_3(0) and not(s_0_1(1)) and not(s_0_1(0))) or (d_0_1_2_3(1) and not(s_0_1(1)) and s_0_1(0)) or
(d_0_1_2_3(2) and s_0_1(1) and not(s_0_1(0))) or (d_0_1_2_3(3) and s_0_1(1) and s_0_1(0));

end rtl;

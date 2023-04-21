library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity arithmatic_adder is port(
    a, b : in  std_logic_vector (3 downto 0);
    s    : out std_logic_vector (4 downto 0)
);
end arithmatic_adder;

architecture arch of arithmatic_adder is
begin
    
    s <= unsigned('0' & a) + unsigned('0' & b);

end arch;

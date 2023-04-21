library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity maquina_estados_moore is port (

    a : in std_logic_vector (1 downto 0);

    clk, reset : in std_logic;

    refrigerante, r_c25, r_c50 : out std_logic );


end maquina_estados_moore;

architecture arch of maquina_estados_moore is

    type estado is (init, 
                    c25, 
                    c50, 
                    c75, 
                    c100, 
                    c125, 
                    d25, 
                    d50, 
                    d75);

    signal current_state, next_state : estado;

begin

    sync_process : process (clk, reset)
    begin
        if reset = '1' then current_state <= init;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process sync_process;

    comp_process : process(current_state, a)
    begin
        case current_state is
            when init =>
                refrigerante <= '0'; r_c25 <= '0'; r_c50 <= '0';
                case a is
                    when "00" => next_state <= init; when "01" => next_state <= c25; when "10" => next_state <= c50; when others => next_state <= init;
                end case;
            when c25 =>
                refrigerante <= '0';
                r_c25 <= '0';
                r_c50 <= '0';
                case a is
                    when "00" => next_state <= c25; when "01" => next_state <= c50; when "10" => next_state <= c75; when others => next_state <= d25;
                end case;
            when c50 =>
                refrigerante <= '0';
                r_c25 <= '0';
                r_c50 <= '0';
                case a is
                    when "00" => next_state <= c50; when "01" => next_state <= c75; when "10" => next_state <= c100; when others => next_state <= d50;
                end case;
            when c75 =>
                refrigerante <= '0';
                r_c25 <= '0';
                r_c50 <= '0';
                case a is
                    when "00" => next_state <= c75; when "01" => next_state <= c100; when "10" => next_state <= c125; when others => next_state <= d75;
                end case;
            when c100 =>
                refrigerante <= '1';
                r_c25  <= '0';
                r_c50  <= '0';
                case a is
                    when "00" => next_state <= init; when "01" => next_state <= c25; when "10" => next_state <= c50; when others => next_state <= init;
                end case;
            when c125 =>
                refrigerante <= '1';
                r_c25 <= '1';
                r_c50 <= '0';
                case a is
                    when "00" => next_state <= init; when "01" => next_state <= c25; when "10" => next_state <= c50; when others => next_state <= init;
                end case;
            when d25 =>
                refrigerante <= '0';
                r_c25 <= '1';
                r_c50 <= '0';
                case a is
                    when "00" => next_state <= init; when "01" => next_state <= c25; when "10" => next_state <= c50; when others => next_state <= init;
                end case;
            when d50 =>
                refrigerante <= '0';
                r_c25 <= '0';
                r_c50 <= '1';
                case a is
                    when "00" => next_state <= init; when "01" => next_state <= c25; when "10" => next_state <= c50; when others => next_state <= init;
                end case;
            when others =>
                refrigerante <= '0';
                r_c25 <= '1';
                r_c50 <= '1';
                case a is
                    when "00" => next_state <= init; when "01" => next_state <= c25; when "10" => next_state <= c50; when others => next_state <= init;
                end case;
        end case;
    end process;
end arch;

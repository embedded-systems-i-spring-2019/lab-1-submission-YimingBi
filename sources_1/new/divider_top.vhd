library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider_top is
    Port ( clk : in std_logic;
           led0 : out std_logic);
end divider_top;

architecture Behavioral of divider_top is
    signal div_out : std_logic;
    signal reg_out : std_logic := '0';
    component clock_div
        port ( clk : in std_logic;
               div : out std_logic);
    end component;
begin
    divider : clock_div
    port map ( clk => clk,
               div => div_out);

    process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (div_out = '1') then
                reg_out <= (not reg_out);
                --led0 <= reg_out;
            end if;
        end if;
    end process;
    
    led0 <= reg_out;
    
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
    Port ( clk : in std_logic;      -- 125 MHz
           div : out std_logic);    -- 2 Hz output
end clock_div;

architecture Behavioral of clock_div is
    signal counter : std_logic_vector(26 downto 0);
begin
    process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (unsigned(counter) < 62499999 ) then
                counter <= std_logic_vector(unsigned(counter) +1);
                div <= '0';
            else
                counter <= (others => '0');
                div <= '1';
            end if;
            
        end if;
    end process;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
    Port ( btn, clk : in std_logic;
           dbnc : out std_logic);
end debounce;
    
architecture Behavioral of debounce is
    signal counter : std_logic_vector(26 downto 0); --set to 2500000
    signal btn_last : std_logic;
begin
    process(CLK)
    begin

        if (rising_edge(CLK)) then
            if (btn = btn_last) then
                if (unsigned(counter) < 2499999 ) then
                counter <= std_logic_vector(unsigned(counter) +1);                
                else
                counter <= (others => '0');
                dbnc <= btn;
                end if;
            else
            counter <= (others => '0');    
            end if;
        btn_last <= btn;            
        end if;
    end process;
end Behavioral;

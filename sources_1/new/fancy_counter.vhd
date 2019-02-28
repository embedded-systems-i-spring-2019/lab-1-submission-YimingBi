library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
    Port ( clk, clk_en, dir, en, ld, rst, updn : in std_logic;
           val : in std_logic_vector(3 downto 0);
           cnt : out std_logic_vector(3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal value_reg : unsigned(3 downto 0);
    signal dir_reg : std_logic:='0';
begin
    process(clk)
    begin
        if (en = '1') then
            if (clk_en = '1') then
                if (rising_edge(clk)) then
                    if (rst = '1') then
                        value_reg <= "0000";
                    else
                    
                        if (updn = '1') then
                            dir_reg <= dir;
                        end if;
                        
                        if (dir_reg = '1') then
--                            if (unsigned(value_reg) = 15) then
--                                value_reg <= (others => '0');
--                            end if;
                            value_reg <= value_reg + 1;
--                        end if;
                        elsif (dir_reg = '0') then
--                            if (unsigned(value_reg) = 0) then
--                                value_reg <= (others => '1');
--                            end if;
                            value_reg <= value_reg - 1;
                        end if;
                        
                        if (ld = '1') then
                            value_reg <= unsigned(val);
                        end if;
                        
                    end if;                
                end if;        
            else
                if (rst = '1') then
                    value_reg <= "0000";
                end if;
            end if;
        end if;
    end process;
cnt <= std_logic_vector(value_reg);
end Behavioral;

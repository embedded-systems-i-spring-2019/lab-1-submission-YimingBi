library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab1_tb is
--  Port ( );
end Lab1_tb;

architecture testbench of Lab1_tb is
    
    signal tb_clk : std_logic := '0';
    signal tb_led0 : std_logic;
    
    component divider_top is 
        port ( clk : in std_logic;
               led0 : out std_logic);
    end component;
    
begin

    clk_gen_proc: process
    begin
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';
    end process clk_gen_proc;

    dut : divider_top
    port map( clk => tb_clk,
              led0 => tb_led0);

end testbench;

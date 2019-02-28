library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bedounce_tb is
--  Port ( );
end bedounce_tb;

architecture Behavioral of bedounce_tb is

    signal tb_clk, tb_btn : std_logic := '0';
    signal tb_dbnc : std_logic;
    component debounce is
        Port ( btn, clk : in std_logic;
               dbnc : out std_logic);
    end component;

begin

    clk_gen_proc: process
    begin
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';
    end process clk_gen_proc;
    
    btn_gen_proc: process
    begin
        tb_btn <= '1';   wait for 90 ms;
        tb_btn <= '0';   wait for 10 ms;
        tb_btn <= '1';   wait for 60 ms;
        tb_btn <= '0';   wait for 40 ms;
        tb_btn <= '1';   wait for 40 ms;
        tb_btn <= '0';   wait for 60 ms;
        tb_btn <= '1';   wait for 10 ms;
        tb_btn <= '0';   wait for 90 ms;    
    end process;

    dut : debounce
    port map( clk => tb_clk,
              btn => tb_btn,
              dbnc => tb_dbnc);

end Behavioral;

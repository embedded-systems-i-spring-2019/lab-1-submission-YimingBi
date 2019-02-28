library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fc_tb is
--  Port ( );
end Fc_tb;

architecture Behavioral of Fc_tb is

    signal tb_clk : std_logic := '0';
    signal tb_clk_en, tb_dir, tb_en, tb_ld, tb_rst, tb_updn : std_logic;
    signal tb_cnt : std_logic_vector(3 downto 0);
    signal tb_val : std_logic_vector(3 downto 0);

    component fancy_counter is
        Port ( clk, clk_en, dir, en, ld, rst, updn : in std_logic;
               val : in std_logic_vector(3 downto 0);
               cnt : out std_logic_vector(3 downto 0));
    end component;

begin

    clk_gen_proc: process
    begin
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';
    end process clk_gen_proc;
    
    en_gen_proc: process
    begin
        tb_clk_en <= '1';
        tb_en <= '1';
        wait for 2000 ms;
    end process;
    
    rst_gen_proc: process
    begin
        tb_rst <= '1';  wait for 20 ns;
        tb_rst <= '0';  wait for 1999 ms;
    end process;
    
    other_gen_process: process
    begin
        tb_dir <= '1';
        tb_val <= "1000";
        wait for 2000 ms;
    end process;
    
    load_gen_proc: process
    begin
        tb_ld <= '0';   wait for 48 ns;
        tb_ld <= '1';   wait for 6 ns;
        tb_ld <= '0';   wait for 1990 ms;
    end process;
    
    updn_gen_proc: process
    begin
    tb_updn <= '0';     wait for 40 ns;  
    tb_updn <= '1';     wait for 6 ns;   
    tb_updn <= '0';     wait for 1990 ms;
    end process;
    
    dut : fancy_counter
    port map( clk => tb_clk,
              clk_en => tb_clk_en,
              dir => tb_dir,
              en => tb_en,
              ld => tb_ld,
              rst => tb_rst,
              updn => tb_updn,
              val => tb_val,
              cnt => tb_cnt);
    
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_top is
    Port ( clk : in std_logic;
            btn, sw : in std_logic_vector(3 downto 0);
            led : out std_logic_vector(3 downto 0));
end counter_top;

architecture Behavioral of counter_top is

    component debounce
        Port ( btn, clk : in std_logic;
                dbnc : out std_logic);
    end component;
    
    component clock_div
        Port ( clk : in std_logic;      -- 125 MHz
                div : out std_logic);    -- 2 Hz output
    end component;
    
    component fancy_counter
        Port ( clk, clk_en, dir, en, ld, rst, updn : in std_logic;
                val : in std_logic_vector(3 downto 0);
                cnt : out std_logic_vector(3 downto 0));
    end component;
    
    signal u1_out, u2_out, u3_out, u4_out, u5_out : std_logic;
        
begin
    u1: debounce
    port map ( btn => btn(0),
                clk => clk,
                dbnc => u1_out);
    
    u2: debounce
    port map ( btn => btn(1),
                clk => clk,
                dbnc => u2_out);
                
    u3: debounce
    port map ( btn => btn(2),
                clk => clk,
                dbnc => u3_out);
                
    u4: debounce
    port map ( btn => btn(3),
                clk => clk,
                dbnc => u4_out);
                
    u5: clock_div
    port map ( clk => clk,
                div => u5_out);
                
    u6: fancy_counter
    port map ( clk => clk,
                clk_en => u5_out,
                dir => sw(0),
                en => u2_out,
                ld => u4_out,
                rst => u1_out,
                updn => u3_out,
                val => sw,
                cnt => led);                
end Behavioral;

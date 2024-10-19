-- ECE532 HW1 Top Level
-- Franklin Okoh
-- 30-SEP-2024

library ieee;
  use ieee.std_logic_1164.all;

entity hw1 is
  port
  (
    i_clk      : in    std_logic;
    i_rst_n    : in    std_logic;
	 
	 o_green_led : out std_logic_vector (7 downto 0);
	 i_button    : in std_logic;
	 i_switch    : in std_logic_vector (17 downto 0);
	 o_hex0      : out std_logic_vector(6 downto 0);
	 o_hex1      : out std_logic_vector(6 downto 0);
	 o_hex2      : out std_logic_vector(6 downto 0);
	 o_hex3      : out std_logic_vector(6 downto 0);
	 o_hex4      : out std_logic_vector(6 downto 0);
	 o_hex5      : out std_logic_vector(6 downto 0);
	 o_hex6      : out std_logic_vector(6 downto 0);
	 o_hex7      : out std_logic_vector(6 downto 0);
	 o_rled      : out std_logic_vector(17 downto 0);
	 o_uart_tx   : out std_logic;
	 i_uart_rx   : in std_logic
  );
end hw1;

architecture sch of hw1 is

  component hw1_cpu is
  port (
    clk_clk         : in    std_logic;
    reset_reset_n   : in    std_logic;
	 
	 green_led_export : out std_logic_vector (7 downto 0);
	 button_export    : in   std_logic;
	 switch_export    : in   std_logic_vector (17 downto 0);
	 hex0_export      : out std_logic_vector (6 downto 0);
	 hex1_export      : out std_logic_vector (6 downto 0);
	 hex2_export      : out std_logic_vector (6 downto 0);
	 hex3_export      : out std_logic_vector (6 downto 0);
	 hex4_export      : out std_logic_vector (6 downto 0);
	 hex5_export      : out std_logic_vector (6 downto 0);
	 hex6_export      : out std_logic_vector (6 downto 0);
	 hex7_export      : out std_logic_vector (6 downto 0);
	 uart_txd         : out std_logic;
	 uart_rxd         : in  std_logic
  );
  end component hw1_cpu;

begin
  o_rled <= i_switch;

  u0 : component hw1_cpu
	port map 
  (
    clk_clk          => i_clk,
    reset_reset_n    => i_rst_n,
	
	 green_led_export => o_green_led,
	 button_export    => i_button,
	 switch_export    => i_switch,
	 hex0_export      => o_hex0,
	 hex1_export      => o_hex1,
	 hex2_export      => o_hex2,
	 hex3_export      => o_hex3,
	 hex4_export      => o_hex4,
	 hex5_export      => o_hex5,
	 hex6_export      => o_hex6,
	 hex7_export      => o_hex7,
	 uart_txd         => o_uart_tx,
	 uart_rxd         => i_uart_rx
  );

end sch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_count_rst is 
end tb_count_rst;

architecture arc_rst of tb_count_rst is
  component counterR
    generic (
	constant N : natural :=5
);
port(
	clk:in std_logic;
	reset:in std_logic;
	PcW: in std_logic;
	S: out std_logic_vector(N-1 downto 0)
);        

  end component;

  -- inputs 
  signal clk   : std_logic;
  signal reset,PcW : std_logic;

  -- outputs 
  signal S : std_logic_vector(3 downto 0);

  signal i : integer; 
begin
  inst : CounterR 
    port map (
      clk => clk,
      reset => reset,
      PcW => PcW, 
      S => S
    );

  process
  begin
    reset <= '0';
    for i in 0 to 8 loop
    clk <= '0';
    wait for 100 ns;
    clk <= '1';
    wait for 100 ns;
    end loop;
    reset <= '1';
    clk <= '0';
    wait for 100 ns;
    clk <= '1';
    wait for 100 ns;
    
  end process;
end arc_rst;

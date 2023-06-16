library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  

entity Register_16bit is
  port (
    clk: in std_logic;
    Wr: in std_logic;
    d: in std_logic_vector(15 downto 0);
    q: out std_logic_vector(15 downto 0)
  );
end entity Register_16bit;

architecture BehavioralRegistre of Register_16bit is
  component D_FF is
    port (
      clk: in std_logic;
      Wr: in std_logic;  
      d: in std_logic;
      q: out std_logic
    );
  end component;

signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15: std_logic;

begin
  -- Instantiate D flip-flops
  FF0: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(0),
      q => q0
    );

  FF1: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(1),
      q => q1
    );

  FF2: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(2),
      q => q2
    );

  FF3: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(3),
      q => q3
    );
FF4: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(4),
      q => q4
    );
    
  FF5: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(5),
      q => q5
    );
    
  FF6: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(6),
      q => q6
    );
    
  FF7: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(7),
      q => q7
    );
    
  FF8: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(8),
      q => q8
    );
    
  FF9: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(9),
      q => q9
    );
    
  FF10: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(10),
      q => q10
    );
    
  FF11: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(11),
      q => q11
    );
    
  FF12: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(12),
      q => q12
    );
    
  FF13: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(13),
      q => q13
    );
    
  FF14: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(14),
      q => q14
    );
    
  FF15: D_FF
    port map (
      clk => clk,
      Wr => Wr,
      d => d(15),
      q => q15
    );

  -- Output assignment
  q <= q15 & q14 & q13 & q12 & q11 & q10 & q9 & q8 & q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;
end architecture BehavioralRegistre;

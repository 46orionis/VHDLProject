library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  

entity CSR is
  port (
	clk: in std_logic;
	d: in std_logic_vector(15 downto 0);
	jump: out std_logic_vector(4 downto 0);
	muxchoice: out std_logic;
	incremente_choice: out std_logic;
	MEMw: out std_logic;
	SRw: out std_logic;
	DRw: out std_logic;
	ARw: out std_logic;
	IRw: out std_logic;
	Pc_incremente: out std_logic;
	DRsrc: out std_logic;
	RFsrc: out std_logic;
	RFxy: out std_logic
	
  );
end entity CSR;

architecture BehavioralRegistre of CSR is
  component D_FF is
    port (
      clk: in std_logic;
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
      d => d(0),
      q => q0
    );

  FF1: D_FF
    port map (
      clk => clk,    
      d => d(1),
      q => q1
    );

  FF2: D_FF
    port map (
      clk => clk,
      d => d(2),
      q => q2
    );

  FF3: D_FF
    port map (
      clk => clk,
      d => d(3),
      q => q3
    );
FF4: D_FF
    port map (
      clk => clk,
      d => d(4),
      q => q4
    );
    
  FF5: D_FF
    port map (
      clk => clk,
      d => d(5),
      q => q5
    );
    
  FF6: D_FF
    port map (
      clk => clk,
      d => d(6),
      q => q6
    );
    
  FF7: D_FF
    port map (
      clk => clk,
      d => d(7),
      q => q7
    );
    
  FF8: D_FF
    port map (
      clk => clk,
      d => d(8),
      q => q8
    );
    
  FF9: D_FF
    port map (
      clk => clk,
      d => d(9),
      q => q9
    );
    
  FF10: D_FF
    port map (
      clk => clk,
      d => d(10),
      q => q10
    );
    
  FF11: D_FF
    port map (
      clk => clk,
      d => d(11),
      q => q11
    );
    
  FF12: D_FF
    port map (
      clk => clk,
      d => d(12),
      q => q12
    );
    
  FF13: D_FF
    port map (
      clk => clk,
      d => d(13),
      q => q13
    );
    
  FF14: D_FF
    port map (
      clk => clk,
      d => d(14),
      q => q14
    );
    
  FF15: D_FF
    port map (
      clk => clk,
      d => d(15),
      q => q15
    );

  -- Output assignment
  jump <= q4 & q3 & q2 & q1 & q0;
  muxchoice <= q5 ;
  incremente_choice <= q6 ;
  MEMw <= q8 ;
  ARw <= q7 ;
  Pc_incremente <= q9 ;
  IRw <= q10 ;
  DRw <= q11 ;
  DRsrc <= q12 ;
  SRw <= q13 ;
  RFsrc <= q14 ;
  RFxy <= q15 ;
end architecture BehavioralRegistre;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
   
entity datapath is
    Port (
       control_word : in std_logic_vector(15 downto 0);
       data_in :in std_logic_vector(15 downto 0);
       clk: in std_logic;
       reset : in std_logic;
       M: out std_logic;
       bus_out_AR,bus_out_PC : out std_logic_vector(5 downto 0); 
       data_out : out std_logic_vector(15 downto 0);
       OpCode : out std_logic_vector(4 downto 0)
    );
end datapath;

architecture Behavioral of datapath is
    -- Component declarations

    COMPONENT ALU is
  	generic ( 
    	 constant N: natural := 1  -- number of shited or rotated bits
    	);
  
   	 Port (
   	 A     : in  STD_LOGIC_VECTOR(15 downto 0);  -- 2 inputs 16-bit
   	 B     : in  STD_LOGIC_VECTOR(15 downto 0);
   	 ALU_Sel  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 1 input 4-bit for selecting function
   	 ALU_Out   : out  STD_LOGIC_VECTOR(15 downto 0); -- 1 output 16-bit 
    	 Carryout : out std_logic        -- Carryout flag
    	);
	 end COMPONENT; 
    COMPONENT Register_File is
        port (

            clk: in std_logic;
            Wr: in std_logic;
            Rd: in std_logic_vector(2 downto 0);
            X: in std_logic_vector(2 downto 0);
            Y: in std_logic_vector(2 downto 0);
            D: in std_logic_vector(15 downto 0);
            Q11: out std_logic_vector(15 downto 0);
            Q22: out std_logic_vector(15 downto 0)

        );
    END COMPONENT;
    COMPONENT counterR is
	generic (
	constant N : natural :=5
	);
	port(
		clk:in std_logic;
		reset:in std_logic;
		PcW : in std_logic;
		S: out std_logic_vector(N-1 downto 0)
	);

  end COMPONENT;

    COMPONENT Register_16bit is  --DR register
        port (

            clk: in std_logic;
            Wr: in std_logic;
            d: in std_logic_vector(15 downto 0);
            q: out std_logic_vector(15 downto 0)

        );
    END COMPONENT;
  

    Component Mux2_16 is
	port(
		 In0, In1 : in std_logic_vector(15 downto 0);
       		 s : in std_logic;
       		 Z : out std_logic_vector(15 downto 0) 
	);
    END COMPONENT;
    COMPONENT instruction_register is
    	Port (
        	In0 : in std_logic_vector(15 downto 0);
        	IL, Clk : in std_logic;
        	SR, SA, SB : out std_logic_vector(2 downto 0);
        	opcode : out std_logic_vector(4 downto 0)
     		);
     end COMPONENT;
    Component address_register is
   	 Port (
         	In0 : in std_logic_vector(5 downto 0);
         	Clk: in std_logic;
         	Z : out std_logic_vector(5 downto 0)
        );
      end COMPONENT;


    -- Signal declarations

   signal to_RF,bus_d,data_out_DR,instruction_register_out,reg0,reg1,data_in_IR,data_in_DR   : std_logic_vector(15 downto 0);	
   signal bus_SR,bus_SA,bus_SB,sel_A ,sel_B,dest_sel: std_logic_vector(2 downto 0);
   signal op_select :std_logic_vector(3 downto 0);
   signal op_code1 :std_logic_vector(4 downto 0);
   signal flag : std_logic;
   signal bus_AR_in :std_logic_vector(5 downto 0);
begin

  
    op_select <= op_code1(3 downto 0);
    bus_AR_in <= bus_SA & bus_SB;

    -- Instantiate the Register_16bit component
    DR : Register_16bit PORT MAP (
        clk => clk,
        Wr => control_word(0),
        d => data_in_DR ,
        q => data_out_DR

    );
 
     AR : address_register PORT MAP (
       In0 => bus_AR_in,
       Clk => clk,
       Z  => bus_out_AR											 -- get it out to memory externe

    );
     Mux_DRsrc : mux2_16 PORT MAP(

	In0 => data_in,
	In1 => reg0,
       	s  => control_word(12),
       	Z  => data_in_DR 
    );
     Mux_RFsrc : mux2_16 PORT MAP(

	In0 => to_RF,
	In1 => data_out_DR,
       	s  => control_word(12),
       	Z  => bus_d
    );

    IR : Instruction_register PORT MAP (
	In0 => data_in,
        IL => control_word(10),
 	Clk => clk,
        SR =>	bus_SR,										        --Cables mdely
 	SA =>	bus_SA,											--Cables mdely
 	SB =>	bus_SB,											--Cables mdely
        opcode => op_code1					
);

    -- Instantiate the Register_File component
    reg_file : Register_File PORT MAP (

        clk => clk,
        Wr => control_word(1),
        Rd => dest_sel,
        X => sel_A,
        Y => sel_B,
        D => bus_d,
        Q11 => reg0,											--Goes into UAL that we still need to add as a component
        Q22 => reg1											--Goes into UAL that we still need to add as a component

    );

	PC: CounterR PORT MAP(
	clk => clk,
	reset => reset,
	PcW => control_word(9),
	S => bus_out_PC  				--get it out to memory externe
);

	alu1: ALU PORT MAP(
	 A  =>  reg0,
   	 B  =>  reg1,
   	 ALU_Sel => op_select,				 -- 1 input 4-bit for selecting function takes 4bits from opcode
   	 ALU_Out  => to_RF,				 -- 1 output 16-bit 
    	 Carryout  =>flag   				 -- Carryout flag
);



end Behavioral;

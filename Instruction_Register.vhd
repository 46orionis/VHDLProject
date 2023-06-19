library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_register is
    Port (
        In0 : in std_logic_vector(15 downto 0);
        IRw, Clk : in std_logic;
        SR, SA, SB : out std_logic_vector(2 downto 0);
        opcode : out std_logic_vector(4 downto 0);
        M,U : out std_logic
     );
end instruction_register;
    
architecture Behavioral of instruction_register is

    COMPONENT Register_16bit
    PORT (
        clk: in std_logic;
   	Wr: in std_logic;
    	d: in std_logic_vector(15 downto 0);
    	q: out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    COMPONENT mux2_16
    PORT (
        In0, In1 : in std_logic_vector(15 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
   
    signal reg_out, mux_out : std_logic_vector(15 downto 0);

begin

    reg : Register_16bit PORT MAP (
        Clk => Clk,
        wr=> '1',
        D => mux_out,
        Q => reg_out
    );
    
    mux : mux2_16 PORT MAP (
        In0 => reg_out,
        In1 => In0,
        s => IRw,
        Z => mux_out
    );
    
    U<= reg_out(15);
    M<= reg_out(14);
    opcode <= reg_out(13 downto 9);
    SR <= reg_out(8 downto 6);
    SA <= reg_out(5 downto 3);
    SB <= reg_out(2 downto 0);
    

    

end Behavioral;
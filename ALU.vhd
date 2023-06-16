library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
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
end ALU; 
architecture Behavioral of ALU is

signal tmp: std_logic_vector (16 downto 0);

begin
 
   ALU_Out  <=   std_logic_vector(unsigned(A) + unsigned(B)) when ALU_Sel ="0000"  else 
                 std_logic_vector(unsigned(A) - unsigned(B))  when ALU_Sel= "0001" else
                 std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),16))  when ALU_Sel = "0010" else 
                 std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),16)) when ALU_Sel = "0011" else 
                 std_logic_vector(unsigned(A) sll to_integer(unsigned(B))) when ALU_Sel = "0100" else
                 std_logic_vector(unsigned(A) srl to_integer(unsigned(B))) when ALU_Sel = "0101" else
                 std_logic_vector(unsigned(A) rol to_integer(unsigned(B))) when ALU_Sel = "0110" else
                 std_logic_vector(unsigned(A) ror to_integer(unsigned(B))) when ALU_Sel = "0111" else
                 A and B when ALU_Sel ="1000" else
                 A or B when ALU_Sel = "1001" else
                 A xor B when ALU_Sel ="1010" else 
                 A nor B when ALU_Sel = "1011" else
                 A nand B when ALU_Sel = "1100" else
                 A xnor B when ALU_Sel = "1101" else
                 X"0001" when ALU_Sel = "1110" and (unsigned(A)> unsigned(B))  else
                 X"0001" when ALU_Sel = "1111" and (unsigned(A) = unsigned(B)) else
                 X"0000"; 
 tmp <= STD_LOGIC_VECTOR(('0' & unsigned(A)) + ('0' & unsigned(B)));
 Carryout <= tmp(16); -- Carryout flag
end Behavioral;

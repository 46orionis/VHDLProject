library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mapper is
    port (
        opcode : in std_logic_vector(4 downto 0);
        address : out std_logic_vector(4 downto 0)
    );
end Mapper;

architecture Behavioral of Mapper is
begin
    process (opcode)
    begin
        case opcode is
            when "0XXXX" =>
                address <= "00000"; -- Micro-instruction address for opcode 00000
            when "10000" =>
                address <= "10000"; -- Micro-instruction address for opcode 00001
            when "10001" =>
                address <= "10100"; -- Micro-instruction address for opcode 00010
            when others =>
                address <= "11111"; -- Default micro-instruction address for unknown opcodes
        end case;
    end process;
end Behavioral;


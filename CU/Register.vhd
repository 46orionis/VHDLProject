library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity RegisterCU is
    port (
        clk : in std_logic;
        reset : in std_logic;
        increment : in std_logic;
        address : in std_logic_vector(4 downto 0);
        next_address : out std_logic_vector(4 downto 0)
    );
end RegisterCU;

architecture Behavioral of RegisterCU is
begin
    process (clk, reset, increment)
    begin
        if reset = '1' then
            next_address <= (others => '0'); -- Reset the next address to all zeros
        elsif rising_edge(clk) then
            if increment = '1' then
                next_address <= std_logic_vector(unsigned(address) + 1); -- Increment the address by 1
            else
                next_address <= address; -- Keep the same address
            end if;
        end if;
    end process;
end Behavioral;

